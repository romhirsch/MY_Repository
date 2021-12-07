package func_pack is 
function get_cideword_size (constant size : integer ) return integer;

end package func_pack;

package body func_pack is 
function get_cideword_size (constant size: integer) return integer is 
begin
	for i in 1 to size loop
		if(2**i >= size + i + 1) then 
			return i;
		end if;
	end loop;
	return 0;
end function get_cideword_size;
end package body func_pack;