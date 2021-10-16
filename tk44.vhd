library ieee;
use IEEE.std_logic_1164.all;

entity decodeco is
	port(
		entradas : in  STD_LOGIC_VECTOR(0 to 7);
		salidas : out STD_LOGIC_VECTOR(0 to 2)
		);
end decodeco;

architecture cuerpo of decodeco is
	begin
		process is 
			begin
				if (entradas = "00000001") then 
					salidas <= "000";
				elsif (entradas = "00000010") then
					salidas <= "001";
				elsif (entradas = "00000100") then
					salidas <= "010";
				elsif (entradas = "00001000") then
					salidas <= "011";
				elsif (entradas = "00010000") then
					salidas <= "100";
				elsif (entradas = "00100000") then
					salidas <= "101";
				elsif (entradas = "01000000") then
					salidas <= "110";
				elsif (entradas = "10001000") then
					salidas <= "111";
				end if;
				wait for 10 ns;
		end process;
end cuerpo;