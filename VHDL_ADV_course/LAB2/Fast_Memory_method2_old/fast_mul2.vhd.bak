LIBRARY ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;
--------------------------------------------

ENTITY fast_mul2 IS
	generic (n: positive:=16);
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

SIGNAL a_s : STD_LOGIC_VECTOR  (n-1 DOWNTO 0);
SIGNAL b_s : STD_LOGIC_VECTOR  (n-1 DOWNTO 0);
SIGNAL res_s : STD_LOGIC_VECTOR ((n*2)-1 DOWNTO 0);
TYPE wire_add_memory is array (n/4-1 downto 0) of std_logic_vector(n*2-1 downto 0);
SIGNAL res_temp : wire_add_memory;
BEGIN 

-- instances Memory: 
FOR_A : for i in 0 to 1 generate
	FOR_B :for j in 0 to 1 generate
	SIGNAL wire_adder,wire_subtractor	: STD_LOGIC_VECTOR (n/2 DOWNTO 0); 
	SIGNAL res_adder , res_subtractor	: STD_LOGIC_VECTOR (n-1 DOWNTO 0);
	begin
	
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
			wire_adder <= ('0' & a_s((i+1)*8-1 downto i*8)) + ('0' & b_s((j+1)*8-1 downto j*8));
			process(a_s,b_s)
			begin 
				if (a_s((i+1)*8-1 downto i*8) < b_s((j+1)*8-1 downto j*8)) then
					wire_subtractor <= ((not(wire_subtractor)) + '1');
				else
					wire_subtractor <= (('0' & a_s((i+1)*8-1 downto i*8)) - ('0' & b_s((j+1)*8-1 downto j*8)));
				end if;

			end process;
			res_temp(i*2+j)((i+j+2)*8-1 downto ((i+j)*8))<=	res_adder - res_subtractor;

			


	end generate FOR_B;		
end generate FOR_A;	
	
	
	
process(clock,rst)
begin 
	 if rising_edge(clock) then
		a_s<=a;
		b_s<=b;
		res <= res_temp(0)+res_temp(1)+res_temp(2)+res_temp(3);
		end if;
	   if (rst ='1') then 
		a_s<=(others=>'0');
		b_s<=(others=>'0');
		res<=(others=>'0');
	
	end if;
end process;
	
end architecture;					
		
					
		

