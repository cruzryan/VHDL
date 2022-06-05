library IEEE;

use IEEE.std_logic_1164.ALL;

ENTITY CD IS
    PORT(CLK, CLR : IN STD_LOGIC;
        CNT: IN  STD_LOGIC_VECTOR(1 downto 0);
        E: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        DISPLAY: INOUT STD_LOGIC_VECTOR(6 downto 0)
    );
END ENTITY;

ARCHITECTURE A_CD of CD IS

CONSTANT DIG0: STD_LOGIC_VECTOR(6 DOWNTO 0) := "0000001";
CONSTANT DIG1: STD_LOGIC_VECTOR(6 DOWNTO 0) := "1001111";
CONSTANT DIG2: STD_LOGIC_VECTOR(6 DOWNTO 0) := "0010010";
CONSTANT DIG3: STD_LOGIC_VECTOR(6 DOWNTO 0) := "0000110";
CONSTANT DIG4: STD_LOGIC_VECTOR(6 DOWNTO 0) := "1001010";
CONSTANT DIG5: STD_LOGIC_VECTOR(6 DOWNTO 0) := "0100100";
CONSTANT DIG6: STD_LOGIC_VECTOR(6 DOWNTO 0) := "1100000";
CONSTANT DIG7: STD_LOGIC_VECTOR(6 DOWNTO 0) := "0001111";
CONSTANT DIG8: STD_LOGIC_VECTOR(6 DOWNTO 0) := "0000000";
CONSTANT DIG9: STD_LOGIC_VECTOR(6 DOWNTO 0) := "0001100";
BEGIN

PROCESS(CLK, CLR, CNT, DISPLAY)

BEGIN

    IF (CLR='0') THEN
        DISPLAY <= DIG0;

    ELSIF(CLK'EVENT AND CLK='1') THEN

        CASE CNT IS
            WHEN "00" => 
                CASE DISPLAY IS
                    WHEN DIG0 => DISPLAY <= DIG1;
                    WHEN DIG1 => DISPLAY <= DIG2;
                    WHEN DIG2 => DISPLAY <= DIG3;
                    WHEN DIG3 => DISPLAY <= DIG4;
                    WHEN DIG4 => DISPLAY <= DIG5;
                    WHEN DIG5 => DISPLAY <= DIG6;
                    WHEN DIG6 => DISPLAY <= DIG7;
                    WHEN DIG7 => DISPLAY <= DIG8;
                    WHEN DIG8 => DISPLAY <= DIG9;
                    WHEN OTHERS => DISPLAY <= DIG0;
                END CASE;
            
            WHEN "01" => 
                CASE DISPLAY IS 
                    WHEN DIG0 => DISPLAY <= DIG9;
                    WHEN DIG9 => DISPLAY <= DIG8;
                    WHEN DIG8 => DISPLAY <= DIG7;
                    WHEN DIG7 => DISPLAY <= DIG6;
                    WHEN DIG6 => DISPLAY <= DIG5;
                    WHEN DIG5 => DISPLAY <= DIG4;
                    WHEN DIG4 => DISPLAY <= DIG3;
                    WHEN DIG3 => DISPLAY <= DIG2;
                    WHEN DIG2 => DISPLAY <= DIG1;
                    WHEN OTHERS => DISPLAY <= DIG0;
                END CASE;

            WHEN "10" => 
                CASE E IS
                    WHEN "0000" => DISPLAY <= DIG0;
                    WHEN "0001" => DISPLAY <= DIG1;
                    WHEN "0010" => DISPLAY <= DIG2;
                    WHEN "0011" => DISPLAY <= DIG3;
                    WHEN "0100" => DISPLAY <= DIG4;
                    WHEN "0101" => DISPLAY <= DIG5;
                    WHEN "0110" => DISPLAY <= DIG6;
                    WHEN "0111" => DISPLAY <= DIG7;
                    WHEN "1000" => DISPLAY <= DIG8;
                    WHEN OTHERS => DISPLAY <= DIG9;
                END CASE;
            
            WHEN OTHERS => 
                DISPLAY <= DISPLAY;
            END CASE;
            END IF;
        END PROCESS;
    END A_CD;



