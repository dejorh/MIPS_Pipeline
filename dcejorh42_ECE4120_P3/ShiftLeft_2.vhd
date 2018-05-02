LIBRARY ieee;							 --Provide compiler with access to Library
USE ieee.std_logic_1164.all;		 --Use all contents from package in ieee Library
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;

ENTITY ShiftLeft_2 IS
GENERIC(N : INTEGER);	
	PORT (Shift_in		:  IN STD_LOGIC_VECTOR(N-1 DOWNTO 0); --input to the shifter
			Shift_out	: OUT	STD_LOGIC_VECTOR(N+1 DOWNTO 0)); --shifted output
END ShiftLeft_2;

ARCHITECTURE Behavior OF ShiftLeft_2 IS
BEGIN
	Shift_out	<= Shift_in&"00";
END Behavior;