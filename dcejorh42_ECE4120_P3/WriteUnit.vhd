LIBRARY ieee;							--Provide compiler with access to Library
USE ieee.std_logic_1164.all;		--Use all contents from package in ieee Library
USE ieee.std_logic_arith.all;		--Use all contents from package in ieee Library
USE ieee.std_logic_unsigned.all;	--Use all contents from package in ieee Library
USE work.decoder5to32_package.all;--Use all contents from package in work Library
USE work.RegBank32_package.all;	 --Use all contents from package in work Library
USE work.proctypes_package.all;

ENTITY WriteUnit IS					--Component Declaration
GENERIC(N : INTEGER := 32);		-- Constant declaration
	PORT (Clock,Wren		:  IN STD_LOGIC; --Clock and Write_enable signal
				--input vectors declarations
			register_number:	IN STD_LOGIC_VECTOR(4 DOWNTO 0);
			register_data	:  IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
				--output vectors declarations	
			Y					: OUT T_SLVV_N);
END WriteUnit;

ARCHITECTURE Structure OF WriteUnit IS
	SIGNAL Temp,F,AND_array: STD_LOGIC_VECTOR(N-1 DOWNTO 0);--intermediate signals
BEGIN
	DECODE0_5_32 : decoder5_to_32 PORT MAP(register_number,Temp); --Decoder maps
	F <= Temp(N-1 DOWNTO 1) & '0';
	--En <= F;
	--An <= AND_array;
						-- The AND-Gate Array
	PROCESS(F,Wren)
	BEGIN
		FOR i IN 0 TO N-1 LOOP
			AND_array(i) <= F(i) AND Wren;
		END LOOP;
	END PROCESS;
					-- Register-Bank Port mappings
	REG_BANK_Inst: Reg_Bank_32 PORT MAP(Clock,'0',AND_array,register_data,Y);
END Structure;