library IEEE;
use IEEE.std_logic_1164.all;


entity Prac3Logic is
	port(
		A : in std_logic_vector(0 to 2);
		B : in std_logic_vector(0 to 2);
		DISPLAY : out std_logic_vector(0 to 6)
		);

end Prac3Logic;

architecture impl of Prac3Logic is
	-- flag 1: A es mayor, flag 2: B es mayor
	signal flag: integer := 0;
	begin
		process is 
		begin
		gl: for i in 0 to 2 loop
			
			wait for 10 ns;
			if (A(i) = '1') AND (B(i) = '0') AND (flag = 0) then
				flag <= 1;
			elsif (A(i) = '0') AND (B(i) = '1') AND (flag = 0) then
				flag <= 2;
			end if;
		end loop;
		end process;

		process is
		begin
			wait for 10 ns;

		-- Son iguales
		if (flag = 0) then
			DISPLAY <= "0001001";
		end if;

		-- A es mayor
		if (flag = 1) then
			DISPLAY <= "1110111";
		end if;

		-- B es mayor
		if (flag = 2) then
			DISPLAY <= "0011111";
		end if;
		end process;
end impl;