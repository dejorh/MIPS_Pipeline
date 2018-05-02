LIBRARY ieee;							--Provide compiler with access to Library
USE ieee.std_logic_1164.all; 		--Use all contents from package in ieee Library
USE ieee.std_logic_unsigned.all; --Use all contents from package in ieee Library

ENTITY alu_1 IS
GENERIC(N : INTEGER := 32);		-- Define Generic Constant
	PORT (		s				:  IN     STD_LOGIC_VECTOR(3 DOWNTO 0); --ALU select
						-- The two input words to the ALU
					A,B			:	IN 	 STD_LOGIC_VECTOR(N-1 DOWNTO 0);
						-- ALU output
					ALU_result	:  BUFFER STD_LOGIC_VECTOR(N-1 DOWNTO 0);
						-- Zero signal, also an ouput
					Zero			:  OUT    STD_LOGIC);
END alu_1;

ARCHITECTURE Behavior OF alu_1 IS
SIGNAL Zeros, Ones	: STD_LOGIC_VECTOR(N-1 DOWNTO 0); -- intermediate signals
BEGIN
	Ones <= (OTHERS => '1');
	Zeros <= (OTHERS => '0');
	PROCESS ( s, A, B ) BEGIN
		CASE s IS					--"ALU_control" as defined in pg.256 Ch.4 of book
			  WHEN "0000" =>
					ALU_result <= A AND B ; -- performed bitwise AND when s="0000"
			  WHEN "0001" =>
					ALU_result <= A OR B ;  -- perform bitwise OR when s= "0001" 
			  WHEN "0010" =>
					ALU_result <= A + B ; 	-- perform addition when s= "0010"
			  WHEN "0100" =>
					ALU_result <= A XOR B ; -- perform bitwise XOR when s="0100"
			  WHEN "0110" =>
					ALU_result <= A - B ; 	-- perform subtraction when s="0110"
			  WHEN "0111" =>
					IF A < B THEN
						ALU_result <= Ones; 	-- perform "Set-On-Less-Than" when s="0111"
					ELSE
						ALU_result <= Zeros;
					END IF;
			  WHEN "1100" =>					-- perform bitwise NOR when s="1100"
					ALU_result <= A NOR B;
			  WHEN OTHERS =>					-- for others cases not defined set result
					ALU_result <= Zeros;		-- to zero (as recommended by Appendix B)
					--Compare <= '0'; 
		END CASE;
	END PROCESS;
	Zero <= '1' WHEN ALU_result=Zeros	-- Zero bit is set when ALU_result is zero
				ELSE '0';						-- Else Zero bit is set low
END Behavior;
