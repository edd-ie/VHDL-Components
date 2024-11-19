library ieee;
use ieee.std_logic_1164.all;

entity async_4bit_upcounter_jk is
    port (
        CLK, CLR : in std_logic;
        Q : out std_logic_vector(3 downto 0)
    );
end entity async_4bit_upcounter_jk;

architecture rtl of async_4bit_upcounter_jk is
    component JK_FF is
        port (
            J, K, CLK, CLR : in std_logic;
            Q, QN : out std_logic
        );
    end component;

    signal Q0, Q1, Q2, Q3 : std_logic;

begin
    -- Instantiate JK flip-flops
    FF0: JK_FF port map ('1', '0', CLK, CLR, Q0, open);
    FF1: JK_FF port map (Q0, '0', CLK, CLR, Q1, open);
    FF2: JK_FF port map (Q1, '0', CLK, CLR, Q2, open);
    FF3: JK_FF port map (Q2, '0', CLK, CLR, Q3, open);

    -- Assign output
    Q <= Q3 & Q2 & Q1 & Q0;
end architecture rtl;