
--2.7 Compuerta AND

library IEEE;
use IEEE.std_logic_1164.all;

entity HW1 is

	port(A : in std_logic := '1';
		 B : in std_logic := '1';
		 F : out std_logic);
end HW1;

architecture hw1_arc of hw1 is
begin

	process is
	begin
		F <= A AND B;
		wait for 10 ns;
	end process;

end hw1_arc;