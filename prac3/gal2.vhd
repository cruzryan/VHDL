library IEEE;
use IEEE.std_logic_1164.all;


entity Prac3Gal2 is
	port(
		a_igual_b : in std_logic;  
        a_menor_b : in std_logic;  
        a_mayor_b : in std_logic; 
		DISPLAY : OUT std_logic_vector(0 to 6)
		);
end Prac3Gal2;

architecture impl of Prac3Gal2 is
	begin
		process
		begin
		wait for 10 ns;

		if (a_igual_b = '1') AND (a_menor_b = '0') AND (a_mayor_b = '0') then
			DISPLAY <= "0001001";
		elsif (a_igual_b = '0') AND (a_menor_b = '1') AND (a_mayor_b = '0') then
			DISPLAY <= "0011111";
		elsif (a_igual_b = '0') AND (a_menor_b = '0') AND (a_mayor_b = '1') then
			DISPLAY <= "1110111";
		else 
			DISPLAY <= "0000000";
		end if;
		
		end process;
end impl;