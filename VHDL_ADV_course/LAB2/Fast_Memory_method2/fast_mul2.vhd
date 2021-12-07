LIBRARY ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;
--------------------------------------------

ENTITY fast_mul2 IS
	generic (n: positive:=8);
	PORT
	(
		a			: IN STD_LOGIC_VECTOR  (n-1 DOWNTO 0);
		b			: IN STD_LOGIC_VECTOR (n-1 DOWNTO 0);
		clock		: IN STD_LOGIC;
		res		: OUT STD_LOGIC_VECTOR ((n*2)-1 DOWNTO 0);
		rst 		: IN STD_LOGIC
	);
END fast_mul2;



ARCHITECTURE SYN OF fast_mul2 IS
	
--COMPENENTS:

component ROM_512_16 is
	PORT
	(
		aclr			: IN STD_LOGIC  := '0';
		address		: IN STD_LOGIC_VECTOR (8 DOWNTO 0);
		clock			: IN STD_LOGIC  := '1';
		q				: OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
	);
	
end component ROM_512_16;

--SIGNALS:

SIGNAL wire_adder,wire_subtractor	: STD_LOGIC_VECTOR (n DOWNTO 0); 
SIGNAL res_adder , res_subtractor	: STD_LOGIC_VECTOR (2*n-1 DOWNTO 0);
SIGNAL a_s : STD_LOGIC_VECTOR  (n-1 DOWNTO 0);
SIGNAL b_s : STD_LOGIC_VECTOR  (n-1 DOWNTO 0);
SIGNAL res_s : STD_LOGIC_VECTOR ((n*2)-1 DOWNTO 0);
BEGIN 

-- instances Memory: 
	
	MemoryIadd : ROM_512_16 
	port map(			
			aclr		=>rst,
			address	=> wire_adder,
			clock		=> clock,
			q			=> res_adder
	
	);
		
	MemoryIIsub : ROM_512_16 
	port map(			
			aclr		=>rst,
			address	=>wire_subtractor,
			clock		=> clock,
			q			=> res_subtractor
	
	);
	
	
	process(clock,rst)
	begin	
	
	if rising_edge(clock) then
			a_s <= a;
			b_s <= b;
			wire_adder <= ('0' & a_s) + ('0' & b_s);
			if (a<b) then -- (a < b) 
				wire_subtractor <= ('0' & b_s) - ('0' & a_s); -- Two's complement to the results
			else -- (a > b)
				wire_subtractor <= ('0' & a_s) - ('0' & b_s);  
			end if;
			res<=	res_adder - res_subtractor;
	end if;
	
	if rst='1' then 
			a_s <= (others=>'0');
			b_s <= (others=>'0');
			res <= (others=>'0');
	end if;
	
	end process;
	
end architecture;					
		
					
		

