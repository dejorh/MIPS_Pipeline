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
-- Generated on "03/01/2018 02:57:00"
                                                             
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
	En <= '0';
WAIT;
END PROCESS t_prcs_En;

-- Reset
t_prcs_Reset: PROCESS
BEGIN
	Reset <= '1';
	WAIT FOR 120000 ps;
	Reset <= '0';
WAIT;
END PROCESS t_prcs_Reset;
END IFetch_Stage_arch;
