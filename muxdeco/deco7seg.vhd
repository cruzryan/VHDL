library ieee;
use IEEE.std_logic_1164.all;

entity deco7seg is
	port(
		i : in  STD_LOGIC_VECTOR(0 to 3);
		o : out STD_LOGIC_VECTOR(0 to 6)
		);
end deco7seg;

architecture impl of deco7seg is
	begin
		process is 
			begin
				case i is
					when "0000" => o <= "1111110"; 
					when "0001" => o <= "0110000"; 
					when "0010" => o <= "1101101"; 
					when "0011" => o <= "1111001"; 
					when "0100" => o <= "0110011"; 
					when "0101" => o <= "1011011"; 
					when "0110" => o <= "1011111"; 
					when "0111" => o <= "1110000"; 
					when "1000" => o <= "1111111"; 
					when "1001" => o <= "1111011"; 
					when others => report "unreachable" severity failure;
				end case;
		end process;
end impl;