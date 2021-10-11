library ieee;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity TB1 is 
	port(
		a : in STD_LOGIC_VECTOR(0 to 3);
		b : in STD_LOGIC_VECTOR(0 to 3);
		push : in std_logic;
		deco : out STD_LOGIC_VECTOR(0 to 6)
	); 
end TB1;


architecture sim of TB1 is
	signal o : STD_LOGIC_VECTOR(0 to 3);
begin
	mux : entity work.mux2x14c(impl) port map(
		a => a,
		b => b,
		push => push,
		o => o
	);

	dec : entity work.deco7seg(impl) port map(
		i => o,
		deco => deco
	);


end sim;