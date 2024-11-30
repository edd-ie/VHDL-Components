library ieee;
use ieee.std_logic_1164.all;

Entity FinalExam_P1_3736377 is
    Port(
        CLK : IN std_logic;
        Q : OUT std_logic_vector(0 to 2);
		  hex1: OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
    );
End FinalExam_P1_3736377;

Architecture design of FinalExam_P1_3736377 is
    component TFlipFlop
		 port (
			  CLK, T, CL: IN std_logic;
			  Q: OUT std_logic
		 );
    end component;
	 
	  COMPONENT nibble_to_7segment 
        PORT (
            D,C,B,A: IN std_logic; 
            HLa,HLb,HLc,HLd,HLe,HLf,HLg: OUT std_logic);
        END COMPONENT;
	 
--	 COMPONENT clk_gen_1_output is
--		 generic( n : integer := 25000;
--		 n1 : integer := 2000); 
--		 port( Clock : in std_logic;
--		 c_out : out std_logic );
--	 end COMPONENT;

    signal Q0, Q1, Q2, tme: std_logic; 
Begin
--    stage0: clk_gen_1_output port map(CLK, tme);
    stage0: TFlipFlop port map(CLK, '1', (not(Q0 and Q2)), Q0); 
    stage1: TFlipFlop port map(CLK, Q0, (not(Q0 and Q2)), Q1); 
    stage2: TFlipFlop port map(CLK, (Q0 and Q1), (not(Q0 and Q2)), Q2);
	 stage3 : nibble_to_7segment PORT MAP ('0', Q2, Q1, Q0, hex1(0), hex1(1), hex1(2), hex1(3), hex1(4), hex1(5), hex1(6)) ;

    Q(0) <= Q0; 
    Q(1) <= Q1; 
    Q(2) <= Q2; 


end design;