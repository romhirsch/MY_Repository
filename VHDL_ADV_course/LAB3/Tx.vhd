LIBRARY ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
LIBRARY altera_mf;
use work.func_pack.all;
USE altera_mf.altera_mf_components.all;
--------------------------------------------

ENTITY Tx IS
	generic (n: positive:=4);
	PORT
	(
		
		clock		: IN STD_LOGIC;
		rst 		: IN STD_LOGIC;
		data_in	: IN STD_LOGIC_VECTOR  (n-1 DOWNTO 0);
		EN			: IN STD_LOGIC;
		data_out	: OUT STD_LOGIC_VECTOR (get_cideword_size(n)+n-1 DOWNTO 0);
		valid    : OUT STD_LOGIC
		
	);
END Tx ;
 


ARCHITECTURE SYN OF Tx  IS

Signal datain_s : STD_LOGIC_VECTOR (get_cideword_size(n)+n-1 DOWNTO 0); 

BEGIN 
	
process(clock,rst)
	variable data_vector : std_logic_vector (get_cideword_size(n)-1 downto 0);
	variable calc_parity : std_logic_vector (get_cideword_size(n)-1 downto 0);
	variable datain_v : STD_LOGIC_VECTOR (get_cideword_size(n)+n-1 DOWNTO 0); 
	variable m : integer ; 
	variable k : integer ; 
begin
     if rst = '1' then 
		data_out<=(others=>'0');
	   valid<='0';
	  elsif rising_edge(clock) then	
	   calc_parity:=(others=>'0'); 
      m:=0;
		k:=0;
	 --generate new data in :
	 	for i in 1 to n+get_cideword_size(n) loop
			if ((2**m)=i) then 
					datain_v(i-1):='0';
					m := m +1;
			else
					datain_v(i-1):=data_in(k);
					data_out(i-1)<=data_in(k);
					k := k+1;
			end if;
		end loop;
		
		--calculate parity 
		
		for column in 0 to get_cideword_size(n)-1 loop
			for line_num in 2**column+1 to n+get_cideword_size(n) loop 
					data_vector := conv_std_logic_vector(line_num,get_cideword_size(n));
					if data_vector(column) = '1' then 
						calc_parity(column) := calc_parity(column) xor datain_v(line_num-1);
					end if;
			end loop;
			data_out(2**column-1)<=calc_parity(column);
		end loop;
      valid<=en;
			
	end if;	
			
end process;
	
end architecture;					
		


		

