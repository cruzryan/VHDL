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
	signal onn : STD_LOGIC;
begin

	comp : entity work.FA(impl) port map(
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