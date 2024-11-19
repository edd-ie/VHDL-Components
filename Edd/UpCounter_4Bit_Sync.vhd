library ieee;
use ieee.std_logic_1164.all;

Entity Lab8 is
    Port(
        CLK, En, CLRn, PRn : IN std_logic;
        Q : OUT std_logic_vector(0 to 3);
        Qn : OUT std_logic_vector(0 to 3)
    );
End Lab8;

Architecture UpCounter of Lab8 is
    component T_FF
        Port(
            CLK, T, CL, PR : IN std_logic;
            Q, Qn : out std_logic
        );
    end component;

    signal Q0, Q1, Q2, Q3 : std_logic; 
    signal Qn0, Qn1, Qn2, Qn3 : std_logic;

Begin
    stage0: T_FF port map(CLK, En, CLRn, PRn, Q0, Qn0); 
    stage1: T_FF port map(CLK, (En and Q0), CLRn, PRn, Q1, Qn1); 
    stage2: T_FF port map(CLK, (En and Q0 and Q1), CLRn, PRn, Q2, Qn2); 
    stage3: T_FF port map(CLK, (En and Q0 and Q1 and Q2), CLRn, PRn, Q3, Qn3); 

    Q(0) <= Q0; 
    Q(1) <= Q1; 
    Q(2) <= Q2; 
    Q(3) <= Q3; 

    Qn(0) <= Qn0; 
    Qn(1) <= Qn1; 
    Qn(2) <= Qn2; 
    Qn(3) <= Qn3;


end UpCounter;