library ieee;
use IEEE.std_logic_1164.all;

entity decoder is
	port(
		entradas : in  STD_LOGIC_VECTOR(0 to 7);
		decoder : out STD_LOGIC_VECTOR(0 to 2)
		);
end decoder;

architecture impl of decoder is
	begin
		process is 
			begin
				case entradas is
					when "00000001" => decoder <= "000"; 
					when "00000010" => decoder <= "001"; 
					when "00000100" => decoder <= "010"; 
					when "00001000" => decoder <= "011"; 
					when "00010000" => decoder <= "100"; 
					when "00100000" => decoder <= "101"; 
					when "01000000" => decoder <= "110"; 
					when "10000000" => decoder <= "111"; 
					when others => report "unreachable" severity failure;
				end case;
				wait for 10 ns;
		end process;
end impl;