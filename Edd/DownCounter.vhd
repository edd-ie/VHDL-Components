library ieee;
use ieee.std_logic_1164.all;

entity sync_4bit_downcounter is
    port (
        CLK, CLR, LD, EN : in std_logic;
        D : in std_logic_vector(3 downto 0);
        Q : out std_logic_vector(3 downto 0)
    );
end entity sync_4bit_downcounter;

architecture rtl of sync_4bit_downcounter is
    signal next_q : std_logic_vector(3 downto 0);

begin
    process(CLK, CLR, LD, EN)
    begin
        if rising_edge(CLK) then
            if CLR = '1' then
                next_q <= "0000";
            elsif LD = '1' then
                next_q <= D;
            elsif EN = '1' then
                next_q <= Q - "0001";
            else
                next_q <= Q;
            end if;
        end if;
    end process;

    Q <= next_q;
end architecture rtl;