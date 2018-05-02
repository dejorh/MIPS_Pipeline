LIBRARY ieee;							 --Provide compiler with access to Library
USE ieee.std_logic_1164.all;		 --Use all contents from package in ieee Library
USE ieee.std_logic_arith.all;		 --Use all contents from package in ieee Library
USE ieee.std_logic_unsigned.all;	 --Use all contents from package in ieee Library
--USE work.Reg32en_package.all;

ENTITY Hazard_Detect_2 IS
	PORT (Clock				: IN STD_LOGIC;
			EX_MEM_PCSrc	: IN STD_LOGIC;
			ID_EX_Jump		: IN STD_LOGIC;
			EX_MEM_Flush	: OUT STD_LOGIC;
			IF_Flush_1		: OUT STD_LOGIC;
			IF_Flush_2		: OUT STD_LOGIC);
END Hazard_Detect_2;

ARCHITECTURE Behavior OF Hazard_Detect_2 IS
	SIGNAL Flush 	: STD_LOGIC_VECTOR(1 DOWNTO 0);
BEGIN
	Flush  <=	"11"  WHEN (ID_EX_Jump='1' OR EX_MEM_PCSrc='1') ELSE
					"00";
					
	EX_MEM_Flush  <= Flush(1);
	IF_Flush_1	  <= Flush(0);
	
	PROCESS(Clock)
	BEGIN
		IF Clock'EVENT AND Clock = '1' THEN
			IF Flush(0)='1' THEN
				IF_Flush_2	<=	'1';
			ELSE
				IF_Flush_2	<= '0';
			END IF;
		END IF;
	END PROCESS;
END Behavior;