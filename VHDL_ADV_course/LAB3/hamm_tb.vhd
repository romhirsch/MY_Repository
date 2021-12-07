library ieee;
library work; 
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use work.func_pack.all;


entity hamm_tb is
end entity hamm_tb;

architecture arc_hamm_tb of hamm_tb is 
constant n   			: positive  := 8;
signal clk 				: std_logic := '0';
signal rst 				: std_logic := '1';
signal en	    	   	: std_logic := '1';
signal valid	   		: std_logic;
signal valid_out		: std_logic; 
signal data_in 			: std_logic_vector (n-1 downto 0) ;
signal data_out,data_out_gen			: std_logic_vector ((n-1) downto 0);
signal data_Tx 			: STD_LOGIC_VECTOR (get_cideword_size(n)+n-1 DOWNTO 0);
signal data_gen 		: STD_LOGIC_VECTOR (get_cideword_size(n)+n-1 DOWNTO 0):=X"003";
signal error			: std_logic := '0';
signal correct_tx           : boolean:=false ;
signal correct_rx           : boolean:=false ;

begin
	u1_Tx:entity work.Tx
    generic map (
    n => n)
	port map(
	-- Inputs:
	clock			=>	clk,
	rst			=>	rst,
	data_in		=>	data_in,
	EN			=>	en,
	--Outputs:
	data_out	=>	data_Tx,
	valid		=>	valid
);
	
	u2_Rx:entity work.Rx
    generic map (
    n => n)
	port map(
	--Input:
	clock		=>	clk,
	rst		=>	rst,
	data_in		=>	data_Tx,
	EN		=>	en,
	valid_in	=> 	valid,
	--Output:
	valid_out 	=>  valid_out,
	data_out	=>	data_out,
	error		=>	error
);

	u2_Rx2:entity work.Rx
    generic map (
    n => n)
	port map(
	--Input:
	clock		=>	clk,
	rst		=>	rst,
	data_in		=>	data_gen,
	EN		=>	en,
	valid_in	=> 	valid,
	--Output:
	valid_out 	=>  valid_out,
	data_out	=>	data_out_gen,
	error		=>	error
);
---------------------------
clk <= not clk after 10 ns;
rst <= '0' after 5 ns;
---------------------------
	process is
		begin
		wait until falling_edge(rst);
		--test1 exmaple datain = 01:
		data_in <= x"01";
		wait until rising_edge(clk);
		wait for 10 ns;
		if (data_tx=X"007") then 
			if (valid='1') then
				correct_tx<=true;
			else 
				correct_tx<=false;
			end if;
		else
			correct_tx<=false;
		end if;
		wait for 10 ns;
		wait until rising_edge(clk);
		if (data_out=data_in) then 
			if (error='0') then
				correct_rx<=true;
			else 
				correct_rx<=false;
			end if;
		
		end if;

		--test2 exmaple datain = ac:
		data_in <= x"AC";
		wait until rising_edge(clk);
		wait for 10 ns;
		if (data_tx=X"A6B") then 
			if (valid='1') then
				correct_tx<=true;
			else 
				correct_tx<=false;
			end if;
		else
			correct_tx<=false;
		end if;
		wait for 10 ns;
		wait until rising_edge(clk);
		if (data_out=data_in) then 
			if (error='0') then
				correct_rx<=true;
			else 
				correct_rx<=false;
			end if;
		end if;
		--test3 with error in one bit:
		if (data_out_gen=X"01") then 
			if (error='0') then
				correct_rx<=true;
			else 
				correct_rx<=false;
			end if;
		end if;
		--test4 with error in more then one bit:
		
		data_gen<=X"005";
		wait for 40 ns;
		if (error='0') then
			correct_rx<=true;
		else 
			correct_rx<=false;
		end if;

		wait;
	end process;
end architecture arc_hamm_tb;