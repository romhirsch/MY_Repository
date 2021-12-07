library ieee;
library work;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_signed.all;
-----------------------------------------

entity first_mul_tb_8bit is
generic( n : positive := 8);
end entity first_mul_tb_8bit;
 
architecture first_mul_tb_arc of first_mul_tb_8bit is
signal clk			: std_logic := '0';
signal rst			: std_logic := '1';
signal a			: std_logic_vector (7 downto 0) :=(others=>'0');
signal b			: std_logic_vector (7 downto 0) :=(others=>'0');
signal mul_out		: std_logic_vector (15 downto 0);
signal 	correct: boolean:=false;
signal a_temp : std_logic_vector (7 downto 0) :=(others=>'0');
signal b_temp : std_logic_vector (7 downto 0) :=(others=>'0');
signal count_s : integer RANGE 0 to 3 := 0;
component fast_mul2 is 
	generic( n : positive := 8);
	PORT
	(
		a			: IN STD_LOGIC_VECTOR  (n-1 DOWNTO 0);
		b			: IN STD_LOGIC_VECTOR (n-1 DOWNTO 0);
		clock		: IN STD_LOGIC;
		res		: OUT STD_LOGIC_VECTOR ((n*2)-1 DOWNTO 0);
		rst 		: IN STD_LOGIC
	);
end component;

begin
	u1: fast_mul2 generic map(n=>8)
	port map(
	clock => clk,
	rst 	=> rst,
	a 		=> a,
	b 		=> b,
	res 	=> mul_out 
	
	);
--------------------------
check: process is 
	variable i : integer RANGE 0 to 10;
	begin
			if (rst='1') then 
				i:=0;
				a<= X"00"; 
				b<= X"02";
			end if;
			if (i=10) then 
				i:=0;
			end if;
			wait until rising_edge(clk);
			if (count_s = 3) then 
				count_s<=0;
				wait until falling_edge(clk);
				correct<=((a*b)=(mul_out)); --- !!!!!!!!!!!!!!!!
				i:=i+1;
				--a<= X"01" + conv_std_logic_vector(i*77,n); 
				--b<= X"02" + conv_std_logic_vector(i*45,n);
			else
				count_s <= count_s+1; 
			end if;
		

	end process check;


-------------------------
	rst <= '0' after 1 ns;
	clk <= NOT clk after 30 ns;
-------------------------
end architecture first_mul_tb_arc;