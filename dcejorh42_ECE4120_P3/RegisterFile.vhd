LIBRARY ieee;							--Provide compiler with access to Library
USE ieee.std_logic_1164.all;		--Use all contents from package in ieee Library
USE ieee.std_logic_arith.all;		--Use all contents from package in ieee Library
USE ieee.std_logic_unsigned.all;	--Use all contents from package in ieee Library
USE work.WriteUnit_package.all;	--Use all contents from package in work Library
USE work.ReadUnit_package.all;	--Use all contents from package in work Library
USE work.proctypes_package.all;

ENTITY RegisterFile IS
GENERIC(N : INTEGER := 32);	
	PORT (Clock,RegWrite					 	 :  IN STD_LOGIC; --Input Signals
						--Read Register address numbers 
			read_register_1,read_register_2:  IN STD_LOGIC_VECTOR(4 DOWNTO 0);
						--Write Register address numbers
			write_register						 :  IN STD_LOGIC_VECTOR(4 DOWNTO 0);
						-- Data to be written to designated "write" register
			write_data							 :  IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
						-- Data to be read from read registers
			read_data_1,read_data_2			 : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0));
END RegisterFile;

ARCHITECTURE Structure OF RegisterFile IS
--TYPE register_file IS ARRAY(0 TO N-1) OF STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL Regs	:  T_SLVV_N;
BEGIN
	READ_U_0	: ReadUnit PORT MAP(read_register_1,read_register_2,Regs,read_data_1,
																						  read_data_2);

--	READ_U_0	:	ReadUnit PORT MAP (read_register_1,read_register_2,Regs(0),
--								Regs(1),Regs(2),Regs(3),Regs(4),Regs(5),Regs(6),
--								Regs(7),Regs(8),Regs(9),Regs(10),Regs(11),Regs(12),
--								Regs(13),Regs(14),Regs(15),Regs(16),Regs(17),
--								Regs(18),Regs(19),Regs(20),Regs(21),Regs(22),
--								Regs(23),Regs(24),Regs(25),Regs(26),Regs(27),Regs(28),
--								Regs(29),Regs(30),Regs(31),read_data_1,read_data_2);
	
	WRITE_U_0:	WriteUnit PORT MAP(Clock,RegWrite,write_register,write_data,Regs);
END Structure;