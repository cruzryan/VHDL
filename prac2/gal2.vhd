library IEEE;
use IEEE.std_logic_1164.all;

entity Prac2Display1 is
	port(
		trigger : in std_logic;
		SEG1 : out std_logic_vector(0 to 6)
		);

	--attribute PIN_NUMBERS of Prac2Sumador:entity is
	--"trigger:2 SEG1(0):23 SEG1(1):22 SEG1(2):21 SEG1(3):20 SEG1(4):19 SEG1(5):18 SEG1(6):17";

end Prac2Display1;

architecture impl of Prac2Display1 is
begin
	process is 
	begin
	if trigger = '1' then
		SEG1 <= "0110000";
	else 
		SEG1 <= "1111110";
	end if;
	wait for 10 ns;
end process;
end impl;