library ieee;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity TB3 is 
	port(
		a0 : out std_logic;
		b0 : out std_logic;
		c0 : out std_logic;
		d0 : out std_logic;

		a1 : out std_logic;
		b1 : out std_logic;
		c1 : out std_logic;
		d1 : out std_logic;

		d_1: in std_logic;
		d_2: in std_logic;

		desinh1: in std_logic;
		desinh2: in std_logic;

		e0: in std_logic;
		e1: in std_logic
	); 
end TB3;


architecture sim of TB3 is
begin

	dmux1 : entity work.dmux(impl) port map (
		a => a0,
		b => b0,
		c => c0,
		d => d0,

		dk => d_1,
		desinh => desinh1,

		e0 => e0,
		e1 => e1
	);

	dmux2 : entity work.dmux(impl) port map (
		a => a1,
		b => b1,
		c => c1,
		d => d1,

		dk => d_2,
		desinh => desinh2,

		e0 => e0,
		e1 => e1
	);

end sim;