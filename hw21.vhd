-- c = ab + ab

library ieee;
use ieee.std_logic_1164.all;

entity eq is
	port (A,B: in std_logic;
		  N: out std_logic
		);
end eq;

--use work.compuerta.all;

architecture s of eq is 
	signal x: std_logic_vector (0 to 1);
	signal no_use: std_logic;

	begin 
		U0: entity work.compuerta(and2) port map(
			A => A, 
			B => B,
			C => no_use,
			F => x(0)
			);

		U1: entity work.compuerta(and2) port map(
			A => B, 
			B => A,
			C => no_use,
			F => x(1)
			);
		U2: entity work.compuerta(or2) port map(
			A => x(0), 
			B => x(1),
			C => no_use,
			F => N
			);
end s;


