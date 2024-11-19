library ieee;
use ieee.std_logic_1164.all;

entity DownCounterWithSyncClearPreset is
    port(
        Clk, cl, pr : in std_logic;      -- Clock, Clear, and Preset
        Q : out std_logic_vector(2 downto 0)  -- Output count
    );
end DownCounterWithSyncClearPreset;

architecture logic of DownCounterWithSyncClearPreset is

    signal Qt : std_logic_vector(2 downto 0);
	 signal clear_flag : std_logic;

    component tflipflopSyncClearPreset is
        port (
            T, clk, Cl, Pr : in std_logic;
            Q, Qn : out std_logic
        );
    end component;

begin
    -- Stage 0 (LSB)
    stage0 : tflipflopSyncClearPreset port map (
        clk => Clk,
        T => '1',            -- Always toggles
        Pr => pr,            -- Preset
        Cl => cl or clear_flag,            -- Asynchronous Clear
        Q => Qt(0),
        Qn => open
    );

    -- Stage 1
    stage1 : tflipflopSyncClearPreset port map (
        clk => Clk,
        T => not(Qt(0)),          -- Toggles when Stage 0 is high
        Pr => pr,            -- Preset
        Cl => cl or clear_flag,            -- Asynchronous Clear
        Q => Qt(1),
        Qn => open
    );

    -- Stage 2 (MSB)
    stage2 : tflipflopSyncClearPreset port map (
        clk => Clk,
        T => not(Qt(0)) and not(Qt(1)),  -- Toggles when Stage 0 and Stage 1 are high
        Pr => pr,              -- Preset
        Cl => cl or clear_flag,              -- Asynchronous Clear
        Q => Qt(2),
        Qn => open
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

    -- Output the counter value
    Q <= Qt;  -- Show the actual count

end logic;
