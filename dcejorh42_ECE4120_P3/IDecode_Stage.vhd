LIBRARY ieee;						--Provide compiler with access to Library
USE ieee.std_logic_1164.all;	--Use all contents from package in ieee Library
USE work.RegisterFile_package.all; --Use all contents from package in work Library
USE work.SignExtend_package.all;	--Use all contents from package in work Library

ENTITY IDecode_Stage IS
GENERIC(N : INTEGER := 32);
	PORT (Clock,RegWrite					 	 :  IN STD_LOGIC; --Input Signals
						--Read Register address numbers 
			read_register_1,read_register_2:  IN STD_LOGIC_VECTOR(4 DOWNTO 0);
						--Write Register address numbers
			write_register						 :  IN STD_LOGIC_VECTOR(4 DOWNTO 0);
						-- Immediate Value for I-Type Instructions
			Immediate_value					 :  IN STD_LOGIC_VECTOR((N/2)-1 DOWNTO 0);
						-- Data to be written to designated "write" register
			write_data							 :  IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
						-- Data to be read from read registers
			read_data_1,read_data_2			 : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);
						-- The Sign-Extended value
			Extend_value						 : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0));
END IDecode_Stage;

ARCHITECTURE Structure OF IDecode_Stage IS
BEGIN
			-- Register File entity port-mapped instantiation
	REG_FILE_0 : RegisterFile PORT MAP(Clock,RegWrite,read_register_1,
												  read_register_2,write_register,
												  write_data,read_data_1,read_data_2);
			-- Sign-Extend entity port-mapped instantiation
	SIGN_EXT_0 : SignExtend PORT MAP(Immediate_value,Extend_value);
END Structure;