library ieee;
use ieee.std_logic_1164.all;

entity tflipflop is
	port (
		T, clk : in std_logic;
		Q, Qn : out std_logic
	);
	
end tflipflop;

architecture logic of tflipflop is
	signal Qt : std_logic;
begin
	process (clk, T)
	begin
		if rising_edge(clk) and T = '1' then
			Qt <= not(Qt);
		end if;
	end process;
		Q <= Qt;
		Qn <= not(Qt);
end logic;