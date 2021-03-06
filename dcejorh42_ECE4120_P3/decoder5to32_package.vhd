LIBRARY ieee;							--Provide compiler with access to Library
USE ieee.std_logic_1164.all;		--Use all contents from package in ieee Library

PACKAGE decoder5to32_package IS
	COMPONENT decoder5_to_32
		PORT(X	: IN  STD_LOGIC_VECTOR(4 DOWNTO 0);		--Input declaration
			  Y	: OUT STD_LOGIC_VECTOR(31 DOWNTO 0));	--Output Vectors
	END COMPONENT;
END decoder5to32_package;
