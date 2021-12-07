library ieee;
library work; 
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use work.img_proc_pack.all;


entity project_filter is
	generic(test_mode : boolean := false)
	PORT(
	start  : IN std_logic;
	clk     : IN std_logic;
	rst      : IN std_logic;
	done 	: OUT std_logic
	);
end entity project_filter;

architecture arc_project_filter of project_filter is 
	signal New_row_r,New_row_g,New_row_b: std_logic_vector((pic_width*rgb_depth)-1 downto 0); --out from ROM
	signal current_row_r ,current_row_g, current_row_b : pixels (0 to (pic_width+1)); 
	signal buffer_r, buffer_g, buffer_b: row_3;
	signal read_address, write_address: std_logic_vector(log_2(pic_height) -1 downto 0);
	signal proc_row_r ,proc_row_g, proc_row_b : std_logic_vector((pic_width*rgb_depth)-1 downto 0); --out from RAM
	type FSM IS (S0, S1, S2, S3);  -- Define the states
	signal state : FSM;
	signal count_fsm : integer(5 downto 0);
	signal filter_enable: boolean;
	
component ROM_R_1280_256 is
	PORT
	(
		aclr		: IN STD_LOGIC  := '0';
		address		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		q			: OUT STD_LOGIC_VECTOR (1279 DOWNTO 0)
	);
	
component ROM_G_1280_256 is
	PORT
	(
		aclr		: IN STD_LOGIC  := '0';
		address		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		q			: OUT STD_LOGIC_VECTOR (1279 DOWNTO 0)
	);
component ROM_B_1280_256 is
	PORT
	(
		aclr		: IN STD_LOGIC  := '0';
		address		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		q			: OUT STD_LOGIC_VECTOR (1279 DOWNTO 0)
	);
	
end component ROM_1280_256;

component RAM_R_1280_256 is
	PORT
	(
		aclr		: IN STD_LOGIC  := '0';
		address		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		data		: IN STD_LOGIC_VECTOR (1279 DOWNTO 0);
		wren		: IN STD_LOGIC ;
		q		: OUT STD_LOGIC_VECTOR (1279 DOWNTO 0)
	);
	
component RAM_G_1280_256 is
	PORT
	(
		aclr		: IN STD_LOGIC  := '0';
		address		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		data		: IN STD_LOGIC_VECTOR (1279 DOWNTO 0);
		wren		: IN STD_LOGIC ;
		q		: OUT STD_LOGIC_VECTOR (1279 DOWNTO 0)
	);
component RAM_B_1280_256 is
	PORT
	(
		aclr		: IN STD_LOGIC  := '0';
		address		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		data		: IN STD_LOGIC_VECTOR (1279 DOWNTO 0);
		wren		: IN STD_LOGIC ;
		q		: OUT STD_LOGIC_VECTOR (1279 DOWNTO 0)
	);
	
end component ROM_1280_256;



begin

--buffer
current_row_r<= std_vector_to_pixels(New_row_r);
current_row_g<= std_vector_to_pixels(New_row_g);
current_row_b<= std_vector_to_pixels(New_row_b);

	  
ROM_R: ROM_R_1280_256 
	port map(			
			aclr		=>rst,
			address	=> read_address,
			clock		=> clk,
			q			=> New_row_r
	);

ROM_G: ROM_G_1280_256 
	port map(			
			aclr		=>rst,
			address	=> read_address,
			clock		=> clk,
			q			=> New_row_g
	);

ROM_B: ROM_B_1280_256 
	port map(			
			aclr		=>rst,
			address	=> read_address,
			clock		=> clk,
			q			=> New_row_b
	);

--RAM	
RAM_R: RAM_R_1280_256 
	port map(	
		aclr		=> rst,
		address		=> write_address,
		clock		=> clk,
		data		=> proc_row_r,
		wren		=> read_enable_s,
		q			=>	x
	);

RAM_G: RAM_G_1280_256 
	port map(			
		aclr		=> rst,
		address		=> write_address,
		clock		=> clk,
		data		=> proc_row_g,
		wren		=> read_enable_s,
		q			=>	x
	);

RAM_B: RAM_B_1280_256 
	port map(			
		aclr		=> rst,
		address		=> write_address,
		clock		=> clk,
		data		=> proc_row_b,
		wren		=> read_enable_s,
		q			=>	x
	);
	
process (clk,rst) is
	variable read_enable,write_enable,push : std_logic;
	variable mat_3x3_r,mat_3x3_g,mat_3x3_b : matrix3x3;
	variable filter_row_r ,filter_row_g, filter_row_b : pixels (0 to (pic_width-1)); 

begin
	if(rst=RST_C) then	
		buffer_r<=(others=>(others=>(others=>'0')));
		buffer_g<=(others=>(others=>(others=>'0')));
		buffer_b<=(others=>(others=>(others=>'0')));
		read_address<=(others=>'0');
		write_address<=(others=>'0');
		state<=S0
		count_fsm<=0;
		filter_enable<=false;

    elsif rising_edge(clk) then	
		
		read_enable:='0';
		write_enable:='0';
		push:='0';
		
		CASE state IS
			WHEN S0 => 
				if start='1' then 
					read_enable:='1';
					state<=S1;
					count_fsm <= 0;
				end if;
			WHEN S1 => 
				if count_fsm = 2 then -- 
					push:='1'
					state<=S2;
					count_fsm <= count_fsm+1;
				elsif count_fsm = 4
					push:='1'
					state<=S2;
					count_fsm <= 0;
				else 
					count_fsm <= count_fsm+1;
				end if;

			WHEN S2 => 
				if done='1' then
					state<=S0;
				elsif count_fsm = 2 then -- 
					read_enable:='1'
					write_enable:='1';
					state<=S3;
					count_fsm <= 0;
				else
					count_fsm <= count_fsm+1;
				end if;

			WHEN S3=> 
				if done='1' then
					state<=S0;
				elsif count_fsm = 2 then -- 
					count_fsm <= 0;
					push:='1'
					state<=S2;
				else
					count_fsm <= count_fsm+1;
				end if;
			WHEN others =>
		END CASE; 
		
        read_address<=read_address+ read_enable;
		write_address<=write_address+ write_enable;
		
		if(push='1') then	
			-- push to buffer 
			if read_address=X"00" then 
					buffer_r<=current_row_r & current_row_r & buffer_r(2);
					buffer_g<=current_row_g & current_row_g & buffer_g(2);
					buffer_b<=current_row_b & current_row_b & buffer_b(2);
			elsif read_address=X"ff" then --change
					buffer_r<=buffer_r(2) & buffer_r(2 downto 1);
					buffer_g<=buffer_g(2) & buffer_g(2 downto 1);
					buffer_b<=buffer_b(2) & buffer_b(2 downto 1);
			else
					buffer_r<=current_row_r & current_row_r & buffer_r(2);
					buffer_g<=current_row_g & current_row_g & buffer_g(2);
					buffer_b<=current_row_b & current_row_b & buffer_b(2);
			end if;
			
			if (count_fsm>1) then
				count_fsm <= count_fsm+1;
			end if;
		
		if test_mode=false then 
		--filter 
			for i in 0 to pic_width-1 loop
				mat_3x3_r:=buffer_r(2)(i+2 downto i) & buffer_r(1)(i+2 downto j) & buffer_r(0)(i+2 downto j);
				mat_3x3_g:=buffer_g(2)(i+2 downto i) & buffer_g(1)(i+2 downto j) & buffer_g(0)(i+2 downto j);
				mat_3x3_b:=buffer_b(2)(i+2 downto i) & buffer_b(1)(i+2 downto j) & buffer_b(0)(i+2 downto j);
				filter_row_r(i) := median_of_median(mat_3x3_r); -- should map it to ram 
				filter_row_g(i) := median_of_median(mat_3x3_g);
				filter_row_b(i) := median_of_median(mat_3x3_b);
			end loop;
			filter_enable:=false;
			proc_row_r <= pixels_to_std_vector(filter_row_r);
			proc_row_g <= pixels_to_std_vector(filter_row_g);
			proc_row_b <= pixels_to_std_vector(filter_row_b);
		end if;
		read_enable_s<=read_enable;
	end if;
end process;	
end architecture arc_project_filter;
