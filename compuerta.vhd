library ieee;
use ieee.std_logic_1164.all;

entity compuerta is 
	port(
		A,B,C: in std_logic;
		F: out std_logic
	);
end entity;


architecture and2 of compuerta is
	begin 
		F <= A and B;
end and2;

architecture or2 of compuerta is
	begin
		F <= A or B;
end or2;

architecture or3 of compuerta is

	begin 
		F <= A or B or c;
end or3;