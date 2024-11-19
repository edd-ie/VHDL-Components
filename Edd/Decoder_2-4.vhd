Library ieee;
use ieee.std_logic_1164.all;

Entity dec2to4 is
    port( 
        w : IN std_logic_vector(1 downto 0);
        En : IN std_logic;
        y : OUT std_logic_vector(0 to 3)
    );
end dec2to4;

Architecture fxLogic of dec2to4 is 
Begin
    process(En, w)
    Begin 
        if En = '1' then
            case w is
                when "00" => y <= "1000";
                when "01" => y <= "0100";
                when "10" => y <= "0010";
                when others => y <= "0001";
            end case;
        else 
            y <= "0000";
        end if;
    end process;
end fxLogic;
