LIBRARY ieee;							 --Provide compiler with access to Library
USE ieee.std_logic_1164.all;		 --Use all contents from package in ieee Library
USE ieee.std_logic_arith.all;		 --Use all contents from package in ieee Library
USE ieee.std_logic_unsigned.all;	 --Use all contents from package in ieee Library


ENTITY TB_MIPS_Pipe IS					--Top-Level Entity Declaration%
GENERIC(N : INTEGER := 32; M : INTEGER := 5);
END ENTITY TB_MIPS_Pipe;

ARCHITECTURE TB_MIPS_Pipe_Arch OF TB_MIPS_Pipe IS
	SIGNAL	Clock,Simend	: STD_LOGIC := '0';
	SIGNAL Reset	:	STD_LOGIC;
	SIGNAL	PC,nextPC,PC_i,Instruction : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			--IF_ID_nextPC,IF_ID_Instruction : BUFFER STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL PC_Write,IF_ID_Write,IF_Flush : STD_LOGIC;
	SIGNAL ID_EX_RegDst,ID_EX_Jump,ID_EX_Branch_eq : STD_LOGIC;
	SIGNAL		ID_EX_Branch_ne,ID_EX_MemRead,ID_EX_MemWrite : STD_LOGIC;
	SIGNAL		ID_EX_ALUOp	: STD_LOGIC_VECTOR(1 DOWNTO 0);
	SIGNAL		ID_EX_MemtoReg,ID_EX_ALUSrc,ID_EX_RegWrite : STD_LOGIC;
	SIGNAL		Flush,EX_MEM_Flush : STD_LOGIC;
	SIGNAL read_register_1,read_register_2: STD_LOGIC_VECTOR(M-1 DOWNTO 0);
	SIGNAL		write_register : STD_LOGIC_VECTOR(M-1 DOWNTO 0);
	SIGNAL FWD_Data_A,FWD_Data_B	: STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			--B						: BUFFER STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL	read_data_1,read_data_2	:	STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			--ID_EX_read_data_1	: BUFFER STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			--ID_EX_read_data_2 : BUFFER STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			--ID_EX_nextPC					: BUFFER STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL EX_MEM_nextPC					: STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			--ID_EX_Jump_address			: BUFFER STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL ID_EX_Rs,ID_EX_Rt,ID_EX_Rd	: STD_LOGIC_VECTOR(M-1 DOWNTO 0);
			--ID_EX_extend_value			: BUFFER STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			--ALU_result	: BUFFER STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL	EX_MEM_ALU_result : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL MEM_WB_ALU_result	: STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL FWD_A,FWD_B	: STD_LOGIC_VECTOR(1 DOWNTO 0);
	SIGNAL Final_Jump	: STD_LOGIC;
	SIGNAL EX_MEM_RegWrite,MEM_WB_RegWrite	: STD_LOGIC;
	SIGNAL EX_MEM_MemtoReg,MEM_WB_MemtoReg	: STD_LOGIC;
	SIGNAL EX_MEM_MemRead,EX_MEM_MemWrite	: STD_LOGIC;
	SIGNAL EX_MEM_Branch_eq,EX_MEM_Branch_ne: STD_LOGIC;
	SIGNAL Zero,EX_MEM_Zero,PC_Src	:	STD_LOGIC;
	SIGNAL EX_MEM_write_register : STD_LOGIC_VECTOR(M-1 DOWNTO 0);
	SIGNAL MEM_WB_write_register : STD_LOGIC_VECTOR(M-1 DOWNTO 0);
	--MEM_read_data	  : BUFFER STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL MEM_WB_read_data : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			--EX_MEM_write_data : BUFFER STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL MEM_WB_write_data	: STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	
	
	COMPONENT MIPS_Pipeline	IS				--Component Declaration
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
			Final_Jump	: BUFFER STD_LOGIC;
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
	END COMPONENT;

BEGIN	
	MIPS : MIPS_Pipeline PORT MAP(Clock,Reset,PC,nextPC,PC_i,Instruction,
										 PC_Write,IF_ID_Write,IF_Flush,ID_EX_RegDst,
										 ID_EX_Jump,ID_EX_Branch_eq,ID_EX_Branch_ne,
										 ID_EX_MemRead,ID_EX_MemWrite,ID_EX_ALUOp,
										 ID_EX_MemtoReg,ID_EX_ALUSrc,ID_EX_RegWrite,Flush,
										 EX_MEM_Flush,read_register_1,read_register_2,
										 write_register,FWD_Data_A,FWD_Data_B,read_data_1,
										 read_data_2,EX_MEM_nextPC,ID_EX_Rs,ID_EX_Rt,
										 ID_EX_Rd,EX_MEM_ALU_result,MEM_WB_ALU_result,
										 FWD_A,FWD_B,Final_Jump,EX_MEM_RegWrite,
										 MEM_WB_RegWrite,EX_MEM_MemtoReg,MEM_WB_MemtoReg,
										 EX_MEM_MemRead,EX_MEM_MemWrite,EX_MEM_Branch_eq,
										 EX_MEM_Branch_ne,Zero,EX_MEM_Zero,PC_Src,
										 EX_MEM_write_register,MEM_WB_write_register,
										 MEM_WB_read_data,MEM_WB_write_data);
								
								
	-- Port Mappings for the Fetch Stage
	
	--PC_out <= Address;
	Clck_Process: PROCESS
	BEGIN
		WHILE Simend = '0' LOOP	
			Clock <= NOT Clock;
			wait for 50 ns; 
		END LOOP;
		wait;
	END PROCESS;
		
	Test_Process: PROCESS
	BEGIN
		--Data <= X"1022FFFF"; -- The Loaded Data (only using one)
		--En  <= '1';				-- Wren == '1' Meaning write to Memory/Load
		Reset <= '1';			--Reset
		wait for 120 ns;
		--En <= '0';
		Reset	<= '0';			-- After 90ns Begin to read from Memory 
		--wait for 90 ns;		-- Reset still high so this is address 0/ where data was
									--written to
		--Reset <= '0';			--After 180 ns Reset goes low and begin incrementing PC
		--En <= '1';		--Now Reset is Low & PC can increment, expect to write to
									-- higher word position/address in memory other than 0.
		--wait for 100 ns;
		--En <= '0';				-- Begin reading again after 2 clock cycles
		wait for 1700 ns;
		
		Simend <= '1';			-- signal to stop toggling clock
		wait;
	END PROCESS;
END TB_MIPS_Pipe_Arch;
								