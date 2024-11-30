library ieee;
use ieee.std_logic_1164.all;

entity TFlipFlop is
    port (
        CLK, T, CL: IN std_logic;
        Q: OUT std_logic
    );
end TFlipFlop;

architecture upLogic of TFlipFlop is
    signal Qt : std_logic;
begin
    process (CLK, T, CL)
    begin
        if CL = '0' then
            Qt <= '0';
        elsif rising_edge(CLK) then
            if T = '1' then
                Qt <= not Qt;
            end if;
        end if;
    end process;

    Q <= Qt;
end upLogic;


