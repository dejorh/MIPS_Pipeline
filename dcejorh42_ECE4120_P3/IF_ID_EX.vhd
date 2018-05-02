LIBRARY ieee;							 --Provide compiler with access to Library
USE ieee.std_logic_1164.all;		 --Use all contents from package in ieee Library
USE ieee.std_logic_arith.all;		 --Use all contents from package in ieee Library
USE ieee.std_logic_unsigned.all;	 --Use all contents from package in ieee Library
USE work.IFetch_package.all;
USE work.RegisterFile_package.all;	
USE work.SignExtend_package.all;
USE work.ALU_package.all;
USE work.mux2to1_package.all;
USE work.proctypes_package.all;

ENTITY IF_ID_EX IS
GENERIC(N : INTEGER := 32);
	PORT ( RegWrite,Reset,ALU_Src,Clock	 :IN STD_LOGIC; --Input Signals
	----- This is the 32-bit bus corresponding to the Instruction -----
			Instruct						       : BUFFER STD_LOGIC_VECTOR(N-1 DOWNTO 0); 
						-- Read Register address numbers 
			read_register_1,read_register_2: BUFFER STD_LOGIC_VECTOR(4 DOWNTO 0);
						-- Write Register address numbers
			write_register					    : BUFFER STD_LOGIC_VECTOR(4 DOWNTO 0);
						-- Data to be written to designated "write" register
			write_data							 : BUFFER STD_LOGIC_VECTOR(N-1 DOWNTO 0);
						-- Data to be read from read registers
			read_data_1,read_data_2		  	 : BUFFER STD_LOGIC_VECTOR(N-1 DOWNTO 0);
						-- Immediate Value for I-Type Instructions
			Immediate_value					 :BUFFER STD_LOGIC_VECTOR((N/2)-1 DOWNTO 0);
						-- The Sign-Extended value
			Extend_value						 : BUFFER STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			Data, Add_Con					    : BUFFER STD_LOGIC_VECTOR(N-1 DOWNTO 0);
						-- Input and Output of the PC Register
			PC_i, PC_o						  	 : BUFFER STD_LOGIC_VECTOR(N-1 DOWNTO 0);
						-- Select Vector for ALU operations
			ALU_ctrl							  	 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
						-- ALU Output Vector
			ALU_result					 	 	 : BUFFER STD_LOGIC_VECTOR(N-1 DOWNTO 0);
						-- Zero signal, also an ouput
			Zero								    : OUT STD_LOGIC);
END IF_ID_EX;

ARCHITECTURE Structure OF IF_ID_EX IS
				-- ALU Input Vectors A and B
	SIGNAL A,B					: STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	
BEGIN

	IF_0 : IFetch_Stage PORT MAP(Clock,Reset,'0',Data,Add_Con,PC_i,PC_o,Instruct);

		
	RegF_0 : RegisterFile PORT MAP(Clock,RegWrite,read_register_1,read_register_2,
										write_register,write_data,read_data_1,read_data_2);
								
	S_Ext_0 : SignExtend PORT MAP(Immediate_value,Extend_value);							
								
	Mux_2_1: mux_2to1 GENERIC MAP(N) PORT MAP(ALU_Src,read_data_2,Extend_value,B); 
	
	ALU_0  : alu_1 PORT MAP(ALU_ctrl,A,B,ALU_result,Zero);
				-- Concurrent Assignment of signals and vectors
	write_data <= ALU_result; Immediate_value <= Instruct((N/2)-1 DOWNTO 0);
	write_register <= Instruct(15 DOWNTO 11); A <= read_data_1;
	read_register_2 <= Instruct(20 DOWNTO 16);  
	read_register_1 <= Instruct(25 DOWNTO 21); 
	-- ALU_Src    <= '0'; En <= '0';
END Structure;	