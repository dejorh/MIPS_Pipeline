LIBRARY ieee;						--Provide compiler with access to Library
USE ieee.std_logic_1164.all;	--Use all contents from package in ieee Library

PACKAGE mux4to1_package IS
	COMPONENT mux_4to1						--Component Declaration
		GENERIC(N	: INTEGER := 32);	-- Constant declaration
		PORT (S				: IN STD_LOGIC_VECTOR(1 DOWNTO 0);	--select signals
					--input vector declarations
				X0,X1,X2,X3	: IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
					--output vector declared
				Y				: OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0));
	END COMPONENT;
END mux4to1_package;