library IEEE;
use IEEE.std_logic_1164.all;

entity PIPO is 
	port(
		pin : in std_logic_vector(0 to 3);
		o : out std_logic_vector(0 to 3);
		clk : in std_logic
		);
end PIPO;

architecture impl of PIPO is 
	begin
	process(clk) is
	begin
		o <= pin;
	end process;
end impl;