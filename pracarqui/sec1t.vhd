-- 4 0 2 3 7 1 6
library ieee;
use ieee.std_logic_1164.all;

entity sec1_t is
    port (
		A,B,C: inout std_logic
    );
end entity sec1_t;

architecture main of sec1_t is
    
begin
  process
  begin
    A <= (A and not(B and C)) or (C and (not(A) or B));
    B <= not(A xor B);
    C <= not(A) and (B xor C);
  wait for 10 ns;
  end process;
end architecture main;