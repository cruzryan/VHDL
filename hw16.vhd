--Functional buffer

library IEEE;
use IEEE.std_logic_1164.all;

entity LAMP is
   port(
      A: in std_logic;
      B: out std_logic
      );
end LAMP;

architecture morse of LAMP is
   begin 
      m: process(a)
      begin 
         if A = '1' then
            B <= '1';
         else
            B <= '0';
      end if;
   end process m;
end morse;