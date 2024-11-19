library ieee;
use ieee.std_logic_1164.all;

entity sync_4bit_upcounter is
    port (
        CLK, CLR, LD, EN : in std_logic;
        D : in std_logic_vector(3 downto 0);
        Q : out std_logic_vector(3 downto 0)
    );
end entity sync_4bit_upcounter;

architecture rtl of sync_4bit_upcounter is
    component DFlipFlopSyncClrPr is
        port (
            D, CLK, CLR, PRST : in std_logic;
            Q, QN : out std_logic
        );
    end component;

    signal next_q : std_logic_vector(3 downto 0);

begin
    -- Instantiate D flip-flops
    FF0: DFlipFlopSyncClrPr port map (next_q(0), CLK, CLR, '0', Q(0), open);
    FF1: DFlipFlopSyncClrPr port map (next_q(1), CLK, CLR, '0', Q(1), open);
    FF2: DFlipFlopSyncClrPr port map (next_q(2), CLK, CLR, '0', Q(2), open);
    FF3: DFlipFlopSyncClrPr port map (next_q(3), CLK, CLR, '0', Q(3), open);

    -- Generate next state logic
    process(CLK, CLR, LD, EN, Q)
    begin
        if rising_edge(CLK) then
            if CLR = '1' then
                next_q <= "0000";
            elsif LD = '1' then
                next_q <= D;
            elsif EN = '1' then
                next_q <= Q + "0001";
            else
                next_q <= Q;
            end if;
        end if;
    end process;
end architecture rtl;