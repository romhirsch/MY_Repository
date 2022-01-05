library ieee;
library work; 
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;


entity image_tb is
generic(test_mode : boolean := TRUE);
end entity image_tb;

architecture arc_image_tb of image_tb is 


component project_filter is 
	generic(test_mode : boolean := TRUE);
	PORT(
	start  : IN std_logic;
	clk     : IN std_logic;
	rst      : IN std_logic;
	done 	: OUT std_logic
	);
end component;


constant n   			: positive  := 8;

signal clk 				: std_logic := '0';
signal rst 				: std_logic := '1';
signal start,done : std_logic:='0';

begin

m1:entity work.project_filter
	generic map(test_mode => test_mode)
	port map(
	start => start,
	clk   => clk,
	rst   => rst,
	done  => done 
);

---------------------------
clk <= not clk after 10 ns;
start <= '1','0' after 40 ns;
rst <= '0' after 5 ns;
---------------------------
-- process is
	-- begin	
		-- wait until falling_edge(rst);
		-- mat(0)<=p0;
		-- mat(1)<=p1;
		-- mat(2)<=p2; 
		

		
		-- wait;
	-- end process;
end architecture arc_image_tb;