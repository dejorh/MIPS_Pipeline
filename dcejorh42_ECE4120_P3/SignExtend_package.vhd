LIBRARY ieee;						--Provide compiler with access to Library
USE ieee.std_logic_1164.all;	--Use all contents from package in ieee Library

PACKAGE SignExtend_package IS
	COMPONENT SignExtend					--Component Declaration
		GENERIC(N	: INTEGER := 16);	-- Constant declaration
					-- Immediate Value for I-Type Instructions
		PORT (Immediate_value	:	IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
					-- The Sign-Extended value
				Extend_value		: OUT STD_LOGIC_VECTOR((2*N)-1 DOWNTO 0));
	END COMPONENT;
END SignExtend_package;