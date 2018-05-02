LIBRARY ieee;							 --Provide compiler with access to Library
USE ieee.std_logic_1164.all;		 --Use all contents from package in ieee Library
USE ieee.std_logic_arith.all;		 --Use all contents from package in ieee Library
USE ieee.std_logic_unsigned.all;	 --Use all contents from package in ieee Library

ENTITY FWD_Unit IS
GENERIC(M : INTEGER := 5);
	PORT (ID_EX_Rs,ID_EX_Rt		:  IN STD_LOGIC_VECTOR(M-1 DOWNTO 0);
			EX_MEM_RegWrite		:  IN STD_LOGIC;
			MEM_WB_RegWrite		:	IN STD_LOGIC;
			EX_MEM_Rd,MEM_WB_Rd	:  IN STD_LOGIC_VECTOR(M-1 DOWNTO 0);
			FWD_A,FWD_B				: OUT STD_LOGIC_VECTOR(1 DOWNTO 0));
END FWD_Unit;

ARCHITECTURE Behavior OF FWD_Unit IS
	SIGNAL	Z	: STD_LOGIC_VECTOR(M-1 DOWNTO 0);
BEGIN
	Z		<= "00000";
	FWD_A <= "10" 
			  WHEN EX_MEM_RegWrite='1' AND EX_MEM_Rd /= Z AND EX_MEM_Rd=ID_EX_Rs
			  ELSE
				"01"
			  WHEN MEM_WB_RegWrite='1' AND (MEM_WB_Rd /= Z) AND (MEM_WB_Rd=ID_EX_Rs)
			  AND NOT (EX_MEM_RegWrite='1' AND EX_MEM_Rd /=Z AND EX_MEM_Rd=ID_EX_Rs)
			  ELSE
			  "00";
			  
	FWD_B <= "10" 
			  WHEN EX_MEM_RegWrite='1' AND EX_MEM_Rd /= Z AND EX_MEM_Rd=ID_EX_Rt
			  ELSE
				"01"
			  WHEN MEM_WB_RegWrite='1' AND (MEM_WB_Rd /= Z) AND (MEM_WB_Rd=ID_EX_Rt)
			  AND NOT (EX_MEM_RegWrite='1' AND EX_MEM_Rd /=Z AND EX_MEM_Rd=ID_EX_Rt)
			  ELSE
			  "00";
END Behavior;