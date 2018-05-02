LIBRARY ieee;								--Provide compiler with access to Library
USE ieee.std_logic_1164.all;			--Use all contents from package in ieee Library
USE ieee.std_logic_unsigned.all;	--Use all contents from package in ieee Library

PACKAGE Adder32_package IS
	COMPONENT Adder32						--Adder32 entity used as a Component
		PORT (A			 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);	--Input declaration 
				B		: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
				Result		 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0));
	END COMPONENT;
END Adder32_package;