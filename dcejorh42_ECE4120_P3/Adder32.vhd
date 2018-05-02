LIBRARY ieee;						--Provide compiler with access to Library
USE ieee.std_logic_1164.all;	--Use all contents from package in ieee Library
USE ieee.std_logic_arith.all;	--Use all contents from package in ieee Library
USE ieee.std_logic_unsigned.all;	--Use all contents from package in ieee Library

ENTITY Adder32 IS						--Top-Level Entity Declaration%
	PORT (A			 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);	--Input declaration
			B         : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			Result	 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)); -- output declaration
END Adder32;

ARCHITECTURE Behavior OF Adder32 IS 
BEGIN	
	Result <= A + B;	--Simple Addition to give behavioral representation
END Behavior;