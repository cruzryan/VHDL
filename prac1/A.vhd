library IEEE;
use IEEE.std_logic_1164.all;


entity PA is
	port(
		A: in std_logic;
		B: in std_logic;
		X: out std_logic
		);
end PA;


architecture impl of PA is

	begin 
	-- X = (AB')' + AB' 
	X <= not(A and not(B)) or (A and not(B))	
end sw;