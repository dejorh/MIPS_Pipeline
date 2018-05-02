LIBRARY ieee;						--Provide compiler with access to Library
USE ieee.std_logic_1164.all;	--Use all contents from package in ieee Library
USE work.proctypes_package.all;

PACKAGE WriteUnit_package IS
	COMPONENT WriteUnit					--Component Declaration
		GENERIC(N	: INTEGER := 32);	-- Constant declaration
		PORT (Clock,Wren		:  IN STD_LOGIC; --Clock and Write_enable signal
				--input vectors declarations
				register_number:	IN STD_LOGIC_VECTOR(4 DOWNTO 0);
				register_data	:  IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
				--output vectors declarations
				Y					: OUT T_SLVV_N);
			--	Y0,Y1,Y2,Y3,Y4,Y5,Y6,Y7,Y8	: OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			--	Y9,Y10,Y11,Y12,Y13,Y14,Y15	: OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			--	Y16,Y17,Y18,Y19,Y20,Y21,Y22: OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			--	Y23,Y24,Y25,Y26,Y27,Y28,Y29: OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			--	Y30,Y31,En,An					: OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0));
	END COMPONENT;
END WriteUnit_package;