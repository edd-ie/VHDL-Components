library ieee;
use ieee.std_logic_1164.all;

entity halfadder is
	port (
	     	a, b : in std_logic;
		s, c : out std_logic
	     );
end halfadder;

architecture logic of halfadder is
begin
	s <= a xor b;
	c <= a and b;
end logic;
