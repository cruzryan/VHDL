library IEEE;
use ieee.std_logic_1164.all;

entity caja is
	port(
		a: in std_logic;
		b: in std_logic;
		c: in std_logic;
		d: in std_logic;
		s: out std_logic
		);
end caja;

architecture sec of caja is
	begin 
		s <= '1' when((a = '1') AND (b = '0') AND (c ='1') AND (d ='1')) else '0';
end sec;