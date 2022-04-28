library ieee;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity gal1 is
	port(

		SA : in STD_LOGIC_VECTOR(0 to 1);
		SD : in STD_LOGIC_VECTOR(0 to 1);
		SB : in STD_LOGIC_VECTOR(0 to 1);
		SC : in STD_LOGIC_VECTOR(0 to 1);

		SEL : in STD_LOGIC_VECTOR(0 to 1);
		REF : in STD_LOGIC_VECTOR(0 to 1);

		DISPLAY : out std_logic_vector(0 to 6);
		z : inout std_logic_Vector(0 to 1)

		);
end gal1;

architecture main of gal1 is 
	begin 
		with SEL select Z <= SA when "00",
		SB when "01",
		SC when "10",
		SD when others;

		DISPLAY <= "1100110" when (z > REF) ELSE "1110011" when (z < REF) else "1110110";
end main;