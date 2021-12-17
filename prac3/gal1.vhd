
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Prac3Logic is
port( a,b : in unsigned(2 downto 0);  
        a_igual_b : out std_logic;  
        a_menor_b : out std_logic;  
        a_mayor_b : out std_logic  
      );    
end Prac3Logic;

architecture impl of Prac3Logic is

signal notxor2,notxor1,notxor0,notand2,notand1,notand0,andnot2,andnot1,andnot0 : std_logic := '0';

begin

notxor2 <= not(a(2) xor b(2));
notxor1 <= not(a(1) xor b(1)); 
notxor0 <= not(a(0) xor b(0)); 

notand2 <= (not a(2)) and b(2);
notand1 <= (not a(1)) and b(1);
notand0 <= (not a(0)) and b(0);

andnot2 <= a(2) and (not b(2));
andnot1 <= a(1) and (not b(1));
andnot0 <= a(0) and (not b(0));

a_igual_b <= notxor2 and notxor1 and notxor0;
a_menor_b <= notand2 or (notxor2 and notand1) or (notxor2 and notxor1 and notand0); 
a_mayor_b <= andnot2 or (notxor2 and andnot1) or (notxor2 and notxor1 and andnot0); 

end impl;