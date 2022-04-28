library IEEE;
use ieee.std_logic_1164.all;

entity PRAC2 is 
	PORT(
		CLK, CLR, D, J, K, S, R, T, PRE : IN std_logic;
		SEL : IN STD_LOGIC_VECTOR(0 to 1);
		Q, NQ : OUT std_logic
		);
end PRAC2;


architecture impl of PRAC2 is
signal tt: std_logic;
begin
	process(CLK, CLR, PRE, D, J, K, S, R, T)
	variable tmp: std_logic;
	begin 

		if(CLR = '0') then
			Q <= '0';
			NQ <= '1';
		elsif(PRE = '1' and CLK = '1' AND CLK'EVENT) then
			Q <= '1';
			NQ <= '0';
		-- D
		elsif (SEL = "00" and CLK = '1' AND CLK'EVENT) then
			Q <= D;
			NQ <= NOT D;
		--SR
		elsif (SEL = "01" and CLK = '1' AND CLK'EVENT) then
			if(S='0' and R='0')then
				tmp:=tmp;
			elsif(S='1' and R='1')then
				tmp:='Z';
			elsif(S='0' and R='1')then
				tmp:='0';
			else
				tmp:='1';
			end if;

			Q <= tmp;
			NQ <= not tmp;
		--JK
		elsif (SEL = "10" and CLK = '1' AND CLK'EVENT) then
			if(J='0' and K='0') then
				tmp:=tmp;
			elsif(J='1' and K='1') then
				tmp:= not tmp;
			elsif(J='0' and K='1') then
				tmp:='0';
			else
				tmp:='1';
			end if;

			Q <= tmp;
			NQ <= not tmp;
		--T
		else 
			if T='0' then
				tt <= tt;
			elsif T='1' then
				tt <= not (tt);
			end if;
			Q <= tt;
			NQ <= not tt;
		end if;
	end process;
end impl;