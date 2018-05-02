LIBRARY ieee;							 --Provide compiler with access to Library
USE ieee.std_logic_1164.all;		 --Use all contents from package in ieee Library
USE work.DataMem_package.all;

ENTITY DataMemory IS
	PORT (Clock,Reset,MemRead,MemWrite	:	IN STD_LOGIC;
			Address								:	IN STD_LOGIC_VECTOR(7 DOWNTO 0);
			write_data							:	IN	STD_LOGIC_VECTOR(31 DOWNTO 0);
			read_data							: OUT STD_LOGIC_VECTOR(31 DOWNTO 0));
END DataMemory;

ARCHITECTURE Structure OF DataMemory IS

BEGIN
	D_MEM0	:	Data_Mem PORT MAP(Address,Clock,write_data,MemWrite,read_data);
END Structure;