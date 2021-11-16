library IEEE;
use IEEE.std_logic_1164.all;

entity Prac2Display1 is
	port(
		trigger : in std_logic
		SEG1 : out std_logic_vector(0 to 6)
		);
end Prac2Display1;

architecture impl of Prac2Display1 is
begin
	SEG1 <= "0110000" when (trigger = '1');
end impl;