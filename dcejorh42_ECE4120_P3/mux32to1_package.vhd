LIBRARY ieee;						--Provide compiler with access to Library
USE ieee.std_logic_1164.all;	--Use all contents from package in ieee Library

PACKAGE mux32to1_package IS
	COMPONENT mux_32to1						--Component Declaration
		GENERIC(N	: INTEGER := 32);	-- Constant declaration
		PORT (S           					: IN STD_LOGIC_VECTOR(4 DOWNTO 0);
					--input vector declarations
				X0,X1,X2,X3,X4,X5,X6,X7,X8	: IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
				X9,X10,X11,X12,X13,X14,X15	: IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
				X16,X17,X18,X19,X20,X21,X22: IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
				X23,X24,X25,X26,X27,X28,X29: IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
				X30,X31							: IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
					--output vector declared
				Y									: OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0));
	END COMPONENT;
END mux32to1_package;