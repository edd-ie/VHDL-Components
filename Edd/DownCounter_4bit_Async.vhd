library ieee;
use ieee.std_logic_1164.all;

entity async_4bit_downcounter_tff is
    port (
        CLK, CLR : in std_logic;
        Q : out std_logic_vector(3 downto 0)
    );
end entity async_4bit_downcounter_tff;

architecture rtl of async_4bit_downcounter_tff is
    component T_FF is
        port (
            CLK, T, CLR : in std_logic;
            Q, QN : out std_logic
        );
    end component;

    signal Q0, Q1, Q2, Q3 : std_logic;

begin
    -- Instantiate T flip-flops
    FF0: T_FF port map (CLK, '1', CLR, Q0, open);
    FF1: T_FF port map (CLK, Q0, CLR, Q1, open);
    FF2: T_FF port map (CLK, Q1, CLR, Q2, open);
    FF3: T_FF port map (CLK, Q2, CLR, Q3, open);

    -- Assign output
    Q <= Q3 & Q2 & Q1 & Q0;
end architecture rtl;