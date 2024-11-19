library ieee;
use ieee.std_logic_1164.all;

entity DFlipFlopSyncClrPr is
    port (
        D, CLK, CLR, PRST : in std_logic;
        Q, QN : out std_logic
    );
end entity DFlipFlopSyncClrPr;

architecture rtl of DFlipFlopSyncClrPr is
begin
    process (CLK)
    begin
        if rising_edge(CLK) then
            if CLR = '1' then
                Q <= '0';
            elsif PRST = '1' then
                Q <= '1';
            else
                Q <= D;
            end if;
        end if;
    end process;

    QN <= not Q;
end architecture rtl;