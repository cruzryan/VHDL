library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use ieee.numeric_std.all;

--Mayor menor igual
entity MMI is 
	port(
		I: in std_logic;
		A : in std_logic_vector(3 downto 0);
		B : in std_logic_vector(3 downto 0);
		a_igual_b : out std_logic;  
        a_mayor_b : out std_logic; 
        b_mayor_a : out std_logic
	);
end MMI;

architecture impl of MMI is
	begin 
		process
		begin
		--wait for 10 ns;
		if I = '1' then
			if a = b then
            	a_igual_b <= '1';
				a_mayor_b <= '0';
				b_mayor_a <= '0';
        	else 
        	    a_igual_b <= '0';
        		if (to_integer(unsigned(a)) < to_integer(unsigned(b))) then
					b_mayor_a <= '1';
					a_mayor_b <= '0';
				else
					b_mayor_a <= '0';
					a_mayor_b <= '1';
        		end if;
        	end if;
        else 
            a_igual_b <= '0';
			b_mayor_a <= '0';
			a_mayor_b <= '0';
        end if;
		end process;
end impl;