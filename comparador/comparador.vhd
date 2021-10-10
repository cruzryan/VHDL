library ieee;
use IEEE.std_logic_1164.all;


entity comparador is 
	port(
		a : in  STD_LOGIC_VECTOR(0 to 3);
		b : in STD_LOGIC_VECTOR(0 to 3);
		o : out std_logic
		);
end comparador;


architecture impl of comparador is
	begin 
		if (to_integer(unsigned(a)) < to_integer(unsigned(b))) then
			o <= '1'
		else
		 	o <= '0'
		end if; 
end impl;