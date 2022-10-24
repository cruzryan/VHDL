-- 4 0 2 3 7 1 6
library ieee;
use ieee.std_logic_1164.all;

entity sec1_d is
    port (
		A,B,C: inout std_logic
    );
end entity sec1_d;

architecture main of sec1_d is
    
begin
  process
  begin
    A <= (not(A) and C) or (A and B and not(C));
    B <= not A;
    C <= B and (not(A) or C);
    wait for 10 ns;
  end process;
    
end architecture main;