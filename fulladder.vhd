
library IEEE;
use IEEE.std_logic_1164.all;

entity FULLADDER is

	port(X : in std_logic;
		 Y : in std_logic;
		 Z : in std_logic;
		 S : OUT std_logic;
		 C : OUT std_logic);
end FULLADDER;

architecture impl of FULLADDER is
begin
	process is
	begin
		C <= (Z AND ((X AND NOT(Y)) OR (NOT(X) AND Y))) OR (X AND Y);
		S <= Z XOR (X XOR Y);
		wait for 10 ns;
	end process;

end impl;