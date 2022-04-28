library ieee;
use ieee.std_logic_1164.all;

entity DecoderMMI is 
	port(
		a_igual_b : in std_logic;  
        a_mayor_b : in std_logic; 
        b_mayor_a : in std_logic;
		DISPLAY: out std_logic_vector(0 to 6)
	);
end DecoderMMI;


architecture impl of DecoderMMI is
	signal op: std_logic_vector (2 downto 0);
	begin 
		op(2) <= a_igual_b;
		op(1) <= a_mayor_b;
		op(0) <= b_mayor_a;

		process 
		begin
			--wait for 10 ns;
			case op is 
			-- Iguales = 
			when "100" => DISPLAY <= "0001001";
			-- A es mayor A
			when "010" => DISPLAY <= "1110111";
			-- B es mayor b
			when "001" => DISPLAY <= "0011111";
			-- Apagado
			when others => DISPLAY <= "0000000";
			end case;

		end process;

end impl;