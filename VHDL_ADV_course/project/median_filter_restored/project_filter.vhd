library ieee;
library work; 
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use work.img_proc_pack.all;


entity project_filter is
	generic(test_mode : boolean := false);
	PORT(
	start  : IN std_logic;
	clk     : IN std_logic;
	rst      : IN std_logic;
	done 	: OUT std_logic
	);
	attribute altera_chip_pin_lc : string;
   attribute altera_chip_pin_lc of clk  : signal is "Y2";
   attribute altera_chip_pin_lc of rst  : signal is "AB28";
	attribute altera_chip_pin_lc of start: signal is "AC28";
   attribute altera_chip_pin_lc of done : signal is "E21";
	
end entity project_filter;

architecture arc_project_filter of project_filter is 
	signal New_row_r,New_row_g,New_row_b: std_logic_vector((pic_width*rgb_depth)-1 downto 0); --out from ROM
	signal current_row_r ,current_row_g, current_row_b : pixels (0 to (pic_width+1)); 
	signal buffer_r, buffer_g, buffer_b: row_3;
	signal read_address, write_address: std_logic_vector(log_2(pic_height)-1 downto 0);
	signal proc_row_r ,proc_row_g, proc_row_b : std_logic_vector((pic_width*rgb_depth)-1 downto 0); --out from RAM
	type FSM IS (S0, S1, S2, S3);  -- Define the states
	signal state : FSM;
	signal count_fsm : integer;
	signal filter_enable: boolean;
	signal write_enable_s,done_s : std_logic;
component ROM_R_1280_256 is
	PORT
	(
		aclr		: IN STD_LOGIC  := '0';
		address		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		q			: OUT STD_LOGIC_VECTOR (1279 DOWNTO 0)
	);
end component;

component ROM_G_1280_256 is
	PORT
	(
		aclr		: IN STD_LOGIC  := '0';
		address		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		q			: OUT STD_LOGIC_VECTOR (1279 DOWNTO 0)
	);
end component;
component ROM_B_1280_256 is
	PORT
	(
		aclr		: IN STD_LOGIC  := '0';
		address		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		q			: OUT STD_LOGIC_VECTOR (1279 DOWNTO 0)
	);
	
end component;

component RAM_R_1280_256 is
	PORT
	(
		address		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		data		: IN STD_LOGIC_VECTOR (1279 DOWNTO 0);
		wren		: IN STD_LOGIC ;
		q		: OUT STD_LOGIC_VECTOR (1279 DOWNTO 0)
	);
end component;


component RAM_G_1280_256 is
	PORT
	(
		address		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		data		: IN STD_LOGIC_VECTOR (1279 DOWNTO 0);
		wren		: IN STD_LOGIC ;
		q		: OUT STD_LOGIC_VECTOR (1279 DOWNTO 0)
	);

end component;
	

component RAM_B_1280_256 is
	PORT
	(
		address		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		data		: IN STD_LOGIC_VECTOR (1279 DOWNTO 0);
		wren		: IN STD_LOGIC ;
		q		: OUT STD_LOGIC_VECTOR (1279 DOWNTO 0)
	);
	
end component ;



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
		address		=> write_address,
		clock		=> clk,
		data		=> proc_row_r,
		wren		=> write_enable_s,
		q			=>	open
	);

RAM_G: RAM_G_1280_256 
	port map(	
		address		=> write_address,
		clock		=> clk,
		data		=> proc_row_g,
		wren		=> write_enable_s,
		q			=>	open
	);

RAM_B: RAM_B_1280_256 
	port map(	
		address		=> write_address,
		clock		=> clk,
		data		=> proc_row_b,
		wren		=> write_enable_s,
		q			=>	open
	);
	
process (clk,rst) is
	variable first_write,read_enable,write_enable,push : std_logic;
	variable mat_3x3_r,mat_3x3_g,mat_3x3_b : matrix3x3;
	variable filter_row_r ,filter_row_g, filter_row_b : pixels (0 to (pic_width-1)); 
	
begin
	if(rst=RST_C) then	
		buffer_r<=(others=>(others=>(others=>'0')));
		buffer_g<=(others=>(others=>(others=>'0')));
		buffer_b<=(others=>(others=>(others=>'0')));
		read_address<=(others=>'0');
		write_address<=(others=>'0');
		state<=S0;
		count_fsm<=0;
		filter_enable<=false;
		done_s<='0';

    elsif rising_edge(clk) then	
		first_write:='0';
		read_enable:='0';
		write_enable:='0';
		push:='0';

		CASE state IS
			WHEN S0 => 
				if start='1' then 
					state<=S1;
					count_fsm <= 0;
				end if;
			WHEN S1 =>
				case count_fsm is 
					when 2 =>
						push:='1';
						count_fsm <= count_fsm+1;
					when 3 =>
						push:='1';
						read_enable:='1';
						count_fsm <= count_fsm+1;
					when 6 =>
						push:='1';
						count_fsm <= count_fsm+1;
					when 7 =>
						read_enable:='1';
						write_enable:='1';
						state<=S3;
						count_fsm <= 0;
						first_write:='1';
					WHEN others =>
						count_fsm <= count_fsm+1;
				END CASE; 
			WHEN S2 => 
				if done_s='1' then
					state<=S0;
					done<=done_s;
				else
					read_enable:='1';
					write_enable:='1';
					state<=S3;
					count_fsm <= 0;
				end if;

			WHEN S3=> 
				if done_s='1' then
					state<=S0;
					done<=done_s;
				elsif count_fsm = 2 then -- 
					push:='1';
					state<=S2;
				else
					count_fsm <= count_fsm+1;
				end if;

			WHEN others =>
				state<=S1;
			
		END CASE; 
		
		
		if not (read_address=X"ff") then
        	read_address<=read_address+ read_enable;
		end if;
		if(first_write = '1') then 
			write_address<=write_address;
		else
			if not (write_address=X"ff") then
				write_address<=write_address+ write_enable;
			end if;
		end if;
		
		if write_address = pic_width-1 then 
			done_s <= '1'; 
		end if;
		
		if(push='1') then	
					buffer_r<=(2=>current_row_r,1=> buffer_r(2), 0=> buffer_r(1));
					buffer_g<=(2=>current_row_g,1=> buffer_g(2), 0=> buffer_g(1));
					buffer_b<=(2=>current_row_b,1=> buffer_b(2), 0=> buffer_b(1));
		end if;	
			
		if test_mode=false then 
		--filter 
			for i in 0 to pic_width-1 loop
				mat_3x3_r:=(2=>buffer_r(2)(i to i+2), 1=>buffer_r(1)(i to i+2),0=>buffer_r(0)(i to i+2));
				mat_3x3_g:=(2=>buffer_g(2)(i to i+2), 1=>buffer_g(1)(i to i+2),0=>buffer_g(0)(i to i+2));
				mat_3x3_b:=(2=>buffer_b(2)(i to i+2), 1=>buffer_b(1)(i to i+2),0=>buffer_b(0)(i to i+2));
				filter_row_r(i) := median_of_median(mat_3x3_r); -- should map it to ram 
				filter_row_g(i) := median_of_median(mat_3x3_g);
				filter_row_b(i) := median_of_median(mat_3x3_b);
			end loop;
			proc_row_r <= pixels_to_std_vector(filter_row_r);
			proc_row_g <= pixels_to_std_vector(filter_row_g);
			proc_row_b <= pixels_to_std_vector(filter_row_b);
		else 
			proc_row_r <= pixels_to_std_vector(buffer_r(1)(1 to pic_width));
			proc_row_g <= pixels_to_std_vector(buffer_g(1)(1 to pic_width));
			proc_row_b <= pixels_to_std_vector(buffer_b(1)(1 to pic_width));
		end if;
		write_enable_s<=write_enable;
		done<=done_s;
	end if;
end process;	
end architecture arc_project_filter;