-- 0 = 25%
-- 1 = 100%

library IEEE;
use ieee.std_logic_1164.all;

entity arroz is 
	port(
		a: in std_logic;
		b: in std_logic;
		d: out std_logic;
		e: out std_logic
		);
end arroz;

architecture XD of arroz is
	begin
		d <= a NAND b;
		e <= '1' when (a = '0') AND (b = '0') else '0';
end XD;