LIBRARY ieee;						--Provide compiler with access to Library
USE ieee.std_logic_1164.all;	--Use all contents from package in ieee Library

package proctypes_package is
--GENERIC(N : INTEGER := 32); 
		-- define a 4-Byte word
subtype T_SLV_N  is STD_LOGIC_VECTOR(31 downto 0);        
		-- define a new 32-bit array of words.
type    T_SLVV_N is array(NATURAL range 0 to 31) of T_SLV_N;  
end proctypes_package;