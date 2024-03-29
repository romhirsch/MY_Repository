library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use std.textio.all;
use ieee.std_logic_textio.all;

-------------------------------------------

entity TB_fifo is
generic( data_size : positive := 16; log2_of_fifo_depth:integer:=4 ; test_num : integer:=16);
end entity TB_fifo;

architecture arc_fifo of TB_fifo is 

component FIFO is 
	generic (data_size: positive:=4;
	log2_of_fifo_depth:integer:=4);
	PORT
	(
		clk			: IN STD_LOGIC;
		wd			: IN STD_LOGIC_VECTOR (data_size-1 DOWNTO 0); --write data 
		wr			: IN STD_LOGIC:='0'; -- write valid
		rr			: IN STD_LOGIC:='0'; -- read valid 
		rst 		: IN STD_LOGIC;
		fifo_empty  : OUT STD_LOGIC; 
		fifo_full   : OUT STD_LOGIC;  
		rd 			: OUT STD_LOGIC_VECTOR (data_size-1 DOWNTO 0) -- READ DATA 
	--	currect_data : OUT STD_LOGIC_VECTOR (data_size-1 DOWNTO 0)
	);
end component;

type INT_ARRAY is array (integer range <>) of integer;
signal gen_array : INT_ARRAY (test_num-1 downto 0):=(1, 5, 6, 25, 5, 6, 19, 22, 53, 11, 33, 55, 66, 23, 10,9);
signal clk			: STD_LOGIC:='0';
signal wd			: STD_LOGIC_VECTOR (data_size-1 DOWNTO 0);
signal wr			: STD_LOGIC:='0'; -- write valid
signal rr			: STD_LOGIC:='0'; -- read valid 
signal rst 		    : STD_LOGIC:='1';
signal fifo_empty   : STD_LOGIC; 
signal fifo_full    : STD_LOGIC;  
signal rd	        : STD_LOGIC_VECTOR (data_size-1 DOWNTO 0);
begin
	u1_fifo:entity work.FIFO
    generic map (
    data_size => data_size,log2_of_fifo_depth=>log2_of_fifo_depth)
	port map(
		clk		=>	clk						,
		wd		=>	wd						,
		wr		=>	wr						,
		rr		=>	rr						,
		rst 		=>  rst 					,
		fifo_empty  	=>	fifo_empty  			,
		fifo_full   	=>	fifo_full  				,
		rd 		=> rd	
);

process is
  file in_file       : text;
  file res_file       : text;
  constant file_data_in : string:="data_in.txt";
  constant file_data_res : string:="data_res.txt";
  constant file_compare_res : string:="compare_res.txt";
  constant file_path : string:="C:\Users\rom21\OneDrive\Desktop\VHDL_git\VHDL\LAB4\";
  variable status,status_w   : file_open_status;
  variable curr_line,curr_line_r : line;
  constant ok_mes : string:="ok";
  constant error_mes : string:="error";	
  variable line_stat : boolean;
  variable file_data : std_logic_vector(data_size-1 DOWNTO 0);
  variable file_num  : string(1 to 2);
  constant headers_read : string:="number              data";	
  constant headers_write : string:="number        full          empty                 data_out              test_result";	


  variable count:integer;
  
begin 
	count:=0;
	-- %%%automatic genarate data_in.txt from gen_array%%%
	
 	--file_open(status,in_file, file_path & file_data_in, write_mode);
	--assert (status = open_ok)
	--	report "file creating failure" & time'image(now)
	--	severity failure;
	--assert (status /= open_ok)
    --    report "file in_file is opened"
    --    severity note;	
	----headers 
	--	write(curr_line,headers_read,left, 15);
	--	writeline(in_file,curr_line);
	--for i in 0 to test_num-1 loop
	--	write(curr_line,gen_array(i),left, 15);
	--	write(curr_line,conv_std_logic_vector(gen_array(i),data_size),left, 15);
	--	writeline(in_file,curr_line);
	--end loop;
	--file_close(in_file);
	--wait for 100ns; 
	
	wait until falling_edge(clk);

	--READ DATA and Generate data to fifo compenent 
	 file_open(status, in_file, file_path & file_data_in, read_mode);
     assert (status = open_ok)
         report "file creating failure" & time'image(now)
         severity failure;
     assert (status /= open_ok)
         report "file data_in is opened"
         severity note;
	READLINE(in_file, curr_line);--skip headers
	while (not ENDFILE(in_file)) loop
		--read from generate file
		READLINE(in_file, curr_line);
		READ(curr_line, file_num, line_stat);
		READ(curr_line, file_data, line_stat);
		wd<=file_data;
		wr<='1','0' after 65 ns;
		wait for 200ns;
	end loop;
	file_close(in_file);
	wait for 100ns;

	--open write file for resulte
	
	 file_open(status, in_file, file_path & file_data_in, read_mode);
     assert (status = open_ok)
         report "file creating failure" & time'image(now)
         severity failure;
     assert (status /= open_ok)
         report "file data_in is opened"
         severity note;
		 
	file_open(status_w, res_file, file_path & file_data_res, write_mode);
	assert (status_w = open_ok)
		report "file creating failure" & time'image(now)
		severity failure;
	assert (status_w /= open_ok)
		report "file data_res is opened"
		severity note;
		--write resulte read from FIFO
		write(curr_line,headers_write,left, 15);
		writeline(res_file,curr_line);
		READLINE(in_file, curr_line_r);--skip headers data_in
		write(curr_line,count,left, 15);
		write(curr_line,fifo_full,left, 15);
		write(curr_line,fifo_empty,left, 15);
		write(curr_line,rd,left, 30);
		write(curr_line,ok_mes,left, 15);
		writeline(res_file,curr_line);
		for i in 0 to test_num-1 loop
			if(not ENDFILE(in_file)) then			
				READLINE(in_file, curr_line_r);
				READ(curr_line_r, file_num, line_stat);
				READ(curr_line_r, file_data, line_stat);
			count:=count+1;
			wait for 20 ns;
			end if;
			write(curr_line,count,left, 15);
			rr<='1','0' after 65 ns;
			wait for 100ns;
			write(curr_line,fifo_full,left, 15);
			write(curr_line,fifo_empty,left, 15);
			write(curr_line,rd,left, 30);
			if (file_data=rd) then 
				write(curr_line,ok_mes,left, 15);
			else 
				write(curr_line,error_mes,left, 15);
			end if;
			writeline(res_file,curr_line);
		end loop;
	file_close(res_file);
	file_close(in_file);

	wait;
	
end process;

-------clk & rst---------
	rst <= '0' after 1 ns;
	clk <= NOT clk after 30 ns;
-------------------------


end architecture;