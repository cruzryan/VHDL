library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.ALL;

entity Prac2Sumador is
	-- 0 to 2 es para lo numeros 8 es para sumar 9 es para enter
	port(
		DeepSwitch1 : in std_logic_vector(0 to 2);
		DeepSwitch2 : in std_logic_vector(0 to 2);
		Trigger : out std_logic;
		salBin: inout std_logic_vector (0 to 3)
		);

	attribute PIN_NUMBERS of Prac2Sumador:entity is
	"Trigger:16" & "DeepSwitch1(0):2 DeepSwitch1(1):3 DeepSwitch1(2):4 " & 
	"DeepSwitch2(0):5 DeepSwitch2(1):6 DeepSwitch2(2):7" & 
	"salBin(3):23 salBin(2):22 salBin(1):21 salBin(0):20"; 

end Prac2Sumador;

architecture impl of Prac2Sumador is
begin
	process
	begin
		--wait for 10 ns;
		-- Sumador 
		salBin(3) <= DeepSwitch1(0) XOR DeepSwitch2(0);
		salBin(2) <= (DeepSwitch1(0) AND DeepSwitch2(0)) XOR (DeepSwitch1(1) XOR DeepSwitch2(1));
		salBin(1) <= (((DeepSwitch1(0) AND DeepSwitch2(0)) AND ((DeepSwitch1(1) AND NOT(DeepSwitch2(1))) OR (NOT(DeepSwitch1(1)) AND DeepSwitch2(1)))) OR (DeepSwitch1(1) AND DeepSwitch2(1))) XOR (DeepSwitch1(2) XOR DeepSwitch2(2));
		salBin(0) <= ((((DeepSwitch1(0) AND DeepSwitch2(0)) AND ((DeepSwitch1(1) AND NOT(DeepSwitch2(1))) OR (NOT(DeepSwitch1(1)) AND DeepSwitch2(1)))) OR (DeepSwitch1(1) AND DeepSwitch2(1))) AND ((DeepSwitch1(2) AND NOT(DeepSwitch2(2))) OR (NOT(DeepSwitch1(2)) AND DeepSwitch2(2)))) OR (DeepSwitch1(2) AND DeepSwitch2(2));

		-- Mandarle al segundo gal el numero
		if salBin > "1001" then
			Trigger <= '1';
		else 
			Trigger <= '0';
		end if;

	end process;

end impl;