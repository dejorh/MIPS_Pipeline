LIBRARY ieee;						--Provide compiler with access to Library
USE ieee.std_logic_1164.all;	--Use all contents from package in ieee Library

PACKAGE MIPS_package IS
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
END MIPS_package;