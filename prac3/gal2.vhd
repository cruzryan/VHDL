library IEEE;
use IEEE.std_logic_1164.all;


entity Prac3Gal2 is
	port(
		i : in std_logic_vector(0 to 2);
		DISPLAY : OUT std_logic_vector(0 to 6)
		);
end Prac3Gal2;

architecture impl of Prac3Gal2 is
	begin
		process
		begin
		wait for 10 ns;

		case i is
		--Iguales
		when "001" => DISPLAY <= "0001001";
		--Menor que
		when "010" => DISPLAY <= "1110111";
		--Mayor que 
		when "100" => DISPLAY <= "0011111";
		when others => DISPLAY <= "0000000";
		end case;
		end process;
end impl;