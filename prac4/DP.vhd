library ieee;
use IEEE.std_logic_1164.all;

entity DP is
	port(
		Bin : in  STD_LOGIC_VECTOR(0 to 4);
		DISPLAY : out STD_LOGIC_VECTOR(0 to 6)
		);
end DP;

architecture impl of DP is
	begin
		process
			begin
				case Bin is
					when "00000" => DISPLAY <= "1111110"; 
					when "00001" => DISPLAY <= "0110000"; 
					when "00010" => DISPLAY <= "1101101"; 
					when "00011" => DISPLAY <= "1111001"; 
					when "00100" => DISPLAY <= "0110011"; 
					when "00101" => DISPLAY <= "1011011"; 
					when "00110" => DISPLAY <= "1011111"; 
					when "00111" => DISPLAY <= "1110000"; 
					when "01000" => DISPLAY <= "1111111"; 
					when "01001" => DISPLAY <= "1111011"; 

					when "01010" => DISPLAY <= "1111110"; 
					when "01011" => DISPLAY <= "0110000"; 
					when "01100" => DISPLAY <= "1101101"; 
					when "01101" => DISPLAY <= "1111001"; 
					when "01110" => DISPLAY <= "0110011"; 
					when others => DISPLAY <= "1111110";
				end case;
				--wait for 10 ns;
		end process;
end impl;