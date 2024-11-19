library ieee;
use ieee.std_logic_1164.all;

entity TFlipFlop is
    port (
        CLK, T : IN std_logic;
        Q, Qn : OUT std_logic
    );
end TFlipFlop 

architecture upLogic of TFlipFlop is
    signal Qt : std_logic;
begin
    process (CLK, T)
    begin
        if rising_edge(CLK)  and T = '1' then
            Qt <= not Qt;
        end if;
    end process;

    Q <= Qt;
    Qn <= not Qt;
end upLogic;


