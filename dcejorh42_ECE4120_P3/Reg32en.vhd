LIBRARY ieee;							--Provide compiler with access to Library
USE ieee.std_logic_1164.all;		--Use all contents from package in ieee Library
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;

ENTITY Reg32en IS					--Top-Level Entity Declaration%
GENERIC(N	: INTEGER := 32);
	PORT (En,Clock,Reset	:  IN  STD_LOGIC;				--Input declaration
			D					:	IN  STD_LOGIC_VECTOR(N-1 DOWNTO 0);
				--Output declaration
			Q					:	OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0));
END Reg32en;

ARCHITECTURE Behavior OF Reg32en IS	---register implementation
BEGIN 
	PROCESS(Reset,Clock)
	BEGIN
		IF Reset = '1' THEN				-- This is an asynchronous reset
			Q <= (OTHERS => '0');
		ELSIF Clock'EVENT AND Clock = '1' THEN		-- on the rising clock edge
			IF En = '1' THEN							-- Enable active high
				Q <= D;									-- D-> Q : Q follows Data input
			END IF;
		END IF;
	END PROCESS;
END Behavior;