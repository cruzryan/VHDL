library ieee;
use IEEE.std_logic_1164.all;

entity mux2x14c is
	port(
		a : in  STD_LOGIC_VECTOR(0 to 3);
		b : in STD_LOGIC_VECTOR(0 to 3)
		o : out STD_LOGIC_VECTOR(0 to 3)
		push : in std_logic;
		);
end mux2x14c;

architecture impl of mux2x14c is
	begin 
		process 
			begin
				if push = '1' then
					o <= a
					else 
					a <= b
				end if;
		end process;
end impl;