library ieee;
use ieee.std_logic_1164.all;

entity async_4bit_upcounter is
    port (
        CLK, CLR : in std_logic;
        Q : out std_logic_vector(3 downto 0)
    );
end entity async_4bit_upcounter;

architecture rtl of async_4bit_upcounter is
    component D_FF is
        port (
            D, CLK, CLR : in std_logic;
            Q, QN : out std_logic
        );
    end component;

    signal Q0, Q1, Q2, Q3 : std_logic;

begin
    -- Instantiate D flip-flops
    FF0: D_FF port map ('1', CLK, CLR, Q0, open);
    FF1: D_FF port map (Q0, CLK, CLR, Q1, open);
    FF2: D_FF port map (Q1, CLK, CLR, Q2, open);
    FF3: D_FF port map (Q2, CLK, CLR, Q3, open);

    -- Assign output
    Q <= Q3 & Q2 & Q1 & Q0;
end architecture rtl;