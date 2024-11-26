LIBRARY ieee ;
USE ieee.std_logic_1164.all ;

ENTITY adder8 IS 
PORT (
    Cin, sub : IN STD_LOGIC ;
    X, Y : IN STD_LOGIC_VECTOR(7 DOWNTO 0); 
    S : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    Cout, overflow : OUT STD_LOGIC ) ; 
END adder8 ;

ARCHITECTURE Structure OF adder8 IS 
    SIGNAL C : STD_LOGIC_VECTOR(1 TO 8) ;

    COMPONENT fulladd
    PORT ( ci, sub, xi, yi: IN STD_LOGIC; 
        so, co : OUT STD_LOGIC );
    END COMPONENT ;
BEGIN
    stage0: fulladd PORT MAP ( Cin , sub, X(0), Y(0), S(0), C(1) ) ;
    stage1: fulladd PORT MAP ( C(1), sub, X(1), Y(1), S(1), C(2) ) ;
    stage2: fulladd PORT MAP ( C(2), sub, X(2), Y(2), S(2), C(3) ) ;
    stage3: fulladd PORT MAP ( C(3), sub, X(3), Y(3), S(3), C(4) ) ; 
    stage4: fulladd PORT MAP ( C(4), sub, X(4), Y(4), S(4), C(5) ) ;
    stage5: fulladd PORT MAP ( C(5), sub, X(5), Y(5), S(5), C(6) ) ;
    stage6: fulladd PORT MAP ( C(6), sub, X(6), Y(6), S(6), C(7) ) ;
    stage7: fulladd PORT MAP ( C(7), sub, X(7), Y(7), S(7), C(8) ) ;

    Cout <= C(8);
    overflow <= C(8) XOR C(7) ;
END Structure ;