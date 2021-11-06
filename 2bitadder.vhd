library IEEE;
use IEEE.std_logic_1164.all;

entity HA is

	port(X1 : in std_logic;
		 Y1 : in std_logic;
		 S1 : INOUT std_logic;
		 C1 : INOUT std_logic;

		 X2 : in std_logic;
		 Y2 : in std_logic;
		 S2 : INOUT std_logic;
		 C2 : INOUT std_logic
		 );
end HA;

architecture impl of HA is
signal SAL: std_logic_vector (0 to 2);

begin
	process is
	begin
		C1 <= X1 AND Y1;
		S1 <= (NOT(X1) AND Y1) OR (X1 AND NOT(Y1));

		C2 <= (C1 AND ((X2 AND NOT(Y2)) OR (NOT(X2) AND Y2))) OR (X2 AND Y2);
		S2 <= C1 XOR (X2 XOR Y2);

		SAL(2) <= S1;
		SAL(1) <= S2;
		SAL(0) <= C2;
 
		wait for 10 ns;
	end process;

end impl;