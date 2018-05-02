LIBRARY ieee;								--Provide compiler with access to Library
USE ieee.std_logic_1164.all;			--Use all contents from package in ieee Library

PACKAGE ProgMem_package IS
	COMPONENT Program_Mem						--Program_Mem entity used as a Component
		PORT (address		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);	--Input declaration
			   clock		: IN STD_LOGIC  := '1';
				data		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
				wren		: IN STD_LOGIC ;
			   Q			: OUT STD_LOGIC_VECTOR(31 DOWNTO 0));	--Output declaration
	END COMPONENT;
END ProgMem_package;