LIBRARY ieee;								--Provide compiler with access to Library
USE ieee.std_logic_1164.all;			--Use all contents from package in ieee Library

PACKAGE PC_reg_package IS
	COMPONENT PC_Reg						--PC_Reg entity used as a Component
		GENERIC(N : INTEGER := 32);
		PORT (Clock, Reset : IN STD_LOGIC;	--Input declaration
			   PC_in			 : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			   PC_out		 : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0));--Output declaration
	END COMPONENT;
END PC_reg_package;