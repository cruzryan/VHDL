library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.ALL;

entity Prac2Sumador is
	-- 0 to 2 es para lo numeros 8 es para sumar 9 es para enter
	port(
		DeepSwitch1 : in std_logic_vector(0 to 2);
		DeepSwitch2 : in std_logic_vector(0 to 2);
		SEG2 : out std_logic_vector(0 to 6);
		Trigger : out std_logic
		);

--attribute PIN_NUMBERS of Prac2Sumador:entity is
--"Trigger:16 " & "DeepSwitch1(0):2 DeepSwitch1(1):3 DeepSwitch1(2):4 " & 
--"DeepSwitch2(0):5 DeepSwitch2(1):6 DeepSwitch2(2):7 " & 
--"SEG2(0):23 SEG2(1):22 SEG2(2):21 SEG2(3):20 SEG2(4):19 SEG2(5):18 SEG2(6):17"; 
end Prac2Sumador;

architecture impl of Prac2Sumador is
	-- Salida en binario
	signal salBin: std_logic_vector (0 to 3);
	signal XD: std_logic;
begin
	process
	begin
	--wait for 1 ns;

	-- Sumador 
		XD <= (NOT(DeepSwitch1(0)) AND (DeepSwitch2(0)));
		salBin(3) <= XD OR ((DeepSwitch1(0)) AND NOT(DeepSwitch2(0)));
		salBin(2) <= (DeepSwitch1(0) AND DeepSwitch2(0)) XOR (DeepSwitch1(1) XOR DeepSwitch2(1));
		salBin(1) <= (((DeepSwitch1(0) AND DeepSwitch2(0)) AND ((DeepSwitch1(1) AND NOT(DeepSwitch2(1))) OR (NOT(DeepSwitch1(1)) AND DeepSwitch2(1)))) OR (DeepSwitch1(1) AND DeepSwitch2(1))) XOR (DeepSwitch1(2) XOR DeepSwitch2(2));
		salBin(0) <= ((((DeepSwitch1(0) AND DeepSwitch2(0)) AND ((DeepSwitch1(1) AND NOT(DeepSwitch2(1))) OR (NOT(DeepSwitch1(1)) AND DeepSwitch2(1)))) OR (DeepSwitch1(1) AND DeepSwitch2(1))) AND ((DeepSwitch1(2) AND NOT(DeepSwitch2(2))) OR (NOT(DeepSwitch1(2)) AND DeepSwitch2(2)))) OR (DeepSwitch1(2) AND DeepSwitch2(2));


	-- Codificador 
	case salBin is
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

		-- Mandarle al segundo gal el numero
		if salBin > "1001" then
			Trigger <= '1';
		else 
			Trigger <= '0';
		end if;
	end process;

end impl;