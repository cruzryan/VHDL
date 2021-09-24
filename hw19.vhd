library IEEE;
use ieee.std_logic_1164.all;

entity robot is
	port(
		cajas : in STD_LOGIC_VECTOR(0 to 3);
		salir : out std_logic
		);
end robot;


architecture prog of robot is 
	begin 
		salir <= '1' when cajas = "1111" else '0';
end prog;