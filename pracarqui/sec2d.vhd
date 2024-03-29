-- 6 1 7 3 2 0 4
library ieee;
use ieee.std_logic_1164.all;

entity sec2_d is
    port (
		  A,B,C: inout std_logic
    );
end entity sec2_d;

architecture main of sec2_d is
    
begin
  process
  begin
    A <= not(B and A and C);
    B <= (C and (not(A) or B)) or (A and not(B and C));
    C <= (A and B) or (not(A and B) and C);
  wait for 10 ns;
  end process;
end architecture main;