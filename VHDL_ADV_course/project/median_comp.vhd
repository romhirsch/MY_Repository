library ieee;
library work; 
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use work.img_proc_pack.all;


entity median_comp is
	PORT(
	mat  : IN matrix3x3;
	res : OUT std_logic_vector (4 downto 0)
	);
end entity median_comp;

architecture arc_median_comp of median_comp is 

begin

--res<=median_of_median(mat); -- (5,3,1) => 3 (00011)	| (4,5,6) => 5 
res<=median_even_odd(mat);-- 1	1 2 3 3 4 5 7 31 (00011) | 5 

end architecture arc_median_comp;