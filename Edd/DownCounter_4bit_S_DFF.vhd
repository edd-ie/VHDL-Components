library ieee;
use ieee.std_logic_1164.all;

entity sync_4bit_downcounter is
    port (
        CLK, CLR, EN : in std_logic;
        Q : out std_logic_vector(3 downto 0)
    );
end entity sync_4bit_downcounter;

architecture rtl of sync_4bit_downcounter is
    component D_FF is
        port (
            D, CLK, CLR : in std_logic;
            Q, QN : out std_logic
        );
    end component;

    signal next_q : std_logic_vector(3 downto 0);

begin
    -- Instantiate D flip-flops
    FF0: D_FF port map (next_q(0), CLK, CLR, Q(0), open);
    FF1: D_FF port map (next_q(1), CLK, CLR, Q(1), open);
    FF2: D_FF port map (next_q(2), CLK, CLR, Q(2), open);
    FF3: D_FF port map (next_q(3), CLK, CLR, Q(3), open);

    -- Generate next state logic
    process(CLK, CLR, EN, Q)
    begin
        if rising_edge(CLK) then
            if CLR = '1' then
                next_q <= "0000";
            elsif EN = '1' then
                next_q <= Q - "0001";
            else
                next_q <= Q;
            end if;
        end if;
    end process;
end architecture rtl;