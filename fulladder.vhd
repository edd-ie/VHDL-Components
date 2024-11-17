library ieee;
use ieee.std_logic_1164.all;

entity fulladder is
	port(
	    	c, a, b : in std_logic;
		si, ci : out std_logic
	    );
end fulladder;

architecture logic of fulladder is
begin
	si <= c xor (a xor b);
	ci <= (c and (a xor b)) or (a and b);
end logic;
