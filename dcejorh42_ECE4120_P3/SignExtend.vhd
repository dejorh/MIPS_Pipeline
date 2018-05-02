LIBRARY ieee;							--Provide compiler with access to Library
USE ieee.std_logic_1164.all;		--Use all contents from package in ieee Library

ENTITY SignExtend IS
GENERIC(N : INTEGER := 16);	
					-- Immediate Value for I-Type Instructions
	PORT (Immediate_value	:	IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
					-- The Sign-Extended value
			Extend_value		: OUT STD_LOGIC_VECTOR((2*N)-1 DOWNTO 0));
END SignExtend;

ARCHITECTURE Behavior OF SignExtend IS
	SIGNAL Zeros,Ones	: STD_LOGIC_VECTOR(N-1 DOWNTO 0); --intermediate signals
BEGIN
	Zeros <= (OTHERS => '0');
	Ones	<= (OTHERS => '1');
	--Sign Extend the zeros if the most-significant immediate bit is a zero
	Extend_value <= Zeros & Immediate_value 			--Sign Extend the zeros
						 WHEN Immediate_value(N-1)='0'
	--Sign Extend the ones if the most-significant immediate bit is a one
						 ELSE Ones & Immediate_value;
END Behavior;