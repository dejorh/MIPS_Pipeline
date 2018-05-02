LIBRARY ieee;							 --Provide compiler with access to Library
USE ieee.std_logic_1164.all;		 --Use all contents from package in ieee Library

ENTITY ALU_Control IS
	PORT (ALUOp			:  IN STD_LOGIC_VECTOR(1 DOWNTO 0); --from Control Unit
			Funct			:  IN STD_LOGIC_VECTOR(5 DOWNTO 0); --six LSB of instruction
			ALU_Ctrl		: OUT	STD_LOGIC_VECTOR(3 DOWNTO 0)); --input to control ALU
END ALU_Control;

ARCHITECTURE Behavior OF ALU_Control IS
	SIGNAL	F	: STD_LOGIC_VECTOR(3 DOWNTO 0); -- intermediate signal
BEGIN
	F				<= Funct(3 DOWNTO 0); --bits of function vector that matter
	ALU_Ctrl		<= "0010" WHEN ALUOp="00" OR F="0000" ELSE
						"0110" WHEN ALUOp(0)='1' OR (ALUOp(1)='1' AND F="0010") ELSE
						"0000" WHEN ALUOp(1)='1' AND F="0100" ELSE
						"0001" WHEN ALUOp(1)='1' AND F="0101" ELSE
						"0111" WHEN ALUOp(1)='1' AND F="1010";
						
END Behavior;