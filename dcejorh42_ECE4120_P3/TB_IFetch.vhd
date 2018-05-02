LIBRARY ieee;							--Provide compiler with access to Library
USE ieee.std_logic_1164.all;		--Use all contents from package in ieee Library

ENTITY TB_IFetch IS								--Top-Level Entity Declaration%
END ENTITY TB_IFetch;

ARCHITECTURE TB_IFetch_Arch OF TB_IFetch IS
	--TestBench Signal declaration -for some EntityInputs
	SIGNAL En, Reset : STD_LOGIC;
	SIGNAL Data, Address, Add_Cons,Instruction : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL PC_in, PC_out		: STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL Clock : STD_LOGIC := '0';	--TestBench Signal initialization for Clock
	SIGNAL Simend	: STD_LOGIC := '0';
	
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
BEGIN
	-- Port Mappings for the Fetch Stage
	TB_IF: IFetch_Stage PORT MAP(Clock,Reset,En,Data,Add_Cons,PC_in,Address,Instruction);
	PC_out <= Address;
	Clock_Process: PROCESS
	BEGIN
		WHILE Simend = '0' LOOP	
			Clock <= NOT Clock;
			wait for 50 ns; 
		END LOOP;
		wait;
	END PROCESS;
		
	Testing_Process: PROCESS
	BEGIN
		Data <= X"1022FFFF"; -- The Loaded Data (only using one)
		En  <= '1';				-- Wren == '1' Meaning write to Memory/Load
		Reset <= '1';			--Reset
		wait for 90 ns;
		En <= '0';				-- After 90ns Begin to read from Memory 
		wait for 90 ns;		-- Reset still high so this is address 0/ where data was
									--written to
		Reset <= '0';			--After 180 ns Reset goes low and begin incrementing PC
		En <= '1';				--Now Reset is Low & PC can increment, expect to write to
									-- higher word position/address in memory other than 0.
		wait for 100 ns;
		En <= '0';				-- Begin reading again after 2 clock cycles
		wait for 700 ns;
		
		Simend <= '1';			-- signal to stop toggling clock
		wait;
	END PROCESS;
END ARCHITECTURE TB_IFetch_Arch;