library ieee;
use ieee.std_logic_1164.all;

entity TFlipFlop is
    port (
        CLK, T, CL, PR : IN std_logic;
        Q, Qn : OUT std_logic
    );
end TFlipDlop;

architecture upLogic of TFlipDlop is
    signal Qt : std_logic;
begin
    process (CLK, T, CL, PR)
    begin
        if CL = '0' then
            Qt <= '0';
        elsif PR = '0' then
            Qt <= '1';
        elsif rising_edge(CLK) then
            if T = '1' then
                Qt <= not Qt;
            end if;
        end if;
    end process;

    Q <= Qt;
    Qn <= not Qt;
end upLogic;


