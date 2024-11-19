library ieee;
use ieee.std_logic_1164.all;

entity JK_FF_SCPR is
    port (
        J, K, CLK, CLR, PRST : in std_logic;
        Q, QN : out std_logic
    );
end entity JK_FF_SCPR;

architecture rtl of JK_FF_SCPR is
begin
    process (CLK)
    begin
        if rising_edge(CLK) then
            if CLR = '1' then
                Q <= '0';
            elsif PRST = '1' then
                Q <= '1';
            else
                if J = '1' and K = '0' then -- Set
                    Q <= '1';
                elsif J = '0' and K = '1' then -- Reset
                    Q <= '0';
                elsif J = '1' and K = '1' then -- Toggle
                    Q <= not Q;
                end if;
            end if;
        end if;
    end process;

    QN <= not Q;
end architecture rtl;