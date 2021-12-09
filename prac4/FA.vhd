library IEEE;
use IEEE.std_logic_1164.all;

entity FA is

	port(A : in std_logic; --A
		 B : in std_logic; --Y
		 K : in std_logic; -- K
		 Cin : in std_logic; --Cin
		 Sum : OUT std_logic; --Sum
		 Cout : OUT std_logic; --Cout
		 INO : INOUT std_logic);
end FA;

architecture impl of FA is
begin
	process
	begin
		INO <= (B XOR K);
		Cout <= (Cin AND ((A AND NOT(INO)) OR (NOT(A) AND (INO)))) OR (A AND (INO));
		Sum <= Cin XOR (A XOR (INO));
		wait for 10 ns;
	end process;
end impl;