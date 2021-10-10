library ieee;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity TB2 is 
	port(
		a : in STD_LOGIC_VECTOR(0 to 3);
		b : in STD_LOGIC_VECTOR(0 to 3);
		o : out STD_LOGIC_VECTOR(0 to 3)
	); 
end TB2;


architecture sim of TB2 is

	--signal a : STD_LOGIC_VECTOR(0 to 3);
	--signal b : STD_LOGIC_VECTOR(0 to 3);
	--signal push : STD_LOGIC_VECTOR(0 to 3);
	signal onn : STD_LOGIC_VECTOR(0 to 3);
	--signal deco : out STD_LOGIC_VECTOR(0 to 6)

begin

	comp : entity work.comparador(impl) port map(
		a => a,
		b => b,
		o => onn
	); 

	mux : entity work.mux2x14c(impl) port map(
		a => a,
		b => b,
		push => onn,
		o => o
	);

end sim;