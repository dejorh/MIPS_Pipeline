LIBRARY ieee;						--Provide compiler with access to Library
USE ieee.std_logic_1164.all;	--Use all contents from package in ieee Library

PACKAGE mux2to1_package IS
	COMPONENT mux_2to1						--Component Declaration
		GENERIC(N	: INTEGER );	-- Constant declaration
		PORT (S		: IN STD_LOGIC;	--select signal
				X0,X1	: IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);--input vector declarations
				Y		: OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0));--output vector declared
	END COMPONENT;
END mux2to1_package;