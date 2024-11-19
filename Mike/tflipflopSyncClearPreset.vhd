library ieee;
use ieee.std_logic_1164.all;

entity tflipflopSyncClearPreset is
	port (
		T, clk, Cl, Pr : in std_logic;
		Q, Qn : out std_logic
	);
	
end tflipflopSyncClearPreset;

architecture logic of tflipflopSyncClearPreset is
	signal Qt : std_logic;
begin
	process (clk, T, Cl, Pr)
	begin
		if rising_edge(clk) then
			if Cl = '1' then
				Qt <= '0';  -- Synchronous Clear
			elsif Pr = '1' then
				Qt <= '1';  -- Synchronous Preset
			elsif T = '1' then
				Qt <= not(Qt);  -- T flip-flop toggle
			end if;
		end if;
	end process;
		Q <= Qt;
		Qn <= not(Qt);
end logic;