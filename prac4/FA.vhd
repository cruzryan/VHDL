library IEEE;
use IEEE.std_logic_1164.all;

entity FA is

	port(A : in std_logic; --A
		 B : in std_logic; --Y
		 K : in std_logic; -- K
		 Cin : in std_logic; --Cin
		 Sum : OUT std_logic; --Sum
		 Cout : OUT std_logic); --Cout
end FA;

architecture impl of FA is
begin
	process
	begin
		Cout <= (Cin AND ((A AND NOT(B XOR K)) OR (NOT(A) AND (B XOR K)))) OR (A AND (B XOR K));
		Sum <= Cin XOR (A XOR (B XOR K));
		--wait for 10 ns;
	end process;
end impl;