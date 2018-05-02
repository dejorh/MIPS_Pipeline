LIBRARY ieee;						--Provide compiler with access to Library
USE ieee.std_logic_1164.all;	--Use all contents from package in ieee Library

PACKAGE ID_EX_package IS
	COMPONENT ID_EX_REG					--Component Declaration
	GENERIC(N : INTEGER := 32);
		PORT (Clock,Reset			 :  IN STD_LOGIC;
				IF_ID_nextPC		 :  IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
				Jump_Addr			 :  IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
				read_data_1,read_data_2 : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
				extend_value		 : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
				IF_ID_Rs,IF_ID_Rt	 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
				IF_ID_Rd	 			 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
				ID_EX_nextPC		 : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);
				ID_EX_Jump_Addr	 : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);
				ID_EX_read_data_1	 : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);
				ID_EX_read_data_2	 : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);
				ID_EX_extend_value : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);
				ID_EX_Rs,ID_EX_Rt	 : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
				ID_EX_Rd				 : OUT STD_LOGIC_VECTOR(4 DOWNTO 0));
	END COMPONENT;
END ID_EX_package;