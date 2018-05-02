LIBRARY ieee;						--Provide compiler with access to Library
USE ieee.std_logic_1164.all;	--Use all contents from package in ieee Library

PACKAGE ALU_package IS
	COMPONENT alu_1					--Component Declaration
		GENERIC(N  : INTEGER := 32);	-- Constant declaration
		PORT (	s				:  IN     STD_LOGIC_VECTOR(3 DOWNTO 0);--ALU select
						-- The two input words to the ALU
					A,B			:	IN 	 STD_LOGIC_VECTOR(N-1 DOWNTO 0);
						-- ALU output
					ALU_result	:  BUFFER STD_LOGIC_VECTOR(N-1 DOWNTO 0);
						-- Zero signal, also an ouput
					Zero			:  OUT    STD_LOGIC);
	END COMPONENT;
END ALU_package;