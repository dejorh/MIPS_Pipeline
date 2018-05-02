LIBRARY ieee;							 --Provide compiler with access to Library
USE ieee.std_logic_1164.all;		 --Use all contents from package in ieee Library
USE ieee.std_logic_arith.all;		 --Use all contents from package in ieee Library
USE ieee.std_logic_unsigned.all;	 --Use all contents from package in ieee Library
USE work.Reg32en_package.all;

ENTITY IF_ID_REG IS
GENERIC(N : INTEGER := 32);
	PORT (En,Clock,Reset		 :  IN STD_LOGIC;
			nextPC,Instruction :  IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			IF_ID_nextPC		 : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);	
			IF_ID_Instruction	 : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0));
END IF_ID_REG;

ARCHITECTURE Behavior OF IF_ID_REG IS

BEGIN
	--Instruction_D :Reg32en PORT MAP(En,Clock,Reset,Instruction,IF_ID_Instruction);
	--nextPC_D		  : Reg32en PORT MAP(En,Clock,Reset,nextPC,IF_ID_nextPC);
	--IF_ID_Instruction	<=  Instruction;
	PROCESS(Clock,Reset,En)
	BEGIN
		IF Clock'EVENT AND Clock = '1' THEN		-- on the rising clock edge
			IF Reset='1'	THEN
				IF_ID_nextPC 	 <=	(OTHERS => '0');
				IF_ID_Instruction	  <=	(OTHERS => '0');
			ELSE
				IF En = '1' THEN	
					IF_ID_nextPC   <=	nextPC;
					IF_ID_Instruction	  <=	Instruction;
				END IF;
			END IF;
		END IF;
	END PROCESS;
END Behavior;