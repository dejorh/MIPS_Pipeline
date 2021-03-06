LIBRARY ieee;							 --Provide compiler with access to Library
USE ieee.std_logic_1164.all;		 --Use all contents from package in ieee Library
USE ieee.std_logic_arith.all;		 --Use all contents from package in ieee Library
USE ieee.std_logic_unsigned.all;	 --Use all contents from package in ieee Library
--USE work.Reg32en_package.all;

ENTITY Hazard_Detect IS
GENERIC(M : INTEGER := 5);
	PORT (EX_MEM_PCSrc: IN STD_LOGIC;
			ID_EX_MemRead,ID_EX_Jump	: IN STD_LOGIC;
			IF_ID_Rs,IF_ID_Rt,ID_EX_Rt	: IN STD_LOGIC_VECTOR(M-1 DOWNTO 0);
			PC_Write,IF_ID_Write,Flush	: OUT STD_LOGIC);
END Hazard_Detect;

ARCHITECTURE Behavior OF Hazard_Detect IS
	SIGNAL	Stall_Flush	:	STD_LOGIC_VECTOR(2 DOWNTO 0);
BEGIN
	Stall_Flush	<=	"111"
					WHEN 
					(ID_EX_MemRead='1' AND (ID_EX_Rt /= "00000") AND
					(ID_EX_Rt=IF_ID_Rs OR ID_EX_Rt=IF_ID_Rt)) 
					ELSE
					"011"
					WHEN
					(ID_EX_Jump='1' OR EX_MEM_PCSrc='1')
					ELSE
					"000";
	
	PC_Write		<=	Stall_Flush(2);
	IF_ID_Write <=	Stall_Flush(1);
	Flush			<=	Stall_Flush(0);
END Behavior;