library IEEE;
use IEEE.std_logic_1164.all;

entity Prac2Display1 is
	port(
		trigger : in std_logic;
		SEG1 : out std_logic_vector(0 to 6)
		);
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