library ieee;
use IEEE.std_logic_1164.all;

entity dd is
	port(
		i : in  STD_LOGIC_VECTOR(0 to 2);
		deco : out STD_LOGIC_VECTOR(0 to 7)
		);
end dd;

architecture impl of dd is
	begin
		process is 
			begin
				case i is
					when "000" => deco <= "00000001"; 
					when "001" => deco <= "00000010"; 
					when "010" => deco <= "00000100"; 
					when "011" => deco <= "00001000"; 
					when "100" => deco <= "00010000"; 
					when "101" => deco <= "00100000"; 
					when "110" => deco <= "01000000"; 
					when "111" => deco <= "10000000"; 
					when others => report "unreachable" severity failure;
				end case;
				wait for 10 ns;
		end process;
end impl;