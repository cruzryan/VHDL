library IEEE;
use ieee.std_logic_1164.all;

entity multiplexer is
	port (
		signal e : in STD_LOGIC_VECTOR(0 to 3);
		signal s : in STD_LOGIC_VECTOR(0 to 1);
		signal o : out std_logic
		);
end entity;

architecture impl from multiplexer is

	-- e(s)
	o <= e(0)

end impl;