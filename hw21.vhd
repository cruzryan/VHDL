-- c = ab + ab

library ieee;
use ieee.std_logic_1164.all;

entity eq is
	port (A,B: in std_logic;
		  C: out std_logic
		);
end eq;

use word.compuerta.all;

architecture s of eq is 
	signal x: bit_vector (0 to 1);
	begin 
		U0: and2 port map(A,B, x(0));
		U1: and2 port map(B,A, x(1));
		U3: or2 port map(x(0), x(1), C);
end s;


