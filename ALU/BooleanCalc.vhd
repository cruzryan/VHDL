library ieee;
use ieee.std_logic_1164.all;

entity BooleanCalc is 
	port(
		OPCODE: in std_logic_vector(2 downto 0);
		A : in std_logic_vector(3 downto 0);
		B : in std_logic_vector(3 downto 0);
		led_array: out std_logic_vector(3 downto 0)
	);
end BooleanCalc;


architecture impl of BooleanCalc is
	begin
	process 
	begin
	--wait for 10 ns;
		case OPCODE is
			when "001" => led_array <= (A AND B);
			when "010" => led_array <= (A OR B);
			when "011" => led_array <= (A XOR B);
			when "100" => led_array <= NOT(A);
			when "101" => led_array <= NOT(B);
			when others => led_array <= "0000";
		end case;
	end process;
end impl;