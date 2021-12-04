library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity Filter is
	port(
		FA : in std_logic_vector(4 downto 0); -- 0|1234, 1 bit signo + 4 bits mag 
		D1 : out std_logic; -- Decoder 1
		D2 : inout std_logic_vector(4 downto 0)  -- Decoder 2
		);
end Filter;

architecture impl of Filter is

constant ONE:   UNSIGNED(FA'RANGE) := (0 => '1', others => '0');

begin
	process 
	begin
	if (FA(4) = '1') then
		D2 <= std_logic_vector(unsigned (not FA) + ONE);
	elsif (FA(4) = '0') then 
		D2 <= FA;
	end if;

	if (signed(D2) > "01001") or (signed(D2) < "10111") then
			D1 <= '1';
	else
			D1 <= '0';
	end if;
	--wait for 10 ns;
	end process;

end impl;