LIBRARY ieee;								--Provide compiler with access to Library
USE ieee.std_logic_1164.all;			--Use all contents from package in ieee Library
USE ieee.std_logic_arith.all;	--Use all contents from package in ieee Library
USE ieee.std_logic_unsigned.all;	--Use all contents from package in ieee Library

ENTITY RegFile IS 
	PORT(read_data_1	:	OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		  read_data_2	:	OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		  write_data	: 	IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		  read_reg_1	:	IN	 STD_LOGIC_VECTOR(4 DOWNTO 0);
		  read_reg_2	:	IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
		  write_reg		:	IN	 STD_LOGIC_VECTOR(4 DOWNTO 0);
		  RegWrite		:  IN  STD_LOGIC;
		  clock, reset	:	IN	 STD_LOGIC);		  
	END RegFile;
	
ARCHITECTURE Behavior OF RegFile IS
TYPE register_bank IS ARRAY (0 TO 31) OF STD_LOGIC_VECTOR(31 DOWNTO 0);

	SIGNAL reg_array	: register_bank;

BEGIN 
	read_data_1 <= reg_array(CONV_INTEGER(read_reg_1)); --Read Register #1
	read_data_2 <= reg_array(CONV_INTEGER(read_reg_2)); --Read Register #2
END Behavior;