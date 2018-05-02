LIBRARY ieee;						--Provide compiler with access to Library
USE ieee.std_logic_1164.all;	--Use all contents from package in ieee Library

PACKAGE IDecode_package IS
	COMPONENT IDecode_Stage					--Component Declaration
		GENERIC(N  : INTEGER := 32);	-- Constant declaration
		PORT (Clock,RegWrite					 :  IN STD_LOGIC; --Input Signals
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
	END COMPONENT;
END IDecode_package;