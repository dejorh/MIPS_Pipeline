LIBRARY ieee;							--Provide compiler with access to Library
USE ieee.std_logic_1164.all;		--Use all contents from package in ieee Library
USE ieee.std_logic_arith.all;		--Use all contents from package in ieee Library
USE ieee.math_real.all;				--Use all contents from package in ieee Library
USE ieee.std_logic_unsigned.all;	--Use all contents from package in ieee Library
USE work.proctypes_package.all;

ENTITY mux32 IS								--Top-Level Entity Declaration%
GENERIC(N : INTEGER := 32);
		-- The Select Input into the Mux
PORT(Sel			:	IN STD_LOGIC_VECTOR(INTEGER(CEIL(LOG2(REAL(N))))-1 DOWNTO 0);
		-- Inputs to the 32-bit, 32 to 1 multiplexer
	  X			:  IN T_SLVV_N;
	--  X0,X1,X2,X3,X4,X5,X6,X7	:	IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	--  X8,X9,X10,X11,X12,X13  	:	IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	--  X14,X15,X16,X17,X18,X19	:	IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	--  X20,X21,X22,X23,X24,X25	:	IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	--  X26,X27,X28,X29,X30,X31	:	IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		-- Output of the multiplexer
	  Y			: OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0));
END mux32;

ARCHITECTURE Behavior OF mux32 IS
BEGIN
		-- Selection Logic for the 32-bit, 32-to-1 Mux
		Y <= X(CONV_INTEGER(Sel));
END Behavior;