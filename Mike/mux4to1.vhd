library ieee;
use ieee.std_logic_1164.all;

entity mux4to1 is
	port (
		w0, w1, w2, w3, s0, s1 : in std_logic;
		f : out std_logic
	);
end mux4to1;

architecture logic of mux4to1 is
begin
	f <= w0 when ((s1 = '0') and (s0 = '0')) else
	w1 when ((s1 = '0') and (s0 = '1')) else
	w2 when ((s1 = '1') and (s0 = '0')) else
	w3 when ((s1 = '1') and (s0 = '1'));
end logic;