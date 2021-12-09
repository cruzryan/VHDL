library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity PuntoExtra is
   port(

   	Cin: in std_logic;
   	K: inout std_logic;
    X: in std_logic_vector(3 downto 0);
    Y: in std_logic_vector(3 downto 0)
      );
end PuntoExtra;

architecture impl of PuntoExtra is

	signal suma: std_logic_vector (4 downto 0);
	signal car: std_logic_vector (4 downto 0);
	signal oc : std_logic;
	signal addsignal: std_logic_vector (4 downto 0) := "00000";

	signal suma2: std_logic_vector (4 downto 0);
	signal car2: std_logic_vector (4 downto 0);
	signal Cin2: std_logic := '0';

   	begin 
	   	car(0) <= Cin;

	   	car(1) <= (Cin AND ((X(0) AND NOT(Y(0))) OR (NOT(X(0)) AND Y(0)))) OR (X(0) AND Y(0));
			suma(0) <= Cin XOR (X(0) XOR Y(0));

			car(2) <= (car(1) AND ((X(1) AND NOT(Y(1))) OR (NOT(X(1)) AND Y(1)))) OR (X(1) AND Y(1));
			suma(1) <= car(1) XOR (X(1) XOR Y(1));

			car(3) <= (car(2) AND ((X(2) AND NOT(Y(2))) OR (NOT(X(2)) AND Y(2)))) OR (X(2) AND Y(2));
			suma(2) <= car(2) XOR (X(2) XOR Y(2));
		
			car(4) <= (car(3) AND ((X(3) AND NOT(Y(3))) OR (NOT(X(3)) AND Y(3)))) OR (X(3) AND Y(3));
			suma(4) <= (car(3) AND ((X(3) AND NOT(Y(3))) OR (NOT(X(3)) AND Y(3)))) OR (X(3) AND Y(3));
			suma(3) <= car(3) XOR (X(3) XOR Y(3));

			process is 
			begin
				wait for 10 ns;
			if ((suma(3) = '1' AND suma(2) = '1') OR (car(4) = '1') OR (suma(3) = '1' AND suma(1) = '1')) then
				oc <= '1';
				addsignal <= "00110";
			else
				oc <= '0';
				addsignal <= "00000";
			end if;
			end process;

			car2(1) <= (Cin2 AND ((suma(0) AND NOT(addsignal(0))) OR (NOT(suma(0)) AND addsignal(0)))) OR (suma(0) AND addsignal(0));
			suma2(0) <= Cin2 XOR (suma(0) XOR addsignal(0));

			car2(2) <= (car2(1) AND ((suma(1) AND NOT(addsignal(1))) OR (NOT(suma(1)) AND addsignal(1)))) OR (suma(1) AND addsignal(1));
			suma2(1) <= car2(1) XOR (suma(1) XOR addsignal(1));

			car2(3) <= (car2(2) AND ((suma(2) AND NOT(addsignal(2))) OR (NOT(suma(2)) AND addsignal(2)))) OR (suma(2) AND addsignal(2));
			suma2(2) <= car2(2) XOR (suma(2) XOR addsignal(2));
		
			suma2(4) <= (car2(3) AND ((suma(3) AND NOT(addsignal(3))) OR (NOT(suma(3)) AND addsignal(3)))) OR (suma(3) AND addsignal(3));
			suma2(3) <= car2(3) XOR (suma(3) XOR addsignal(3));

end impl;