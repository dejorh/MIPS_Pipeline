LIBRARY ieee;							 --Provide compiler with access to Library
USE ieee.std_logic_1164.all;		 --Use all contents from package in ieee Library
USE ieee.std_logic_arith.all;		 --Use all contents from package in ieee Library
USE ieee.std_logic_unsigned.all;	 --Use all contents from package in ieee Library
--USE work.Reg32en_package.all;

ENTITY EX_MEM_REG IS
GENERIC(N : INTEGER := 32);
	PORT (Clock,Reset			 	: IN STD_LOGIC;
			Branch_Addr		 	 	: IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			--ID_EX_Jump_Addr		: IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			ALU_result			 	: IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			FWD_data_2			 	: IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			write_register		 	: IN STD_LOGIC_VECTOR(4 DOWNTO 0);
			ID_EX_MemRead		 	: IN STD_LOGIC;
			ID_EX_MemWrite			: IN STD_LOGIC;
			ID_EX_MemtoReg			: IN STD_LOGIC;
			ID_EX_RegWrite		 	: IN STD_LOGIC;
			ID_EX_Branch_eq	 	: IN STD_LOGIC;
			ID_EX_Branch_ne	 	: IN STD_LOGIC;
			--ID_EX_Jump,
			Zero	 					: IN STD_LOGIC;
			EX_MEM_Branch_Addr 	: OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			--EX_MEM_Jump_Addr		: OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			EX_MEM_ALU_result	 	: OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			EX_MEM_write_data  	: OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			EX_MEM_write_register: OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
			EX_MEM_MemRead		 	: OUT STD_LOGIC;
			EX_MEM_MemWrite		: OUT STD_LOGIC;
			EX_MEM_MemtoReg		: OUT STD_LOGIC;
			EX_MEM_RegWrite	 	: OUT STD_LOGIC;
			EX_MEM_Branch_eq	 	: OUT STD_LOGIC;
			EX_MEM_Branch_ne	 	: OUT STD_LOGIC;
			--EX_MEM_Jump				: OUT STD_LOGIC;
			EX_MEM_Zero			 	: OUT STD_LOGIC);
END EX_MEM_REG;

ARCHITECTURE Behavior OF EX_MEM_REG IS

BEGIN
	PROCESS(Clock)
	BEGIN
		IF Clock'EVENT AND Clock = '1' THEN		-- on the rising clock edge
			IF Reset='1'	THEN
				EX_MEM_Branch_Addr 	  <=	(OTHERS => '0');
				EX_MEM_ALU_result	 	  <=	(OTHERS => '0');
				EX_MEM_write_data  	  <=	(OTHERS => '0');
				EX_MEM_write_register  <=	(OTHERS => '0');
				EX_MEM_MemRead		 	  <=	'1';
				EX_MEM_MemWrite		  <=	'0';
				EX_MEM_MemtoReg		  <=	'0';
				EX_MEM_RegWrite	 	  <=	'0';
				EX_MEM_Branch_eq	 	  <=	'0';
				EX_MEM_Branch_ne	 	  <=	'0';
				--EX_MEM_Jump			 	  <=	'0';
				EX_MEM_Zero				  <=	'0';
			ELSE
				EX_MEM_Branch_Addr 	  <=	Branch_Addr;
				EX_MEM_ALU_result	 	  <=	ALU_result;
				EX_MEM_write_data  	  <=	FWD_data_2;
				EX_MEM_write_register  <=	write_register;
				EX_MEM_MemRead		 	  <=	ID_EX_MemRead;
				EX_MEM_MemWrite		  <=	ID_EX_MemWrite;
				EX_MEM_MemtoReg		  <=	ID_EX_MemtoReg;
				EX_MEM_RegWrite	 	  <=	ID_EX_RegWrite;
				EX_MEM_Branch_eq	 	  <=	ID_EX_Branch_eq;
				EX_MEM_Branch_ne	 	  <=	ID_EX_Branch_ne;
				--EX_MEM_Jump			 	  <=	ID_EX_Jump;
				EX_MEM_Zero				  <=	Zero;
			END IF;
		END IF;
	END PROCESS;
END Behavior;