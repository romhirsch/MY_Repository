library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use IEEE.NUMERIC_STD.all;

--------------------------------
entity mul1 is
generic (n: positive:=16);
port ( clk  : in  std_logic;
       rst  : in  std_logic;
	   start: in  std_logic;
	   a    : in  std_logic_vector(n-1   downto 0);
	   b    : in  std_logic_vector(n-1   downto 0);
	   res  : out std_logic_vector(2*n-1 downto 0);
	   done : out std_logic
	  );
end entity mul1;

architecture arc_mul of mul1 is
signal ra : std_logic_vector(2*n-1 downto 0):=(others=>'0');
signal rb : std_logic_vector(n-1 downto 0);
signal acc: std_logic_vector(2*n-1 downto 0);
signal rcarry : std_logic := '0';
signal A3 :std_logic_vector(2*n-1 downto 0);
signal A5 :std_logic_vector(2*n-1 downto 0);
signal A7 :std_logic_vector(2*n-1 downto 0);

type fsm_st is (s0,s1);
signal cs: fsm_st;
begin
	res<=acc;
	process(clk,rst) is
	variable rb_v: std_logic_vector(2*n-1 downto 0) :=(others => '0');
	variable p   : std_logic_vector(2*n-1 downto 0);
	variable sh_acc, ld_clr, done_v: std_logic;
	variable end_op: boolean;
	variable ns: fsm_st;
	variable ZEROS :std_logic_vector(2*n-1 downto 0):= (others=>'0');
	variable ONES :std_logic_vector(2*n-1 downto 0):= (others=>'1');
	variable v_carry : std_logic ;
	begin
		if(rst='0') then
			cs<=s0;
			ra<=(others=>'0');
			rb<=(others=>'0');
			acc<=(others=>'0');
			rcarry <='0';
			A3<=(others=>'0');
			A5<=(others=>'0');
			A7<=(others=>'0');
			
	   elsif rising_edge(clk) then

			end_op:=(rb(n-1 downto 0)=X"0000") and (rcarry ='0');
			sh_acc:='0'; 
			ld_clr:='0';
			done_v:='0';
			ns:=cs;
			case cs is
				when s0=> if(start='1') then	
							ns:=s1;
							sh_acc:='0';
							ld_clr:='1';
							ra<=x"0000" & a;
							end if;
			   when s1=> if (not end_op) then	
					         sh_acc:='1';
								rb_v(3 downto 0):= rb(3 downto 0) + rcarry;
								if (rb_v> 8) then 
									v_carry:='1';
								else
									v_carry:='0';
								end if;
								rcarry<=v_carry;
							
								case rb_v(3 downto 0) is 
									when "0000" => p:= ZEROS;
									when "0001" => p:= ra;
									when "0010" => p:= (ra(2*n-2 downto 0) & '0');
									when "0011" => p:= A3;
									when "0100" => p:= (ra(2*n-3 downto 0) & "00");
									when "0101" => p:= A5;
									when "0110" => p:= (A3(2*n-2 downto 0) & '0');
									when "0111" => p:= A7;
									when "1000" => p:= (ra(2*n-4 downto 0) & "000");
									when "1001" => p:= X"00000000" - A7;
									when "1010" => p:= X"00000000" - (A3(2*n-2 downto 0) & '0');
									when "1011" => p:= X"00000000" - A5;
									when "1100" => p:= X"00000000" - (ra(2*n-3 downto 0) & "00");
									when "1101" => p:= X"00000000" - A3;
									when "1110" => p:= X"00000000" - (ra(2*n-2 downto 0) & '0');
									when "1111" => p:= X"00000000" - ra;
									when others => null;
								end case;	
						  else 
							 ns:=s0;
							 done_v:='1';
						  end if;
            when others => null;
			end case;
			cs<=ns;
			if(ld_clr='1') then
				ra<= x"0000" & a;
				A3 <= ("000000000000000" & a & '0')+(x"0000" & a);
				A5 <= ("00000000000000" & a & "00")+(x"0000" & a);
				A7 <= ("0000000000000" & a & "000")-(x"0000" & a);
				rcarry<='0';
				rb<=b;
				acc<=(others=>'0');
			elsif (sh_acc='1') then
				ra	<=	ra((2*n)-5 downto 0)  & "0000";
				rb	<=	X"0" & rb(n-1 downto 4);
				A3 <= A3(2*n-5 downto 0) & x"0";
				A5 <= A5(2*n-5 downto 0) & x"0";
				A7 <= A7(2*n-5 downto 0) & x"0";
				acc	<=	acc + p;
			end if;	
		end if;
        done<=done_v;
    end process;		
end architecture arc_mul;			
	  