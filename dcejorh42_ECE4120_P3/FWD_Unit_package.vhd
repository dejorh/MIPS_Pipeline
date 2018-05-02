LIBRARY ieee;						--Provide compiler with access to Library
USE ieee.std_logic_1164.all;	--Use all contents from package in ieee Library

PACKAGE FWD_Unit_package IS
	COMPONENT FWD_Unit					--Component Declaration
	GENERIC(M : INTEGER := 5);
		PORT (ID_EX_Rs,ID_EX_Rt		:  IN STD_LOGIC_VECTOR(M-1 DOWNTO 0);
				EX_MEM_RegWrite		:  IN STD_LOGIC;
				MEM_WB_RegWrite		:	IN STD_LOGIC;
				EX_MEM_Rd,MEM_WB_Rd	:  IN STD_LOGIC_VECTOR(M-1 DOWNTO 0);
				FWD_A,FWD_B				: OUT STD_LOGIC_VECTOR(1 DOWNTO 0));
	END COMPONENT;
END FWD_Unit_package;