-- Copyright (C) 2017  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "03/01/2018 11:37:39"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          IFetch_Stage
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY IFetch_Stage_vhd_vec_tst IS
END IFetch_Stage_vhd_vec_tst;
ARCHITECTURE IFetch_Stage_arch OF IFetch_Stage_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL Clock : STD_LOGIC;
SIGNAL Curr_Address : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL Data : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL En : STD_LOGIC;
SIGNAL Instruction : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL Reset : STD_LOGIC;
COMPONENT IFetch_Stage
	PORT (
	Clock : IN STD_LOGIC;
	Curr_Address : BUFFER STD_LOGIC_VECTOR(31 DOWNTO 0);
	Data : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	En : IN STD_LOGIC;
	Instruction : BUFFER STD_LOGIC_VECTOR(31 DOWNTO 0);
	Reset : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : IFetch_Stage
	PORT MAP (
-- list connections between master ports and signals
	Clock => Clock,
	Curr_Address => Curr_Address,
	Data => Data,
	En => En,
	Instruction => Instruction,
	Reset => Reset
	);

-- Clock
t_prcs_Clock: PROCESS
BEGIN
LOOP
	Clock <= '0';
	WAIT FOR 50000 ps;
	Clock <= '1';
	WAIT FOR 50000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_Clock;

-- En
t_prcs_En: PROCESS
BEGIN
	En <= '1';
	WAIT FOR 120000 ps;
	En <= '0';
	WAIT FOR 100000 ps;
	En <= '1';
	WAIT FOR 100000 ps;
	En <= '0';
WAIT;
END PROCESS t_prcs_En;

-- Reset
t_prcs_Reset: PROCESS
BEGIN
	Reset <= '1';
	WAIT FOR 140000 ps;
	Reset <= '0';
WAIT;
END PROCESS t_prcs_Reset;
-- Data[31]
t_prcs_Data_31: PROCESS
BEGIN
	Data(31) <= '0';
WAIT;
END PROCESS t_prcs_Data_31;
-- Data[30]
t_prcs_Data_30: PROCESS
BEGIN
	Data(30) <= '0';
WAIT;
END PROCESS t_prcs_Data_30;
-- Data[29]
t_prcs_Data_29: PROCESS
BEGIN
	Data(29) <= '0';
WAIT;
END PROCESS t_prcs_Data_29;
-- Data[28]
t_prcs_Data_28: PROCESS
BEGIN
	Data(28) <= '1';
WAIT;
END PROCESS t_prcs_Data_28;
-- Data[27]
t_prcs_Data_27: PROCESS
BEGIN
	Data(27) <= '0';
WAIT;
END PROCESS t_prcs_Data_27;
-- Data[26]
t_prcs_Data_26: PROCESS
BEGIN
	Data(26) <= '0';
WAIT;
END PROCESS t_prcs_Data_26;
-- Data[25]
t_prcs_Data_25: PROCESS
BEGIN
	Data(25) <= '0';
WAIT;
END PROCESS t_prcs_Data_25;
-- Data[24]
t_prcs_Data_24: PROCESS
BEGIN
	Data(24) <= '0';
WAIT;
END PROCESS t_prcs_Data_24;
-- Data[23]
t_prcs_Data_23: PROCESS
BEGIN
	Data(23) <= '0';
WAIT;
END PROCESS t_prcs_Data_23;
-- Data[22]
t_prcs_Data_22: PROCESS
BEGIN
	Data(22) <= '0';
WAIT;
END PROCESS t_prcs_Data_22;
-- Data[21]
t_prcs_Data_21: PROCESS
BEGIN
	Data(21) <= '1';
WAIT;
END PROCESS t_prcs_Data_21;
-- Data[20]
t_prcs_Data_20: PROCESS
BEGIN
	Data(20) <= '0';
WAIT;
END PROCESS t_prcs_Data_20;
-- Data[19]
t_prcs_Data_19: PROCESS
BEGIN
	Data(19) <= '0';
WAIT;
END PROCESS t_prcs_Data_19;
-- Data[18]
t_prcs_Data_18: PROCESS
BEGIN
	Data(18) <= '0';
WAIT;
END PROCESS t_prcs_Data_18;
-- Data[17]
t_prcs_Data_17: PROCESS
BEGIN
	Data(17) <= '1';
WAIT;
END PROCESS t_prcs_Data_17;
-- Data[16]
t_prcs_Data_16: PROCESS
BEGIN
	Data(16) <= '0';
WAIT;
END PROCESS t_prcs_Data_16;
-- Data[15]
t_prcs_Data_15: PROCESS
BEGIN
	Data(15) <= '1';
WAIT;
END PROCESS t_prcs_Data_15;
-- Data[14]
t_prcs_Data_14: PROCESS
BEGIN
	Data(14) <= '1';
WAIT;
END PROCESS t_prcs_Data_14;
-- Data[13]
t_prcs_Data_13: PROCESS
BEGIN
	Data(13) <= '1';
WAIT;
END PROCESS t_prcs_Data_13;
-- Data[12]
t_prcs_Data_12: PROCESS
BEGIN
	Data(12) <= '1';
WAIT;
END PROCESS t_prcs_Data_12;
-- Data[11]
t_prcs_Data_11: PROCESS
BEGIN
	Data(11) <= '1';
WAIT;
END PROCESS t_prcs_Data_11;
-- Data[10]
t_prcs_Data_10: PROCESS
BEGIN
	Data(10) <= '1';
WAIT;
END PROCESS t_prcs_Data_10;
-- Data[9]
t_prcs_Data_9: PROCESS
BEGIN
	Data(9) <= '1';
WAIT;
END PROCESS t_prcs_Data_9;
-- Data[8]
t_prcs_Data_8: PROCESS
BEGIN
	Data(8) <= '1';
WAIT;
END PROCESS t_prcs_Data_8;
-- Data[7]
t_prcs_Data_7: PROCESS
BEGIN
	Data(7) <= '1';
WAIT;
END PROCESS t_prcs_Data_7;
-- Data[6]
t_prcs_Data_6: PROCESS
BEGIN
	Data(6) <= '1';
WAIT;
END PROCESS t_prcs_Data_6;
-- Data[5]
t_prcs_Data_5: PROCESS
BEGIN
	Data(5) <= '1';
WAIT;
END PROCESS t_prcs_Data_5;
-- Data[4]
t_prcs_Data_4: PROCESS
BEGIN
	Data(4) <= '1';
WAIT;
END PROCESS t_prcs_Data_4;
-- Data[3]
t_prcs_Data_3: PROCESS
BEGIN
	Data(3) <= '1';
WAIT;
END PROCESS t_prcs_Data_3;
-- Data[2]
t_prcs_Data_2: PROCESS
BEGIN
	Data(2) <= '1';
WAIT;
END PROCESS t_prcs_Data_2;
-- Data[1]
t_prcs_Data_1: PROCESS
BEGIN
	Data(1) <= '1';
WAIT;
END PROCESS t_prcs_Data_1;
-- Data[0]
t_prcs_Data_0: PROCESS
BEGIN
	Data(0) <= '1';
WAIT;
END PROCESS t_prcs_Data_0;
END IFetch_Stage_arch;
