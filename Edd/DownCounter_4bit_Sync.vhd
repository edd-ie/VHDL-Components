library ieee;
use ieee.std_logic_1164.all;

entity sync_4bit_downcounter_tff is
    port (
        CLK, CLR, EN : in std_logic;
        Q : out std_logic_vector(3 downto 0)
    );
end entity sync_4bit_downcounter_tff;

architecture rtl of sync_4bit_downcounter_tff is
    signal T0, T1, T2, T3 : std_logic;

    component T_FF is
        port (
            CLK, T, CLR : in std_logic;
            Q, QN : out std_logic
        );
    end component;

    signal Q0, Q1, Q2, Q3 : std_logic;

begin
    -- Instantiate T flip-flops
    FF0: T_FF port map (CLK, T0, CLR, Q0, open);
    FF1: T_FF port map (CLK, T1, CLR, Q1, open);
    FF2: T_FF port map (CLK, T2, CLR, Q2, open);
    FF3: T_FF port map (CLK, T3, CLR, Q3, open);

    -- Generate T inputs for flip-flops
    T0 <= EN and Q0;
    T1 <= EN and Q1;
    T2 <= EN and Q2;
    T3 <= EN and Q3;

    -- Assign output
    Q <= Q3 & Q2 & Q1 & Q0;
end architecture rtl;