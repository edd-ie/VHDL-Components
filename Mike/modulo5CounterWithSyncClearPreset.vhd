library ieee;
use ieee.std_logic_1164.all;

entity modulo5CounterWithSyncClearPreset is
	port(
		Clk, cl, pr : in std_logic;
		Q : out std_logic_vector(2 downto 0)
	);
end modulo5CounterWithSyncClearPreset;

architecture logic of modulo5CounterWithSyncClearPreset is

	signal Qt : std_logic_vector(2 downto 0);
	signal clear_flag : std_logic;

	component tflipflopSyncClearPreset is
		port (
			T, clk, Cl, Pr : in std_logic;
			Q, Qn : out std_logic
		);
		
	end component;
	
begin
	stage0 : tflipflopSyncClearPreset port map (
		clk => Clk,
		T => '1',
		Pr => pr,
		Q => Qt(0),
		Cl => cl or clear_flag
	);
	
	stage1 : tflipflopSyncClearPreset port map (
		clk => Clk,
		T => Qt(0),
		Pr => pr,
		Q => Qt(1),
		Cl => cl or clear_flag
	);
	
	stage2 : tflipflopSyncClearPreset port map (
		clk => Clk,
		T => Qt(0) and Qt(1),
		Pr => pr,
		Q => Qt(2),
		Cl => cl or clear_flag
	);
	
	-- Logic to reset the counter to 0 when it reaches 5 (binary 101)
    process(Clk, cl)  -- Sensitive to Clk and Clear
    begin
        if cl = '1' then
            clear_flag <= '1';  -- Set clear flag for reset
        elsif Qt = "101" then
            clear_flag <= '1';  -- Set clear flag to reset counter at 5
        else
            clear_flag <= '0';  -- Otherwise, clear flag is inactive
        end if;
    end process;
		
	Q <= Qt;
end logic;