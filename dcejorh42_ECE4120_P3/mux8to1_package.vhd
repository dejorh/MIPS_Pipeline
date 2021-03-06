LIBRARY ieee;						--Provide compiler with access to Library
USE ieee.std_logic_1164.all;	--Use all contents from package in ieee Library

PACKAGE mux8to1_package IS
	COMPONENT mux_8to1						--Component Declaration
		GENERIC(N	: INTEGER := 32);	-- Constant declaration
		PORT (S0,S1,S2		: IN STD_LOGIC;	--select signals
					--input vector declarations
				X0,X1,X2,X3	: IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
				X4,X5,X6,X7	: IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
					--output vector declared
				Y				: OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0));
	END COMPONENT;
END mux8to1_package;