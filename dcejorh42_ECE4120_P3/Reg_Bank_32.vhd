LIBRARY ieee;						--Provide compiler with access to Librar
USE ieee.std_logic_1164.all;	--Use all contents from package in ieee Library
USE work.Reg32en_package.all;	--Use all contents from package in work Library
USE work.proctypes_package.all;

ENTITY Reg_Bank_32 IS
GENERIC(N	: INTEGER := 32);			-- Constant declaration
	PORT (Clock,Reset						:	IN STD_LOGIC;	--Input declaration
					--Input Vector Declarations
			E									:	IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			Data								:	IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
					-- Ouput Vector Declarations for the 32, 32-bit Registers
			Q									: OUT T_SLVV_N);
		--	Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q8	: OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		--	Q9,Q10,Q11,Q12,Q13,Q14,Q15	: OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		--	Q16,Q17,Q18,Q19,Q20,Q21,Q22: OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		--	Q23,Q24,Q25,Q26,Q27,Q28,Q29: OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		--	Q30,Q31							: OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0));
END Reg_Bank_32;

ARCHITECTURE Structure OF Reg_Bank_32 IS
BEGIN 
		-- Used Port MApping to Instantiate 32, 32-bit Registers
	REG0	  : Reg32en PORT MAP(E(0),Clock,'1',Data,Q(0));	 
	GEN_REGS: FOR i IN 1 TO (N-1) GENERATE
		 REGS: Reg32en PORT MAP(E(i),Clock,Reset,Data,Q(i));
	END GENERATE GEN_REGS;	 
-- REG0	: Reg32en PORT MAP(E(0),Clock,'1',Data,Q0); 
--	REG1	: Reg32en PORT MAP(E(1),Clock,Reset,Data,Q1);  
--	REG2	: Reg32en PORT MAP(E(2),Clock,Reset,Data,Q2); 
--	REG3	: Reg32en PORT MAP(E(3),Clock,Reset,Data,Q3); 
--	REG4	: Reg32en PORT MAP(E(4),Clock,Reset,Data,Q4);  
--	REG5	: Reg32en PORT MAP(E(5),Clock,Reset,Data,Q5);
--	REG6	: Reg32en PORT MAP(E(6),Clock,Reset,Data,Q6); 
--	REG7	: Reg32en PORT MAP(E(7),Clock,Reset,Data,Q7);  
--	REG8	: Reg32en PORT MAP(E(8),Clock,Reset,Data,Q8);
--	REG9	: Reg32en PORT MAP(E(9),Clock,Reset,Data,Q9); 
--	REG10	: Reg32en PORT MAP(E(10),Clock,Reset,Data,Q10);  
--	REG11	: Reg32en PORT MAP(E(11),Clock,Reset,Data,Q11); 
--	REG12	: Reg32en PORT MAP(E(12),Clock,Reset,Data,Q12); 
--	REG13	: Reg32en PORT MAP(E(13),Clock,Reset,Data,Q13);  
--	REG14	: Reg32en PORT MAP(E(14),Clock,Reset,Data,Q14);
--	REG15	: Reg32en PORT MAP(E(15),Clock,Reset,Data,Q15); 
--	REG16	: Reg32en PORT MAP(E(16),Clock,Reset,Data,Q16);  
--	REG17	: Reg32en PORT MAP(E(17),Clock,Reset,Data,Q17);
--	REG18	: Reg32en PORT MAP(E(18),Clock,Reset,Data,Q18);  
--	REG19	: Reg32en PORT MAP(E(19),Clock,Reset,Data,Q19); 
--	REG20	: Reg32en PORT MAP(E(20),Clock,Reset,Data,Q20); 
--	REG21	: Reg32en PORT MAP(E(21),Clock,Reset,Data,Q21);  
--	REG22	: Reg32en PORT MAP(E(22),Clock,Reset,Data,Q22);
--	REG23	: Reg32en PORT MAP(E(23),Clock,Reset,Data,Q23); 
--	REG24	: Reg32en PORT MAP(E(24),Clock,Reset,Data,Q24);  
--	REG25	: Reg32en PORT MAP(E(25),Clock,Reset,Data,Q25);
--	REG26	: Reg32en PORT MAP(E(26),Clock,Reset,Data,Q26);  
--	REG27	: Reg32en PORT MAP(E(27),Clock,Reset,Data,Q27); 
--	REG28	: Reg32en PORT MAP(E(28),Clock,Reset,Data,Q28); 
--	REG29	: Reg32en PORT MAP(E(29),Clock,Reset,Data,Q29);  
--	REG30	: Reg32en PORT MAP(E(30),Clock,Reset,Data,Q30);
--	REG31	: Reg32en PORT MAP(E(31),Clock,Reset,Data,Q31);
	--Structural Implementation
END Structure;	