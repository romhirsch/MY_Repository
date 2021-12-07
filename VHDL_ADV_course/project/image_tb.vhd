library ieee;
library work; 
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use work.img_proc_pack.all;


entity image_tb is
end entity image_tb;

architecture arc_image_tb of image_tb is 

component median_comp is 
	PORT(
	mat  : IN matrix3x3;
	res : OUT std_logic_vector (4 downto 0)
	);
end component;
component m_of_m is 
	PORT(
	mat  : IN matrix3x3;
	res : OUT std_logic_vector (4 downto 0)
	);
end component;


constant n   			: positive  := 8;
signal clk 				: std_logic := '0';
signal rst 				: std_logic := '1';
--signal p0 : pixels(2 downto 0):=("00011","00011","00100"); --  3 	3	4 | 1  2 3
--signal p1 : pixels(2 downto 0):=("11111","00010","00001"); --  31	2	1 | 4  5 6
--signal p2 : pixels(2 downto 0):=("00101","00111","00001");--   5    7   1 | 7  8 9
signal p0 : pixels(2 downto 0):=("00001","00010","00011"); --  3 	3	4 | 1  2 3
signal p1 : pixels(2 downto 0):=("00100","00101","00110"); --  31	2	1 | 4  5 6
signal p2 : pixels(2 downto 0):=("00111","01000","01001");--   5    7   1 | 7  8 9

signal mat : matrix3x3:=(p0,p1,p2);
signal res_m_of_m : std_logic_vector (4 downto 0) ;
signal res_even_odd : std_logic_vector (4 downto 0) ;


begin

m1:entity work.median_comp
	port map(
	mat  =>mat,
	res => res_even_odd
);



m2:entity work.m_of_m
	port map(
	mat  =>mat,
	res => res_m_of_m
);

--res_m_of_m<=median_of_median(mat); -- (5,3,1) => 3 (00011)	| (4,5,6) => 5 
--res_even_odd<=median_even_odd(mat);-- 1	1 2 3 3 4 5 7 31 (00011) | 5 
--res<=res_m_of_m;



---------------------------
clk <= not clk after 10 ns;
rst <= '0' after 5 ns;
---------------------------
--	process is
--		begin
		
--		wait until falling_edge(rst);
-- 		mat(0)<=p0;
--		mat(1)<=p1;
--		mat(2)<=p2; 
		

		
--		wait;
--	end process;
end architecture arc_image_tb;