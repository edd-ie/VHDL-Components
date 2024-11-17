library ieee;
use ieee.std_logic_1164.all;

entity tflipflopAsyncClearPreset is
	port (
		T, clk, Cl, Pr : in std_logic;
		Q, Qn : out std_logic
	);
	
end tflipflopAsyncClearPreset;

architecture logic of tflipflopAsyncClearPreset is
	signal Qt : std_logic;
begin
	process (clk, T, Cl, Pr)
	begin
		if Cl = '1' then
				Qt <= '0';  -- Asynchronous Clear
		elsif Pr = '1' then
				Qt <= '1';  -- Asynchronous Preset
		elsif rising_edge(clk) then
			if T = '1' then
				Qt <= not(Qt);  -- T flip-flop toggle
			end if;
		end if;
	end process;
		Q <= Qt;
		Qn <= not(Qt);
end logic;