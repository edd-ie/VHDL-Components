library ieee;
use ieee.std_logic_1164.all;

entity DFlipFlopAsyncClrPr is
    port (
        D, CLK, Clr, Pr : in std_logic;
        Q, QN : out std_logic
    );
end entity DFlipFlopAsyncClrPr;

architecture rtl of DFlipFlopAsyncClrPr is
begin
    process (CLK, Clr, Pr)
    begin
        if Clr = '1' then
            Q <= '0';
        elsif Pr = '1' then
            Q <= '1';
        elsif rising_edge(CLK) then
            Q <= D;
        end if;
    end process;

    QN <= not Q;
end architecture rtl;