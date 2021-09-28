library IEEE;
use IEEE.std_logic_1164.all;


entity PC is
	port(
		A: in std_logic;
		B: in std_logic;
		X: out std_logic
		);
end PC;


architecture impl of PC is

	begin 
	-- X = A’+B+AB
	X <= not(A) or B or (A and B)
end impl;