LIBRARY ieee;							 --Provide compiler with access to Library
USE ieee.std_logic_1164.all;		 --Use all contents from package in ieee Library
USE ieee.std_logic_arith.all;		 --Use all contents from package in ieee Library
USE ieee.std_logic_unsigned.all;	 --Use all contents from package in ieee Library
-- USE work.Reg32en_package.all;

ENTITY MEM_WB_REG IS
GENERIC(N : INTEGER := 32);
	PORT (Clock,Reset				: IN STD_LOGIC;
			MEM_read_data		 	: IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			EX_MEM_ALU_result  	: IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			EX_MEM_write_register: IN STD_LOGIC_VECTOR(4 DOWNTO 0);
			EX_MEM_MemtoReg		: IN STD_LOGIC;
			EX_MEM_RegWrite	 	: IN STD_LOGIC;
			MEM_WB_read_data	 	: OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			MEM_WB_ALU_result  	: OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			MEM_WB_write_register: OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
			MEM_WB_MemtoReg		: OUT STD_LOGIC;
			MEM_WB_RegWrite	 	: OUT STD_LOGIC);
END MEM_WB_REG;

ARCHITECTURE Behavior OF MEM_WB_REG IS
BEGIN
	MEM_WB_read_data	<=	MEM_read_data;
	PROCESS(Clock,Reset)
	BEGIN
		IF Reset='1'	THEN
			--MEM_WB_read_data	 	 <=  (OTHERS => '0');
			MEM_WB_ALU_result  	 <=  (OTHERS => '0');
			MEM_WB_write_register <=  (OTHERS => '0');
			MEM_WB_MemtoReg		 <=  '0';
			MEM_WB_RegWrite	 	 <=  '0';
		ELSIF Clock'EVENT AND Clock = '1' THEN		-- on the rising clock edge
			--MEM_WB_read_data	 	 <=  MEM_read_data;
			MEM_WB_ALU_result  	 <=  EX_MEM_ALU_result;
			MEM_WB_write_register <=  EX_MEM_write_register;
			MEM_WB_MemtoReg		 <=  EX_MEM_MemtoReg;
			MEM_WB_RegWrite	 	 <=  EX_MEM_RegWrite;
		END IF;
	END PROCESS;
END Behavior;