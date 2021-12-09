library ieee;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity Prac4TB is 
	port(
		A : in STD_LOGIC_VECTOR(3 downto 0);
		B : in STD_LOGIC_VECTOR(3 downto 0);
		Sum : out STD_LOGIC_VECTOR(4 downto 0);
		Cout : INOUT STD_LOGIC_VECTOR(4 downto 0)
	); 
end Prac4TB;

architecture sim of Prac4TB is
	signal o : STD_LOGIC_VECTOR(0 to 4);
	signal K : STD_LOGIC := '0';
	signal Cin : STD_LOGIC := '0';
begin
	fa3 : entity work.FA(impl) port map(
		A => A(3),
		B => B(3),
		K => K,
		Cin => Cin,
		Cout => Cout(4),  
		Sum => Sum(4)
	);

	fa2 : entity work.FA(impl) port map(
		A => A(2),
		B => B(2),
		K => K,
		Cin => Cout(4),
		Cout => Cout(3),  
		Sum => Sum(3)  
	);

	fa1 : entity work.FA(impl) port map(
		A => A(1),
		B => B(1),
		K => K,
		Cin => Cout(3),
		Cout => Cout(2),  
		Sum => Sum(2)  
	);

	fa0 : entity work.FA(impl) port map(
		A => A(0),
		B => B(0),
		K => K,
		Cin => Cout(2),
		Cout => Sum(0),  
		Sum => Sum(1)  
	);

end sim;