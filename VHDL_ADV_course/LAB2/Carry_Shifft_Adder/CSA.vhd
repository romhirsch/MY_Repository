library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
--------------------------------

entity CSA is
generic (size: integer:=16);
port (
       a				: in  std_logic_vector((size-1) downto 0);
		 b				: in  std_logic_vector((size-1) downto 0);
		 cin			: in std_logic; 
		 carry_out 	: out std_logic; 
       s				: out std_logic_vector((size-1) downto 0)
      );
end entity CSA ;

architecture arc_rca  of CSA is
	signal t1,t0	: std_logic_vector(size+1 downto 0);
begin
	t1<=('0' & a & '1' ) + ('0' & b & '1');
	t0<=('0' & a & '1' ) + ('0' & b & '0') ;
	s<= t1((t1'left-1 ) downto 1 ) when (cin = '1') else 
	t0((t0'left-1) downto 1 );
	carry_out<= t1((t1'left)) when (cin = '1') else 
		t0(t0'left);	
end architecture arc_rca;