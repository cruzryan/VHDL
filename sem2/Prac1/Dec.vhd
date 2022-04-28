library ieee;
use IEEE.std_logic_1164.all;

entity dec is
	port(
		A: std_logic_vector(0 to 1);
		DISPLAY : out std_logic_vector(0 to 6)
		);
end dec;

architecture main of dec is 
	begin
		with A select DISPLAY <= "0000001" when "00",
		"1001111" when "01",
		"0010010" when "10",
		"0000110" when others;
end main;