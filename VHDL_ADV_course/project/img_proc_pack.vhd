library ieee;
use ieee.std_logic_1164.all;

package img_proc_pack is 
	constant pic_width : positive :=256;
	constant pic_height : positive :=256;
	constant rgb_depth : positive :=5;
	type pixels is array (natural range <>) of std_logic_vector((rgb_depth-1) downto 0);
	type matrix3x3 is array (2 downto 0) of pixels(2 downto 0);
	type row_3 is array (2 downto 0) of pixels(0 to (pic_width+1)); --buffer
	type data_img is array (0 to (pic_height-1)) of pixels(0 to (pic_width-1));
	constant RST_C : std_logic :='1';
	constant mem_r : string :="r.mif";
	constant mem_g : string :="g.mif";
	constant mem_b : string :="b.mif";
	function std_vector_to_pixels (curr_row : std_logic_vector) return pixels;
	function pixels_to_std_vector (pixels_v : pixels) return std_logic_vector;
	function median_of_median (arg : matrix3x3) return std_logic_vector;
	function median_even_odd (matrix : matrix3x3) return std_logic_vector;
	--function filter_func (arg : row_3) return pixels;
	function middleOfThree( a : std_logic_vector; b : std_logic_vector; c : std_logic_vector) return std_logic_vector;
	function log_2 ( x : natural ) return natural;

end package img_proc_pack;

package body img_proc_pack is 


function log_2 ( x : natural ) return natural is
        variable temp : natural := x ;
        variable n : natural := 0 ;
    begin
        while temp > 1 loop
            temp := temp / 2 ;
            n := n + 1 ;
        end loop ;
		  return n;
end function log_2 ;
	 
	 
function median_even_odd (matrix : matrix3x3) return std_logic_vector is
	variable temp : std_logic_vector((rgb_depth-1) downto 0);
	variable arg : matrix3x3;
begin 
	arg:=matrix;
	for i in 0 to 8 loop
		if ((i mod 2)=0) then 
			if arg(0)(0)>arg(0)(1) then 
				temp:=arg(0)(1);
				arg(0)(1):=arg(0)(0);
				arg(0)(0):=temp;
			end if;
			if arg(0)(2)>arg(1)(0) then 
				temp:=arg(1)(0);
				arg(1)(0):=arg(0)(2);
				arg(0)(2):=temp;
			end if;
 			if arg(1)(1)>arg(1)(2) then 
				temp:=arg(1)(2);
				arg(1)(2):=arg(1)(1);
				arg(1)(1):=temp;
			end if;
			if arg(2)(0)>arg(2)(1) then 
				temp:=arg(2)(1);
				arg(2)(1):=arg(2)(0);
				arg(2)(0):=temp;
			end if;
		else
			if arg(0)(1)>arg(0)(2) then 
				temp:=arg(0)(2);
				arg(0)(2):=arg(0)(1);
				arg(0)(1):=temp;
			end if;
			if arg(1)(0)>arg(1)(1) then 
				temp:=arg(1)(1);
				arg(1)(1):=arg(1)(0);
				arg(1)(0):=temp;
			end if;
 			if arg(1)(2)>arg(2)(0) then 
				temp:=arg(2)(0);
				arg(2)(0):=arg(1)(2);
				arg(1)(2):=temp;
			end if;
			if arg(2)(1)>arg(2)(2) then 
				temp:=arg(2)(2);
				arg(2)(2):=arg(2)(1);
				arg(2)(1):=temp;
			end if;
		end if;		
	end loop;
	return arg(1)(1);
end function median_even_odd;
	
function middleOfThree (a : std_logic_vector; b : std_logic_vector; c : std_logic_vector ) return std_logic_vector is 
begin 
	if ((b <= a) and (a <= c)) or ( (c <= a) and (a <= b)) then 
		return a;
	elsif ((a <= b) and (b <= c)) or ( (c <= b) and (b <= a)) then 
		return b;
	else 
		return c;
	end if;
end function middleOfThree;	


function median_of_median (arg : matrix3x3 ) return std_logic_vector is 
	variable median_v : pixels(2 downto 0);
begin 
	for i in 0 to 2 loop
		median_v(i) := middleOfThree(arg(0)(i),arg(1)(i),arg(2)(i));
	end loop;
	return (middleOfThree(median_v(0),median_v(1),median_v(2)));
end function median_of_median;	
	
function pixels_to_std_vector (pixels_v : pixels ) return std_logic_vector is 
	variable std_v : std_logic_vector(pixels_v'length*rgb_depth-1 downto 0);
	variable j : integer:=pixels_v'length-1;
begin 

	for i in pixels_v'left to pixels_v'right loop
		std_v(j*5+4 downto j*5 ) := pixels_v(i);
		j:=j-1;
	end loop;
	return std_v;
end function pixels_to_std_vector;	


function std_vector_to_pixels (curr_row : std_logic_vector ) return pixels is 
	variable arr_pixel : pixels((pic_width+1) downto 0);
begin 
	arr_pixel(0):=curr_row(4 downto 0); 
	for i in 0 to pic_width-1 loop
		arr_pixel(i+1):=curr_row((i*5)+4 downto (i*5)) ;
	end loop;
	arr_pixel(pic_width+1):=curr_row(curr_row'left-1 downto curr_row'left-5);
	return arr_pixel;
end function std_vector_to_pixels;
end package body img_proc_pack;