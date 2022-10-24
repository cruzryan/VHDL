-- 6 1 7 3 2 0 1
library ieee;
use ieee.std_logic_1164.all;

entity sec2_t is
    port (
		  A,B,C: inout std_logic
    );
end entity sec2_t;

architecture main of sec2_t is
    
begin
    A <= not(A xor B);
    B <= (not(A and B) and C) or (B and not C) or (A and not C);
    C <= B and (A xor C);
    
end architecture main;