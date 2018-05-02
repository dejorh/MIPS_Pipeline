LIBRARY ieee;						--Provide compiler with access to Library
USE ieee.std_logic_1164.all;	--Use all contents from package in ieee Library

PACKAGE ALUcontrol_package IS
	COMPONENT ALU_Control					--Component Declaration
		PORT (ALUOp		:  IN STD_LOGIC_VECTOR(1 DOWNTO 0); --from Control Unit
				Funct		:  IN STD_LOGIC_VECTOR(5 DOWNTO 0); --six LSB of instruction
				ALU_Ctrl	: OUT	STD_LOGIC_VECTOR(3 DOWNTO 0)); --input to control ALU
	END COMPONENT;
END ALUcontrol_package;