library ieee;
use ieee.std_logic_1164.all;

entity async_4bit_upcounter is
    port (
        CLK, CLR, PRST : in std_logic;
        Q : out std_logic_vector(3 downto 0)
    );
end entity async_4bit_upcounter;

architecture rtl of async_4bit_upcounter is
    component T_FF is
        port (
            CLK, T, CL, PR : in std_logic;
            Q, Qn : out std_logic
        );
    end component;

    signal Q0, Q1, Q2, Q3 : std_logic;

begin
    -- Instantiate T flip-flops
    FF0: T_FF port map (CLK, '1', CLR, PRST, Q0, open);
    FF1: T_FF port map (CLK, Q0, CLR, PRST, Q1, open);
    FF2: T_FF port map (CLK, Q1, CLR, PRST, Q2, open);
    FF3: T_FF port map (CLK, Q2, CLR, PRST, Q3, open);

    -- Assign outputs
    Q <= Q3 & Q2 & Q1 & Q0;
end architecture rtl;