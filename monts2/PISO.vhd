library IEEE;
use IEEE.std_logic_1164.all;

entity PISO is 
	port(
		pin : in std_logic_vector(0 to 3);
		o : out std_logic;
		clk : in std_logic
		);
end PISO;

architecture impl of PISO is 

	signal c: integer := 0;
	begin
	process(clk) is
	begin
		c <= c + 1;
		o <= pin(c);

		if(c > 3) then
			c <= 0;
		end if;
	end process;
end impl;