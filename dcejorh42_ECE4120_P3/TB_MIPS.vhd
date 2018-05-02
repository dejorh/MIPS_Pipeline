LIBRARY ieee;							 --Provide compiler with access to Library
USE ieee.std_logic_1164.all;		 --Use all contents from package in ieee Library
USE ieee.std_logic_arith.all;		 --Use all contents from package in ieee Library
USE ieee.std_logic_unsigned.all;	 --Use all contents from package in ieee Library


ENTITY TB_MIPS IS					--Top-Level Entity Declaration%
GENERIC(N : INTEGER := 32);
END ENTITY TB_MIPS;

ARCHITECTURE TB_MIPS_Arch OF TB_MIPS IS
	SIGNAL	Clock,Simend	: STD_LOGIC := '0';
	SIGNAL	Reset		: STD_LOGIC;
						-- ALU Output Vector
	SIGNAL	ALU_result	: STD_LOGIC_VECTOR(N-1 DOWNTO 0);
						-- ALU Input Vectors A and B
	SIGNAL 	A,B		: STD_LOGIC_VECTOR(N-1 DOWNTO 0);
						-- Data to be read from read registers
	SIGNAL	read_data_1,read_data_2	: STD_LOGIC_VECTOR(N-1 DOWNTO 0);
						-- Write Register address numbers
	SIGNAL 	write_register : STD_LOGIC_VECTOR(4 DOWNTO 0);
	SIGNAL	write_data	: STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL	Instruction	: STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL	PC_i,PC_o	: STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL	Branch_eq	: STD_LOGIC;
	SIGNAL	Branch_ne	: STD_LOGIC;
	SIGNAL	Jump		   : STD_LOGIC;
	SIGNAL	MemRead,MemWrite : STD_LOGIC;
	SIGNAL	RegWrite		: STD_LOGIC;
	SIGNAL 	read_data	: STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL 	ALU_Src,PC_Src		  : STD_LOGIC; --Input Signals
						-- Read Register address numbers 
	SIGNAL 	read_register_1,read_register_2: STD_LOGIC_VECTOR(4 DOWNTO 0);
						-- Zero signal, also an ouput
	SIGNAL	Zero			: STD_LOGIC;
	
	
	COMPONENT MIPS_Full					--Component Declaration
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
	END COMPONENT;

BEGIN	
	MIPS_0 : MIPS_Full PORT MAP(Clock,Reset,ALU_result,read_data_1,read_data_2,
										 read_register_1,read_register_2,write_data,
										 write_register,Instruction,PC_i,PC_o,A,B,
										 Branch_eq,Branch_ne,Jump,MemRead,MemWrite,
										 RegWrite,read_data,ALU_Src,PC_Src,Zero);
								
								
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
		wait for 1000 ns;
		
		Simend <= '1';			-- signal to stop toggling clock
		wait;
	END PROCESS;
END TB_MIPS_Arch;
								