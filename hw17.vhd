--Simple inverter

library IEEE;
use IEEE.std_logic_1164.all;


entity SWITCH is
	port(
		A: in std_logic;
		B: in std_logic;
		F: out std_logic
		);
end SWITCH;


architecture sw of SWITCH is

	begin 
		s: process(A,B)
		begin 
			if (A = '1') and (B = '0') then
				F <= '1';
			elsif (A = '0') and (B = '1') then
				F <= '0';
			end if;
		end process s;
end sw;