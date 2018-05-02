LIBRARY ieee;						--Provide compiler with access to Library
USE ieee.std_logic_1164.all;	--Use all contents from package in ieee Library

PACKAGE HDU_2_package IS
	COMPONENT Hazard_Detect_2					--Component Declaration
		PORT (Clock				: IN STD_LOGIC;
				EX_MEM_PCSrc	: IN STD_LOGIC;
				ID_EX_Jump		: IN STD_LOGIC;
				EX_MEM_Flush	: OUT STD_LOGIC;
				IF_Flush_1		: OUT STD_LOGIC;
				IF_Flush_2		: OUT STD_LOGIC);
	END COMPONENT;
END HDU_2_package;