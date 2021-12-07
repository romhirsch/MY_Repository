LIBRARY ieee;
USE ieee.std_logic_1164.all;
LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

ENTITY FIFO IS
	generic (data_size: positive:=4;
		log2_of_fifo_depth:integer:=4);
	PORT
	(
		clk		: IN STD_LOGIC;
		wd			: IN STD_LOGIC_VECTOR (data_size-1 DOWNTO 0); --write data 
		wr			: IN STD_LOGIC; -- write valid
		rr			: IN STD_LOGIC; -- read valid 
		rst 		: IN STD_LOGIC;
		fifo_empty  : OUT STD_LOGIC; 
		fifo_full   : OUT STD_LOGIC;  
		rd 			: OUT STD_LOGIC_VECTOR (data_size-1 DOWNTO 0) -- READ DATA 
	--	currect_data: OUT std_logic_vector(data_size-1 downto 0)
	);
END FIFO;

ARCHITECTURE SYN OF FIFO IS

	type ram_type is array (2**log2_of_fifo_depth downto 0) of std_logic_vector(data_size-1 downto 0);
	signal ram_fifo : ram_type;
	signal wp,rp    : std_logic_vector (log2_of_fifo_depth downto 0);
	signal fifo_e,fifo_f    : std_logic;
	signal rd_s : STD_LOGIC_VECTOR (data_size-1 DOWNTO 0);
BEGIN 

process(clk,rst) is 
	variable temp : std_logic_vector (log2_of_fifo_depth downto 0);
begin 
	if(rst='1') then 
		fifo_e<='0';
		fifo_f<='0';
		rd_s<=(others=>'0');
		wp	<=(others=>'0');
		rp	<=(others=>'0');
	elsif rising_edge(clk) then 
		wp <= wp + wr;
		rp  <= rp + rr; 
		
	if wr='1' then 
		ram_fifo(conv_integer(unsigned(wp(wp'left-1 downto 0)))) <= wd;
	elsif rr='1' then 
		rd_s<=ram_fifo(conv_integer(unsigned(rp(rp'left-1 downto 0))));
	end if;
		temp:= wp-rp;
		if (temp(temp'left) = '1')  then 
			fifo_f<='1';
		elsif (wp=rp) then 
			fifo_e<='1';
		else 
			fifo_e<='0';
			fifo_f<='0';
		end if;
		
	end if;
	
end process;
rd<=rd_s;
fifo_full<=fifo_f;
fifo_empty<=fifo_e;
--currect_data<=ram_fifo(0);
end architecture; 
