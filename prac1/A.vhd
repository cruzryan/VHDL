library IEEE;
use IEEE.std_logic_1164.all;


entity SWITCH is
	port(
		A: in std_logic;
		B: in std_logic;
		X: out std_logic
		);
end SWITCH;


architecture sw of SWITCH is

	begin 
	-- X = (AB')' + AB' 
	X <= not(A and not(B)) or (A and not(B))	
end sw;