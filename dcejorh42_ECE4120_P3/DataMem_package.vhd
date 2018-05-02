LIBRARY ieee;								--Provide compiler with access to Library
USE ieee.std_logic_1164.all;			--Use all contents from package in ieee Library

PACKAGE DataMem_package IS
	COMPONENT Data_Mem						--Program_Mem entity used as a Component
		PORT (				-- Input declaration
				address						: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
				clock							: IN STD_LOGIC  := '1';
				write_data			    	: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
				MemRead,MemWrite,Reset	: IN STD_LOGIC ;
								--Output declaration
				read_data					: OUT STD_LOGIC_VECTOR (31 DOWNTO 0));	
	END COMPONENT;
END DataMem_package;