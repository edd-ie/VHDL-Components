library ieee;
use ieee.std_logic_1164.all;

entity modulo5CounterWithAsyncClearPreset is
    port(
        Clk, cl, pr : in std_logic;          
        Q : out std_logic_vector(2 downto 0)  
    );
end modulo5CounterWithAsyncClearPreset;

architecture logic of modulo5CounterWithAsyncClearPreset is
    signal Qt : std_logic_vector(2 downto 0);
	 signal clear_flag : std_logic;

    component tflipflopAsyncClearPreset is
        port (
            T, clk, Cl, Pr : in std_logic;
            Q, Qn : out std_logic
        );
    end component;

begin

    stage0 : tflipflopAsyncClearPreset port map (
        T => '1',            
        clk => Clk,
        Cl => cl or clear_flag,            
        Pr => pr,            
        Q => Qt(0)
    );

    stage1 : tflipflopAsyncClearPreset port map (
        T => Qt(0),          
        clk => Clk,
        Cl => cl or clear_flag,           
        Pr => pr,            
        Q => Qt(1)
    );

    stage2 : tflipflopAsyncClearPreset port map (
        T => Qt(0) and Qt(1), 
        clk => Clk,
        Cl => cl or clear_flag,           
        Pr => pr,            
        Q => Qt(2)
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
