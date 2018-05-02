LIBRARY ieee;							--Provide compiler with access to Library
USE ieee.std_logic_1164.all;		--Use all contents from package in ieee Library
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all; --Use all contents from package in ieee Library

ENTITY decoder5_to_32 IS						--Top-Level Entity Declaration%
	PORT(X	: IN  STD_LOGIC_VECTOR(4 DOWNTO 0);		--Input declaration
		  Y	: OUT STD_LOGIC_VECTOR(31 DOWNTO 0));	--Output Vectors
END decoder5_to_32;

ARCHITECTURE Behavior OF decoder5_to_32 IS
	TYPE	decoder_array IS ARRAY(0 TO 31) OF STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL	dec_bus : decoder_array;
	--SIGNAL	F		  : STD_LOGIC_VECTOR(31 DOWNTO 0);
BEGIN
	--PROCESS(X)
		--BEGIN
			GEN_DEC : FOR i IN 0 TO 31 GENERATE--LOOP
			--Set high bit index corresponding to X value
				dec_bus(i) <= (i => '1', OTHERS => '0');	
			--END LOOP;
	--END PROCESS;
			END GENERATE;
	Y <= dec_bus(CONV_INTEGER(X));
END Behavior;