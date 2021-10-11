library ieee;
use IEEE.std_logic_1164.all;

entity dmux is 
	port(
		a : out std_logic;
		b : out std_logic;
		c : out std_logic;
		d : out std_logic;

		dk: in std_logic;
		desinh: in std_logic;

		e0: in std_logic;
		e1: in std_logic
		);
end dmux;

architecture impl of dmux is
	
	signal ES: STD_LOGIC_VECTOR (0 to 1);

	begin
		k: process
		begin
			if desinh = '0' then
				a <= '0';
				b <= '0';
				c <= '0';
				d <= '0';
				wait for 10 ns;
			else 
				wait for 10 ns;
				ES(0) <= e0;
				ES(1) <= e1;
				wait for 10 ns;
				case ES is 
					when "00" => a <= dk; b <= '0'; c <= '0'; d <= '0';
					when "01" => a <= '0'; b <= dk; c <= '0'; d <= '0';
					when "10" => a <= '0'; b <= '0'; c <= dk; d <= '0';
					when "11" => a <= '0'; b <= '0'; c <= '0'; d <= dk;
					when others => report "unreachable" severity failure;
				end case;
			wait for 10 ns;
			end if;
		end process k;

end impl;