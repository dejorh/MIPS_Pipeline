LIBRARY ieee;							 --Provide compiler with access to Library
USE ieee.std_logic_1164.all;		 --Use all contents from package in ieee Library
USE ieee.std_logic_arith.all;		 --Use all contents from package in ieee Library
USE ieee.std_logic_unsigned.all;	 --Use all contents from package in ieee Library
USE work.PC_reg_package.all;
USE work.I_Mem_package.all;
USE work.RegisterFile_package.all;	
USE work.SignExtend_package.all;
USE work.ALU_package.all;
USE work.mux2to1_package.all;
USE work.mux32_package.all;
USE work.proctypes_package.all;
USE work.Adder32_package.all;
USE work.D_Mem_package.all;
USE work.ShiftLeft2_package.all;
USE work.Control_package.all;
USE work.ALUcontrol_package.all;
USE work.IF_ID_package.all;
USE work.ID_EX_package.all;
USE work.EX_MEM_package.all;
USE work.MEM_WB_package.all;
USE work.FWD_Unit_package.all;
USE work.HDU_1_package.all;
USE work.HDU_2_package.all;
USE work.mux4to1_package.all;
USE work.Reg32en_package.all;

ENTITY MIPS_Pipeline IS
GENERIC(N : INTEGER := 32; M : INTEGER := 5);
	PORT (Clock,Reset	:	IN STD_LOGIC;
			PC,nextPC,PC_i,Instruction : BUFFER STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			--IF_ID_nextPC,IF_ID_Instruction : BUFFER STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			PC_Write,IF_ID_Write,IF_Flush : BUFFER STD_LOGIC;
			ID_EX_RegDst,ID_EX_Jump,ID_EX_Branch_eq : BUFFER STD_LOGIC;
			ID_EX_Branch_ne,ID_EX_MemRead,ID_EX_MemWrite : BUFFER STD_LOGIC;
			ID_EX_ALUOp	: BUFFER STD_LOGIC_VECTOR(1 DOWNTO 0);
			ID_EX_MemtoReg,ID_EX_ALUSrc,ID_EX_RegWrite : BUFFER STD_LOGIC;
			Flush,EX_MEM_Flush : BUFFER STD_LOGIC;
			read_register_1,read_register_2: BUFFER STD_LOGIC_VECTOR(M-1 DOWNTO 0);
			write_register : BUFFER STD_LOGIC_VECTOR(M-1 DOWNTO 0);
			FWD_Data_A,FWD_Data_B	: BUFFER STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			--B						: BUFFER STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			read_data_1,read_data_2	:	BUFFER STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			--ID_EX_read_data_1	: BUFFER STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			--ID_EX_read_data_2 : BUFFER STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			--ID_EX_nextPC					: BUFFER STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			EX_MEM_nextPC					: BUFFER STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			--ID_EX_Jump_address			: BUFFER STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			ID_EX_Rs,ID_EX_Rt,ID_EX_Rd	: BUFFER STD_LOGIC_VECTOR(M-1 DOWNTO 0);
			--ID_EX_extend_value			: BUFFER STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			--ALU_result	: BUFFER STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			EX_MEM_ALU_result : BUFFER STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			MEM_WB_ALU_result	: BUFFER STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			FWD_A,FWD_B	: BUFFER STD_LOGIC_VECTOR(1 DOWNTO 0);
			Final_Jump : BUFFER STD_LOGIC;
			EX_MEM_RegWrite,MEM_WB_RegWrite	: BUFFER STD_LOGIC;
			EX_MEM_MemtoReg,MEM_WB_MemtoReg	: BUFFER STD_LOGIC;
			EX_MEM_MemRead,EX_MEM_MemWrite	: BUFFER STD_LOGIC;
			EX_MEM_Branch_eq,EX_MEM_Branch_ne: BUFFER STD_LOGIC;
			Zero,EX_MEM_Zero,PC_Src	:	BUFFER STD_LOGIC;
			EX_MEM_write_register : BUFFER STD_LOGIC_VECTOR(M-1 DOWNTO 0);
			MEM_WB_write_register : BUFFER STD_LOGIC_VECTOR(M-1 DOWNTO 0);
			--MEM_read_data	  : BUFFER STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			MEM_WB_read_data : BUFFER STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			--EX_MEM_write_data : BUFFER STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			MEM_WB_write_data	: BUFFER STD_LOGIC_VECTOR(N-1 DOWNTO 0));
END MIPS_Pipeline;

ARCHITECTURE Structure OF MIPS_Pipeline IS
	SIGNAL Address	: STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL ID_EX_Jump_address : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL ID_EX_extend_value : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL ID_EX_read_data_1  : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL ID_EX_read_data_2  : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL ALU_result			  : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL B						  : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL ID_EX_nextPC		  : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL EX_MEM_write_data  : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL MEM_read_data	  	  : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL IF_ID_nextPC,IF_ID_Instruction : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	--SIGNAL Add_const : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	--SIGNAL	Extend_Value : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL	Addr : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL	Cons : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL	Data : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL	RegDst,Jump,Branch_eq,Branch_ne,ALUSrc	: STD_LOGIC;
	SIGNAL   MemRead,MemWrite,MemtoReg,RegWrite : STD_LOGIC;
	SIGNAL   ALUOp	: STD_LOGIC_VECTOR(1 DOWNTO 0);
	SIGNAL	PC_plus_4 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
						-- Write Register address numbers
	--SIGNAL write_register : STD_LOGIC_VECTOR(4 DOWNTO 0);
	SIGNAL Reg_d_0,Reg_d_1 : STD_LOGIC_VECTOR(M-1 DOWNTO 0);
						-- Read Register address numbers 
	--SIGNAL read_register_1,read_register_2: STD_LOGIC_VECTOR(4 DOWNTO 0);
						-- Immediate Value for I-Type Instructions
	SIGNAL Immediate_value					  : STD_LOGIC_VECTOR((N/2)-1 DOWNTO 0);
						-- The Sign-Extended value
	SIGNAL Extend_value,EX_MEM_Branch_Addr	  : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL Extend_shift						  : STD_LOGIC_VECTOR(N+1 DOWNTO 0);
						-- Select Vector for ALU operations
	SIGNAL ALU_ctrl							  : STD_LOGIC_VECTOR(3 DOWNTO 0);
						-- ALU Input Vectors A and B
	--SIGNAL A,B									  : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	--SIGNAL MemtoReg		: STD_LOGIC;  -- for writing to register from memory
	--SIGNAL ALUOp			: STD_LOGIC_VECTOR(1 DOWNTO 0);  --for ALU control unit
				--picks between sign-extended value and read_data_2
	--SIGNAL ALU_Src,PC_Src		  : STD_LOGIC; --Input Signals
	--SIGNAL RegDst		: STD_LOGIC;  -- RegDst picks destination Write-Back Reg
	SIGNAL J_immediate : STD_LOGIC_VECTOR(N-7 DOWNTO 0);
	SIGNAL J_immed_shift	: STD_LOGIC_VECTOR(N-5 DOWNTO 0);
	SIGNAL Add_const : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL Branch_addr : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL Jump_address	: STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL PC_plus_offset : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	--SIGNAL MEM_WB_write_data,EX_MEM_ALU_result : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL Funct	: STD_LOGIC_VECTOR(5 DOWNTO 0);
	SIGNAL PCen,IF_ID_en,IF_Flush_1,IF_Flush_2	: STD_LOGIC;
	--SIGNAL PC_plus_4			: STD_LOGIC_VECTOR(N-1 DOWNTO 0);
BEGIN
	Address <= PC(9 DOWNTO 2);
	Reg_d_0	<= IF_ID_Instruction(20 DOWNTO 16);
	Reg_d_1	<= IF_ID_Instruction(15 DOWNTO 11);
	read_register_1	<=	IF_ID_Instruction(25 DOWNTO 21);
	read_register_2	<=	IF_ID_Instruction(20 DOWNTO 16);
	Add_const <= (2 => '1', OTHERS => '0');
	--PC_Src <= Branch AND Zero;
	J_immediate	 <=	IF_ID_Instruction(25 DOWNTO 0);
	Jump_address <= IF_ID_nextPC(N-1 DOWNTO N-4) & (J_immed_shift);
	Immediate_value	<= IF_ID_Instruction((N/2)-1 DOWNTO 0);
	--A	<= read_data_1;
	ID_EX_MemRead <= MemRead; ID_EX_Jump <= Jump; ID_EX_Branch_ne <= Branch_ne;
	ID_EX_Branch_eq <= Branch_eq; ID_EX_MemWrite <= MemWrite; 
	ID_EX_RegDst <= RegDst; ID_EX_ALUOp <= ALUOp; ID_EX_MemtoReg <= MemtoReg;
	ID_EX_ALUSrc <= ALUSrc; ID_EX_RegWrite <= RegWrite;
	Funct	<=	ID_EX_extend_value(5 DOWNTO 0);
	PCen	<=	NOT PC_Write;
	IF_ID_en	<=	NOT (IF_ID_Write AND (NOT IF_Flush));
	--PC_reset	<= Reset OR PC_Src;
	IF_Flush		<= IF_Flush_1 OR IF_Flush_2;
	
	--Instruction Fetching Stage of the Pipeline --
	PC_Reg_1: Reg32en PORT MAP(PCen,Clock,Reset,PC_i,PC);
	
	PC_plus4: Reg32en PORT MAP('1',Clock,'0',nextPC,PC_plus_4);
	
	Inst_Mem: I_Mem PORT MAP('0',Address,Clock,Data,IF_ID_en,'0',
									Instruction);
	
	Add0 : Adder32 PORT MAP(PC,Add_const,nextPC);
	--End of the Instruction FEtching Stage of the Pipeline
	
	--Instantiate the IF/ID Pipeline Register
	
	IF_ID : IF_ID_REG PORT MAP(IF_ID_en,Clock,IF_Flush,PC_plus_4,Instruction,
										IF_ID_nextPC,IF_ID_Instruction);
	
	---Instruction Decode Stage of the Pipeline ---
	Shift_L0	: ShiftLeft_2 GENERIC MAP(26) PORT MAP(J_immediate,J_immed_shift);
	
	Control_U: Control PORT MAP(IF_ID_Instruction(31 DOWNTO 26),Clock,Flush,
										 RegDst,Jump,Branch_eq,Branch_ne,MemRead,MemtoReg,
										 ALUOp,MemWrite,ALUSrc,RegWrite);
	
	HDU1 : Hazard_Detect PORT MAP(PC_Src,ID_EX_MemRead,ID_EX_Jump,read_register_1
											,read_register_2,ID_EX_Rt,PC_Write,IF_ID_Write,
											Flush);
	
	RegF0	: RegisterFile PORT MAP(Clock,MEM_WB_RegWrite,read_register_1,
											read_register_2,MEM_WB_write_register,
											MEM_WB_write_data,read_data_1,read_data_2);
	
	Sign_Ext_0 : SignExtend PORT MAP(Immediate_value,Extend_value);
	
	--Instantiate the ID/EX Pipeline Register
	
	ID_EX : ID_EX_REG PORT MAP(Clock,'0',IF_ID_nextPC,Jump_address,read_data_1,
										read_data_2,Extend_value,read_register_1,
										read_register_2,Reg_d_1,ID_EX_nextPC,
										ID_EX_Jump_address,ID_EX_read_data_1,
										ID_EX_read_data_2,ID_EX_extend_value,ID_EX_Rs,
										ID_EX_Rt,ID_EX_Rd);
										
	-- The Execute Stage of the Pipelined MIPS Architecture
	HDU2 : Hazard_Detect_2 PORT MAP(Clock,PC_Src,ID_EX_Jump,EX_MEM_Flush,
											  IF_Flush_1,IF_Flush_2);
	
	Mux0_2to1 : mux_2to1 GENERIC MAP(M) 
								PORT MAP(ID_EX_RegDst,ID_EX_Rt,ID_EX_Rd,write_register);
	
	Mux1_2to1 : mux_2to1 GENERIC MAP(N) 
								PORT MAP(ID_EX_ALUSrc,FWD_Data_B,ID_EX_extend_value,B); 
	
	Mux0_4to1 : mux_4to1 GENERIC MAP(N) 
								PORT MAP(FWD_A,ID_EX_read_data_1,MEM_WB_write_data,
								EX_MEM_ALU_result,X"00000000",FWD_Data_A);
								
	Mux1_4to1 : mux_4to1 GENERIC MAP(N) 
								PORT MAP(FWD_B,ID_EX_read_data_2,MEM_WB_write_data,
								EX_MEM_ALU_result,X"00000000",FWD_Data_B);
	
	FWD_U : FWD_Unit PORT MAP(ID_EX_Rs,ID_EX_Rt,EX_MEM_RegWrite,MEM_WB_RegWrite,
									  EX_MEM_write_register,MEM_WB_write_register,
									  FWD_A,FWD_B);
	
	ALU_exc  : alu_1 PORT MAP(ALU_ctrl,FWD_Data_A,B,ALU_result,Zero);
	
	ALUctrl_0 : ALU_control PORT MAP(ID_EX_ALUOp,Funct,ALU_ctrl);
	
	Shift_L1	: ShiftLeft_2 GENERIC MAP(32) 
								  PORT MAP(ID_EX_extend_Value,Extend_shift);
	
	Add1 : Adder32 PORT MAP(ID_EX_nextPC,Extend_shift(N-1 DOWNTO 0),Branch_addr);
	
	Mux3_2to1 : mux_2to1 GENERIC MAP(N) 
								PORT MAP(Final_Jump,PC_plus_offset,ID_EX_Jump_address,
								PC_i);
								
	WITH ID_EX_Jump SELECT
	Final_Jump 	<=	NOT PC_Src WHEN '1',
						ID_EX_Jump WHEN OTHERS;
						
								
	-- Instantiate the EX/MEM Pipeline Register
	EX_MEM : EX_MEM_REG PORT MAP(Clock,EX_MEM_Flush,Branch_addr,ALU_result,
							  FWD_Data_B,write_register,ID_EX_MemRead,ID_EX_Memwrite,
							  ID_EX_MemtoReg,ID_EX_RegWrite,ID_EX_Branch_eq,
							  ID_EX_Branch_ne,Zero,EX_MEM_Branch_Addr,
							  EX_MEM_ALU_result,EX_MEM_write_data,EX_MEM_write_register
							  ,EX_MEM_MemRead,EX_MEM_MemWrite,EX_MEM_MemtoReg,
							  EX_MEM_RegWrite,EX_MEM_Branch_eq,EX_MEM_Branch_ne,
							  EX_MEM_Zero);
	
	-- The Memory Stage of the MIPS Pipeline Architecture
	
	-- Using this to incorporate Branch_eq and Branch_ne decision association
	-- With PC_Src
	WITH EX_MEM_Zero SELECT
	PC_Src	<= EX_MEM_Branch_ne WHEN '0',
					EX_MEM_Branch_eq WHEN OTHERS;
	
	Mux2_2to1 : mux_2to1 GENERIC MAP(N)  
								PORT MAP(PC_Src,nextPC,EX_MEM_Branch_addr,
								PC_plus_offset);
								
	
	DataMEM0 : D_Mem PORT MAP('0',EX_MEM_ALU_result(7 DOWNTO 0),Clock,
						  EX_MEM_write_data,EX_MEM_MemRead,EX_MEM_MemWrite,
						  MEM_read_data);
	
	-- Instantiate the MEM/WB Pipeline Register
	MEM_WB : MEM_WB_REG PORT MAP(Clock,'0',MEM_read_data,EX_MEM_ALU_result,
							  EX_MEM_write_register,EX_MEM_MemtoReg,EX_MEM_RegWrite,
							  MEM_WB_read_data,MEM_WB_ALU_result,MEM_WB_write_register,
							  MEM_WB_MemtoReg,MEM_WB_RegWrite);
							  
	-- The Write-Back Stage of the MIPS Pipelined Architecture
	
	Mux4_2to1 : mux_2to1 GENERIC MAP(N) 
								PORT MAP(MEM_WB_MemtoReg,MEM_WB_ALU_result,
								MEM_WB_read_data,MEM_WB_write_data);
END Structure;