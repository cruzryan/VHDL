library IEEE;
use IEEE.std_logic_1164.all;


entity PB is
	port(
		A: in std_logic := '1';
		B: in std_logic := '0';
		X: out std_logic
		);
end PB;

architecture impl of PB is

	begin 
	-- X = (A+B’)’(A+B)
	X <= not(A or not(B)) and (A or B);	
end impl;