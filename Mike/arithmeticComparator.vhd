library ieee;
use ieee.std_logic_1164.all;

entity arithmeticComparator is
	port (
		A, B : in std_logic_vector(0 to 3);
		AeqB, AgtB, AltB : out std_logic
	);
end arithmeticComparator;


architecture logic of arithmeticComparator is
begin
	AeqB <= '1' when A = B else '0';
	AgtB <= '1' when A > B else '0';
	AltB <= '1' when A < B else '0';
end logic;
