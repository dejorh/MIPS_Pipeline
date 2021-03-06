LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;

ENTITY mux_2to1 IS
GENERIC (N : INTEGER);
	PORT (S		: IN STD_LOGIC;
			X0,X1	: IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			Y		: OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0));
END mux_2to1;

ARCHITECTURE Behavior OF mux_2to1 IS
BEGIN
	WITH S SELECT 
	Y <= X0 WHEN '0',
		  X1 WHEN OTHERS;
END Behavior;