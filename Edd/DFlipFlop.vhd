library ieee;
use ieee.std_logic_1164.all;

entity DFlipFlop is
    port (
        D, CLK : in std_logic;
        Q, QN : out std_logic
    );
end entity DFlipFlop;

architecture rtl of DFlipFlop is
begin
    process (CLK)
    begin
        if rising_edge(CLK) then
            Q <= D;
        end if;
    end process;

    QN <= not Q;
end architecture rtl;