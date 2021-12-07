
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use IEEE.NUMERIC_STD.all;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;

ENTITY fast_mul IS
	generic (n: positive:=16);
	PORT
	(
		a			: IN STD_LOGIC_VECTOR  (n-1 DOWNTO 0);
		b			: IN STD_LOGIC_VECTOR (n-1 DOWNTO 0);
		clock		: IN STD_LOGIC;
		res		: OUT STD_LOGIC_VECTOR ((n*2)-1 DOWNTO 0);
		rst 		: IN STD_LOGIC
	);
END fast_mul;

ARCHITECTURE SYN OF fast_mul IS
	TYPE wire_add_memory is array (n-1 downto 0) of std_logic_vector(n*2-1 downto 0);
	SIGNAL add_wire : wire_add_memory;
	SIGNAL add_res : STD_LOGIC_VECTOR ((n*2)-1 DOWNTO 0);
component ROM_256_8 is
	PORT
	(
		aclr			: IN STD_LOGIC  := '0';
		address		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		clock			: IN STD_LOGIC  := '1';
		q				: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
	);	
end component ROM_256_8;
--SIGNALS
	signal a_s : STD_LOGIC_VECTOR (n-1 DOWNTO 0); 
	signal b_s : STD_LOGIC_VECTOR (n-1 DOWNTO 0); 
	Signal pri_sum_v : STD_LOGIC_VECTOR ((n*2)-1 DOWNTO 0);
	signal res_s : STD_LOGIC_VECTOR ((n*2)-1 DOWNTO 0); 

BEGIN 
	FOR_A : for i in 1 to n/4 generate			
			FOR_B : for j in 0 to n/4-1 generate
				   SIGNAL t : std_logic_vector (7 downto 0);
					SIGNAL add_wire_out	: STD_LOGIC_VECTOR ((n/2)-1 DOWNTO 0);
				begin
				t <= b_s(i*4-1 downto i*4-4) & a_s(j*4+3 downto j*4);
				MemoryI : ROM_256_8 
					port map(			
							aclr		=>rst,
							address	=>t,
							clock		=> clock,
							q			=> add_wire_out	
					);
						process(add_wire_out)
						BEGIN 
							add_wire((i-1)*4+j)<=(others=>'0');
							add_wire((i-1)*4+j)((i+j-1)*4+7 downto (i+j-1)*4)<=add_wire_out;
						END PROCESS;						
		end generate FOR_B;		
	end generate FOR_A;	
	
process(clock,rst)
begin 
	 if rising_edge(clock) then
		a_s<=a;
		b_s<=b;
		res <= (((add_wire(0) + add_wire(1)) + (add_wire(2) + add_wire(3))) + ((add_wire(4) + add_wire(5)) + (add_wire(6) + add_wire(7)))) +    (((add_wire(8) + add_wire(9)) + (add_wire(10) + add_wire(11))) + ((add_wire(12) + add_wire(13)) + (add_wire(14) + add_wire(15))));
	end if;
	 if rst='1' then 
		a_s<=(others=>'0');
		b_s<=(others=>'0');
		res<=(others=>'0');
	 end if;
	 
end process;
end architecture; 

