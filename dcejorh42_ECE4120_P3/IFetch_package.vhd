LIBRARY ieee;								--Provide compiler with access to Library
USE ieee.std_logic_1164.all;			--Use all contents from package in ieee Library

PACKAGE IFetch_package IS
	COMPONENT IFetch_Stage						--IFetch entity used as a Component
		PORT (Clock, Reset,En : IN STD_LOGIC;	--Input declaration
			Data       : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			B			:   BUFFER STD_LOGIC_VECTOR(31 DOWNTO 0);
		----- This address corresponds to Instruction-Memory -----
			PC_plus4	: BUFFER STD_LOGIC_VECTOR(31 DOWNTO 0); -- PC input
			Curr_Address: OUT STD_LOGIC_VECTOR(31 DOWNTO 0); --Output Vectors
		----- This is the 32-bit bus corresponding to the Instruction -----
			Instruction	: OUT STD_LOGIC_VECTOR(31 DOWNTO 0)); --Output Vectors
	END COMPONENT;
END IFetch_package;