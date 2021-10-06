library IEEE;
use ieee.std_logic_1164.all;

entity servo is
	port (
		signal s : in STD_LOGIC_VECTOR(0 to 9);
		signal o : out STD_LOGIC_VECTOR(0 to 3)
		);
end servo;

architecture impl of servo is
	begin
		process is 
		begin
			--loop
				case s is 
				when "0000000000" => o <= "0001";
				when "0000000001" => o <= "0011";
				when "0000000010" => o <= "0010";
				when "0000000100" => o <= "0110";
				when "0000001000" => o <= "0111";
				when "0000010000" => o <= "0101";
				when "0000100000" => o <= "0100";
				when "0001000000" => o <= "1100";
				when "0010000000" => o <= "1101";
				when "0100000000" => o <= "1111";
				when "1000000000" => o <= "1110";
				when others => report "unreachable" severity failure;
				end case;
				wait for 10 ns;
			--end loop;
		end process;
end impl;