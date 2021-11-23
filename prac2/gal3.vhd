library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.ALL;

entity Prac2Deco is
	port(
		inBin: in std_logic_vector (0 to 3);
		SEG2 : out std_logic_vector(0 to 6)
	);

	attribute PIN_NUMBERS of Prac2Deco:entity is
	"inBin(3):2 inBin(2):3 inBin(1):4 inBin(0):5 " & 
	"SEG2(0):23 SEG2(1):22 SEG2(2):21 SEG2(3):20 SEG2(4):19 SEG2(5):18 SEG2(6):17";
end Prac2Deco;

--Decodificador
architecture impl of Prac2Deco is 
begin
	process
		begin
	-- Decodificador 
	case inBin is
			when "0000" =>  SEG2 <= "1111110";
			when "0001" =>  SEG2 <= "0110000";
			when "0010" =>  SEG2 <= "1101101";
			when "0011" =>  SEG2 <= "1111001";
			when "0100" =>  SEG2 <= "0110011";
			when "0101" =>  SEG2 <= "1011011";
			when "0110" =>  SEG2 <= "1011111";
			when "0111" =>  SEG2 <= "1110000";
			when "1000" =>  SEG2 <= "1111111";
			when "1001" =>  SEG2 <= "1110011";
			when "1010" => SEG2 <= "1111110";
			when "1011" => SEG2 <= "0110000";
			when "1100" => SEG2 <= "1101101";
			when "1101" => SEG2 <= "1111001";
			when "1110" => SEG2 <= "0110011";
			when "1111" => SEG2 <= "1011011";
		when others => SEG2 <= "0000000";
		end case;

	end process;
end impl;