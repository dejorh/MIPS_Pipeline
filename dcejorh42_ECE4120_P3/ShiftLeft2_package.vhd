LIBRARY ieee;						--Provide compiler with access to Library
USE ieee.std_logic_1164.all;	--Use all contents from package in ieee Library

PACKAGE ShiftLeft2_package IS
	COMPONENT ShiftLeft_2					--Component Declaration
	GENERIC(N : INTEGER);	
		PORT (Shift_in		:  IN STD_LOGIC_VECTOR(N-1 DOWNTO 0); --input to the shifter
				Shift_out	: OUT	STD_LOGIC_VECTOR(N+1 DOWNTO 0)); --shifted output
	END COMPONENT;
END ShiftLeft2_package;