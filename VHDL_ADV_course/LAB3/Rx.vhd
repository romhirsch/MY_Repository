LIBRARY ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use IEEE.math_real.all;
LIBRARY altera_mf;
use work.func_pack.all;
USE altera_mf.altera_mf_components.all;
--------------------------------------------

ENTITY Rx IS
	generic (n: positive:=5);
	PORT
	(
		
		clock			: IN STD_LOGIC;
		rst 			: IN STD_LOGIC;
		data_in		: IN STD_LOGIC_VECTOR  (get_cideword_size(n)+n-1 DOWNTO 0);
		EN				: IN STD_LOGIC;
		valid_in		: IN STD_LOGIC;
		data_out		: OUT STD_LOGIC_VECTOR (n-1 DOWNTO 0);
		valid_out   : OUT STD_LOGIC;
		Error 		: out std_logic
	);
END Rx ;
 


ARCHITECTURE SYN OF Rx  IS


BEGIN 
	
process(clock,rst)
	variable data_vector : std_logic_vector (get_cideword_size(n)-1 downto 0);
	variable calc_parity : std_logic_vector (get_cideword_size(n)-1 downto 0);
	variable dataout_v : STD_LOGIC_VECTOR (get_cideword_size(n)+n-1 DOWNTO 0); 
	variable	bit_error : Integer;
	variable m : integer ; 
	variable k : integer ; 

begin
     if rst = '1'  then 
		data_out<=(others=>'0');
	   valid_out<='0';
		Error<='0';
		
	  elsif rising_edge(clock) then	
		if valid_in = '1' then
	   calc_parity:=(others=>'0');
		dataout_v := data_in;
   	m:=0;
		k:=0;
		for column in 0 to get_cideword_size(n)-1 loop
			calc_parity(column) := data_in(2**column-1) ;
			for line_num in 2**column to n+get_cideword_size(n)-1 loop 
					data_vector := conv_std_logic_vector(line_num,get_cideword_size(n));
					if data_vector(column) = '1' then 
						calc_parity(column) := calc_parity(column) xor data_in(line_num);
					end if;
			end loop;
		end loop;
		--checking the wrong bit --decoding
		 bit_error := conv_integer(unsigned(calc_parity));
			if bit_error> n then 
				error<='1';
			elsif bit_error = 0 then
					-- nothing happen
			else
				dataout_v(bit_error) := not(dataout_v(bit_error));-- convert the calc_parity to num and change it
				
			end if;
		
   
	 --generate new data in :
	 	for i in 1 to n+get_cideword_size(n) loop
			if ((2**m)=i) then 
					m := m +1;
			else
					data_out(k) <=dataout_v(i-1);
					k := k+1;
			end if;
		end loop;
      valid_out<=en;
			
	end if;	
	end if;		
end process;
	
end architecture;					
		


		

