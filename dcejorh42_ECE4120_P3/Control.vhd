LIBRARY ieee;							 --Provide compiler with access to Library
USE ieee.std_logic_1164.all;		 --Use all contents from package in ieee Library

ENTITY Control IS
	PORT (Opcode		:  IN STD_LOGIC_VECTOR(5 DOWNTO 0); --instruction Opcode
			Clock,Reset	:  IN STD_LOGIC; 	-- Clock and Reset signals
			RegDst		: OUT STD_LOGIC;  -- RegDst picks destination Write-Back Reg
			Jump			: OUT STD_LOGIC;  -- exclusively for Jump instructions
			Branch_eq	: OUT STD_LOGIC;	--For branch equal instructions
			Branch_ne	: OUT STD_LOGIC;	--For branch not-equal instructions
			MemRead		: OUT STD_LOGIC;	-- for reading from memory
			MemtoReg		: OUT STD_LOGIC;  -- for writing to register from memory
			ALUOp			: OUT STD_LOGIC_VECTOR(1 DOWNTO 0);  --for ALU control unit
			MemWrite		: OUT STD_LOGIC;	-- for writing to memory
			ALUSrc		: OUT STD_LOGIC;  --picks between sign-extended value and
													-- read_data_2
			RegWrite		: OUT STD_LOGIC); -- for when register write-backs
END Control;

ARCHITECTURE Behavior OF Control IS
	SIGNAL Lw,Sw,R_format,Beq,Bne,J	: STD_LOGIC; -- intermediate signals
BEGIN 
	R_format <= '1' WHEN Opcode="000000" ELSE '0';	--For R-type instructions
	Lw			<= '1' WHEN Opcode="100011" ELSE '0';  --for Load-Word instructions
	Sw			<= '1' WHEN Opcode="101011" ELSE '0';	--for store-word instructions
	Beq		<= '1' WHEN Opcode="000100" ELSE '0';	--Branch-Equal Instructions
	Bne		<= '1' WHEN Opcode="000101" ELSE '0';	--Branch-Not-Equal Instructions
	J			<= '1' WHEN Opcode="000010" ELSE '0';	--for J-type instructions
	PROCESS(Reset,Clock)
	BEGIN
		IF Clock'EVENT AND Clock = '1' THEN		-- on the rising clock edge
			IF Reset = '1' THEN				-- This is an asynchronous reset
				RegDst		<= '0';		
				Branch_eq	<= '0';
				Branch_ne	<= '0';
				Jump			<= '0';
				MemRead		<= '0';
				MemtoReg		<= '0';
				ALUOp(1)		<= '0';
				ALUOp(0)		<= '0';
				MemWrite		<= '0';
				ALUSrc		<= '0';
				RegWrite		<= '0';
			ELSE
		-- The Table justifying this mapping is given in Figures 4.18 and 4.22 --
		-- Signals officially being clocked so will appear in execute pipeline stage
				RegDst		<= R_format;		
				Branch_eq	<= Beq;
				Branch_ne	<= Bne;
				Jump			<= J;
				MemRead		<= Lw;
				MemtoReg		<= Lw;
				ALUOp(1)		<= R_format;
				ALUOp(0)		<= Beq OR Bne;
				MemWrite		<= Sw;
				ALUSrc		<= Lw OR Sw;
				RegWrite		<= R_format OR Lw;
			END IF;
		END IF;
	END PROCESS;
		
			
END Behavior;