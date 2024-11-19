Library ieee;
use ieee.std_logic_1164.all;

Entity Decoder is
    port( 
        a : IN std_logic_vector(3 downto 0);
        En : IN std_logic;
        L : OUT std_logic_vector(0 to 15)
    );
end Decoder;

Architecture struct of Decoder is
    component dec2to4 
        port( 
            w : IN std_logic_vector(1 downto 0);
            En : IN std_logic;
            y : OUT std_logic_vector(0 to 3)
        );
    end component;

    SIGNAL y0, y1, y2, y3 : std_logic_vector(0 to 3);

Begin
    stage0: dec2to4 port map (a(1 downto 0), En, y0);
    stage1: dec2to4 port map (a(1 downto 0), En, y1);
    stage2: dec2to4 port map (a(1 downto 0), En, y2);
    stage3: dec2to4 port map (a(1 downto 0), En, y3);
    
    L(0 to 3) <= y0 when a(3 downto 2) = "00" else (others => '0');
    L(4 to 7) <= y1 when a(3 downto 2) = "01" else (others => '0');
    L(8 to 11) <= y2 when a(3 downto 2) = "10" else (others => '0');
    L(12 to 15) <= y3 when a(3 downto 2) = "11" else (others => '0');
end struct;