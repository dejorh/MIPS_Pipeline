LIBRARY ieee;						--Provide compiler with access to Library
USE ieee.std_logic_1164.all;	--Use all contents from package in ieee Library

PACKAGE MEM_WB_package IS
	COMPONENT MEM_WB_REG					--Component Declaration
	GENERIC(N : INTEGER := 32);
		PORT (Clock,Reset			 	: IN STD_LOGIC;
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
	END COMPONENT;
END MEM_WB_package;