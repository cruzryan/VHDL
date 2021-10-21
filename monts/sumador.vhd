library ieee;
use ieee.std_logic_1164.all;
use ieee.NUMERIC_STD.ALL;

entity sumador is 
	port(

		signal U : in STD_LOGIC_VECTOR(0 to 3);
		signal D : in STD_LOGIC_VECTOR(0 to 3);

		signal SEG1 : out STD_LOGIC_VECTOR(0 to 6);
		signal SEG2 : out STD_LOGIC_VECTOR(0 to 6)

	);
end sumador;


architecture impl of sumador is

	signal u_int : integer;
	signal d_int : integer;
	signal sum_int : integer;
	--signal sum_vec : std_logic_vector(0 to 2);

	begin 
		u_int <= to_integer(unsigned(U));
		d_int <= to_integer(unsigned(D));
		sum_int <= u_int + d_int;
		--sum_vec <= std_logic_vector(to_unsigned(sum_int, sum_vec'length));
	process is
	begin 
		wait for 10 ns;
		case sum_int is
			when 0 => SEG1 <= "1111110"; SEG2 <= "1111110";
			when 1 => SEG1 <= "1111110"; SEG2 <= "0110000";
			when 2 => SEG1 <= "1111110"; SEG2 <= "1101101";
			when 3 => SEG1 <= "1111110"; SEG2 <= "1111001";
			when 4 => SEG1 <= "1111110"; SEG2 <= "0110011";
			when 5 => SEG1 <= "1111110"; SEG2 <= "1011011";
			when 6 => SEG1 <= "1111110"; SEG2 <= "1011111";
			when 7 => SEG1 <= "1111110"; SEG2 <= "1110000";
			when 8 => SEG1 <= "1111110"; SEG2 <= "1111111";
			when 9 => SEG1 <= "1111110"; SEG2 <= "1110011";

			when 10 => SEG1 <= "0110000"; SEG2 <= "1111110";
			when 11 => SEG1 <= "0110000"; SEG2 <= "0110000";
			when 12 => SEG1 <= "0110000"; SEG2 <= "1101101";
			when 13 => SEG1 <= "0110000"; SEG2 <= "1111001";
			when 14 => SEG1 <= "0110000"; SEG2 <= "0110011";
			when 15 => SEG1 <= "0110000"; SEG2 <= "1011011";
			when 16 => SEG1 <= "0110000"; SEG2 <= "1011111";
			when 17 => SEG1 <= "0110000"; SEG2 <= "1110000";
			when 18 => SEG1 <= "0110000"; SEG2 <= "1111111";
			when 19 => SEG1 <= "0110000"; SEG2 <= "1110011";

			when 20 => SEG1 <= "1111001"; SEG2 <= "1111110";
			when 21 => SEG1 <= "1111001"; SEG2 <= "0110000";
			when 22 => SEG1 <= "1111001"; SEG2 <= "1101101";
			when 23 => SEG1 <= "1111001"; SEG2 <= "1111001";
			when 24 => SEG1 <= "1111001"; SEG2 <= "0110011";
			when 25 => SEG1 <= "1111001"; SEG2 <= "1011011";
			when 26 => SEG1 <= "1111001"; SEG2 <= "1011111";
			when 27 => SEG1 <= "1111001"; SEG2 <= "1110000";
			when 28 => SEG1 <= "1111001"; SEG2 <= "1111111";
			when 29 => SEG1 <= "1111001"; SEG2 <= "1110011";
			when 30 => SEG1 <= "1111001"; SEG2 <= "1111110";
		when others => report "unreachable" severity failure;
		end case;
		wait for 10 ns;
	end process;


end impl;