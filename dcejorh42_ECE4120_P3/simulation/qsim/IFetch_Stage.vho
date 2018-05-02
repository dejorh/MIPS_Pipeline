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

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 17.1.0 Build 590 10/25/2017 SJ Lite Edition"

-- DATE "03/01/2018 11:37:41"

-- 
-- Device: Altera 10M50DAF484C7G Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY FIFTYFIVENM;
LIBRARY IEEE;
USE FIFTYFIVENM.FIFTYFIVENM_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	hard_block IS
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic
	);
END hard_block;

-- Design Ports Information
-- ~ALTERA_TMS~	=>  Location: PIN_H2,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_TCK~	=>  Location: PIN_G2,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_TDI~	=>  Location: PIN_L4,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_TDO~	=>  Location: PIN_M5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_CONFIG_SEL~	=>  Location: PIN_H10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_nCONFIG~	=>  Location: PIN_H9,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_nSTATUS~	=>  Location: PIN_G9,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_CONF_DONE~	=>  Location: PIN_F8,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default


ARCHITECTURE structure OF hard_block IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL \~ALTERA_TMS~~padout\ : std_logic;
SIGNAL \~ALTERA_TCK~~padout\ : std_logic;
SIGNAL \~ALTERA_TDI~~padout\ : std_logic;
SIGNAL \~ALTERA_CONFIG_SEL~~padout\ : std_logic;
SIGNAL \~ALTERA_nCONFIG~~padout\ : std_logic;
SIGNAL \~ALTERA_nSTATUS~~padout\ : std_logic;
SIGNAL \~ALTERA_CONF_DONE~~padout\ : std_logic;
SIGNAL \~ALTERA_TMS~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_TCK~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_TDI~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_CONFIG_SEL~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_nCONFIG~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_nSTATUS~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_CONF_DONE~~ibuf_o\ : std_logic;

BEGIN

ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
END structure;


LIBRARY ALTERA;
LIBRARY FIFTYFIVENM;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE FIFTYFIVENM.FIFTYFIVENM_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	IFetch_Stage IS
    PORT (
	Clock : IN std_logic;
	Reset : IN std_logic;
	En : IN std_logic;
	Data : IN std_logic_vector(31 DOWNTO 0);
	Curr_Address : BUFFER std_logic_vector(31 DOWNTO 0);
	Instruction : BUFFER std_logic_vector(31 DOWNTO 0)
	);
END IFetch_Stage;

-- Design Ports Information
-- Curr_Address[0]	=>  Location: PIN_AB12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Curr_Address[1]	=>  Location: PIN_AB13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Curr_Address[2]	=>  Location: PIN_W12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Curr_Address[3]	=>  Location: PIN_V13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Curr_Address[4]	=>  Location: PIN_AB14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Curr_Address[5]	=>  Location: PIN_AA11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Curr_Address[6]	=>  Location: PIN_AA13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Curr_Address[7]	=>  Location: PIN_W13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Curr_Address[8]	=>  Location: PIN_R13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Curr_Address[9]	=>  Location: PIN_AA14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Curr_Address[10]	=>  Location: PIN_W16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Curr_Address[11]	=>  Location: PIN_AA19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Curr_Address[12]	=>  Location: PIN_AA17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Curr_Address[13]	=>  Location: PIN_W14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Curr_Address[14]	=>  Location: PIN_Y18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Curr_Address[15]	=>  Location: PIN_V15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Curr_Address[16]	=>  Location: PIN_U15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Curr_Address[17]	=>  Location: PIN_V14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Curr_Address[18]	=>  Location: PIN_Y14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Curr_Address[19]	=>  Location: PIN_AB20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Curr_Address[20]	=>  Location: PIN_Y16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Curr_Address[21]	=>  Location: PIN_AB16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Curr_Address[22]	=>  Location: PIN_AB15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Curr_Address[23]	=>  Location: PIN_Y19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Curr_Address[24]	=>  Location: PIN_P13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Curr_Address[25]	=>  Location: PIN_Y13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Curr_Address[26]	=>  Location: PIN_AB19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Curr_Address[27]	=>  Location: PIN_AA15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Curr_Address[28]	=>  Location: PIN_AA16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Curr_Address[29]	=>  Location: PIN_Y17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Curr_Address[30]	=>  Location: PIN_W15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Curr_Address[31]	=>  Location: PIN_V16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Instruction[0]	=>  Location: PIN_W4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Instruction[1]	=>  Location: PIN_Y8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Instruction[2]	=>  Location: PIN_AB2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Instruction[3]	=>  Location: PIN_Y2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Instruction[4]	=>  Location: PIN_U7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Instruction[5]	=>  Location: PIN_U6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Instruction[6]	=>  Location: PIN_AA12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Instruction[7]	=>  Location: PIN_AA7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Instruction[8]	=>  Location: PIN_Y7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Instruction[9]	=>  Location: PIN_AB7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Instruction[10]	=>  Location: PIN_AB8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Instruction[11]	=>  Location: PIN_A5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Instruction[12]	=>  Location: PIN_W9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Instruction[13]	=>  Location: PIN_W8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Instruction[14]	=>  Location: PIN_AB3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Instruction[15]	=>  Location: PIN_AA9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Instruction[16]	=>  Location: PIN_P10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Instruction[17]	=>  Location: PIN_W3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Instruction[18]	=>  Location: PIN_AB6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Instruction[19]	=>  Location: PIN_W7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Instruction[20]	=>  Location: PIN_P11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Instruction[21]	=>  Location: PIN_D8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Instruction[22]	=>  Location: PIN_R11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Instruction[23]	=>  Location: PIN_Y5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Instruction[24]	=>  Location: PIN_D9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Instruction[25]	=>  Location: PIN_Y4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Instruction[26]	=>  Location: PIN_AA8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Instruction[27]	=>  Location: PIN_V8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Instruction[28]	=>  Location: PIN_V11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Instruction[29]	=>  Location: PIN_V12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Instruction[30]	=>  Location: PIN_R10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Instruction[31]	=>  Location: PIN_B7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Clock	=>  Location: PIN_M8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Reset	=>  Location: PIN_M9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- En	=>  Location: PIN_AB9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data[0]	=>  Location: PIN_P12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data[1]	=>  Location: PIN_R12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data[2]	=>  Location: PIN_W6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data[3]	=>  Location: PIN_AA10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data[4]	=>  Location: PIN_AB10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data[5]	=>  Location: PIN_A6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data[6]	=>  Location: PIN_V7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data[7]	=>  Location: PIN_AA5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data[8]	=>  Location: PIN_W10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data[9]	=>  Location: PIN_Y1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data[10]	=>  Location: PIN_AA3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data[11]	=>  Location: PIN_AB11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data[12]	=>  Location: PIN_C8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data[13]	=>  Location: PIN_J10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data[14]	=>  Location: PIN_W11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data[15]	=>  Location: PIN_A4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data[16]	=>  Location: PIN_Y6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data[17]	=>  Location: PIN_H11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data[18]	=>  Location: PIN_Y3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data[19]	=>  Location: PIN_D10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data[20]	=>  Location: PIN_AB4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data[21]	=>  Location: PIN_AA2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data[22]	=>  Location: PIN_Y10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data[23]	=>  Location: PIN_Y11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data[24]	=>  Location: PIN_C7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data[25]	=>  Location: PIN_R9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data[26]	=>  Location: PIN_AA1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data[27]	=>  Location: PIN_V10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data[28]	=>  Location: PIN_P9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data[29]	=>  Location: PIN_AB5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data[30]	=>  Location: PIN_AA6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data[31]	=>  Location: PIN_V9,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF IFetch_Stage IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_Clock : std_logic;
SIGNAL ww_Reset : std_logic;
SIGNAL ww_En : std_logic;
SIGNAL ww_Data : std_logic_vector(31 DOWNTO 0);
SIGNAL ww_Curr_Address : std_logic_vector(31 DOWNTO 0);
SIGNAL ww_Instruction : std_logic_vector(31 DOWNTO 0);
SIGNAL \Memory_Stage|altsyncram_component|auto_generated|ram_block1a0_PORTADATAIN_bus\ : std_logic_vector(17 DOWNTO 0);
SIGNAL \Memory_Stage|altsyncram_component|auto_generated|ram_block1a0_PORTAADDR_bus\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \Memory_Stage|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\ : std_logic_vector(17 DOWNTO 0);
SIGNAL \Memory_Stage|altsyncram_component|auto_generated|ram_block1a14_PORTADATAIN_bus\ : std_logic_vector(17 DOWNTO 0);
SIGNAL \Memory_Stage|altsyncram_component|auto_generated|ram_block1a14_PORTAADDR_bus\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \Memory_Stage|altsyncram_component|auto_generated|ram_block1a14_PORTADATAOUT_bus\ : std_logic_vector(17 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_ADC1~_CHSEL_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_ADC2~_CHSEL_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \Reset~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \Clock~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \~QUARTUS_CREATED_UNVM~~busy\ : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC1~~eoc\ : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC2~~eoc\ : std_logic;
SIGNAL \Curr_Address[0]~output_o\ : std_logic;
SIGNAL \Curr_Address[1]~output_o\ : std_logic;
SIGNAL \Curr_Address[2]~output_o\ : std_logic;
SIGNAL \Curr_Address[3]~output_o\ : std_logic;
SIGNAL \Curr_Address[4]~output_o\ : std_logic;
SIGNAL \Curr_Address[5]~output_o\ : std_logic;
SIGNAL \Curr_Address[6]~output_o\ : std_logic;
SIGNAL \Curr_Address[7]~output_o\ : std_logic;
SIGNAL \Curr_Address[8]~output_o\ : std_logic;
SIGNAL \Curr_Address[9]~output_o\ : std_logic;
SIGNAL \Curr_Address[10]~output_o\ : std_logic;
SIGNAL \Curr_Address[11]~output_o\ : std_logic;
SIGNAL \Curr_Address[12]~output_o\ : std_logic;
SIGNAL \Curr_Address[13]~output_o\ : std_logic;
SIGNAL \Curr_Address[14]~output_o\ : std_logic;
SIGNAL \Curr_Address[15]~output_o\ : std_logic;
SIGNAL \Curr_Address[16]~output_o\ : std_logic;
SIGNAL \Curr_Address[17]~output_o\ : std_logic;
SIGNAL \Curr_Address[18]~output_o\ : std_logic;
SIGNAL \Curr_Address[19]~output_o\ : std_logic;
SIGNAL \Curr_Address[20]~output_o\ : std_logic;
SIGNAL \Curr_Address[21]~output_o\ : std_logic;
SIGNAL \Curr_Address[22]~output_o\ : std_logic;
SIGNAL \Curr_Address[23]~output_o\ : std_logic;
SIGNAL \Curr_Address[24]~output_o\ : std_logic;
SIGNAL \Curr_Address[25]~output_o\ : std_logic;
SIGNAL \Curr_Address[26]~output_o\ : std_logic;
SIGNAL \Curr_Address[27]~output_o\ : std_logic;
SIGNAL \Curr_Address[28]~output_o\ : std_logic;
SIGNAL \Curr_Address[29]~output_o\ : std_logic;
SIGNAL \Curr_Address[30]~output_o\ : std_logic;
SIGNAL \Curr_Address[31]~output_o\ : std_logic;
SIGNAL \Instruction[0]~output_o\ : std_logic;
SIGNAL \Instruction[1]~output_o\ : std_logic;
SIGNAL \Instruction[2]~output_o\ : std_logic;
SIGNAL \Instruction[3]~output_o\ : std_logic;
SIGNAL \Instruction[4]~output_o\ : std_logic;
SIGNAL \Instruction[5]~output_o\ : std_logic;
SIGNAL \Instruction[6]~output_o\ : std_logic;
SIGNAL \Instruction[7]~output_o\ : std_logic;
SIGNAL \Instruction[8]~output_o\ : std_logic;
SIGNAL \Instruction[9]~output_o\ : std_logic;
SIGNAL \Instruction[10]~output_o\ : std_logic;
SIGNAL \Instruction[11]~output_o\ : std_logic;
SIGNAL \Instruction[12]~output_o\ : std_logic;
SIGNAL \Instruction[13]~output_o\ : std_logic;
SIGNAL \Instruction[14]~output_o\ : std_logic;
SIGNAL \Instruction[15]~output_o\ : std_logic;
SIGNAL \Instruction[16]~output_o\ : std_logic;
SIGNAL \Instruction[17]~output_o\ : std_logic;
SIGNAL \Instruction[18]~output_o\ : std_logic;
SIGNAL \Instruction[19]~output_o\ : std_logic;
SIGNAL \Instruction[20]~output_o\ : std_logic;
SIGNAL \Instruction[21]~output_o\ : std_logic;
SIGNAL \Instruction[22]~output_o\ : std_logic;
SIGNAL \Instruction[23]~output_o\ : std_logic;
SIGNAL \Instruction[24]~output_o\ : std_logic;
SIGNAL \Instruction[25]~output_o\ : std_logic;
SIGNAL \Instruction[26]~output_o\ : std_logic;
SIGNAL \Instruction[27]~output_o\ : std_logic;
SIGNAL \Instruction[28]~output_o\ : std_logic;
SIGNAL \Instruction[29]~output_o\ : std_logic;
SIGNAL \Instruction[30]~output_o\ : std_logic;
SIGNAL \Instruction[31]~output_o\ : std_logic;
SIGNAL \Clock~input_o\ : std_logic;
SIGNAL \Clock~inputclkctrl_outclk\ : std_logic;
SIGNAL \PC_Stage|PC_out[0]~93_combout\ : std_logic;
SIGNAL \Reset~input_o\ : std_logic;
SIGNAL \Reset~inputclkctrl_outclk\ : std_logic;
SIGNAL \PC_Stage|PC_out[1]~31_combout\ : std_logic;
SIGNAL \PC_Stage|PC_out[1]~32\ : std_logic;
SIGNAL \PC_Stage|PC_out[2]~33_combout\ : std_logic;
SIGNAL \PC_Stage|PC_out[2]~34\ : std_logic;
SIGNAL \PC_Stage|PC_out[3]~35_combout\ : std_logic;
SIGNAL \PC_Stage|PC_out[3]~36\ : std_logic;
SIGNAL \PC_Stage|PC_out[4]~37_combout\ : std_logic;
SIGNAL \PC_Stage|PC_out[4]~38\ : std_logic;
SIGNAL \PC_Stage|PC_out[5]~39_combout\ : std_logic;
SIGNAL \PC_Stage|PC_out[5]~40\ : std_logic;
SIGNAL \PC_Stage|PC_out[6]~41_combout\ : std_logic;
SIGNAL \PC_Stage|PC_out[6]~42\ : std_logic;
SIGNAL \PC_Stage|PC_out[7]~43_combout\ : std_logic;
SIGNAL \PC_Stage|PC_out[7]~44\ : std_logic;
SIGNAL \PC_Stage|PC_out[8]~45_combout\ : std_logic;
SIGNAL \PC_Stage|PC_out[8]~46\ : std_logic;
SIGNAL \PC_Stage|PC_out[9]~47_combout\ : std_logic;
SIGNAL \PC_Stage|PC_out[9]~48\ : std_logic;
SIGNAL \PC_Stage|PC_out[10]~49_combout\ : std_logic;
SIGNAL \PC_Stage|PC_out[10]~50\ : std_logic;
SIGNAL \PC_Stage|PC_out[11]~51_combout\ : std_logic;
SIGNAL \PC_Stage|PC_out[11]~52\ : std_logic;
SIGNAL \PC_Stage|PC_out[12]~53_combout\ : std_logic;
SIGNAL \PC_Stage|PC_out[12]~54\ : std_logic;
SIGNAL \PC_Stage|PC_out[13]~55_combout\ : std_logic;
SIGNAL \PC_Stage|PC_out[13]~56\ : std_logic;
SIGNAL \PC_Stage|PC_out[14]~57_combout\ : std_logic;
SIGNAL \PC_Stage|PC_out[14]~58\ : std_logic;
SIGNAL \PC_Stage|PC_out[15]~59_combout\ : std_logic;
SIGNAL \PC_Stage|PC_out[15]~60\ : std_logic;
SIGNAL \PC_Stage|PC_out[16]~61_combout\ : std_logic;
SIGNAL \PC_Stage|PC_out[16]~62\ : std_logic;
SIGNAL \PC_Stage|PC_out[17]~63_combout\ : std_logic;
SIGNAL \PC_Stage|PC_out[17]~64\ : std_logic;
SIGNAL \PC_Stage|PC_out[18]~65_combout\ : std_logic;
SIGNAL \PC_Stage|PC_out[18]~66\ : std_logic;
SIGNAL \PC_Stage|PC_out[19]~67_combout\ : std_logic;
SIGNAL \PC_Stage|PC_out[19]~68\ : std_logic;
SIGNAL \PC_Stage|PC_out[20]~69_combout\ : std_logic;
SIGNAL \PC_Stage|PC_out[20]~70\ : std_logic;
SIGNAL \PC_Stage|PC_out[21]~71_combout\ : std_logic;
SIGNAL \PC_Stage|PC_out[21]~72\ : std_logic;
SIGNAL \PC_Stage|PC_out[22]~73_combout\ : std_logic;
SIGNAL \PC_Stage|PC_out[22]~74\ : std_logic;
SIGNAL \PC_Stage|PC_out[23]~75_combout\ : std_logic;
SIGNAL \PC_Stage|PC_out[23]~76\ : std_logic;
SIGNAL \PC_Stage|PC_out[24]~77_combout\ : std_logic;
SIGNAL \PC_Stage|PC_out[24]~78\ : std_logic;
SIGNAL \PC_Stage|PC_out[25]~79_combout\ : std_logic;
SIGNAL \PC_Stage|PC_out[25]~80\ : std_logic;
SIGNAL \PC_Stage|PC_out[26]~81_combout\ : std_logic;
SIGNAL \PC_Stage|PC_out[26]~82\ : std_logic;
SIGNAL \PC_Stage|PC_out[27]~83_combout\ : std_logic;
SIGNAL \PC_Stage|PC_out[27]~84\ : std_logic;
SIGNAL \PC_Stage|PC_out[28]~85_combout\ : std_logic;
SIGNAL \PC_Stage|PC_out[28]~86\ : std_logic;
SIGNAL \PC_Stage|PC_out[29]~87_combout\ : std_logic;
SIGNAL \PC_Stage|PC_out[29]~88\ : std_logic;
SIGNAL \PC_Stage|PC_out[30]~89_combout\ : std_logic;
SIGNAL \PC_Stage|PC_out[30]~90\ : std_logic;
SIGNAL \PC_Stage|PC_out[31]~91_combout\ : std_logic;
SIGNAL \En~input_o\ : std_logic;
SIGNAL \Data[0]~input_o\ : std_logic;
SIGNAL \Data[1]~input_o\ : std_logic;
SIGNAL \Data[2]~input_o\ : std_logic;
SIGNAL \Data[3]~input_o\ : std_logic;
SIGNAL \Data[4]~input_o\ : std_logic;
SIGNAL \Data[5]~input_o\ : std_logic;
SIGNAL \Data[6]~input_o\ : std_logic;
SIGNAL \Data[7]~input_o\ : std_logic;
SIGNAL \Data[8]~input_o\ : std_logic;
SIGNAL \Data[9]~input_o\ : std_logic;
SIGNAL \Data[10]~input_o\ : std_logic;
SIGNAL \Data[11]~input_o\ : std_logic;
SIGNAL \Data[12]~input_o\ : std_logic;
SIGNAL \Data[13]~input_o\ : std_logic;
SIGNAL \Data[14]~input_o\ : std_logic;
SIGNAL \Data[15]~input_o\ : std_logic;
SIGNAL \Data[16]~input_o\ : std_logic;
SIGNAL \Data[17]~input_o\ : std_logic;
SIGNAL \Data[18]~input_o\ : std_logic;
SIGNAL \Data[19]~input_o\ : std_logic;
SIGNAL \Data[20]~input_o\ : std_logic;
SIGNAL \Data[21]~input_o\ : std_logic;
SIGNAL \Data[22]~input_o\ : std_logic;
SIGNAL \Data[23]~input_o\ : std_logic;
SIGNAL \Data[24]~input_o\ : std_logic;
SIGNAL \Data[25]~input_o\ : std_logic;
SIGNAL \Data[26]~input_o\ : std_logic;
SIGNAL \Data[27]~input_o\ : std_logic;
SIGNAL \Data[28]~input_o\ : std_logic;
SIGNAL \Data[29]~input_o\ : std_logic;
SIGNAL \Data[30]~input_o\ : std_logic;
SIGNAL \Data[31]~input_o\ : std_logic;
SIGNAL \Memory_Stage|altsyncram_component|auto_generated|q_a\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \PC_Stage|PC_out\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \ALT_INV_Reset~inputclkctrl_outclk\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_Clock <= Clock;
ww_Reset <= Reset;
ww_En <= En;
ww_Data <= Data;
Curr_Address <= ww_Curr_Address;
Instruction <= ww_Instruction;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\Memory_Stage|altsyncram_component|auto_generated|ram_block1a0_PORTADATAIN_bus\ <= (gnd & gnd & gnd & gnd & \Data[13]~input_o\ & \Data[12]~input_o\ & \Data[11]~input_o\ & \Data[10]~input_o\ & \Data[9]~input_o\ & \Data[8]~input_o\ & \Data[7]~input_o\ & 
\Data[6]~input_o\ & \Data[5]~input_o\ & \Data[4]~input_o\ & \Data[3]~input_o\ & \Data[2]~input_o\ & \Data[1]~input_o\ & \Data[0]~input_o\);

\Memory_Stage|altsyncram_component|auto_generated|ram_block1a0_PORTAADDR_bus\ <= (\PC_Stage|PC_out\(7) & \PC_Stage|PC_out\(6) & \PC_Stage|PC_out\(5) & \PC_Stage|PC_out\(4) & \PC_Stage|PC_out\(3) & \PC_Stage|PC_out\(2) & \PC_Stage|PC_out\(1)
& \PC_Stage|PC_out\(0));

\Memory_Stage|altsyncram_component|auto_generated|q_a\(0) <= \Memory_Stage|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(0);
\Memory_Stage|altsyncram_component|auto_generated|q_a\(1) <= \Memory_Stage|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(1);
\Memory_Stage|altsyncram_component|auto_generated|q_a\(2) <= \Memory_Stage|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(2);
\Memory_Stage|altsyncram_component|auto_generated|q_a\(3) <= \Memory_Stage|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(3);
\Memory_Stage|altsyncram_component|auto_generated|q_a\(4) <= \Memory_Stage|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(4);
\Memory_Stage|altsyncram_component|auto_generated|q_a\(5) <= \Memory_Stage|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(5);
\Memory_Stage|altsyncram_component|auto_generated|q_a\(6) <= \Memory_Stage|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(6);
\Memory_Stage|altsyncram_component|auto_generated|q_a\(7) <= \Memory_Stage|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(7);
\Memory_Stage|altsyncram_component|auto_generated|q_a\(8) <= \Memory_Stage|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(8);
\Memory_Stage|altsyncram_component|auto_generated|q_a\(9) <= \Memory_Stage|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(9);
\Memory_Stage|altsyncram_component|auto_generated|q_a\(10) <= \Memory_Stage|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(10);
\Memory_Stage|altsyncram_component|auto_generated|q_a\(11) <= \Memory_Stage|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(11);
\Memory_Stage|altsyncram_component|auto_generated|q_a\(12) <= \Memory_Stage|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(12);
\Memory_Stage|altsyncram_component|auto_generated|q_a\(13) <= \Memory_Stage|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(13);

\Memory_Stage|altsyncram_component|auto_generated|ram_block1a14_PORTADATAIN_bus\ <= (\Data[31]~input_o\ & \Data[30]~input_o\ & \Data[29]~input_o\ & \Data[28]~input_o\ & \Data[27]~input_o\ & \Data[26]~input_o\ & \Data[25]~input_o\ & \Data[24]~input_o\ & 
\Data[23]~input_o\ & \Data[22]~input_o\ & \Data[21]~input_o\ & \Data[20]~input_o\ & \Data[19]~input_o\ & \Data[18]~input_o\ & \Data[17]~input_o\ & \Data[16]~input_o\ & \Data[15]~input_o\ & \Data[14]~input_o\);

\Memory_Stage|altsyncram_component|auto_generated|ram_block1a14_PORTAADDR_bus\ <= (\PC_Stage|PC_out\(7) & \PC_Stage|PC_out\(6) & \PC_Stage|PC_out\(5) & \PC_Stage|PC_out\(4) & \PC_Stage|PC_out\(3) & \PC_Stage|PC_out\(2) & \PC_Stage|PC_out\(1)
& \PC_Stage|PC_out\(0));

\Memory_Stage|altsyncram_component|auto_generated|q_a\(14) <= \Memory_Stage|altsyncram_component|auto_generated|ram_block1a14_PORTADATAOUT_bus\(0);
\Memory_Stage|altsyncram_component|auto_generated|q_a\(15) <= \Memory_Stage|altsyncram_component|auto_generated|ram_block1a14_PORTADATAOUT_bus\(1);
\Memory_Stage|altsyncram_component|auto_generated|q_a\(16) <= \Memory_Stage|altsyncram_component|auto_generated|ram_block1a14_PORTADATAOUT_bus\(2);
\Memory_Stage|altsyncram_component|auto_generated|q_a\(17) <= \Memory_Stage|altsyncram_component|auto_generated|ram_block1a14_PORTADATAOUT_bus\(3);
\Memory_Stage|altsyncram_component|auto_generated|q_a\(18) <= \Memory_Stage|altsyncram_component|auto_generated|ram_block1a14_PORTADATAOUT_bus\(4);
\Memory_Stage|altsyncram_component|auto_generated|q_a\(19) <= \Memory_Stage|altsyncram_component|auto_generated|ram_block1a14_PORTADATAOUT_bus\(5);
\Memory_Stage|altsyncram_component|auto_generated|q_a\(20) <= \Memory_Stage|altsyncram_component|auto_generated|ram_block1a14_PORTADATAOUT_bus\(6);
\Memory_Stage|altsyncram_component|auto_generated|q_a\(21) <= \Memory_Stage|altsyncram_component|auto_generated|ram_block1a14_PORTADATAOUT_bus\(7);
\Memory_Stage|altsyncram_component|auto_generated|q_a\(22) <= \Memory_Stage|altsyncram_component|auto_generated|ram_block1a14_PORTADATAOUT_bus\(8);
\Memory_Stage|altsyncram_component|auto_generated|q_a\(23) <= \Memory_Stage|altsyncram_component|auto_generated|ram_block1a14_PORTADATAOUT_bus\(9);
\Memory_Stage|altsyncram_component|auto_generated|q_a\(24) <= \Memory_Stage|altsyncram_component|auto_generated|ram_block1a14_PORTADATAOUT_bus\(10);
\Memory_Stage|altsyncram_component|auto_generated|q_a\(25) <= \Memory_Stage|altsyncram_component|auto_generated|ram_block1a14_PORTADATAOUT_bus\(11);
\Memory_Stage|altsyncram_component|auto_generated|q_a\(26) <= \Memory_Stage|altsyncram_component|auto_generated|ram_block1a14_PORTADATAOUT_bus\(12);
\Memory_Stage|altsyncram_component|auto_generated|q_a\(27) <= \Memory_Stage|altsyncram_component|auto_generated|ram_block1a14_PORTADATAOUT_bus\(13);
\Memory_Stage|altsyncram_component|auto_generated|q_a\(28) <= \Memory_Stage|altsyncram_component|auto_generated|ram_block1a14_PORTADATAOUT_bus\(14);
\Memory_Stage|altsyncram_component|auto_generated|q_a\(29) <= \Memory_Stage|altsyncram_component|auto_generated|ram_block1a14_PORTADATAOUT_bus\(15);
\Memory_Stage|altsyncram_component|auto_generated|q_a\(30) <= \Memory_Stage|altsyncram_component|auto_generated|ram_block1a14_PORTADATAOUT_bus\(16);
\Memory_Stage|altsyncram_component|auto_generated|q_a\(31) <= \Memory_Stage|altsyncram_component|auto_generated|ram_block1a14_PORTADATAOUT_bus\(17);

\~QUARTUS_CREATED_ADC1~_CHSEL_bus\ <= (\~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\);

\~QUARTUS_CREATED_ADC2~_CHSEL_bus\ <= (\~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\);

\Reset~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \Reset~input_o\);

\Clock~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \Clock~input_o\);
\ALT_INV_Reset~inputclkctrl_outclk\ <= NOT \Reset~inputclkctrl_outclk\;
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: LCCOMB_X44_Y50_N12
\~QUARTUS_CREATED_GND~I\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \~QUARTUS_CREATED_GND~I_combout\ = GND

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \~QUARTUS_CREATED_GND~I_combout\);

-- Location: IOOBUF_X40_Y0_N23
\Curr_Address[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \PC_Stage|PC_out\(0),
	devoe => ww_devoe,
	o => \Curr_Address[0]~output_o\);

-- Location: IOOBUF_X40_Y0_N16
\Curr_Address[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \PC_Stage|PC_out\(1),
	devoe => ww_devoe,
	o => \Curr_Address[1]~output_o\);

-- Location: IOOBUF_X46_Y0_N9
\Curr_Address[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \PC_Stage|PC_out\(2),
	devoe => ww_devoe,
	o => \Curr_Address[2]~output_o\);

-- Location: IOOBUF_X49_Y0_N30
\Curr_Address[3]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \PC_Stage|PC_out\(3),
	devoe => ww_devoe,
	o => \Curr_Address[3]~output_o\);

-- Location: IOOBUF_X49_Y0_N9
\Curr_Address[4]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \PC_Stage|PC_out\(4),
	devoe => ww_devoe,
	o => \Curr_Address[4]~output_o\);

-- Location: IOOBUF_X40_Y0_N9
\Curr_Address[5]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \PC_Stage|PC_out\(5),
	devoe => ww_devoe,
	o => \Curr_Address[5]~output_o\);

-- Location: IOOBUF_X49_Y0_N16
\Curr_Address[6]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \PC_Stage|PC_out\(6),
	devoe => ww_devoe,
	o => \Curr_Address[6]~output_o\);

-- Location: IOOBUF_X46_Y0_N2
\Curr_Address[7]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \PC_Stage|PC_out\(7),
	devoe => ww_devoe,
	o => \Curr_Address[7]~output_o\);

-- Location: IOOBUF_X49_Y0_N2
\Curr_Address[8]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \PC_Stage|PC_out\(8),
	devoe => ww_devoe,
	o => \Curr_Address[8]~output_o\);

-- Location: IOOBUF_X51_Y0_N23
\Curr_Address[9]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \PC_Stage|PC_out\(9),
	devoe => ww_devoe,
	o => \Curr_Address[9]~output_o\);

-- Location: IOOBUF_X60_Y0_N30
\Curr_Address[10]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \PC_Stage|PC_out\(10),
	devoe => ww_devoe,
	o => \Curr_Address[10]~output_o\);

-- Location: IOOBUF_X58_Y0_N16
\Curr_Address[11]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \PC_Stage|PC_out\(11),
	devoe => ww_devoe,
	o => \Curr_Address[11]~output_o\);

-- Location: IOOBUF_X58_Y0_N30
\Curr_Address[12]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \PC_Stage|PC_out\(12),
	devoe => ww_devoe,
	o => \Curr_Address[12]~output_o\);

-- Location: IOOBUF_X49_Y0_N23
\Curr_Address[13]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \PC_Stage|PC_out\(13),
	devoe => ww_devoe,
	o => \Curr_Address[13]~output_o\);

-- Location: IOOBUF_X58_Y0_N9
\Curr_Address[14]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \PC_Stage|PC_out\(14),
	devoe => ww_devoe,
	o => \Curr_Address[14]~output_o\);

-- Location: IOOBUF_X58_Y0_N2
\Curr_Address[15]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \PC_Stage|PC_out\(15),
	devoe => ww_devoe,
	o => \Curr_Address[15]~output_o\);

-- Location: IOOBUF_X56_Y0_N23
\Curr_Address[16]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \PC_Stage|PC_out\(16),
	devoe => ww_devoe,
	o => \Curr_Address[16]~output_o\);

-- Location: IOOBUF_X54_Y0_N16
\Curr_Address[17]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \PC_Stage|PC_out\(17),
	devoe => ww_devoe,
	o => \Curr_Address[17]~output_o\);

-- Location: IOOBUF_X51_Y0_N2
\Curr_Address[18]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \PC_Stage|PC_out\(18),
	devoe => ww_devoe,
	o => \Curr_Address[18]~output_o\);

-- Location: IOOBUF_X56_Y0_N2
\Curr_Address[19]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \PC_Stage|PC_out\(19),
	devoe => ww_devoe,
	o => \Curr_Address[19]~output_o\);

-- Location: IOOBUF_X54_Y0_N23
\Curr_Address[20]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \PC_Stage|PC_out\(20),
	devoe => ww_devoe,
	o => \Curr_Address[20]~output_o\);

-- Location: IOOBUF_X54_Y0_N2
\Curr_Address[21]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \PC_Stage|PC_out\(21),
	devoe => ww_devoe,
	o => \Curr_Address[21]~output_o\);

-- Location: IOOBUF_X51_Y0_N16
\Curr_Address[22]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \PC_Stage|PC_out\(22),
	devoe => ww_devoe,
	o => \Curr_Address[22]~output_o\);

-- Location: IOOBUF_X62_Y0_N16
\Curr_Address[23]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \PC_Stage|PC_out\(23),
	devoe => ww_devoe,
	o => \Curr_Address[23]~output_o\);

-- Location: IOOBUF_X51_Y0_N30
\Curr_Address[24]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \PC_Stage|PC_out\(24),
	devoe => ww_devoe,
	o => \Curr_Address[24]~output_o\);

-- Location: IOOBUF_X51_Y0_N9
\Curr_Address[25]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \PC_Stage|PC_out\(25),
	devoe => ww_devoe,
	o => \Curr_Address[25]~output_o\);

-- Location: IOOBUF_X56_Y0_N9
\Curr_Address[26]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \PC_Stage|PC_out\(26),
	devoe => ww_devoe,
	o => \Curr_Address[26]~output_o\);

-- Location: IOOBUF_X54_Y0_N30
\Curr_Address[27]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \PC_Stage|PC_out\(27),
	devoe => ww_devoe,
	o => \Curr_Address[27]~output_o\);

-- Location: IOOBUF_X56_Y0_N30
\Curr_Address[28]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \PC_Stage|PC_out\(28),
	devoe => ww_devoe,
	o => \Curr_Address[28]~output_o\);

-- Location: IOOBUF_X58_Y0_N23
\Curr_Address[29]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \PC_Stage|PC_out\(29),
	devoe => ww_devoe,
	o => \Curr_Address[29]~output_o\);

-- Location: IOOBUF_X54_Y0_N9
\Curr_Address[30]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \PC_Stage|PC_out\(30),
	devoe => ww_devoe,
	o => \Curr_Address[30]~output_o\);

-- Location: IOOBUF_X56_Y0_N16
\Curr_Address[31]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \PC_Stage|PC_out\(31),
	devoe => ww_devoe,
	o => \Curr_Address[31]~output_o\);

-- Location: IOOBUF_X18_Y0_N16
\Instruction[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Memory_Stage|altsyncram_component|auto_generated|q_a\(0),
	devoe => ww_devoe,
	o => \Instruction[0]~output_o\);

-- Location: IOOBUF_X20_Y0_N2
\Instruction[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Memory_Stage|altsyncram_component|auto_generated|q_a\(1),
	devoe => ww_devoe,
	o => \Instruction[1]~output_o\);

-- Location: IOOBUF_X22_Y0_N16
\Instruction[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Memory_Stage|altsyncram_component|auto_generated|q_a\(2),
	devoe => ww_devoe,
	o => \Instruction[2]~output_o\);

-- Location: IOOBUF_X16_Y0_N16
\Instruction[3]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Memory_Stage|altsyncram_component|auto_generated|q_a\(3),
	devoe => ww_devoe,
	o => \Instruction[3]~output_o\);

-- Location: IOOBUF_X16_Y0_N2
\Instruction[4]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Memory_Stage|altsyncram_component|auto_generated|q_a\(4),
	devoe => ww_devoe,
	o => \Instruction[4]~output_o\);

-- Location: IOOBUF_X16_Y0_N9
\Instruction[5]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Memory_Stage|altsyncram_component|auto_generated|q_a\(5),
	devoe => ww_devoe,
	o => \Instruction[5]~output_o\);

-- Location: IOOBUF_X40_Y0_N2
\Instruction[6]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Memory_Stage|altsyncram_component|auto_generated|q_a\(6),
	devoe => ww_devoe,
	o => \Instruction[6]~output_o\);

-- Location: IOOBUF_X29_Y0_N16
\Instruction[7]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Memory_Stage|altsyncram_component|auto_generated|q_a\(7),
	devoe => ww_devoe,
	o => \Instruction[7]~output_o\);

-- Location: IOOBUF_X20_Y0_N9
\Instruction[8]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Memory_Stage|altsyncram_component|auto_generated|q_a\(8),
	devoe => ww_devoe,
	o => \Instruction[8]~output_o\);

-- Location: IOOBUF_X29_Y0_N2
\Instruction[9]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Memory_Stage|altsyncram_component|auto_generated|q_a\(9),
	devoe => ww_devoe,
	o => \Instruction[9]~output_o\);

-- Location: IOOBUF_X31_Y0_N9
\Instruction[10]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Memory_Stage|altsyncram_component|auto_generated|q_a\(10),
	devoe => ww_devoe,
	o => \Instruction[10]~output_o\);

-- Location: IOOBUF_X31_Y39_N16
\Instruction[11]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Memory_Stage|altsyncram_component|auto_generated|q_a\(11),
	devoe => ww_devoe,
	o => \Instruction[11]~output_o\);

-- Location: IOOBUF_X22_Y0_N2
\Instruction[12]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Memory_Stage|altsyncram_component|auto_generated|q_a\(12),
	devoe => ww_devoe,
	o => \Instruction[12]~output_o\);

-- Location: IOOBUF_X24_Y0_N2
\Instruction[13]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Memory_Stage|altsyncram_component|auto_generated|q_a\(13),
	devoe => ww_devoe,
	o => \Instruction[13]~output_o\);

-- Location: IOOBUF_X22_Y0_N9
\Instruction[14]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Memory_Stage|altsyncram_component|auto_generated|q_a\(14),
	devoe => ww_devoe,
	o => \Instruction[14]~output_o\);

-- Location: IOOBUF_X34_Y0_N23
\Instruction[15]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Memory_Stage|altsyncram_component|auto_generated|q_a\(15),
	devoe => ww_devoe,
	o => \Instruction[15]~output_o\);

-- Location: IOOBUF_X26_Y0_N9
\Instruction[16]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Memory_Stage|altsyncram_component|auto_generated|q_a\(16),
	devoe => ww_devoe,
	o => \Instruction[16]~output_o\);

-- Location: IOOBUF_X18_Y0_N9
\Instruction[17]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Memory_Stage|altsyncram_component|auto_generated|q_a\(17),
	devoe => ww_devoe,
	o => \Instruction[17]~output_o\);

-- Location: IOOBUF_X29_Y0_N9
\Instruction[18]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Memory_Stage|altsyncram_component|auto_generated|q_a\(18),
	devoe => ww_devoe,
	o => \Instruction[18]~output_o\);

-- Location: IOOBUF_X24_Y0_N9
\Instruction[19]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Memory_Stage|altsyncram_component|auto_generated|q_a\(19),
	devoe => ww_devoe,
	o => \Instruction[19]~output_o\);

-- Location: IOOBUF_X34_Y0_N30
\Instruction[20]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Memory_Stage|altsyncram_component|auto_generated|q_a\(20),
	devoe => ww_devoe,
	o => \Instruction[20]~output_o\);

-- Location: IOOBUF_X31_Y39_N2
\Instruction[21]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Memory_Stage|altsyncram_component|auto_generated|q_a\(21),
	devoe => ww_devoe,
	o => \Instruction[21]~output_o\);

-- Location: IOOBUF_X31_Y0_N2
\Instruction[22]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Memory_Stage|altsyncram_component|auto_generated|q_a\(22),
	devoe => ww_devoe,
	o => \Instruction[22]~output_o\);

-- Location: IOOBUF_X18_Y0_N2
\Instruction[23]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Memory_Stage|altsyncram_component|auto_generated|q_a\(23),
	devoe => ww_devoe,
	o => \Instruction[23]~output_o\);

-- Location: IOOBUF_X31_Y39_N9
\Instruction[24]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Memory_Stage|altsyncram_component|auto_generated|q_a\(24),
	devoe => ww_devoe,
	o => \Instruction[24]~output_o\);

-- Location: IOOBUF_X24_Y0_N16
\Instruction[25]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Memory_Stage|altsyncram_component|auto_generated|q_a\(25),
	devoe => ww_devoe,
	o => \Instruction[25]~output_o\);

-- Location: IOOBUF_X31_Y0_N16
\Instruction[26]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Memory_Stage|altsyncram_component|auto_generated|q_a\(26),
	devoe => ww_devoe,
	o => \Instruction[26]~output_o\);

-- Location: IOOBUF_X20_Y0_N16
\Instruction[27]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Memory_Stage|altsyncram_component|auto_generated|q_a\(27),
	devoe => ww_devoe,
	o => \Instruction[27]~output_o\);

-- Location: IOOBUF_X38_Y0_N30
\Instruction[28]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Memory_Stage|altsyncram_component|auto_generated|q_a\(28),
	devoe => ww_devoe,
	o => \Instruction[28]~output_o\);

-- Location: IOOBUF_X38_Y0_N23
\Instruction[29]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Memory_Stage|altsyncram_component|auto_generated|q_a\(29),
	devoe => ww_devoe,
	o => \Instruction[29]~output_o\);

-- Location: IOOBUF_X26_Y0_N16
\Instruction[30]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Memory_Stage|altsyncram_component|auto_generated|q_a\(30),
	devoe => ww_devoe,
	o => \Instruction[30]~output_o\);

-- Location: IOOBUF_X34_Y39_N23
\Instruction[31]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Memory_Stage|altsyncram_component|auto_generated|q_a\(31),
	devoe => ww_devoe,
	o => \Instruction[31]~output_o\);

-- Location: IOIBUF_X0_Y18_N15
\Clock~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Clock,
	o => \Clock~input_o\);

-- Location: CLKCTRL_G3
\Clock~inputclkctrl\ : fiftyfivenm_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \Clock~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \Clock~inputclkctrl_outclk\);

-- Location: LCCOMB_X54_Y2_N0
\PC_Stage|PC_out[0]~93\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \PC_Stage|PC_out[0]~93_combout\ = !\PC_Stage|PC_out\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \PC_Stage|PC_out\(0),
	combout => \PC_Stage|PC_out[0]~93_combout\);

-- Location: IOIBUF_X0_Y18_N22
\Reset~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Reset,
	o => \Reset~input_o\);

-- Location: CLKCTRL_G4
\Reset~inputclkctrl\ : fiftyfivenm_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \Reset~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \Reset~inputclkctrl_outclk\);

-- Location: FF_X54_Y2_N1
\PC_Stage|PC_out[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \PC_Stage|PC_out[0]~93_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PC_Stage|PC_out\(0));

-- Location: LCCOMB_X54_Y2_N2
\PC_Stage|PC_out[1]~31\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \PC_Stage|PC_out[1]~31_combout\ = (\PC_Stage|PC_out\(1) & (\PC_Stage|PC_out\(0) $ (VCC))) # (!\PC_Stage|PC_out\(1) & (\PC_Stage|PC_out\(0) & VCC))
-- \PC_Stage|PC_out[1]~32\ = CARRY((\PC_Stage|PC_out\(1) & \PC_Stage|PC_out\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PC_Stage|PC_out\(1),
	datab => \PC_Stage|PC_out\(0),
	datad => VCC,
	combout => \PC_Stage|PC_out[1]~31_combout\,
	cout => \PC_Stage|PC_out[1]~32\);

-- Location: FF_X54_Y2_N3
\PC_Stage|PC_out[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \PC_Stage|PC_out[1]~31_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PC_Stage|PC_out\(1));

-- Location: LCCOMB_X54_Y2_N4
\PC_Stage|PC_out[2]~33\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \PC_Stage|PC_out[2]~33_combout\ = (\PC_Stage|PC_out\(2) & (!\PC_Stage|PC_out[1]~32\)) # (!\PC_Stage|PC_out\(2) & ((\PC_Stage|PC_out[1]~32\) # (GND)))
-- \PC_Stage|PC_out[2]~34\ = CARRY((!\PC_Stage|PC_out[1]~32\) # (!\PC_Stage|PC_out\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \PC_Stage|PC_out\(2),
	datad => VCC,
	cin => \PC_Stage|PC_out[1]~32\,
	combout => \PC_Stage|PC_out[2]~33_combout\,
	cout => \PC_Stage|PC_out[2]~34\);

-- Location: FF_X54_Y2_N5
\PC_Stage|PC_out[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \PC_Stage|PC_out[2]~33_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PC_Stage|PC_out\(2));

-- Location: LCCOMB_X54_Y2_N6
\PC_Stage|PC_out[3]~35\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \PC_Stage|PC_out[3]~35_combout\ = (\PC_Stage|PC_out\(3) & (\PC_Stage|PC_out[2]~34\ $ (GND))) # (!\PC_Stage|PC_out\(3) & (!\PC_Stage|PC_out[2]~34\ & VCC))
-- \PC_Stage|PC_out[3]~36\ = CARRY((\PC_Stage|PC_out\(3) & !\PC_Stage|PC_out[2]~34\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \PC_Stage|PC_out\(3),
	datad => VCC,
	cin => \PC_Stage|PC_out[2]~34\,
	combout => \PC_Stage|PC_out[3]~35_combout\,
	cout => \PC_Stage|PC_out[3]~36\);

-- Location: FF_X54_Y2_N7
\PC_Stage|PC_out[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \PC_Stage|PC_out[3]~35_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PC_Stage|PC_out\(3));

-- Location: LCCOMB_X54_Y2_N8
\PC_Stage|PC_out[4]~37\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \PC_Stage|PC_out[4]~37_combout\ = (\PC_Stage|PC_out\(4) & (!\PC_Stage|PC_out[3]~36\)) # (!\PC_Stage|PC_out\(4) & ((\PC_Stage|PC_out[3]~36\) # (GND)))
-- \PC_Stage|PC_out[4]~38\ = CARRY((!\PC_Stage|PC_out[3]~36\) # (!\PC_Stage|PC_out\(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \PC_Stage|PC_out\(4),
	datad => VCC,
	cin => \PC_Stage|PC_out[3]~36\,
	combout => \PC_Stage|PC_out[4]~37_combout\,
	cout => \PC_Stage|PC_out[4]~38\);

-- Location: FF_X54_Y2_N9
\PC_Stage|PC_out[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \PC_Stage|PC_out[4]~37_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PC_Stage|PC_out\(4));

-- Location: LCCOMB_X54_Y2_N10
\PC_Stage|PC_out[5]~39\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \PC_Stage|PC_out[5]~39_combout\ = (\PC_Stage|PC_out\(5) & (\PC_Stage|PC_out[4]~38\ $ (GND))) # (!\PC_Stage|PC_out\(5) & (!\PC_Stage|PC_out[4]~38\ & VCC))
-- \PC_Stage|PC_out[5]~40\ = CARRY((\PC_Stage|PC_out\(5) & !\PC_Stage|PC_out[4]~38\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \PC_Stage|PC_out\(5),
	datad => VCC,
	cin => \PC_Stage|PC_out[4]~38\,
	combout => \PC_Stage|PC_out[5]~39_combout\,
	cout => \PC_Stage|PC_out[5]~40\);

-- Location: FF_X54_Y2_N11
\PC_Stage|PC_out[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \PC_Stage|PC_out[5]~39_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PC_Stage|PC_out\(5));

-- Location: LCCOMB_X54_Y2_N12
\PC_Stage|PC_out[6]~41\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \PC_Stage|PC_out[6]~41_combout\ = (\PC_Stage|PC_out\(6) & (!\PC_Stage|PC_out[5]~40\)) # (!\PC_Stage|PC_out\(6) & ((\PC_Stage|PC_out[5]~40\) # (GND)))
-- \PC_Stage|PC_out[6]~42\ = CARRY((!\PC_Stage|PC_out[5]~40\) # (!\PC_Stage|PC_out\(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \PC_Stage|PC_out\(6),
	datad => VCC,
	cin => \PC_Stage|PC_out[5]~40\,
	combout => \PC_Stage|PC_out[6]~41_combout\,
	cout => \PC_Stage|PC_out[6]~42\);

-- Location: FF_X54_Y2_N13
\PC_Stage|PC_out[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \PC_Stage|PC_out[6]~41_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PC_Stage|PC_out\(6));

-- Location: LCCOMB_X54_Y2_N14
\PC_Stage|PC_out[7]~43\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \PC_Stage|PC_out[7]~43_combout\ = (\PC_Stage|PC_out\(7) & (\PC_Stage|PC_out[6]~42\ $ (GND))) # (!\PC_Stage|PC_out\(7) & (!\PC_Stage|PC_out[6]~42\ & VCC))
-- \PC_Stage|PC_out[7]~44\ = CARRY((\PC_Stage|PC_out\(7) & !\PC_Stage|PC_out[6]~42\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \PC_Stage|PC_out\(7),
	datad => VCC,
	cin => \PC_Stage|PC_out[6]~42\,
	combout => \PC_Stage|PC_out[7]~43_combout\,
	cout => \PC_Stage|PC_out[7]~44\);

-- Location: FF_X54_Y2_N15
\PC_Stage|PC_out[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \PC_Stage|PC_out[7]~43_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PC_Stage|PC_out\(7));

-- Location: LCCOMB_X54_Y2_N16
\PC_Stage|PC_out[8]~45\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \PC_Stage|PC_out[8]~45_combout\ = (\PC_Stage|PC_out\(8) & (!\PC_Stage|PC_out[7]~44\)) # (!\PC_Stage|PC_out\(8) & ((\PC_Stage|PC_out[7]~44\) # (GND)))
-- \PC_Stage|PC_out[8]~46\ = CARRY((!\PC_Stage|PC_out[7]~44\) # (!\PC_Stage|PC_out\(8)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \PC_Stage|PC_out\(8),
	datad => VCC,
	cin => \PC_Stage|PC_out[7]~44\,
	combout => \PC_Stage|PC_out[8]~45_combout\,
	cout => \PC_Stage|PC_out[8]~46\);

-- Location: FF_X54_Y2_N17
\PC_Stage|PC_out[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \PC_Stage|PC_out[8]~45_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PC_Stage|PC_out\(8));

-- Location: LCCOMB_X54_Y2_N18
\PC_Stage|PC_out[9]~47\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \PC_Stage|PC_out[9]~47_combout\ = (\PC_Stage|PC_out\(9) & (\PC_Stage|PC_out[8]~46\ $ (GND))) # (!\PC_Stage|PC_out\(9) & (!\PC_Stage|PC_out[8]~46\ & VCC))
-- \PC_Stage|PC_out[9]~48\ = CARRY((\PC_Stage|PC_out\(9) & !\PC_Stage|PC_out[8]~46\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \PC_Stage|PC_out\(9),
	datad => VCC,
	cin => \PC_Stage|PC_out[8]~46\,
	combout => \PC_Stage|PC_out[9]~47_combout\,
	cout => \PC_Stage|PC_out[9]~48\);

-- Location: FF_X54_Y2_N19
\PC_Stage|PC_out[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \PC_Stage|PC_out[9]~47_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PC_Stage|PC_out\(9));

-- Location: LCCOMB_X54_Y2_N20
\PC_Stage|PC_out[10]~49\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \PC_Stage|PC_out[10]~49_combout\ = (\PC_Stage|PC_out\(10) & (!\PC_Stage|PC_out[9]~48\)) # (!\PC_Stage|PC_out\(10) & ((\PC_Stage|PC_out[9]~48\) # (GND)))
-- \PC_Stage|PC_out[10]~50\ = CARRY((!\PC_Stage|PC_out[9]~48\) # (!\PC_Stage|PC_out\(10)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \PC_Stage|PC_out\(10),
	datad => VCC,
	cin => \PC_Stage|PC_out[9]~48\,
	combout => \PC_Stage|PC_out[10]~49_combout\,
	cout => \PC_Stage|PC_out[10]~50\);

-- Location: FF_X54_Y2_N21
\PC_Stage|PC_out[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \PC_Stage|PC_out[10]~49_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PC_Stage|PC_out\(10));

-- Location: LCCOMB_X54_Y2_N22
\PC_Stage|PC_out[11]~51\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \PC_Stage|PC_out[11]~51_combout\ = (\PC_Stage|PC_out\(11) & (\PC_Stage|PC_out[10]~50\ $ (GND))) # (!\PC_Stage|PC_out\(11) & (!\PC_Stage|PC_out[10]~50\ & VCC))
-- \PC_Stage|PC_out[11]~52\ = CARRY((\PC_Stage|PC_out\(11) & !\PC_Stage|PC_out[10]~50\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \PC_Stage|PC_out\(11),
	datad => VCC,
	cin => \PC_Stage|PC_out[10]~50\,
	combout => \PC_Stage|PC_out[11]~51_combout\,
	cout => \PC_Stage|PC_out[11]~52\);

-- Location: FF_X54_Y2_N23
\PC_Stage|PC_out[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \PC_Stage|PC_out[11]~51_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PC_Stage|PC_out\(11));

-- Location: LCCOMB_X54_Y2_N24
\PC_Stage|PC_out[12]~53\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \PC_Stage|PC_out[12]~53_combout\ = (\PC_Stage|PC_out\(12) & (!\PC_Stage|PC_out[11]~52\)) # (!\PC_Stage|PC_out\(12) & ((\PC_Stage|PC_out[11]~52\) # (GND)))
-- \PC_Stage|PC_out[12]~54\ = CARRY((!\PC_Stage|PC_out[11]~52\) # (!\PC_Stage|PC_out\(12)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \PC_Stage|PC_out\(12),
	datad => VCC,
	cin => \PC_Stage|PC_out[11]~52\,
	combout => \PC_Stage|PC_out[12]~53_combout\,
	cout => \PC_Stage|PC_out[12]~54\);

-- Location: FF_X54_Y2_N25
\PC_Stage|PC_out[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \PC_Stage|PC_out[12]~53_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PC_Stage|PC_out\(12));

-- Location: LCCOMB_X54_Y2_N26
\PC_Stage|PC_out[13]~55\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \PC_Stage|PC_out[13]~55_combout\ = (\PC_Stage|PC_out\(13) & (\PC_Stage|PC_out[12]~54\ $ (GND))) # (!\PC_Stage|PC_out\(13) & (!\PC_Stage|PC_out[12]~54\ & VCC))
-- \PC_Stage|PC_out[13]~56\ = CARRY((\PC_Stage|PC_out\(13) & !\PC_Stage|PC_out[12]~54\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \PC_Stage|PC_out\(13),
	datad => VCC,
	cin => \PC_Stage|PC_out[12]~54\,
	combout => \PC_Stage|PC_out[13]~55_combout\,
	cout => \PC_Stage|PC_out[13]~56\);

-- Location: FF_X54_Y2_N27
\PC_Stage|PC_out[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \PC_Stage|PC_out[13]~55_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PC_Stage|PC_out\(13));

-- Location: LCCOMB_X54_Y2_N28
\PC_Stage|PC_out[14]~57\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \PC_Stage|PC_out[14]~57_combout\ = (\PC_Stage|PC_out\(14) & (!\PC_Stage|PC_out[13]~56\)) # (!\PC_Stage|PC_out\(14) & ((\PC_Stage|PC_out[13]~56\) # (GND)))
-- \PC_Stage|PC_out[14]~58\ = CARRY((!\PC_Stage|PC_out[13]~56\) # (!\PC_Stage|PC_out\(14)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \PC_Stage|PC_out\(14),
	datad => VCC,
	cin => \PC_Stage|PC_out[13]~56\,
	combout => \PC_Stage|PC_out[14]~57_combout\,
	cout => \PC_Stage|PC_out[14]~58\);

-- Location: FF_X54_Y2_N29
\PC_Stage|PC_out[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \PC_Stage|PC_out[14]~57_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PC_Stage|PC_out\(14));

-- Location: LCCOMB_X54_Y2_N30
\PC_Stage|PC_out[15]~59\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \PC_Stage|PC_out[15]~59_combout\ = (\PC_Stage|PC_out\(15) & (\PC_Stage|PC_out[14]~58\ $ (GND))) # (!\PC_Stage|PC_out\(15) & (!\PC_Stage|PC_out[14]~58\ & VCC))
-- \PC_Stage|PC_out[15]~60\ = CARRY((\PC_Stage|PC_out\(15) & !\PC_Stage|PC_out[14]~58\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \PC_Stage|PC_out\(15),
	datad => VCC,
	cin => \PC_Stage|PC_out[14]~58\,
	combout => \PC_Stage|PC_out[15]~59_combout\,
	cout => \PC_Stage|PC_out[15]~60\);

-- Location: FF_X54_Y2_N31
\PC_Stage|PC_out[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \PC_Stage|PC_out[15]~59_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PC_Stage|PC_out\(15));

-- Location: LCCOMB_X54_Y1_N0
\PC_Stage|PC_out[16]~61\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \PC_Stage|PC_out[16]~61_combout\ = (\PC_Stage|PC_out\(16) & (!\PC_Stage|PC_out[15]~60\)) # (!\PC_Stage|PC_out\(16) & ((\PC_Stage|PC_out[15]~60\) # (GND)))
-- \PC_Stage|PC_out[16]~62\ = CARRY((!\PC_Stage|PC_out[15]~60\) # (!\PC_Stage|PC_out\(16)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \PC_Stage|PC_out\(16),
	datad => VCC,
	cin => \PC_Stage|PC_out[15]~60\,
	combout => \PC_Stage|PC_out[16]~61_combout\,
	cout => \PC_Stage|PC_out[16]~62\);

-- Location: FF_X54_Y1_N1
\PC_Stage|PC_out[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \PC_Stage|PC_out[16]~61_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PC_Stage|PC_out\(16));

-- Location: LCCOMB_X54_Y1_N2
\PC_Stage|PC_out[17]~63\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \PC_Stage|PC_out[17]~63_combout\ = (\PC_Stage|PC_out\(17) & (\PC_Stage|PC_out[16]~62\ $ (GND))) # (!\PC_Stage|PC_out\(17) & (!\PC_Stage|PC_out[16]~62\ & VCC))
-- \PC_Stage|PC_out[17]~64\ = CARRY((\PC_Stage|PC_out\(17) & !\PC_Stage|PC_out[16]~62\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \PC_Stage|PC_out\(17),
	datad => VCC,
	cin => \PC_Stage|PC_out[16]~62\,
	combout => \PC_Stage|PC_out[17]~63_combout\,
	cout => \PC_Stage|PC_out[17]~64\);

-- Location: FF_X54_Y1_N3
\PC_Stage|PC_out[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \PC_Stage|PC_out[17]~63_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PC_Stage|PC_out\(17));

-- Location: LCCOMB_X54_Y1_N4
\PC_Stage|PC_out[18]~65\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \PC_Stage|PC_out[18]~65_combout\ = (\PC_Stage|PC_out\(18) & (!\PC_Stage|PC_out[17]~64\)) # (!\PC_Stage|PC_out\(18) & ((\PC_Stage|PC_out[17]~64\) # (GND)))
-- \PC_Stage|PC_out[18]~66\ = CARRY((!\PC_Stage|PC_out[17]~64\) # (!\PC_Stage|PC_out\(18)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \PC_Stage|PC_out\(18),
	datad => VCC,
	cin => \PC_Stage|PC_out[17]~64\,
	combout => \PC_Stage|PC_out[18]~65_combout\,
	cout => \PC_Stage|PC_out[18]~66\);

-- Location: FF_X54_Y1_N5
\PC_Stage|PC_out[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \PC_Stage|PC_out[18]~65_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PC_Stage|PC_out\(18));

-- Location: LCCOMB_X54_Y1_N6
\PC_Stage|PC_out[19]~67\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \PC_Stage|PC_out[19]~67_combout\ = (\PC_Stage|PC_out\(19) & (\PC_Stage|PC_out[18]~66\ $ (GND))) # (!\PC_Stage|PC_out\(19) & (!\PC_Stage|PC_out[18]~66\ & VCC))
-- \PC_Stage|PC_out[19]~68\ = CARRY((\PC_Stage|PC_out\(19) & !\PC_Stage|PC_out[18]~66\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \PC_Stage|PC_out\(19),
	datad => VCC,
	cin => \PC_Stage|PC_out[18]~66\,
	combout => \PC_Stage|PC_out[19]~67_combout\,
	cout => \PC_Stage|PC_out[19]~68\);

-- Location: FF_X54_Y1_N7
\PC_Stage|PC_out[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \PC_Stage|PC_out[19]~67_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PC_Stage|PC_out\(19));

-- Location: LCCOMB_X54_Y1_N8
\PC_Stage|PC_out[20]~69\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \PC_Stage|PC_out[20]~69_combout\ = (\PC_Stage|PC_out\(20) & (!\PC_Stage|PC_out[19]~68\)) # (!\PC_Stage|PC_out\(20) & ((\PC_Stage|PC_out[19]~68\) # (GND)))
-- \PC_Stage|PC_out[20]~70\ = CARRY((!\PC_Stage|PC_out[19]~68\) # (!\PC_Stage|PC_out\(20)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \PC_Stage|PC_out\(20),
	datad => VCC,
	cin => \PC_Stage|PC_out[19]~68\,
	combout => \PC_Stage|PC_out[20]~69_combout\,
	cout => \PC_Stage|PC_out[20]~70\);

-- Location: FF_X54_Y1_N9
\PC_Stage|PC_out[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \PC_Stage|PC_out[20]~69_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PC_Stage|PC_out\(20));

-- Location: LCCOMB_X54_Y1_N10
\PC_Stage|PC_out[21]~71\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \PC_Stage|PC_out[21]~71_combout\ = (\PC_Stage|PC_out\(21) & (\PC_Stage|PC_out[20]~70\ $ (GND))) # (!\PC_Stage|PC_out\(21) & (!\PC_Stage|PC_out[20]~70\ & VCC))
-- \PC_Stage|PC_out[21]~72\ = CARRY((\PC_Stage|PC_out\(21) & !\PC_Stage|PC_out[20]~70\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \PC_Stage|PC_out\(21),
	datad => VCC,
	cin => \PC_Stage|PC_out[20]~70\,
	combout => \PC_Stage|PC_out[21]~71_combout\,
	cout => \PC_Stage|PC_out[21]~72\);

-- Location: FF_X54_Y1_N11
\PC_Stage|PC_out[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \PC_Stage|PC_out[21]~71_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PC_Stage|PC_out\(21));

-- Location: LCCOMB_X54_Y1_N12
\PC_Stage|PC_out[22]~73\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \PC_Stage|PC_out[22]~73_combout\ = (\PC_Stage|PC_out\(22) & (!\PC_Stage|PC_out[21]~72\)) # (!\PC_Stage|PC_out\(22) & ((\PC_Stage|PC_out[21]~72\) # (GND)))
-- \PC_Stage|PC_out[22]~74\ = CARRY((!\PC_Stage|PC_out[21]~72\) # (!\PC_Stage|PC_out\(22)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \PC_Stage|PC_out\(22),
	datad => VCC,
	cin => \PC_Stage|PC_out[21]~72\,
	combout => \PC_Stage|PC_out[22]~73_combout\,
	cout => \PC_Stage|PC_out[22]~74\);

-- Location: FF_X54_Y1_N13
\PC_Stage|PC_out[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \PC_Stage|PC_out[22]~73_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PC_Stage|PC_out\(22));

-- Location: LCCOMB_X54_Y1_N14
\PC_Stage|PC_out[23]~75\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \PC_Stage|PC_out[23]~75_combout\ = (\PC_Stage|PC_out\(23) & (\PC_Stage|PC_out[22]~74\ $ (GND))) # (!\PC_Stage|PC_out\(23) & (!\PC_Stage|PC_out[22]~74\ & VCC))
-- \PC_Stage|PC_out[23]~76\ = CARRY((\PC_Stage|PC_out\(23) & !\PC_Stage|PC_out[22]~74\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \PC_Stage|PC_out\(23),
	datad => VCC,
	cin => \PC_Stage|PC_out[22]~74\,
	combout => \PC_Stage|PC_out[23]~75_combout\,
	cout => \PC_Stage|PC_out[23]~76\);

-- Location: FF_X54_Y1_N15
\PC_Stage|PC_out[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \PC_Stage|PC_out[23]~75_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PC_Stage|PC_out\(23));

-- Location: LCCOMB_X54_Y1_N16
\PC_Stage|PC_out[24]~77\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \PC_Stage|PC_out[24]~77_combout\ = (\PC_Stage|PC_out\(24) & (!\PC_Stage|PC_out[23]~76\)) # (!\PC_Stage|PC_out\(24) & ((\PC_Stage|PC_out[23]~76\) # (GND)))
-- \PC_Stage|PC_out[24]~78\ = CARRY((!\PC_Stage|PC_out[23]~76\) # (!\PC_Stage|PC_out\(24)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \PC_Stage|PC_out\(24),
	datad => VCC,
	cin => \PC_Stage|PC_out[23]~76\,
	combout => \PC_Stage|PC_out[24]~77_combout\,
	cout => \PC_Stage|PC_out[24]~78\);

-- Location: FF_X54_Y1_N17
\PC_Stage|PC_out[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \PC_Stage|PC_out[24]~77_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PC_Stage|PC_out\(24));

-- Location: LCCOMB_X54_Y1_N18
\PC_Stage|PC_out[25]~79\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \PC_Stage|PC_out[25]~79_combout\ = (\PC_Stage|PC_out\(25) & (\PC_Stage|PC_out[24]~78\ $ (GND))) # (!\PC_Stage|PC_out\(25) & (!\PC_Stage|PC_out[24]~78\ & VCC))
-- \PC_Stage|PC_out[25]~80\ = CARRY((\PC_Stage|PC_out\(25) & !\PC_Stage|PC_out[24]~78\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \PC_Stage|PC_out\(25),
	datad => VCC,
	cin => \PC_Stage|PC_out[24]~78\,
	combout => \PC_Stage|PC_out[25]~79_combout\,
	cout => \PC_Stage|PC_out[25]~80\);

-- Location: FF_X54_Y1_N19
\PC_Stage|PC_out[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \PC_Stage|PC_out[25]~79_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PC_Stage|PC_out\(25));

-- Location: LCCOMB_X54_Y1_N20
\PC_Stage|PC_out[26]~81\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \PC_Stage|PC_out[26]~81_combout\ = (\PC_Stage|PC_out\(26) & (!\PC_Stage|PC_out[25]~80\)) # (!\PC_Stage|PC_out\(26) & ((\PC_Stage|PC_out[25]~80\) # (GND)))
-- \PC_Stage|PC_out[26]~82\ = CARRY((!\PC_Stage|PC_out[25]~80\) # (!\PC_Stage|PC_out\(26)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \PC_Stage|PC_out\(26),
	datad => VCC,
	cin => \PC_Stage|PC_out[25]~80\,
	combout => \PC_Stage|PC_out[26]~81_combout\,
	cout => \PC_Stage|PC_out[26]~82\);

-- Location: FF_X54_Y1_N21
\PC_Stage|PC_out[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \PC_Stage|PC_out[26]~81_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PC_Stage|PC_out\(26));

-- Location: LCCOMB_X54_Y1_N22
\PC_Stage|PC_out[27]~83\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \PC_Stage|PC_out[27]~83_combout\ = (\PC_Stage|PC_out\(27) & (\PC_Stage|PC_out[26]~82\ $ (GND))) # (!\PC_Stage|PC_out\(27) & (!\PC_Stage|PC_out[26]~82\ & VCC))
-- \PC_Stage|PC_out[27]~84\ = CARRY((\PC_Stage|PC_out\(27) & !\PC_Stage|PC_out[26]~82\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \PC_Stage|PC_out\(27),
	datad => VCC,
	cin => \PC_Stage|PC_out[26]~82\,
	combout => \PC_Stage|PC_out[27]~83_combout\,
	cout => \PC_Stage|PC_out[27]~84\);

-- Location: FF_X54_Y1_N23
\PC_Stage|PC_out[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \PC_Stage|PC_out[27]~83_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PC_Stage|PC_out\(27));

-- Location: LCCOMB_X54_Y1_N24
\PC_Stage|PC_out[28]~85\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \PC_Stage|PC_out[28]~85_combout\ = (\PC_Stage|PC_out\(28) & (!\PC_Stage|PC_out[27]~84\)) # (!\PC_Stage|PC_out\(28) & ((\PC_Stage|PC_out[27]~84\) # (GND)))
-- \PC_Stage|PC_out[28]~86\ = CARRY((!\PC_Stage|PC_out[27]~84\) # (!\PC_Stage|PC_out\(28)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \PC_Stage|PC_out\(28),
	datad => VCC,
	cin => \PC_Stage|PC_out[27]~84\,
	combout => \PC_Stage|PC_out[28]~85_combout\,
	cout => \PC_Stage|PC_out[28]~86\);

-- Location: FF_X54_Y1_N25
\PC_Stage|PC_out[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \PC_Stage|PC_out[28]~85_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PC_Stage|PC_out\(28));

-- Location: LCCOMB_X54_Y1_N26
\PC_Stage|PC_out[29]~87\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \PC_Stage|PC_out[29]~87_combout\ = (\PC_Stage|PC_out\(29) & (\PC_Stage|PC_out[28]~86\ $ (GND))) # (!\PC_Stage|PC_out\(29) & (!\PC_Stage|PC_out[28]~86\ & VCC))
-- \PC_Stage|PC_out[29]~88\ = CARRY((\PC_Stage|PC_out\(29) & !\PC_Stage|PC_out[28]~86\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \PC_Stage|PC_out\(29),
	datad => VCC,
	cin => \PC_Stage|PC_out[28]~86\,
	combout => \PC_Stage|PC_out[29]~87_combout\,
	cout => \PC_Stage|PC_out[29]~88\);

-- Location: FF_X54_Y1_N27
\PC_Stage|PC_out[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \PC_Stage|PC_out[29]~87_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PC_Stage|PC_out\(29));

-- Location: LCCOMB_X54_Y1_N28
\PC_Stage|PC_out[30]~89\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \PC_Stage|PC_out[30]~89_combout\ = (\PC_Stage|PC_out\(30) & (!\PC_Stage|PC_out[29]~88\)) # (!\PC_Stage|PC_out\(30) & ((\PC_Stage|PC_out[29]~88\) # (GND)))
-- \PC_Stage|PC_out[30]~90\ = CARRY((!\PC_Stage|PC_out[29]~88\) # (!\PC_Stage|PC_out\(30)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \PC_Stage|PC_out\(30),
	datad => VCC,
	cin => \PC_Stage|PC_out[29]~88\,
	combout => \PC_Stage|PC_out[30]~89_combout\,
	cout => \PC_Stage|PC_out[30]~90\);

-- Location: FF_X54_Y1_N29
\PC_Stage|PC_out[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \PC_Stage|PC_out[30]~89_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PC_Stage|PC_out\(30));

-- Location: LCCOMB_X54_Y1_N30
\PC_Stage|PC_out[31]~91\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \PC_Stage|PC_out[31]~91_combout\ = \PC_Stage|PC_out\(31) $ (\PC_Stage|PC_out[30]~90\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \PC_Stage|PC_out\(31),
	cin => \PC_Stage|PC_out[30]~90\,
	combout => \PC_Stage|PC_out[31]~91_combout\);

-- Location: FF_X54_Y1_N31
\PC_Stage|PC_out[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \PC_Stage|PC_out[31]~91_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PC_Stage|PC_out\(31));

-- Location: IOIBUF_X34_Y0_N15
\En~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_En,
	o => \En~input_o\);

-- Location: IOIBUF_X40_Y0_N29
\Data[0]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Data(0),
	o => \Data[0]~input_o\);

-- Location: IOIBUF_X38_Y0_N1
\Data[1]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Data(1),
	o => \Data[1]~input_o\);

-- Location: IOIBUF_X16_Y0_N29
\Data[2]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Data(2),
	o => \Data[2]~input_o\);

-- Location: IOIBUF_X34_Y0_N1
\Data[3]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Data(3),
	o => \Data[3]~input_o\);

-- Location: IOIBUF_X38_Y0_N15
\Data[4]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Data(4),
	o => \Data[4]~input_o\);

-- Location: IOIBUF_X34_Y39_N29
\Data[5]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Data(5),
	o => \Data[5]~input_o\);

-- Location: IOIBUF_X20_Y0_N22
\Data[6]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Data(6),
	o => \Data[6]~input_o\);

-- Location: IOIBUF_X26_Y0_N1
\Data[7]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Data(7),
	o => \Data[7]~input_o\);

-- Location: IOIBUF_X24_Y0_N29
\Data[8]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Data(8),
	o => \Data[8]~input_o\);

-- Location: IOIBUF_X16_Y0_N22
\Data[9]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Data(9),
	o => \Data[9]~input_o\);

-- Location: IOIBUF_X26_Y0_N29
\Data[10]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Data(10),
	o => \Data[10]~input_o\);

-- Location: IOIBUF_X38_Y0_N8
\Data[11]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Data(11),
	o => \Data[11]~input_o\);

-- Location: IOIBUF_X36_Y39_N29
\Data[12]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Data(12),
	o => \Data[12]~input_o\);

-- Location: IOIBUF_X34_Y39_N8
\Data[13]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Data(13),
	o => \Data[13]~input_o\);

-- Location: M9K_X33_Y1_N0
\Memory_Stage|altsyncram_component|auto_generated|ram_block1a0\ : fiftyfivenm_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init2 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000800020000040000",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "Program1.mif",
	init_file_layout => "port_a",
	logical_ram_name => "Program_Mem:Memory_Stage|altsyncram:altsyncram_component|altsyncram_lrq3:auto_generated|ALTSYNCRAM",
	operation_mode => "single_port",
	port_a_address_clear => "none",
	port_a_address_width => 8,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 18,
	port_a_first_address => 0,
	port_a_first_bit_number => 0,
	port_a_last_address => 255,
	port_a_logical_ram_depth => 256,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_b_address_width => 8,
	port_b_data_width => 18,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \En~input_o\,
	portare => VCC,
	clk0 => \Clock~inputclkctrl_outclk\,
	portadatain => \Memory_Stage|altsyncram_component|auto_generated|ram_block1a0_PORTADATAIN_bus\,
	portaaddr => \Memory_Stage|altsyncram_component|auto_generated|ram_block1a0_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \Memory_Stage|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\);

-- Location: IOIBUF_X36_Y0_N8
\Data[14]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Data(14),
	o => \Data[14]~input_o\);

-- Location: IOIBUF_X31_Y39_N22
\Data[15]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Data(15),
	o => \Data[15]~input_o\);

-- Location: IOIBUF_X20_Y0_N29
\Data[16]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Data(16),
	o => \Data[16]~input_o\);

-- Location: IOIBUF_X34_Y39_N15
\Data[17]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Data(17),
	o => \Data[17]~input_o\);

-- Location: IOIBUF_X24_Y0_N22
\Data[18]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Data(18),
	o => \Data[18]~input_o\);

-- Location: IOIBUF_X31_Y39_N29
\Data[19]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Data(19),
	o => \Data[19]~input_o\);

-- Location: IOIBUF_X26_Y0_N22
\Data[20]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Data(20),
	o => \Data[20]~input_o\);

-- Location: IOIBUF_X18_Y0_N22
\Data[21]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Data(21),
	o => \Data[21]~input_o\);

-- Location: IOIBUF_X34_Y0_N8
\Data[22]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Data(22),
	o => \Data[22]~input_o\);

-- Location: IOIBUF_X36_Y0_N1
\Data[23]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Data(23),
	o => \Data[23]~input_o\);

-- Location: IOIBUF_X34_Y39_N1
\Data[24]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Data(24),
	o => \Data[24]~input_o\);

-- Location: IOIBUF_X22_Y0_N29
\Data[25]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Data(25),
	o => \Data[25]~input_o\);

-- Location: IOIBUF_X18_Y0_N29
\Data[26]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Data(26),
	o => \Data[26]~input_o\);

-- Location: IOIBUF_X31_Y0_N22
\Data[27]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Data(27),
	o => \Data[27]~input_o\);

-- Location: IOIBUF_X22_Y0_N22
\Data[28]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Data(28),
	o => \Data[28]~input_o\);

-- Location: IOIBUF_X29_Y0_N29
\Data[29]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Data(29),
	o => \Data[29]~input_o\);

-- Location: IOIBUF_X29_Y0_N22
\Data[30]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Data(30),
	o => \Data[30]~input_o\);

-- Location: IOIBUF_X31_Y0_N29
\Data[31]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Data(31),
	o => \Data[31]~input_o\);

-- Location: M9K_X33_Y1_N0
\Memory_Stage|altsyncram_component|auto_generated|ram_block1a14\ : fiftyfivenm_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init2 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000AD49008428C0B23028",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "Program1.mif",
	init_file_layout => "port_a",
	logical_ram_name => "Program_Mem:Memory_Stage|altsyncram:altsyncram_component|altsyncram_lrq3:auto_generated|ALTSYNCRAM",
	operation_mode => "single_port",
	port_a_address_clear => "none",
	port_a_address_width => 8,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 18,
	port_a_first_address => 0,
	port_a_first_bit_number => 14,
	port_a_last_address => 255,
	port_a_logical_ram_depth => 256,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_b_address_width => 8,
	port_b_data_width => 18,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \En~input_o\,
	portare => VCC,
	clk0 => \Clock~inputclkctrl_outclk\,
	portadatain => \Memory_Stage|altsyncram_component|auto_generated|ram_block1a14_PORTADATAIN_bus\,
	portaaddr => \Memory_Stage|altsyncram_component|auto_generated|ram_block1a14_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \Memory_Stage|altsyncram_component|auto_generated|ram_block1a14_PORTADATAOUT_bus\);

-- Location: UNVM_X0_Y40_N40
\~QUARTUS_CREATED_UNVM~\ : fiftyfivenm_unvm
-- pragma translate_off
GENERIC MAP (
	addr_range1_end_addr => -1,
	addr_range1_offset => -1,
	addr_range2_offset => -1,
	is_compressed_image => "false",
	is_dual_boot => "false",
	is_eram_skip => "false",
	max_ufm_valid_addr => -1,
	max_valid_addr => -1,
	min_ufm_valid_addr => -1,
	min_valid_addr => -1,
	part_name => "quartus_created_unvm",
	reserve_block => "true")
-- pragma translate_on
PORT MAP (
	nosc_ena => \~QUARTUS_CREATED_GND~I_combout\,
	xe_ye => \~QUARTUS_CREATED_GND~I_combout\,
	se => \~QUARTUS_CREATED_GND~I_combout\,
	busy => \~QUARTUS_CREATED_UNVM~~busy\);

-- Location: ADCBLOCK_X43_Y52_N0
\~QUARTUS_CREATED_ADC1~\ : fiftyfivenm_adcblock
-- pragma translate_off
GENERIC MAP (
	analog_input_pin_mask => 0,
	clkdiv => 1,
	device_partname_fivechar_prefix => "none",
	is_this_first_or_second_adc => 1,
	prescalar => 0,
	pwd => 1,
	refsel => 0,
	reserve_block => "true",
	testbits => 66,
	tsclkdiv => 1,
	tsclksel => 0)
-- pragma translate_on
PORT MAP (
	soc => \~QUARTUS_CREATED_GND~I_combout\,
	usr_pwd => VCC,
	tsen => \~QUARTUS_CREATED_GND~I_combout\,
	chsel => \~QUARTUS_CREATED_ADC1~_CHSEL_bus\,
	eoc => \~QUARTUS_CREATED_ADC1~~eoc\);

-- Location: ADCBLOCK_X43_Y51_N0
\~QUARTUS_CREATED_ADC2~\ : fiftyfivenm_adcblock
-- pragma translate_off
GENERIC MAP (
	analog_input_pin_mask => 0,
	clkdiv => 1,
	device_partname_fivechar_prefix => "none",
	is_this_first_or_second_adc => 2,
	prescalar => 0,
	pwd => 1,
	refsel => 0,
	reserve_block => "true",
	testbits => 66,
	tsclkdiv => 1,
	tsclksel => 0)
-- pragma translate_on
PORT MAP (
	soc => \~QUARTUS_CREATED_GND~I_combout\,
	usr_pwd => VCC,
	tsen => \~QUARTUS_CREATED_GND~I_combout\,
	chsel => \~QUARTUS_CREATED_ADC2~_CHSEL_bus\,
	eoc => \~QUARTUS_CREATED_ADC2~~eoc\);

ww_Curr_Address(0) <= \Curr_Address[0]~output_o\;

ww_Curr_Address(1) <= \Curr_Address[1]~output_o\;

ww_Curr_Address(2) <= \Curr_Address[2]~output_o\;

ww_Curr_Address(3) <= \Curr_Address[3]~output_o\;

ww_Curr_Address(4) <= \Curr_Address[4]~output_o\;

ww_Curr_Address(5) <= \Curr_Address[5]~output_o\;

ww_Curr_Address(6) <= \Curr_Address[6]~output_o\;

ww_Curr_Address(7) <= \Curr_Address[7]~output_o\;

ww_Curr_Address(8) <= \Curr_Address[8]~output_o\;

ww_Curr_Address(9) <= \Curr_Address[9]~output_o\;

ww_Curr_Address(10) <= \Curr_Address[10]~output_o\;

ww_Curr_Address(11) <= \Curr_Address[11]~output_o\;

ww_Curr_Address(12) <= \Curr_Address[12]~output_o\;

ww_Curr_Address(13) <= \Curr_Address[13]~output_o\;

ww_Curr_Address(14) <= \Curr_Address[14]~output_o\;

ww_Curr_Address(15) <= \Curr_Address[15]~output_o\;

ww_Curr_Address(16) <= \Curr_Address[16]~output_o\;

ww_Curr_Address(17) <= \Curr_Address[17]~output_o\;

ww_Curr_Address(18) <= \Curr_Address[18]~output_o\;

ww_Curr_Address(19) <= \Curr_Address[19]~output_o\;

ww_Curr_Address(20) <= \Curr_Address[20]~output_o\;

ww_Curr_Address(21) <= \Curr_Address[21]~output_o\;

ww_Curr_Address(22) <= \Curr_Address[22]~output_o\;

ww_Curr_Address(23) <= \Curr_Address[23]~output_o\;

ww_Curr_Address(24) <= \Curr_Address[24]~output_o\;

ww_Curr_Address(25) <= \Curr_Address[25]~output_o\;

ww_Curr_Address(26) <= \Curr_Address[26]~output_o\;

ww_Curr_Address(27) <= \Curr_Address[27]~output_o\;

ww_Curr_Address(28) <= \Curr_Address[28]~output_o\;

ww_Curr_Address(29) <= \Curr_Address[29]~output_o\;

ww_Curr_Address(30) <= \Curr_Address[30]~output_o\;

ww_Curr_Address(31) <= \Curr_Address[31]~output_o\;

ww_Instruction(0) <= \Instruction[0]~output_o\;

ww_Instruction(1) <= \Instruction[1]~output_o\;

ww_Instruction(2) <= \Instruction[2]~output_o\;

ww_Instruction(3) <= \Instruction[3]~output_o\;

ww_Instruction(4) <= \Instruction[4]~output_o\;

ww_Instruction(5) <= \Instruction[5]~output_o\;

ww_Instruction(6) <= \Instruction[6]~output_o\;

ww_Instruction(7) <= \Instruction[7]~output_o\;

ww_Instruction(8) <= \Instruction[8]~output_o\;

ww_Instruction(9) <= \Instruction[9]~output_o\;

ww_Instruction(10) <= \Instruction[10]~output_o\;

ww_Instruction(11) <= \Instruction[11]~output_o\;

ww_Instruction(12) <= \Instruction[12]~output_o\;

ww_Instruction(13) <= \Instruction[13]~output_o\;

ww_Instruction(14) <= \Instruction[14]~output_o\;

ww_Instruction(15) <= \Instruction[15]~output_o\;

ww_Instruction(16) <= \Instruction[16]~output_o\;

ww_Instruction(17) <= \Instruction[17]~output_o\;

ww_Instruction(18) <= \Instruction[18]~output_o\;

ww_Instruction(19) <= \Instruction[19]~output_o\;

ww_Instruction(20) <= \Instruction[20]~output_o\;

ww_Instruction(21) <= \Instruction[21]~output_o\;

ww_Instruction(22) <= \Instruction[22]~output_o\;

ww_Instruction(23) <= \Instruction[23]~output_o\;

ww_Instruction(24) <= \Instruction[24]~output_o\;

ww_Instruction(25) <= \Instruction[25]~output_o\;

ww_Instruction(26) <= \Instruction[26]~output_o\;

ww_Instruction(27) <= \Instruction[27]~output_o\;

ww_Instruction(28) <= \Instruction[28]~output_o\;

ww_Instruction(29) <= \Instruction[29]~output_o\;

ww_Instruction(30) <= \Instruction[30]~output_o\;

ww_Instruction(31) <= \Instruction[31]~output_o\;
END structure;


