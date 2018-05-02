LIBRARY ieee;							 --Provide compiler with access to Library
USE ieee.std_logic_1164.all;		 --Use all contents from package in ieee Library
USE ieee.std_logic_arith.all;		 --Use all contents from package in ieee Library
USE ieee.std_logic_unsigned.all;	 --Use all contents from package in ieee Library
--USE work.Reg32en_package.all;

ENTITY ID_EX_REG IS
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
END ID_EX_REG;

ARCHITECTURE Behavior OF ID_EX_REG IS

BEGIN
	PROCESS(Reset,Clock)
	BEGIN
		IF Reset = '1' THEN				-- This is an asynchronous reset
			ID_EX_nextPC  <=  (OTHERS => '0');
			ID_EX_read_data_1	<=	(OTHERS => '0');
			ID_EX_read_data_2	<=	(OTHERS => '0');
			ID_EX_extend_value  <=	(OTHERS => '0');
			ID_EX_Rs	<= (OTHERS => '0');
			ID_EX_Rt	<= (OTHERS => '0');
			ID_EX_Rd	<= (OTHERS => '0');
		ELSIF Clock'EVENT AND Clock = '1' THEN		-- on the rising clock edge
			ID_EX_nextPC  <=  IF_ID_nextPC;
			ID_EX_read_data_1	<=	read_data_1;
			ID_EX_read_data_2	<=	read_data_2;
			ID_EX_extend_value  <=	extend_value;
			ID_EX_Rs	<= IF_ID_Rs;
			ID_EX_Rt	<= IF_ID_Rt;
			ID_EX_Rd	<= IF_ID_Rd;
		END IF;
	END PROCESS;
END Behavior;