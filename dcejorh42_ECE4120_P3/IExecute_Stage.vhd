LIBRARY ieee;							--Provide compiler with access to Library
USE ieee.std_logic_1164.all;		--Use all contents from package in ieee Library
USE work.mux2to1_package.all; 	--Use all contents from package in work Library
USE work.ALU_package.all;	  		--Use all contents from package in work Library

ENTITY IExecute_Stage IS
GENERIC(N : INTEGER := 32);
				--select read_data_2 for R-Type and Sign-Extend value for I-Type
	PORT (ALU_Src						: IN STD_LOGIC; 
				-- Select Vector for ALU operations
			ALU_ctrl						: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
						-- Data to be read from read registers
			read_data_1					: IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			read_data_2					: BUFFER STD_LOGIC_VECTOR(N-1 DOWNTO 0);
						-- The Sign-Extended value
			Extend_value				: IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
						-- ALU output
			ALU_result					: OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);
						-- Zero signal, also an ouput
			Zero							: OUT STD_LOGIC);
END IExecute_Stage;

ARCHITECTURE Structure OF IExecute_Stage IS
	SIGNAL F, ALU_32 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
BEGIN
		-- Port Mapping for all entities in current Execute Stag--
		--the following 2-to-1 32-bit multiplexorselects between the value
		-- in the second read register(R-Type) and the sign-extended value (I-Type)
	 MUX0_EXEC_2_1	: mux_2to1 GENERIC MAP(N) 
										PORT MAP(ALU_Src,read_data_2,Extend_value,F);
		--the following ALU Entity instantiation is for the needed calcluations
		--for instructions: Performs address calculations for load and store
		--comparisons, and other general arithmetic operations for R-Type and branch 
	 ALU_EXEC_0		: alu_1 PORT MAP(ALU_ctrl,read_data_1,F,ALU_32,Zero);
	 ALU_result <= ALU_32;
END Structure;