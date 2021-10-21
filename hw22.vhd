-- y = ab + cb + ac

library ieee;
use ieee.std_logic_1164.all;

entity hw22 is
	port (A,B,C: in std_logic;
		  Y: out std_logic
		);
end hw22;

--use work.compuerta.all;

architecture s of hw22 is 
	signal x: std_logic_vector (0 to 2);
	signal no_use: std_logic;

	begin 
		U0: entity work.compuerta(and2) port map(
			A => A, 
			B => B,
			C => no_use,
			F => x(0)
			);

		U1: entity work.compuerta(and2) port map(
			A => C, 
			B => B,
			C => no_use,
			F => x(1)
			);
		U2: entity work.compuerta(and2) port map(
			A => A, 
			B => C,
			C => no_use,
			F => x(2)
			);
		U3: entity work.compuerta(or3) port map(
			A => x(0), 
			B => x(1),
			C => x(2),
			F => Y
			);
end s;


