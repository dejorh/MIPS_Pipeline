LIBRARY ieee;								--Provide compiler with access to Library
USE ieee.std_logic_1164.all;			--Use all contents from package in ieee Library
USE work.ProgMem_package.all;		   --Use all contents from package in work Library
USE work.PC_reg_package.all;			--Use all contents from package in work Library
USE work.Adder32_package.all;

ENTITY IFetch_Stage IS						--Top-Level Entity Declaration%
	PORT (Clock, Reset,En : IN STD_LOGIC;	--Input declaration
			Data       : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		----- This address corresponds to Instruction-Memory ----
			B			  : BUFFER STD_LOGIC_VECTOR(31 DOWNTO 0); --Constant Adder Input
			PC_plus4	 : BUFFER STD_LOGIC_VECTOR(31 DOWNTO 0); -- PC input
			Curr_Address: OUT STD_LOGIC_VECTOR(31 DOWNTO 0); --Output Vectors
		----- This is the 32-bit bus corresponding to the Instruction -----
			Instruction	: OUT STD_LOGIC_VECTOR(31 DOWNTO 0)); --Output Vectors
END IFetch_Stage; 

ARCHITECTURE Structure OF IFetch_Stage IS		--Behavioral Entity Description
   	----- This will serve as the input to the PC register -----
	SIGNAL PC: STD_LOGIC_VECTOR(31 DOWNTO 0); --Interim vector signals
BEGIN
	B <= (2 => '1',          -- Equivalent to 0x00000004
			OTHERS => '0');
	PC_Stage	   : PC_Reg PORT MAP(Clock,Reset,PC_plus4,PC);
	Adder_Stage : Adder32 PORT MAP(PC,B,PC_plus4);
	----------- because mif file does not adhere to the 4-byte addressing scheme-----
	Memory_Stage: Program_Mem PORT MAP(PC(9 DOWNTO 2),Clock,Data,En,Instruction); 
	
	Curr_Address <= PC;
END Structure;