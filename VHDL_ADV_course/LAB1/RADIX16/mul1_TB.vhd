library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
--------------------------------
entity mul1_tb is
generic (n: positive:=16);
end entity mul1_tb;

architecture arc_mul_tb of mul1_tb is
component mul1 is
generic (n: positive:=16);
port ( clk  : in  std_logic;
       rst  : in  std_logic;
	   start: in  std_logic;
	   a    : in  std_logic_vector(n-1   downto 0);
	   b    : in  std_logic_vector(n-1   downto 0);
	   res  : out std_logic_vector(2*n-1 downto 0);
	   done : out std_logic
	  );
end component mul1;
signal clk  : std_logic:='0';
signal rst  : std_logic:='0';
signal start: std_logic:='0';
signal a    : std_logic_vector(n-1   downto 0):=(others=>'0');
signal b    : std_logic_vector(n-1   downto 0):=(others=>'0');
signal res  : std_logic_vector(2*n-1 downto 0);
signal done : std_logic;
signal correct: boolean:=false;
begin
 u1: mul1
 generic map (n=>n)
 port map (
			clk  => clk,
            rst  => rst,
	        start=> start,
	        a    => a,
	        b    => b,
	        res  => res,
	        done => done
           );
 
 clk<= not clk after 10 ns;
 rst<='1' after 15 ns;
 
 process is
 begin
 wait until rising_edge(rst);
 wait for 10 ns;
 for i in 0 to 5 loop
	wait until rising_edge(clk);
	a<=x"1234" + conv_std_logic_vector(i*77,n);
	b<=x"345a" + conv_std_logic_vector(i*45,n);
    start<='1';
    wait until rising_edge(clk);
    start<='0';
    wait until rising_edge(done);
    correct<=((a*b)=res); --- !!!!!!!!!!!!!!!!
    wait until rising_edge(clk);
	correct<=false;
 end loop;
 wait;
 end process;	
end architecture arc_mul_tb;			
	  
	   