LIBRARY ieee;								--Provide compiler with access to Library
USE ieee.std_logic_1164.all;			--Use all contents from package in ieee Library

ENTITY PC_Reg IS						--Top-Level Entity Declaration%
	GENERIC(N : INTEGER := 32);
	PORT (Clock, Reset : IN STD_LOGIC;	--Input declaration
			PC_in			 : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			PC_out		 : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0));
END PC_Reg;

ARCHITECTURE Behavior OF PC_Reg IS ---register implementation
BEGIN 
	PROCESS(Reset,Clock)
	BEGIN
		IF Reset = '1' THEN      -- This is an asynchronous reset
			PC_out <= (OTHERS => '0');
		ELSIF Clock'EVENT AND Clock = '1' THEN    -- on the rising clock edge
			PC_out <= PC_in;								-- D-> Q : Q follows Data input 
		END IF;
	END PROCESS;
END Behavior; 
