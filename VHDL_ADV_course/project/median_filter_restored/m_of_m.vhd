library ieee;
library work; 
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use work.img_proc_pack.all;


entity m_of_m is
	PORT(
	mat  : IN matrix3x3;
	res : OUT std_logic_vector (4 downto 0)
	);
end entity m_of_m;

architecture arc_m_of_m of m_of_m is 

begin

res<=median_of_median(mat); -- (5,3,1) => 3 (00011)	| (4,5,6) => 5 

end architecture arc_m_of_m;