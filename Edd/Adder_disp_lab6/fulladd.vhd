LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY fulladd IS
    PORT ( ci, sub, xi, yi: IN STD_LOGIC;
           so, co : OUT STD_LOGIC );
END fulladd;

ARCHITECTURE LogicFunc OF fulladd IS
    SIGNAL ySub, ySubX : STD_LOGIC;
BEGIN
    ySub <= yi XOR sub;
    ySubX <= ySub XOR xi;
    so <= ySubX XOR ci;
    co <= (ySub AND xi) OR (ySubX AND ci);
END LogicFunc ;