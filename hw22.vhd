-- y = ab + cb + ac

library ieee;
use ieee.std_logic_1164.all;

entity eq is
	port (A,B,C: in std_logic;
		  Y: out std_logic
		);
end eq;

use work.compuerta.all;

architecture s of eq is 
	signal x: bit_vector (0 to 2);
	begin 
		U0: and2 port map(A,B, x(0));
		U1: and2 port map(C,B, x(1));
		U2: and2 port map(A,C, x(2));
		U3: or3 port map(x(0), x(1), x(2), Y);
end s;


