library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
--------------------------------
entity add16_tb is
generic (n: integer:=16);
end entity add16_tb;

architecture arc_add16_tb of add16_tb is
component CSA_adder is
generic (n: positive:=n);
port ( 			
		A  		: in  std_logic_vector(n-1 downto 0);
		B  		: in  std_logic_vector(n-1 downto 0);
		Carry_in: in  std_logic;
		Carry_out: out  std_logic;
		res  		: out std_logic_vector(n-1 downto 0)
	  );
end component CSA_adder;

	SIGNAL	A  			:   std_logic_vector(n-1 downto 0):=X"0000";
	SIGNAL	B  			:   std_logic_vector(n-1 downto 0):=X"0000";
	SIGNAL	Carry_in		:   std_logic:='0';
	SIGNAL	Carry_out	:   std_logic;
	SIGNAL	res  			: 	 std_logic_vector(n-1 downto 0);
	SIGNAL 	correct: boolean:=false;
	
begin
	u1: CSA_adder
	generic map(n=>n)
	port map(
		A  		 =>A,
		B  		 =>B,
		Carry_in  =>carry_in,
		Carry_out =>carry_out,
		res  		 => res
			
	);
	
process is
 begin
	for i in 0 to 10 loop
	 A<= X"0001" + conv_std_logic_vector(i*77,n); 
	 B<= X"0002" + conv_std_logic_vector(i*45,n);
 	wait for 100 ns;
	end loop;
end process;
correct<=((A+B)=(carry_out & res)); --- !!!!!!!!!!!!!!!!
end architecture;