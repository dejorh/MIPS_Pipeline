LIBRARY ieee;							 --Provide compiler with access to Library
USE ieee.std_logic_1164.all;		 --Use all contents from package in ieee Library
USE ieee.std_logic_arith.all;		 --Use all contents from package in ieee Library
USE ieee.std_logic_unsigned.all;	 --Use all contents from package in ieee Library


ENTITY TB_IF_ID_EX IS					--Top-Level Entity Declaration%
GENERIC(N : INTEGER := 32);
END ENTITY TB_IF_ID_EX;

ARCHITECTURE TB_IF_ID_EX_Arch OF TB_IF_ID_EX IS
	SIGNAL En,RegWrite,Reset,ALU_Src		  : STD_LOGIC; --Input Signals
	----- This is the 32-bit bus corresponding to the Instruction -----
	SIGNAL Instruct						     : STD_LOGIC_VECTOR(N-1 DOWNTO 0); 
						-- Read Register address numbers 
	SIGNAL read_register_1,read_register_2: STD_LOGIC_VECTOR(4 DOWNTO 0);
						-- Write Register address numbers
	SIGNAL write_register					  : STD_LOGIC_VECTOR(4 DOWNTO 0);
						-- Data to be written to designated "write" register
	SIGNAL write_data							  : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
						-- Data to be read from read registers
	SIGNAL read_data_1,read_data_2		  : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
						-- Immediate Value for I-Type Instructions
	SIGNAL Immediate_value					  : STD_LOGIC_VECTOR((N/2)-1 DOWNTO 0);
						-- The Sign-Extended value
	SIGNAL Extend_value						  : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL Data, Add_Con					     : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
						-- Input and Output of the PC Register
	SIGNAL PC_i, PC_o						  : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
						-- Select Vector for ALU operations
	SIGNAL ALU_ctrl							  : STD_LOGIC_VECTOR(3 DOWNTO 0);
						-- ALU Output Vector
	SIGNAL ALU_result							  : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
						-- ALU Input Vectors A and B
	SIGNAL A,B									  : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
						-- Zero signal, also an ouput
	SIGNAL Zero									  : STD_LOGIC;
						-- Clock Signal Initialization
	SIGNAL Clock								  : STD_LOGIC	:= '0';
	SIGNAL Simend								  : STD_LOGIC	:= '0';
	
	COMPONENT IFetch_Stage IS					--IFetch entity used as a Component
		PORT (Clock, Reset,En : IN STD_LOGIC;	--Input declaration
			Data       : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			B			  : BUFFER STD_LOGIC_VECTOR(31 DOWNTO 0);-- Constant adder input
			PC_plus4   : BUFFER STD_LOGIC_VECTOR(31 DOWNTO 0); -- PC input
		----- This address corresponds to Instruction-Memory -----
			Curr_Address: OUT STD_LOGIC_VECTOR(31 DOWNTO 0); --Output Vectors
		----- This is the 32-bit bus corresponding to the Instruction -----
			Instruction	: OUT STD_LOGIC_VECTOR(31 DOWNTO 0)); --Output Vectors
	END COMPONENT;
	
	COMPONENT RegisterFile					--Component Declaration
		GENERIC(N	: INTEGER := 32);	-- Constant declaration
		PORT (Clock,RegWrite					 	 :  IN STD_LOGIC; --Input Signals
						--Read Register address numbers 
				read_register_1,read_register_2: IN STD_LOGIC_VECTOR(4 DOWNTO 0);
						--Write Register address numbers
				write_register						 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
						-- Data to be written to designated "write" register
				write_data							 : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
						-- Data to be read from read registers
				read_data_1,read_data_2			 :OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0));
	END COMPONENT;
	
	COMPONENT SignExtend					--Component Declaration
		GENERIC(N	: INTEGER := 16);	-- Constant declaration
					-- Immediate Value for I-Type Instructions
		PORT (Immediate_value	:	IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
					-- The Sign-Extended value
				Extend_value		: OUT STD_LOGIC_VECTOR((2*N)-1 DOWNTO 0));
	END COMPONENT;
	
	COMPONENT alu_1					--Component Declaration
		GENERIC(N  : INTEGER := 32);	-- Constant declaration
		PORT (	s				:  IN     STD_LOGIC_VECTOR(3 DOWNTO 0);--ALU select
						-- The two input words to the ALU
					A,B			:	IN 	 STD_LOGIC_VECTOR(N-1 DOWNTO 0);
						-- ALU output
					ALU_result	:  BUFFER STD_LOGIC_VECTOR(N-1 DOWNTO 0);
						-- Zero signal, also an ouput
					Zero			:  OUT    STD_LOGIC);
	END COMPONENT;
	
	COMPONENT mux_2to1						--Component Declaration
		GENERIC(N	: INTEGER := 32);	-- Constant declaration
		PORT (S		: IN STD_LOGIC;	--select signal
				X0,X1	: IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);--input vector declarations
				Y		: OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0));--output vector declared
	END COMPONENT;
	
BEGIN
	
	IF_0 : IFetch_Stage PORT MAP(Clock,Reset,En,Data,Add_Con,PC_i,PC_o,Instruct);

		
	RegF_0 : RegisterFile PORT MAP(Clock,RegWrite,read_register_1,read_register_2,
								write_register,write_data,read_data_1,read_data_2);
								
	S_Ext_0 : SignExtend PORT MAP(Immediate_value,Extend_value);							
								
	Mux_2_1 : mux_2to1 PORT MAP(ALU_Src,read_data_2,Extend_value,B); 
	
	ALU_0  : alu_1 PORT MAP(ALU_ctrl,A,B,ALU_result,Zero);
				-- Concurrent Assignment of signals and vectors
	Immediate_value <= Instruct((N/2)-1 DOWNTO 0);
	ALU_Src    <= '0'; En <= '0';
	A <= read_data_1;  
	Clk_process: PROCESS
	BEGIN
		WHILE Simend = '0' LOOP	
			Clock <= NOT Clock;
			wait for 50 ns; 
		END LOOP;
		wait;
	END PROCESS;
	
	Test_Process: PROCESS
	BEGIN
		Reset <= '1';			--Reset
		RegWrite <= '0';
		Data <= X"00000000";
		ALU_ctrl <= "1111"; --Just sets ALU to be Zero
		wait for 160 ns;	
		
		--Loading Register 16 or $s0
		RegWrite <= '1';	--Now Allow RegisterFile to perform write-backs
		write_data <= X"00000004";
		write_register <= "10000";  --register 16 or $s0
		wait for 100 ns;
		
		--Loading Register 17 or $s1
		write_register <= "10001";	--register 17 or $s1
		read_register_1 <= "10000";  -- for checking contents of register 16 or $s0
		wait for 100 ns;
		
		--Loading Register 8 or $t0
		write_register <= "01000"; --register 8 or $t0
		write_data <= X"00000002";
		read_register_2 <= "10001"; -- for checking contents of register 17 or $s1
		wait for 100 ns;
		
		--Loading Register 9 or $t1
		write_register <= "01001"; --register 9 or $t1
		write_data <= X"00000003";
		read_register_1 <= "01000"; -- for checking contents of register 8 or $t0
		wait for 100 ns;
		
		--Checking on the contents of register 9 or $t1
		read_register_2 <= "01001";
		wait for 100 ns;
		write_register <= "00000";
		write_data <= X"00000000";
		read_register_2 <= "00000";
		read_register_1 <= "00000";
		Reset <= '0';
		wait for 175 ns;
		ALU_ctrl <= "0010";			--ADD Operation
		write_register <= Instruct(15 DOWNTO 11);
		write_data <= ALU_result;
		read_register_2 <= Instruct(20 DOWNTO 16);
		read_register_1 <= Instruct(25 DOWNTO 21);
		wait for 100 ns;
		write_register <= Instruct(15 DOWNTO 11);
		write_data <= ALU_result;
		read_register_2 <= Instruct(20 DOWNTO 16);
		read_register_1 <= Instruct(25 DOWNTO 21);
		ALU_ctrl <= "0110";	-- Subtract Operation
		wait for 100 ns;
		ALU_ctrl <= "0000";	-- Bitwise AND Operation
		write_register <= Instruct(15 DOWNTO 11);
		write_data <= ALU_result;
		read_register_2 <= Instruct(20 DOWNTO 16);
		read_register_1 <= Instruct(25 DOWNTO 21);
		wait for 400 ns;
		Simend <= '1';			-- signal to stop toggling clock
		wait;
	END PROCESS;
END TB_IF_ID_EX_Arch;