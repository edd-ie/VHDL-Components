 LIBRARY ieee ;
USE ieee.std_logic_1164.all ;

ENTITY Lab6 IS 
    PORT (
        Cin, sub : IN STD_LOGIC ;
        X : STD_LOGIC_VECTOR(7 DOWNTO 0) ; 
        Y : STD_LOGIC_VECTOR(7 DOWNTO 0) ;
        so : OUT STD_LOGIC_VECTOR(7 DOWNTO 0); 
        hex1: OUT STD_LOGIC_VECTOR(6 DOWNTO 0); 
        hex0: OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
        Cout, overflow : OUT STD_LOGIC ) ; 
        
END Lab6 ;

ARCHITECTURE Structure OF Lab6 IS
    SIGNAL S : STD_LOGIC_VECTOR(7 DOWNTO 0) ;

    COMPONENT adder8 
        PORT (
            Cin, sub : IN STD_LOGIC ;
            X, Y : IN STD_LOGIC_VECTOR(7 DOWNTO 0); 
            S : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
            Cout, overflow : OUT STD_LOGIC) ;
    END COMPONENT ;

    COMPONENT nibble_to_7segment 
        PORT (
            D,C,B,A: IN std_logic; 
            HLa,HLb,HLc,HLd,HLe,HLf,HLg: OUT std_logic);
        END COMPONENT ;

BEGIN
    -- instantiate 8 bit adder
    stage0 : adder8 PORT MAP ( Cin, sub, X, Y, S, Cout, overflow ) ; 
    so <= S ;

    stage1 : nibble_to_7segment PORT MAP (S(7),S(6),S(5),S(4)
        , hex1(0), hex1(1), hex1(2), hex1(3), hex1(4), hex1(5), hex1(6)) ;

    stage2 : nibble_to_7segment PORT MAP (S(3),S(2),S(1),S(0)
        , hex0(0), hex0(1), hex0(2), hex0(3), hex0(4), hex0(5), hex0(6)) ;
END Structure ;