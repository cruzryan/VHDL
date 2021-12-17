library ieee;
use ieee.std_logic_1164.all;

--Simple adder
entity XY is 
	port(
		A : in std_logic_vector(2 downto 0);
		B : in std_logic_vector(2 downto 0);
		sum: out std_logic_vector(3 downto 0)
	);
end XY;

architecture impl of XY is
	signal C: std_logic_vector (2 downto 0) := "000";
	begin
		sum(0) <= A(0) xor B(0) xor C(0);
		C(1) <= (A(0) and B(0)) or (A(0) and C(0)) or (B(0) and C(0)); 

		sum(1) <= A(1) xor B(1) xor C(1);
		C(2) <= (A(1) and B(1)) or (A(1) and C(1)) or (B(1) and C(1)); 

		sum(2) <= A(2) xor B(2) xor C(2);
		sum(3) <= (A(2) and B(2)) or (A(2) and C(2)) or (B(2) and C(2)); 
end impl;