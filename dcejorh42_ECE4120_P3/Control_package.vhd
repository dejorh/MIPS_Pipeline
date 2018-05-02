LIBRARY ieee;						--Provide compiler with access to Library
USE ieee.std_logic_1164.all;	--Use all contents from package in ieee Library

PACKAGE Control_package IS
	COMPONENT Control					--Component Declaration
		PORT (Opcode		:  IN STD_LOGIC_VECTOR(5 DOWNTO 0); --instruction Opcode
				Clock,Reset	:  IN STD_LOGIC; 	-- Clock and Reset signals
				RegDst		: OUT STD_LOGIC;-- RegDst picks destination Write-Back Reg
				Jump			: OUT STD_LOGIC;  -- exclusively for Jump instructions
				Branch_eq	: OUT STD_LOGIC;	--Exclusively for branch instructions
				Branch_ne	: OUT STD_LOGIC;	--For branch not-equal instructions
				MemRead		: OUT STD_LOGIC;	-- for reading from memory
				MemtoReg		: OUT STD_LOGIC;  -- for writing to register from memory
				ALUOp			: OUT STD_LOGIC_VECTOR(1 DOWNTO 0);--for ALU control unit
				MemWrite		: OUT STD_LOGIC;	-- for writing to memory
				ALUSrc		: OUT STD_LOGIC;  --picks between sign-extended value and
													 -- read_data_2
				RegWrite		: OUT STD_LOGIC); -- for when register write-backs
	END COMPONENT;
END Control_package;