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

	-- Salida en entero
	signal sum_int : integer;

begin
	process is
	begin
	wait for 1 ns;

	-- Sumador 

		salBin(3) <= (NOT(DeepSwitch1(0)) AND DeepSwitch2(0)) OR (DeepSwitch1(0) AND NOT(DeepSwitch2(0)));
		salBin(2) <= (DeepSwitch1(0) AND DeepSwitch2(0)) XOR (DeepSwitch1(1) XOR DeepSwitch2(1));
		salBin(1) <= (((DeepSwitch1(0) AND DeepSwitch2(0)) AND ((DeepSwitch1(1) AND NOT(DeepSwitch2(1))) OR (NOT(DeepSwitch1(1)) AND DeepSwitch2(1)))) OR (DeepSwitch1(1) AND DeepSwitch2(1))) XOR (DeepSwitch1(2) XOR DeepSwitch2(2));
		salBin(0) <= ((((DeepSwitch1(0) AND DeepSwitch2(0)) AND ((DeepSwitch1(1) AND NOT(DeepSwitch2(1))) OR (NOT(DeepSwitch1(1)) AND DeepSwitch2(1)))) OR (DeepSwitch1(1) AND DeepSwitch2(1))) AND ((DeepSwitch1(2) AND NOT(DeepSwitch2(2))) OR (NOT(DeepSwitch1(2)) AND DeepSwitch2(2)))) OR (DeepSwitch1(2) AND DeepSwitch2(2));


	-- Codificador 

	sum_int <= to_integer(unsigned(salBin));

	case sum_int is
			when 0 =>  SEG2 <= "1111110";
			when 1 =>  SEG2 <= "0110000";
			when 2 =>  SEG2 <= "1101101";
			when 3 =>  SEG2 <= "1111001";
			when 4 =>  SEG2 <= "0110011";
			when 5 =>  SEG2 <= "1011011";
			when 6 =>  SEG2 <= "1011111";
			when 7 =>  SEG2 <= "1110000";
			when 8 =>  SEG2 <= "1111111";
			when 9 =>  SEG2 <= "1110011";

			when 10 => SEG2 <= "1111110";
			when 11 => SEG2 <= "0110000";
			when 12 => SEG2 <= "1101101";
			when 13 => SEG2 <= "1111001";
			when 14 => SEG2 <= "0110011";
			when 15 => SEG2 <= "1011011";
			when 16 => SEG2 <= "1011111";
			when 17 => SEG2 <= "1111111";
			when 19 => SEG2 <= "1110000";
			when 18 => SEG2 <= "1110011";

			when 20 => SEG2 <= "1111110";
			when 21 => SEG2 <= "0110000";
			when 22 => SEG2 <= "1101101";
			when 23 => SEG2 <= "1111001";
			when 24 => SEG2 <= "0110011";
			when 25 => SEG2 <= "1011011";
			when 26 => SEG2 <= "1011111";
			when 27 => SEG2 <= "1110000";
			when 28 => SEG2 <= "1111111";
			when 29 => SEG2 <= "1110011";
			when 30 => SEG2 <= "1111110";
		when others => report "unreachable" severity failure;
		end case;

		-- Mandarle al segundo gal el numero

		if sum_int > 9 then
			Trigger <= '1';
		else 
			Trigger <= '0';
		end if;
	end process;

end impl;