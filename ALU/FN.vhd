library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity FlipNegate is 
	port(
		OPCODE: in std_logic_vector(1 downto 0);

		A : in std_logic_vector(2 downto 0);
		B : in std_logic_vector(2 downto 0);

		X : out std_logic_vector(2 downto 0);
		Y : out std_logic_vector(2 downto 0)
	);
end FlipNegate;

architecture impl of FlipNegate is
	signal temp : std_logic_vector(2 downto 0);
	begin
	process 
	begin
	--wait for 10 ns;
		case OPCODE is
			--Sin cambio,  A + B
			when "01" => X <= A; Y <= B;
			-- Negando B,  A - B
			when "10" => X <= A; temp <= NOT(B); Y <= std_logic_vector(unsigned(temp + 1));
			-- Flip y Negando, B - A
			when "11" => temp <= NOT(A); Y <= std_logic_vector(unsigned(temp + 1)); X <= B;  
			-- Desactivado
			when others => X <= "000"; Y <= "000";
		end case;
	end process;
end impl;