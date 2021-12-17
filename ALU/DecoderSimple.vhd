library ieee;
use ieee.std_logic_1164.all;

entity DecoderSimple is 
	port(
		sum_in: in std_logic_vector(3 downto 0);
		DISPLAY : out std_logic_vector(0 to 6);
		trigger: out std_logic
	);
end DecoderSimple;

architecture impl of DecoderSimple is
	begin 
		trigger <= sum_in(3);
		process 
		begin
			wait for 10 ns;
			case sum_in is
				--Positivos (0 -> 6)
				when "0000" =>  DISPLAY <= "1111110";
				when "0001" =>  DISPLAY <= "0110000";
				when "0010" =>  DISPLAY <= "1101101";
				when "0011" =>  DISPLAY <= "1111001";
				when "0100" =>  DISPLAY <= "0110011";
				when "0101" =>  DISPLAY <= "1011011";
				when "0110" =>  DISPLAY <= "1011111";

				--Negativos (-1 -> -8)
				when "1111" => DISPLAY <= "0110000";
				when "1110" => DISPLAY <= "1101101";
				when "1101" => DISPLAY <= "1111001";
				when "1100" => DISPLAY <= "0110011";
				when "1011" => DISPLAY <= "1011011";
				when "1010" => DISPLAY <= "1011111";
				when "1001" => DISPLAY <= "1110000";
				when "1000" => DISPLAY <= "1111111";
		when others => DISPLAY <= "0000000";
		end case;
		end process;
end impl;