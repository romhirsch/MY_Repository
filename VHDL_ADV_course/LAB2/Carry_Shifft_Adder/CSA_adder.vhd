library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
--------------------------------
entity CSA_adder is
generic (n: positive:=16);
port ( 			
		A  		: in  std_logic_vector(n-1 downto 0);
		B  		: in  std_logic_vector(n-1 downto 0);
		Carry_in: in  std_logic;
		Carry_out: out  std_logic;
		res  		: out std_logic_vector(n-1 downto 0)
	  );
end entity CSA_adder;

architecture arc_rca of CSA_adder is

component CSA is
	generic (size: integer:=16);
	port (
       a				: in  std_logic_vector((size-1) downto 0);
		 b				: in  std_logic_vector((size-1) downto 0);
		 cin			: in std_logic; 
		 carry_out 	: out std_logic; 
       s				: out std_logic_vector((size-1) downto 0)
      );
end component CSA;
	
 function location (
 i    : in integer)
    return integer is
    variable loc : integer := 1;
  begin
    for j in 0 to i-1 loop
      loc := loc +j;
    end loop;
    return loc;
     
  end function location;
  
   function num_add (
    n    : in integer)
    return integer is
    variable num : integer := 1;
	 variable i : integer := 0;
  begin
    while num <= n loop
      num := num +i;
		i := i+1;
    end loop;
    return i;
     
  end function num_add;
  
signal carrys : std_logic_vector(num_add(n) -2 downto 0);


begin
   GEN_ADD : for i in 0 to num_add(n) -2 generate			
		GEN_ADD0 : if( i = 0) generate
			CSA0 : CSA generic map(size => 1)
				port map(			
					a  		=>A(0 downto 0 ),
					b	 		=>B(0 downto 0),
					cin		=> Carry_in,
					Carry_out => carrys(0),
					s => res(0 downto 0)
				);
				
		end generate GEN_ADD0;	
		GEN_ADDi : if( i > 0) generate
			CSA_i : CSA generic map(size => i)
				port map(			
					a  		  =>	A(location(i)+i-1 downto location(i)),
					b	 	  =>	B(location(i)+i-1 downto location(i)),
					cin		  => 	carrys(i-1),
					Carry_out => 	carrys(i),
					s 		  => 	res(location(i)+i-1 downto location(i))
				);
		end generate GEN_ADDi;
		
		
	end generate GEN_ADD;
	
	carry_out <= carrys(carrys'left);

end architecture;