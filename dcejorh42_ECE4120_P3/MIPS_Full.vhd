LIBRARY ieee;							 --Provide compiler with access to Library
USE ieee.std_logic_1164.all;		 --Use all contents from package in ieee Library
USE ieee.std_logic_arith.all;		 --Use all contents from package in ieee Library
USE ieee.std_logic_unsigned.all;	 --Use all contents from package in ieee Library
USE work.PC_reg_package.all;
USE work.ProgMem_package.all;
USE work.RegisterFile_package.all;	
USE work.SignExtend_package.all;
USE work.ALU_package.all;
USE work.mux2to1_package.all;
USE work.mux32_package.all;
USE work.proctypes_package.all;
USE work.Adder32_package.all;
USE work.DataMem_package.all;
USE work.ShiftLeft2_package.all;
USE work.Control_package.all;
USE work.ALUcontrol_package.all;

ENTITY MIPS_Full IS
GENERIC(N : INTEGER := 32);
	PORT (Clock,Reset	:  IN STD_LOGIC;
						-- ALU Output Vector
			ALU_result	: BUFFER STD_LOGIC_VECTOR(N-1 DOWNTO 0);
						-- Data to be read from read registers
			read_data_1,read_data_2	: BUFFER STD_LOGIC_VECTOR(N-1 DOWNTO 0);
								-- Read Register address numbers 
			read_register_1,read_register_2: BUFFER STD_LOGIC_VECTOR(4 DOWNTO 0);
			write_data	: BUFFER STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			write_register: BUFFER STD_LOGIC_VECTOR(4 DOWNTO 0);
			Instruction	: BUFFER STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			PC_i,PC_o	: BUFFER STD_LOGIC_VECTOR(N-1 DOWNTO 0);
								-- ALU Input Vectors A and B
			A,B			: BUFFER STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			Branch_eq	: BUFFER STD_LOGIC;
			Branch_ne	: BUFFER STD_LOGIC;
			Jump		   : BUFFER STD_LOGIC;
			MemRead,MemWrite : BUFFER STD_LOGIC;
			RegWrite		: BUFFER STD_LOGIC;
			read_data	: BUFFER STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			ALU_Src,PC_Src	: BUFFER STD_LOGIC; --Input Signal
						-- Zero signal, also an ouput
			Zero			: BUFFER STD_LOGIC);
END MIPS_Full;

ARCHITECTURE Structure OF MIPS_Full IS
	--SIGNAL	Extend_Value : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL	Addr : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL	Cons : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL	Data : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	--SIGNAL	PC_in,PC_out,
	SIGNAL	PC_plus_4 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
						-- Write Register address numbers
	--SIGNAL write_register : STD_LOGIC_VECTOR(4 DOWNTO 0);
	SIGNAL Reg_d_0,Reg_d_1 : STD_LOGIC_VECTOR(4 DOWNTO 0);
						-- Read Register address numbers 
	--SIGNAL read_register_1,read_register_2: STD_LOGIC_VECTOR(4 DOWNTO 0);
						-- Immediate Value for I-Type Instructions
	SIGNAL Immediate_value					  : STD_LOGIC_VECTOR((N/2)-1 DOWNTO 0);
						-- The Sign-Extended value
	SIGNAL Extend_value						  : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL Extend_shift						  : STD_LOGIC_VECTOR(N+1 DOWNTO 0);
						-- Select Vector for ALU operations
	SIGNAL ALU_ctrl							  : STD_LOGIC_VECTOR(3 DOWNTO 0);
						-- ALU Input Vectors A and B
	--SIGNAL A,B									  : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL MemtoReg		: STD_LOGIC;  -- for writing to register from memory
	SIGNAL ALUOp			: STD_LOGIC_VECTOR(1 DOWNTO 0);  --for ALU control unit
				--picks between sign-extended value and read_data_2
	--SIGNAL ALU_Src,PC_Src		  : STD_LOGIC; --Input Signals
	SIGNAL RegDst		: STD_LOGIC;  -- RegDst picks destination Write-Back Reg
	SIGNAL J_immediate : STD_LOGIC_VECTOR(N-7 DOWNTO 0);
	SIGNAL J_immed_shift	: STD_LOGIC_VECTOR(N-5 DOWNTO 0);
	SIGNAL Add_const : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL Branch_addr : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL Jump_address	: STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL PC_plus_offset :STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	--SIGNAL 
BEGIN
	--PC <= PC_o;
	Reg_d_0	<= Instruction(20 DOWNTO 16);
	Reg_d_1	<= Instruction(15 DOWNTO 11);
	read_register_1	<=	Instruction(25 DOWNTO 21);
	read_register_2	<=	Instruction(20 DOWNTO 16);
	Add_const <= (2 => '1', OTHERS => '0');
	--PC_Src <= Branch AND Zero;
	Jump_address <= PC_plus_4(N-1 DOWNTO N-4) & (J_immed_shift);
	Immediate_value	<= Instruction((N/2)-1 DOWNTO 0);
	A	<= read_data_1;
	
	PC_Reg0: PC_Reg PORT MAP(Clock,Reset,PC_i,PC_o);
	
	Inst_Mem: Program_Mem PORT MAP(PC_o(9 DOWNTO 2),Clock,Data,'0',Instruction);
	
	Adder0 : Adder32 PORT MAP(PC_o,Add_const,PC_plus_4);
	
	Control_U: Control PORT MAP(Instruction(31 DOWNTO 26),Clock,Reset,RegDst,Jump
										 ,Branch_eq,Branch_ne,MemRead,MemtoReg,ALUOp,
										 MemWrite,ALU_Src,RegWrite);
	
	Mux0_32_1 : mux_2to1 GENERIC MAP(5) 
								PORT MAP(RegDst,Reg_d_0,Reg_d_1,write_register);
	
	RegF0	: RegisterFile PORT MAP(Clock,RegWrite,read_register_1,read_register_2,
										write_register,write_data,read_data_1,read_data_2);
	
	Sign_Ext_0 : SignExtend PORT MAP(Immediate_value,Extend_value);
	
	Mux1_32_1 : mux_2to1 GENERIC MAP(N) 
								PORT MAP(ALU_Src,read_data_2,Extend_value,B); 
	
	ALU_exc  : alu_1 PORT MAP(ALU_ctrl,A,B,ALU_result,Zero);
	
	ALUctrl_0 : ALU_control PORT MAP(ALUOp,Instruction(5 DOWNTO 0),ALU_ctrl);
	
	Shift_L0	: ShiftLeft_2 GENERIC MAP(26) PORT MAP(J_immediate,J_immed_shift);
	
	Shift_L1	: ShiftLeft_2 GENERIC MAP(32) PORT MAP(Extend_Value,Extend_shift);
	
	Adder1 : Adder32 PORT MAP(PC_plus_4,Extend_shift(N-1 DOWNTO 0),Branch_addr);
	-- Using this to incorporate Branch_eq and Branch_ne decision association
	-- With PC_Src
	WITH Zero SELECT
	PC_Src	<= Branch_ne WHEN '0',
					Branch_eq WHEN OTHERS;
	
	Mux2_32_1 : mux_2to1 GENERIC MAP(N)  
								PORT MAP(PC_Src,PC_plus_4,Branch_addr,PC_plus_offset);
	
	Mux3_32_1 : mux_2to1 GENERIC MAP(N) 
								PORT MAP(Jump,PC_plus_offset,Jump_address,PC_i);
	
	DataMEM0 : Data_Mem PORT MAP(ALU_result(7 DOWNTO 0),Clock,write_data,MemRead,
										MemWrite,Reset,read_data);
	
	Mux4_32_1 : mux_2to1 GENERIC MAP(N) 
								PORT MAP(MemtoReg,ALU_result,read_data,write_data);
	
END Structure;
	
	
	
	
	
	