library ieee;
use ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;

entity Coords is 
	port(
		OPCODE: in std_logic_vector(3 downto 0);
		--Salida hacia el modulo de operaciones boooleanas
		BOOLEAN_OUT: out std_logic_vector(2 downto 0);
		--Salida hacia el modulo Flip and Negate (FN)
		FN_OUT: out std_logic_vector(1 downto 0);
		--Activar mayor menor igual
		I: out std_logic
	);
end Coords;


architecture impl of Coords is
	signal num : integer;
	begin
		num <= to_integer(unsigned(OPCODE));		
		process
		begin
			--wait for 10 ns;
			 I <= '0';
			 if ( num < 6 ) then
			 	BOOLEAN_OUT(2) <= OPCODE(2);
			 	BOOLEAN_OUT(1) <= OPCODE(1);
			 	BOOLEAN_OUT(0) <= OPCODE(0);
			 	--Desactivar FN
			 	FN_OUT(1) <= '0';
			 	FN_OUT(0) <= '0';
			 else
			 --Deactivar BOOLEAN OUT
			 	BOOLEAN_OUT(2) <= '0';
			 	BOOLEAN_OUT(1) <= '0';
			 	BOOLEAN_OUT(0) <= '0';
			 end if;

			 --Activar suma en FN
			 if(num = 6) then
			 	FN_OUT(1) <= '0';
			 	FN_OUT(0) <= '1';
			 elsif(num = 7) then
			 	FN_OUT(1) <= '1';
			 	FN_OUT(0) <= '0';
			 elsif(num = 8) then
			 	FN_OUT(1) <= '1';
			 	FN_OUT(0) <= '1';
			 elsif(num = 9) then
			 	FN_OUT(1) <= '0';
			 	FN_OUT(0) <= '0';
			 	I <= '1'; 	
			 end if;
		end process;
end impl;