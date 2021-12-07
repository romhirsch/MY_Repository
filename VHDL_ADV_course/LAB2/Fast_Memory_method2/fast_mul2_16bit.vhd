LIBRARY ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use IEEE.NUMERIC_STD.all;
LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;
--------------------------------------------

ENTITY fast_mul2_16bit IS
	generic (n: positive:=16);
	PORT
	(
		a			: IN STD_LOGIC_VECTOR  (n-1 DOWNTO 0);
		b			: IN STD_LOGIC_VECTOR (n-1 DOWNTO 0);
		clock		: IN STD_LOGIC;
		res		: OUT STD_LOGIC_VECTOR ((n*2)-1 DOWNTO 0);
		rst 		: IN STD_LOGIC
	);
END fast_mul2_16bit;



ARCHITECTURE SYN OF fast_mul2_16bit IS
	
--COMPENENTS:

component fast_mul2 is
	generic (n: positive:=8);
	PORT
	(
		a			: IN STD_LOGIC_VECTOR  (n-1 DOWNTO 0);
		b			: IN STD_LOGIC_VECTOR (n-1 DOWNTO 0);
		clock		: IN STD_LOGIC;
		res		: OUT STD_LOGIC_VECTOR ((n*2)-1 DOWNTO 0);
		rst 		: IN STD_LOGIC
	);
	
end component fast_mul2;

--SIGNALS:


TYPE wire_add_memory is array (3 downto 0) of std_logic_vector(n*2-1 downto 0);
SIGNAL res_temp : wire_add_memory;
SIGNAL a_s :  STD_LOGIC_VECTOR (n-1 DOWNTO 0);
SIGNAL b_s :  STD_LOGIC_VECTOR (n-1 DOWNTO 0);
BEGIN 

	fast_mul2_1 : fast_mul2 
	 generic map ( n => 8 )
	port map(			
		a		=> 	a_s(7 downto 0),
		b		=> b_s(7 downto 0),
		clock	=> 	clock        ,
		res		=> res_temp(0)(15 downto 0),
		rst  	=> rst
	
	);

		fast_mul2_2 : fast_mul2 
	 generic map ( n => 8 )
	port map(			
		a		=> 	a_s(15 downto 8),
		b		=> 	b_s(7 downto 0),
		clock	=> 	clock        ,
		res		=> res_temp(1)(23 downto 8),
		rst  	=> rst
	
	);
		fast_mul2_3 : fast_mul2 
	 generic map ( n => 8 )
	port map(			
		a		=> 	a_s(7 downto 0),
		b		=> 	b_s(15 downto 8),
		clock	=> 	clock        ,
		res		=> res_temp(2)(23 downto 8),
		rst  	=> rst
	
	);
	fast_mul2_4 : fast_mul2 
	generic map ( n => 8 )
	port map(			
		a		=> 	a_s(15 downto 8),
		b		=> 	b_s(15 downto 8),
		clock	=> 	clock        ,
		res		=> res_temp(3)(31 downto 16)         ,
		rst  	=> rst
	
	);

	
	process(clock,rst)
	begin 
		if rising_edge(clock) then
			res<= res_temp(0) + res_temp(1) + res_temp(2) + res_temp(3);
			a_s<=a;
			b_s<=b;
		end if;
		if rst = '1' then
			res_temp(0)(31 downto 16)<=(others=>'0');
			res_temp(1)(7 downto 0)<=(others=>'0');
			res_temp(1)(31 downto 24)<=(others=>'0');
			res_temp(2)(7 downto 0)<=(others=>'0');
			res_temp(2)(31 downto 24)<=(others=>'0');
			res_temp(3)(15 downto 0)<=(others=>'0');
		end if;
	end process;
	
end architecture;					
		
					
		

