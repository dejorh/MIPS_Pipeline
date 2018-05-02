LIBRARY ieee;						--Provide compiler with access to Library
USE ieee.std_logic_1164.all;	--Use all contents from package in ieee Library

PACKAGE EX_MEM_package IS
	COMPONENT EX_MEM_REG					--Component Declaration
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
				Zero	 	: IN STD_LOGIC;
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
				--EX_MEM_Jump			 	: OUT STD_LOGIC;
				EX_MEM_Zero			 	: OUT STD_LOGIC);
	END COMPONENT;
END EX_MEM_package;