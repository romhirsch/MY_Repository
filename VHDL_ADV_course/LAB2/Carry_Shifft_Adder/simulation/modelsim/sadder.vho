-- Copyright (C) 2018  Intel Corporation. All rights reserved.
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
-- VERSION "Version 18.1.0 Build 625 09/12/2018 SJ Lite Edition"

-- DATE "10/24/2021 18:55:18"

-- 
-- Device: Altera 5CGXFC7C7F23C8 Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	CSA_adder IS
    PORT (
	A : IN std_logic_vector(15 DOWNTO 0);
	B : IN std_logic_vector(15 DOWNTO 0);
	Carry_in : IN std_logic;
	Carry_out : OUT std_logic;
	res : OUT std_logic_vector(15 DOWNTO 0)
	);
END CSA_adder;

-- Design Ports Information
-- Carry_out	=>  Location: PIN_AA7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- res[0]	=>  Location: PIN_AA12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- res[1]	=>  Location: PIN_AB13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- res[2]	=>  Location: PIN_U8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- res[3]	=>  Location: PIN_U7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- res[4]	=>  Location: PIN_R5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- res[5]	=>  Location: PIN_R6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- res[6]	=>  Location: PIN_W8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- res[7]	=>  Location: PIN_AB6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- res[8]	=>  Location: PIN_AB5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- res[9]	=>  Location: PIN_V10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- res[10]	=>  Location: PIN_V9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- res[11]	=>  Location: PIN_AB12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- res[12]	=>  Location: PIN_R11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- res[13]	=>  Location: PIN_R10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- res[14]	=>  Location: PIN_M9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- res[15]	=>  Location: PIN_AB10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A[5]	=>  Location: PIN_U6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B[5]	=>  Location: PIN_N6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A[4]	=>  Location: PIN_P6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B[4]	=>  Location: PIN_T7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A[6]	=>  Location: PIN_T8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B[6]	=>  Location: PIN_M6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A[2]	=>  Location: PIN_W9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B[2]	=>  Location: PIN_V6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A[3]	=>  Location: PIN_P7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B[3]	=>  Location: PIN_M7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A[0]	=>  Location: PIN_U12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B[0]	=>  Location: PIN_P9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Carry_in	=>  Location: PIN_Y11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A[1]	=>  Location: PIN_N9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B[1]	=>  Location: PIN_AB11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B[10]	=>  Location: PIN_P8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A[10]	=>  Location: PIN_AB8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B[15]	=>  Location: PIN_Y10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A[15]	=>  Location: PIN_AA9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A[7]	=>  Location: PIN_AB7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B[7]	=>  Location: PIN_T9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A[8]	=>  Location: PIN_AA8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B[8]	=>  Location: PIN_U10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A[9]	=>  Location: PIN_R7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B[9]	=>  Location: PIN_N8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A[11]	=>  Location: PIN_R12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B[11]	=>  Location: PIN_R9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A[12]	=>  Location: PIN_M8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B[12]	=>  Location: PIN_T10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A[13]	=>  Location: PIN_U11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B[13]	=>  Location: PIN_P12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A[14]	=>  Location: PIN_Y9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B[14]	=>  Location: PIN_AA10,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF CSA_adder IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_A : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_B : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_Carry_in : std_logic;
SIGNAL ww_Carry_out : std_logic;
SIGNAL ww_res : std_logic_vector(15 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \A[6]~input_o\ : std_logic;
SIGNAL \B[4]~input_o\ : std_logic;
SIGNAL \B[5]~input_o\ : std_logic;
SIGNAL \A[5]~input_o\ : std_logic;
SIGNAL \A[4]~input_o\ : std_logic;
SIGNAL \B[6]~input_o\ : std_logic;
SIGNAL \GEN_ADD:3:GEN_ADDi:CSA_i|carry_out~0_combout\ : std_logic;
SIGNAL \GEN_ADD:3:GEN_ADDi:CSA_i|Add1~1_combout\ : std_logic;
SIGNAL \B[2]~input_o\ : std_logic;
SIGNAL \B[3]~input_o\ : std_logic;
SIGNAL \A[2]~input_o\ : std_logic;
SIGNAL \A[3]~input_o\ : std_logic;
SIGNAL \GEN_ADD:2:GEN_ADDi:CSA_i|Add1~0_combout\ : std_logic;
SIGNAL \GEN_ADD:2:GEN_ADDi:CSA_i|carry_out~0_combout\ : std_logic;
SIGNAL \GEN_ADD:3:GEN_ADDi:CSA_i|Add1~0_combout\ : std_logic;
SIGNAL \B[0]~input_o\ : std_logic;
SIGNAL \A[1]~input_o\ : std_logic;
SIGNAL \A[0]~input_o\ : std_logic;
SIGNAL \B[1]~input_o\ : std_logic;
SIGNAL \Carry_in~input_o\ : std_logic;
SIGNAL \GEN_ADD:1:GEN_ADDi:CSA_i|carry_out~0_combout\ : std_logic;
SIGNAL \GEN_ADD:3:GEN_ADDi:CSA_i|carry_out~1_combout\ : std_logic;
SIGNAL \A[15]~input_o\ : std_logic;
SIGNAL \B[15]~input_o\ : std_logic;
SIGNAL \A[14]~input_o\ : std_logic;
SIGNAL \B[14]~input_o\ : std_logic;
SIGNAL \A[13]~input_o\ : std_logic;
SIGNAL \B[13]~input_o\ : std_logic;
SIGNAL \A[12]~input_o\ : std_logic;
SIGNAL \B[12]~input_o\ : std_logic;
SIGNAL \B[11]~input_o\ : std_logic;
SIGNAL \A[11]~input_o\ : std_logic;
SIGNAL \GEN_ADD:5:GEN_ADDi:CSA_i|Add1~6\ : std_logic;
SIGNAL \GEN_ADD:5:GEN_ADDi:CSA_i|Add1~10\ : std_logic;
SIGNAL \GEN_ADD:5:GEN_ADDi:CSA_i|Add1~14\ : std_logic;
SIGNAL \GEN_ADD:5:GEN_ADDi:CSA_i|Add1~18\ : std_logic;
SIGNAL \GEN_ADD:5:GEN_ADDi:CSA_i|Add1~1_sumout\ : std_logic;
SIGNAL \B[10]~input_o\ : std_logic;
SIGNAL \A[10]~input_o\ : std_logic;
SIGNAL \B[9]~input_o\ : std_logic;
SIGNAL \A[9]~input_o\ : std_logic;
SIGNAL \B[8]~input_o\ : std_logic;
SIGNAL \A[8]~input_o\ : std_logic;
SIGNAL \B[7]~input_o\ : std_logic;
SIGNAL \A[7]~input_o\ : std_logic;
SIGNAL \GEN_ADD:4:GEN_ADDi:CSA_i|t1[1]~2\ : std_logic;
SIGNAL \GEN_ADD:4:GEN_ADDi:CSA_i|t1[1]~3\ : std_logic;
SIGNAL \GEN_ADD:4:GEN_ADDi:CSA_i|t1[2]~6\ : std_logic;
SIGNAL \GEN_ADD:4:GEN_ADDi:CSA_i|t1[2]~7\ : std_logic;
SIGNAL \GEN_ADD:4:GEN_ADDi:CSA_i|t1[3]~10\ : std_logic;
SIGNAL \GEN_ADD:4:GEN_ADDi:CSA_i|t1[3]~11\ : std_logic;
SIGNAL \GEN_ADD:4:GEN_ADDi:CSA_i|t1[4]~14\ : std_logic;
SIGNAL \GEN_ADD:4:GEN_ADDi:CSA_i|t1[4]~15\ : std_logic;
SIGNAL \GEN_ADD:4:GEN_ADDi:CSA_i|Add0~1_sumout\ : std_logic;
SIGNAL \GEN_ADD:4:GEN_ADDi:CSA_i|Add1~6\ : std_logic;
SIGNAL \GEN_ADD:4:GEN_ADDi:CSA_i|Add1~10\ : std_logic;
SIGNAL \GEN_ADD:4:GEN_ADDi:CSA_i|Add1~14\ : std_logic;
SIGNAL \GEN_ADD:4:GEN_ADDi:CSA_i|Add1~1_sumout\ : std_logic;
SIGNAL \GEN_ADD:5:GEN_ADDi:CSA_i|t1[1]~2\ : std_logic;
SIGNAL \GEN_ADD:5:GEN_ADDi:CSA_i|t1[1]~3\ : std_logic;
SIGNAL \GEN_ADD:5:GEN_ADDi:CSA_i|t1[2]~6\ : std_logic;
SIGNAL \GEN_ADD:5:GEN_ADDi:CSA_i|t1[2]~7\ : std_logic;
SIGNAL \GEN_ADD:5:GEN_ADDi:CSA_i|t1[3]~10\ : std_logic;
SIGNAL \GEN_ADD:5:GEN_ADDi:CSA_i|t1[3]~11\ : std_logic;
SIGNAL \GEN_ADD:5:GEN_ADDi:CSA_i|t1[4]~14\ : std_logic;
SIGNAL \GEN_ADD:5:GEN_ADDi:CSA_i|t1[4]~15\ : std_logic;
SIGNAL \GEN_ADD:5:GEN_ADDi:CSA_i|t1[5]~18\ : std_logic;
SIGNAL \GEN_ADD:5:GEN_ADDi:CSA_i|t1[5]~19\ : std_logic;
SIGNAL \GEN_ADD:5:GEN_ADDi:CSA_i|Add0~1_sumout\ : std_logic;
SIGNAL \GEN_ADD:5:GEN_ADDi:CSA_i|carry_out~0_combout\ : std_logic;
SIGNAL \GEN_ADD:0:GEN_ADD0:CSA0|s[0]~0_combout\ : std_logic;
SIGNAL \GEN_ADD:1:GEN_ADDi:CSA_i|s[0]~0_combout\ : std_logic;
SIGNAL \GEN_ADD:2:GEN_ADDi:CSA_i|s[0]~0_combout\ : std_logic;
SIGNAL \GEN_ADD:2:GEN_ADDi:CSA_i|s[1]~1_combout\ : std_logic;
SIGNAL \GEN_ADD:3:GEN_ADDi:CSA_i|s[0]~0_combout\ : std_logic;
SIGNAL \GEN_ADD:3:GEN_ADDi:CSA_i|s[1]~2_combout\ : std_logic;
SIGNAL \GEN_ADD:3:GEN_ADDi:CSA_i|Add0~0_combout\ : std_logic;
SIGNAL \GEN_ADD:3:GEN_ADDi:CSA_i|s[2]~1_combout\ : std_logic;
SIGNAL \GEN_ADD:4:GEN_ADDi:CSA_i|t1[1]~1_sumout\ : std_logic;
SIGNAL \GEN_ADD:4:GEN_ADDi:CSA_i|Add1~5_sumout\ : std_logic;
SIGNAL \GEN_ADD:4:GEN_ADDi:CSA_i|s[0]~0_combout\ : std_logic;
SIGNAL \GEN_ADD:4:GEN_ADDi:CSA_i|t1[2]~5_sumout\ : std_logic;
SIGNAL \GEN_ADD:4:GEN_ADDi:CSA_i|Add1~9_sumout\ : std_logic;
SIGNAL \GEN_ADD:4:GEN_ADDi:CSA_i|s[1]~1_combout\ : std_logic;
SIGNAL \GEN_ADD:4:GEN_ADDi:CSA_i|Add1~13_sumout\ : std_logic;
SIGNAL \GEN_ADD:4:GEN_ADDi:CSA_i|t1[3]~9_sumout\ : std_logic;
SIGNAL \GEN_ADD:4:GEN_ADDi:CSA_i|s[2]~2_combout\ : std_logic;
SIGNAL \GEN_ADD:4:GEN_ADDi:CSA_i|t1[4]~13_sumout\ : std_logic;
SIGNAL \GEN_ADD:4:GEN_ADDi:CSA_i|s[3]~3_combout\ : std_logic;
SIGNAL \GEN_ADD:5:GEN_ADDi:CSA_i|t1[1]~1_sumout\ : std_logic;
SIGNAL \GEN_ADD:5:GEN_ADDi:CSA_i|Add1~5_sumout\ : std_logic;
SIGNAL \GEN_ADD:5:GEN_ADDi:CSA_i|s[0]~0_combout\ : std_logic;
SIGNAL \GEN_ADD:5:GEN_ADDi:CSA_i|t1[2]~5_sumout\ : std_logic;
SIGNAL \GEN_ADD:5:GEN_ADDi:CSA_i|Add1~9_sumout\ : std_logic;
SIGNAL \GEN_ADD:5:GEN_ADDi:CSA_i|s[1]~1_combout\ : std_logic;
SIGNAL \GEN_ADD:5:GEN_ADDi:CSA_i|Add1~13_sumout\ : std_logic;
SIGNAL \GEN_ADD:5:GEN_ADDi:CSA_i|t1[3]~9_sumout\ : std_logic;
SIGNAL \GEN_ADD:5:GEN_ADDi:CSA_i|s[2]~2_combout\ : std_logic;
SIGNAL \GEN_ADD:5:GEN_ADDi:CSA_i|Add1~17_sumout\ : std_logic;
SIGNAL \GEN_ADD:5:GEN_ADDi:CSA_i|t1[4]~13_sumout\ : std_logic;
SIGNAL \GEN_ADD:5:GEN_ADDi:CSA_i|s[3]~3_combout\ : std_logic;
SIGNAL \GEN_ADD:5:GEN_ADDi:CSA_i|t1[5]~17_sumout\ : std_logic;
SIGNAL \GEN_ADD:5:GEN_ADDi:CSA_i|s[4]~4_combout\ : std_logic;
SIGNAL \GEN_ADD:3:GEN_ADDi:CSA_i|ALT_INV_Add0~0_combout\ : std_logic;
SIGNAL \GEN_ADD:3:GEN_ADDi:CSA_i|ALT_INV_carry_out~1_combout\ : std_logic;
SIGNAL \GEN_ADD:3:GEN_ADDi:CSA_i|ALT_INV_carry_out~0_combout\ : std_logic;
SIGNAL \GEN_ADD:2:GEN_ADDi:CSA_i|ALT_INV_carry_out~0_combout\ : std_logic;
SIGNAL \GEN_ADD:1:GEN_ADDi:CSA_i|ALT_INV_carry_out~0_combout\ : std_logic;
SIGNAL \GEN_ADD:2:GEN_ADDi:CSA_i|ALT_INV_Add1~0_combout\ : std_logic;
SIGNAL \GEN_ADD:3:GEN_ADDi:CSA_i|ALT_INV_Add1~1_combout\ : std_logic;
SIGNAL \GEN_ADD:3:GEN_ADDi:CSA_i|ALT_INV_Add1~0_combout\ : std_logic;
SIGNAL \GEN_ADD:5:GEN_ADDi:CSA_i|ALT_INV_t1[5]~17_sumout\ : std_logic;
SIGNAL \GEN_ADD:5:GEN_ADDi:CSA_i|ALT_INV_Add1~17_sumout\ : std_logic;
SIGNAL \GEN_ADD:5:GEN_ADDi:CSA_i|ALT_INV_t1[4]~13_sumout\ : std_logic;
SIGNAL \GEN_ADD:5:GEN_ADDi:CSA_i|ALT_INV_Add1~13_sumout\ : std_logic;
SIGNAL \GEN_ADD:5:GEN_ADDi:CSA_i|ALT_INV_t1[3]~9_sumout\ : std_logic;
SIGNAL \GEN_ADD:5:GEN_ADDi:CSA_i|ALT_INV_Add1~9_sumout\ : std_logic;
SIGNAL \GEN_ADD:5:GEN_ADDi:CSA_i|ALT_INV_t1[2]~5_sumout\ : std_logic;
SIGNAL \GEN_ADD:5:GEN_ADDi:CSA_i|ALT_INV_Add1~5_sumout\ : std_logic;
SIGNAL \GEN_ADD:5:GEN_ADDi:CSA_i|ALT_INV_t1[1]~1_sumout\ : std_logic;
SIGNAL \GEN_ADD:4:GEN_ADDi:CSA_i|ALT_INV_t1[4]~13_sumout\ : std_logic;
SIGNAL \GEN_ADD:4:GEN_ADDi:CSA_i|ALT_INV_Add1~13_sumout\ : std_logic;
SIGNAL \GEN_ADD:4:GEN_ADDi:CSA_i|ALT_INV_t1[3]~9_sumout\ : std_logic;
SIGNAL \GEN_ADD:4:GEN_ADDi:CSA_i|ALT_INV_Add1~9_sumout\ : std_logic;
SIGNAL \GEN_ADD:4:GEN_ADDi:CSA_i|ALT_INV_t1[2]~5_sumout\ : std_logic;
SIGNAL \GEN_ADD:4:GEN_ADDi:CSA_i|ALT_INV_Add1~5_sumout\ : std_logic;
SIGNAL \GEN_ADD:4:GEN_ADDi:CSA_i|ALT_INV_t1[1]~1_sumout\ : std_logic;
SIGNAL \GEN_ADD:5:GEN_ADDi:CSA_i|ALT_INV_Add1~1_sumout\ : std_logic;
SIGNAL \GEN_ADD:4:GEN_ADDi:CSA_i|ALT_INV_Add1~1_sumout\ : std_logic;
SIGNAL \GEN_ADD:4:GEN_ADDi:CSA_i|ALT_INV_Add0~1_sumout\ : std_logic;
SIGNAL \GEN_ADD:5:GEN_ADDi:CSA_i|ALT_INV_Add0~1_sumout\ : std_logic;
SIGNAL \ALT_INV_B[14]~input_o\ : std_logic;
SIGNAL \ALT_INV_A[14]~input_o\ : std_logic;
SIGNAL \ALT_INV_B[13]~input_o\ : std_logic;
SIGNAL \ALT_INV_A[13]~input_o\ : std_logic;
SIGNAL \ALT_INV_B[12]~input_o\ : std_logic;
SIGNAL \ALT_INV_A[12]~input_o\ : std_logic;
SIGNAL \ALT_INV_B[11]~input_o\ : std_logic;
SIGNAL \ALT_INV_A[11]~input_o\ : std_logic;
SIGNAL \ALT_INV_B[9]~input_o\ : std_logic;
SIGNAL \ALT_INV_A[9]~input_o\ : std_logic;
SIGNAL \ALT_INV_B[8]~input_o\ : std_logic;
SIGNAL \ALT_INV_A[8]~input_o\ : std_logic;
SIGNAL \ALT_INV_B[7]~input_o\ : std_logic;
SIGNAL \ALT_INV_A[7]~input_o\ : std_logic;
SIGNAL \ALT_INV_A[15]~input_o\ : std_logic;
SIGNAL \ALT_INV_B[15]~input_o\ : std_logic;
SIGNAL \ALT_INV_A[10]~input_o\ : std_logic;
SIGNAL \ALT_INV_B[10]~input_o\ : std_logic;
SIGNAL \ALT_INV_B[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_A[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_Carry_in~input_o\ : std_logic;
SIGNAL \ALT_INV_B[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_A[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_B[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_A[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_B[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_A[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_B[6]~input_o\ : std_logic;
SIGNAL \ALT_INV_A[6]~input_o\ : std_logic;
SIGNAL \ALT_INV_B[4]~input_o\ : std_logic;
SIGNAL \ALT_INV_A[4]~input_o\ : std_logic;
SIGNAL \ALT_INV_B[5]~input_o\ : std_logic;
SIGNAL \ALT_INV_A[5]~input_o\ : std_logic;

BEGIN

ww_A <= A;
ww_B <= B;
ww_Carry_in <= Carry_in;
Carry_out <= ww_Carry_out;
res <= ww_res;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\GEN_ADD:3:GEN_ADDi:CSA_i|ALT_INV_Add0~0_combout\ <= NOT \GEN_ADD:3:GEN_ADDi:CSA_i|Add0~0_combout\;
\GEN_ADD:3:GEN_ADDi:CSA_i|ALT_INV_carry_out~1_combout\ <= NOT \GEN_ADD:3:GEN_ADDi:CSA_i|carry_out~1_combout\;
\GEN_ADD:3:GEN_ADDi:CSA_i|ALT_INV_carry_out~0_combout\ <= NOT \GEN_ADD:3:GEN_ADDi:CSA_i|carry_out~0_combout\;
\GEN_ADD:2:GEN_ADDi:CSA_i|ALT_INV_carry_out~0_combout\ <= NOT \GEN_ADD:2:GEN_ADDi:CSA_i|carry_out~0_combout\;
\GEN_ADD:1:GEN_ADDi:CSA_i|ALT_INV_carry_out~0_combout\ <= NOT \GEN_ADD:1:GEN_ADDi:CSA_i|carry_out~0_combout\;
\GEN_ADD:2:GEN_ADDi:CSA_i|ALT_INV_Add1~0_combout\ <= NOT \GEN_ADD:2:GEN_ADDi:CSA_i|Add1~0_combout\;
\GEN_ADD:3:GEN_ADDi:CSA_i|ALT_INV_Add1~1_combout\ <= NOT \GEN_ADD:3:GEN_ADDi:CSA_i|Add1~1_combout\;
\GEN_ADD:3:GEN_ADDi:CSA_i|ALT_INV_Add1~0_combout\ <= NOT \GEN_ADD:3:GEN_ADDi:CSA_i|Add1~0_combout\;
\GEN_ADD:5:GEN_ADDi:CSA_i|ALT_INV_t1[5]~17_sumout\ <= NOT \GEN_ADD:5:GEN_ADDi:CSA_i|t1[5]~17_sumout\;
\GEN_ADD:5:GEN_ADDi:CSA_i|ALT_INV_Add1~17_sumout\ <= NOT \GEN_ADD:5:GEN_ADDi:CSA_i|Add1~17_sumout\;
\GEN_ADD:5:GEN_ADDi:CSA_i|ALT_INV_t1[4]~13_sumout\ <= NOT \GEN_ADD:5:GEN_ADDi:CSA_i|t1[4]~13_sumout\;
\GEN_ADD:5:GEN_ADDi:CSA_i|ALT_INV_Add1~13_sumout\ <= NOT \GEN_ADD:5:GEN_ADDi:CSA_i|Add1~13_sumout\;
\GEN_ADD:5:GEN_ADDi:CSA_i|ALT_INV_t1[3]~9_sumout\ <= NOT \GEN_ADD:5:GEN_ADDi:CSA_i|t1[3]~9_sumout\;
\GEN_ADD:5:GEN_ADDi:CSA_i|ALT_INV_Add1~9_sumout\ <= NOT \GEN_ADD:5:GEN_ADDi:CSA_i|Add1~9_sumout\;
\GEN_ADD:5:GEN_ADDi:CSA_i|ALT_INV_t1[2]~5_sumout\ <= NOT \GEN_ADD:5:GEN_ADDi:CSA_i|t1[2]~5_sumout\;
\GEN_ADD:5:GEN_ADDi:CSA_i|ALT_INV_Add1~5_sumout\ <= NOT \GEN_ADD:5:GEN_ADDi:CSA_i|Add1~5_sumout\;
\GEN_ADD:5:GEN_ADDi:CSA_i|ALT_INV_t1[1]~1_sumout\ <= NOT \GEN_ADD:5:GEN_ADDi:CSA_i|t1[1]~1_sumout\;
\GEN_ADD:4:GEN_ADDi:CSA_i|ALT_INV_t1[4]~13_sumout\ <= NOT \GEN_ADD:4:GEN_ADDi:CSA_i|t1[4]~13_sumout\;
\GEN_ADD:4:GEN_ADDi:CSA_i|ALT_INV_Add1~13_sumout\ <= NOT \GEN_ADD:4:GEN_ADDi:CSA_i|Add1~13_sumout\;
\GEN_ADD:4:GEN_ADDi:CSA_i|ALT_INV_t1[3]~9_sumout\ <= NOT \GEN_ADD:4:GEN_ADDi:CSA_i|t1[3]~9_sumout\;
\GEN_ADD:4:GEN_ADDi:CSA_i|ALT_INV_Add1~9_sumout\ <= NOT \GEN_ADD:4:GEN_ADDi:CSA_i|Add1~9_sumout\;
\GEN_ADD:4:GEN_ADDi:CSA_i|ALT_INV_t1[2]~5_sumout\ <= NOT \GEN_ADD:4:GEN_ADDi:CSA_i|t1[2]~5_sumout\;
\GEN_ADD:4:GEN_ADDi:CSA_i|ALT_INV_Add1~5_sumout\ <= NOT \GEN_ADD:4:GEN_ADDi:CSA_i|Add1~5_sumout\;
\GEN_ADD:4:GEN_ADDi:CSA_i|ALT_INV_t1[1]~1_sumout\ <= NOT \GEN_ADD:4:GEN_ADDi:CSA_i|t1[1]~1_sumout\;
\GEN_ADD:5:GEN_ADDi:CSA_i|ALT_INV_Add1~1_sumout\ <= NOT \GEN_ADD:5:GEN_ADDi:CSA_i|Add1~1_sumout\;
\GEN_ADD:4:GEN_ADDi:CSA_i|ALT_INV_Add1~1_sumout\ <= NOT \GEN_ADD:4:GEN_ADDi:CSA_i|Add1~1_sumout\;
\GEN_ADD:4:GEN_ADDi:CSA_i|ALT_INV_Add0~1_sumout\ <= NOT \GEN_ADD:4:GEN_ADDi:CSA_i|Add0~1_sumout\;
\GEN_ADD:5:GEN_ADDi:CSA_i|ALT_INV_Add0~1_sumout\ <= NOT \GEN_ADD:5:GEN_ADDi:CSA_i|Add0~1_sumout\;
\ALT_INV_B[14]~input_o\ <= NOT \B[14]~input_o\;
\ALT_INV_A[14]~input_o\ <= NOT \A[14]~input_o\;
\ALT_INV_B[13]~input_o\ <= NOT \B[13]~input_o\;
\ALT_INV_A[13]~input_o\ <= NOT \A[13]~input_o\;
\ALT_INV_B[12]~input_o\ <= NOT \B[12]~input_o\;
\ALT_INV_A[12]~input_o\ <= NOT \A[12]~input_o\;
\ALT_INV_B[11]~input_o\ <= NOT \B[11]~input_o\;
\ALT_INV_A[11]~input_o\ <= NOT \A[11]~input_o\;
\ALT_INV_B[9]~input_o\ <= NOT \B[9]~input_o\;
\ALT_INV_A[9]~input_o\ <= NOT \A[9]~input_o\;
\ALT_INV_B[8]~input_o\ <= NOT \B[8]~input_o\;
\ALT_INV_A[8]~input_o\ <= NOT \A[8]~input_o\;
\ALT_INV_B[7]~input_o\ <= NOT \B[7]~input_o\;
\ALT_INV_A[7]~input_o\ <= NOT \A[7]~input_o\;
\ALT_INV_A[15]~input_o\ <= NOT \A[15]~input_o\;
\ALT_INV_B[15]~input_o\ <= NOT \B[15]~input_o\;
\ALT_INV_A[10]~input_o\ <= NOT \A[10]~input_o\;
\ALT_INV_B[10]~input_o\ <= NOT \B[10]~input_o\;
\ALT_INV_B[1]~input_o\ <= NOT \B[1]~input_o\;
\ALT_INV_A[1]~input_o\ <= NOT \A[1]~input_o\;
\ALT_INV_Carry_in~input_o\ <= NOT \Carry_in~input_o\;
\ALT_INV_B[0]~input_o\ <= NOT \B[0]~input_o\;
\ALT_INV_A[0]~input_o\ <= NOT \A[0]~input_o\;
\ALT_INV_B[3]~input_o\ <= NOT \B[3]~input_o\;
\ALT_INV_A[3]~input_o\ <= NOT \A[3]~input_o\;
\ALT_INV_B[2]~input_o\ <= NOT \B[2]~input_o\;
\ALT_INV_A[2]~input_o\ <= NOT \A[2]~input_o\;
\ALT_INV_B[6]~input_o\ <= NOT \B[6]~input_o\;
\ALT_INV_A[6]~input_o\ <= NOT \A[6]~input_o\;
\ALT_INV_B[4]~input_o\ <= NOT \B[4]~input_o\;
\ALT_INV_A[4]~input_o\ <= NOT \A[4]~input_o\;
\ALT_INV_B[5]~input_o\ <= NOT \B[5]~input_o\;
\ALT_INV_A[5]~input_o\ <= NOT \A[5]~input_o\;

-- Location: IOOBUF_X28_Y0_N53
\Carry_out~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \GEN_ADD:5:GEN_ADDi:CSA_i|carry_out~0_combout\,
	devoe => ww_devoe,
	o => ww_Carry_out);

-- Location: IOOBUF_X40_Y0_N36
\res[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \GEN_ADD:0:GEN_ADD0:CSA0|s[0]~0_combout\,
	devoe => ww_devoe,
	o => ww_res(0));

-- Location: IOOBUF_X50_Y0_N93
\res[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \GEN_ADD:1:GEN_ADDi:CSA_i|s[0]~0_combout\,
	devoe => ww_devoe,
	o => ww_res(1));

-- Location: IOOBUF_X2_Y0_N76
\res[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \GEN_ADD:2:GEN_ADDi:CSA_i|s[0]~0_combout\,
	devoe => ww_devoe,
	o => ww_res(2));

-- Location: IOOBUF_X2_Y0_N93
\res[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \GEN_ADD:2:GEN_ADDi:CSA_i|s[1]~1_combout\,
	devoe => ww_devoe,
	o => ww_res(3));

-- Location: IOOBUF_X2_Y0_N42
\res[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \GEN_ADD:3:GEN_ADDi:CSA_i|s[0]~0_combout\,
	devoe => ww_devoe,
	o => ww_res(4));

-- Location: IOOBUF_X2_Y0_N59
\res[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \GEN_ADD:3:GEN_ADDi:CSA_i|s[1]~2_combout\,
	devoe => ww_devoe,
	o => ww_res(5));

-- Location: IOOBUF_X4_Y0_N53
\res[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \GEN_ADD:3:GEN_ADDi:CSA_i|s[2]~1_combout\,
	devoe => ww_devoe,
	o => ww_res(6));

-- Location: IOOBUF_X26_Y0_N93
\res[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \GEN_ADD:4:GEN_ADDi:CSA_i|s[0]~0_combout\,
	devoe => ww_devoe,
	o => ww_res(7));

-- Location: IOOBUF_X26_Y0_N76
\res[8]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \GEN_ADD:4:GEN_ADDi:CSA_i|s[1]~1_combout\,
	devoe => ww_devoe,
	o => ww_res(8));

-- Location: IOOBUF_X26_Y0_N42
\res[9]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \GEN_ADD:4:GEN_ADDi:CSA_i|s[2]~2_combout\,
	devoe => ww_devoe,
	o => ww_res(9));

-- Location: IOOBUF_X26_Y0_N59
\res[10]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \GEN_ADD:4:GEN_ADDi:CSA_i|s[3]~3_combout\,
	devoe => ww_devoe,
	o => ww_res(10));

-- Location: IOOBUF_X50_Y0_N76
\res[11]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \GEN_ADD:5:GEN_ADDi:CSA_i|s[0]~0_combout\,
	devoe => ww_devoe,
	o => ww_res(11));

-- Location: IOOBUF_X38_Y0_N2
\res[12]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \GEN_ADD:5:GEN_ADDi:CSA_i|s[1]~1_combout\,
	devoe => ww_devoe,
	o => ww_res(12));

-- Location: IOOBUF_X38_Y0_N19
\res[13]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \GEN_ADD:5:GEN_ADDi:CSA_i|s[2]~2_combout\,
	devoe => ww_devoe,
	o => ww_res(13));

-- Location: IOOBUF_X32_Y0_N2
\res[14]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \GEN_ADD:5:GEN_ADDi:CSA_i|s[3]~3_combout\,
	devoe => ww_devoe,
	o => ww_res(14));

-- Location: IOOBUF_X38_Y0_N53
\res[15]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \GEN_ADD:5:GEN_ADDi:CSA_i|s[4]~4_combout\,
	devoe => ww_devoe,
	o => ww_res(15));

-- Location: IOIBUF_X6_Y0_N1
\A[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(6),
	o => \A[6]~input_o\);

-- Location: IOIBUF_X6_Y0_N18
\B[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(4),
	o => \B[4]~input_o\);

-- Location: IOIBUF_X4_Y0_N1
\B[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(5),
	o => \B[5]~input_o\);

-- Location: IOIBUF_X6_Y0_N52
\A[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(5),
	o => \A[5]~input_o\);

-- Location: IOIBUF_X4_Y0_N18
\A[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(4),
	o => \A[4]~input_o\);

-- Location: IOIBUF_X8_Y0_N18
\B[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(6),
	o => \B[6]~input_o\);

-- Location: MLABCELL_X6_Y1_N0
\GEN_ADD:3:GEN_ADDi:CSA_i|carry_out~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \GEN_ADD:3:GEN_ADDi:CSA_i|carry_out~0_combout\ = ( \A[4]~input_o\ & ( \B[6]~input_o\ & ( (!\A[6]~input_o\ & (!\B[5]~input_o\ & !\A[5]~input_o\)) ) ) ) # ( !\A[4]~input_o\ & ( \B[6]~input_o\ & ( (!\A[6]~input_o\ & ((!\B[4]~input_o\ & ((!\B[5]~input_o\) # 
-- (!\A[5]~input_o\))) # (\B[4]~input_o\ & (!\B[5]~input_o\ & !\A[5]~input_o\)))) ) ) ) # ( \A[4]~input_o\ & ( !\B[6]~input_o\ & ( (!\A[6]~input_o\) # ((!\B[5]~input_o\ & !\A[5]~input_o\)) ) ) ) # ( !\A[4]~input_o\ & ( !\B[6]~input_o\ & ( (!\A[6]~input_o\) # 
-- ((!\B[4]~input_o\ & ((!\B[5]~input_o\) # (!\A[5]~input_o\))) # (\B[4]~input_o\ & (!\B[5]~input_o\ & !\A[5]~input_o\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111011101010111110101010101010101000100000001010000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_A[6]~input_o\,
	datab => \ALT_INV_B[4]~input_o\,
	datac => \ALT_INV_B[5]~input_o\,
	datad => \ALT_INV_A[5]~input_o\,
	datae => \ALT_INV_A[4]~input_o\,
	dataf => \ALT_INV_B[6]~input_o\,
	combout => \GEN_ADD:3:GEN_ADDi:CSA_i|carry_out~0_combout\);

-- Location: MLABCELL_X6_Y1_N15
\GEN_ADD:3:GEN_ADDi:CSA_i|Add1~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \GEN_ADD:3:GEN_ADDi:CSA_i|Add1~1_combout\ = ( \B[6]~input_o\ & ( !\A[6]~input_o\ ) ) # ( !\B[6]~input_o\ & ( \A[6]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101010101010101010110101010101010101010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_A[6]~input_o\,
	dataf => \ALT_INV_B[6]~input_o\,
	combout => \GEN_ADD:3:GEN_ADDi:CSA_i|Add1~1_combout\);

-- Location: IOIBUF_X6_Y0_N35
\B[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(2),
	o => \B[2]~input_o\);

-- Location: IOIBUF_X8_Y0_N1
\B[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(3),
	o => \B[3]~input_o\);

-- Location: IOIBUF_X4_Y0_N35
\A[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(2),
	o => \A[2]~input_o\);

-- Location: IOIBUF_X8_Y0_N35
\A[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(3),
	o => \A[3]~input_o\);

-- Location: MLABCELL_X6_Y1_N18
\GEN_ADD:2:GEN_ADDi:CSA_i|Add1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \GEN_ADD:2:GEN_ADDi:CSA_i|Add1~0_combout\ = ( \A[3]~input_o\ & ( !\B[3]~input_o\ $ (((\B[2]~input_o\ & \A[2]~input_o\))) ) ) # ( !\A[3]~input_o\ & ( !\B[3]~input_o\ $ (((!\B[2]~input_o\) # (!\A[2]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011011000110110110010011100100100110110001101101100100111001001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_B[2]~input_o\,
	datab => \ALT_INV_B[3]~input_o\,
	datac => \ALT_INV_A[2]~input_o\,
	datae => \ALT_INV_A[3]~input_o\,
	combout => \GEN_ADD:2:GEN_ADDi:CSA_i|Add1~0_combout\);

-- Location: MLABCELL_X6_Y1_N57
\GEN_ADD:2:GEN_ADDi:CSA_i|carry_out~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \GEN_ADD:2:GEN_ADDi:CSA_i|carry_out~0_combout\ = ( \A[3]~input_o\ & ( ((\B[2]~input_o\) # (\B[3]~input_o\)) # (\A[2]~input_o\) ) ) # ( !\A[3]~input_o\ & ( (\B[3]~input_o\ & ((\B[2]~input_o\) # (\A[2]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100001111010111111111111100000101000011110101111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_A[2]~input_o\,
	datac => \ALT_INV_B[3]~input_o\,
	datad => \ALT_INV_B[2]~input_o\,
	datae => \ALT_INV_A[3]~input_o\,
	combout => \GEN_ADD:2:GEN_ADDi:CSA_i|carry_out~0_combout\);

-- Location: MLABCELL_X6_Y1_N36
\GEN_ADD:3:GEN_ADDi:CSA_i|Add1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \GEN_ADD:3:GEN_ADDi:CSA_i|Add1~0_combout\ = ( \A[5]~input_o\ & ( ((\A[4]~input_o\ & \B[4]~input_o\)) # (\B[5]~input_o\) ) ) # ( !\A[5]~input_o\ & ( (\B[5]~input_o\ & (\A[4]~input_o\ & \B[4]~input_o\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000100000001000000010000000101010111010101110101011101010111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_B[5]~input_o\,
	datab => \ALT_INV_A[4]~input_o\,
	datac => \ALT_INV_B[4]~input_o\,
	dataf => \ALT_INV_A[5]~input_o\,
	combout => \GEN_ADD:3:GEN_ADDi:CSA_i|Add1~0_combout\);

-- Location: IOIBUF_X40_Y0_N18
\B[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(0),
	o => \B[0]~input_o\);

-- Location: IOIBUF_X40_Y0_N1
\A[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(1),
	o => \A[1]~input_o\);

-- Location: IOIBUF_X36_Y0_N1
\A[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(0),
	o => \A[0]~input_o\);

-- Location: IOIBUF_X38_Y0_N35
\B[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(1),
	o => \B[1]~input_o\);

-- Location: IOIBUF_X40_Y0_N52
\Carry_in~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Carry_in,
	o => \Carry_in~input_o\);

-- Location: LABCELL_X36_Y1_N30
\GEN_ADD:1:GEN_ADDi:CSA_i|carry_out~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \GEN_ADD:1:GEN_ADDi:CSA_i|carry_out~0_combout\ = ( \B[1]~input_o\ & ( \Carry_in~input_o\ & ( ((!\A[1]~input_o\) # (\A[0]~input_o\)) # (\B[0]~input_o\) ) ) ) # ( !\B[1]~input_o\ & ( \Carry_in~input_o\ & ( \A[1]~input_o\ ) ) ) # ( \B[1]~input_o\ & ( 
-- !\Carry_in~input_o\ & ( (!\A[1]~input_o\) # (!\B[0]~input_o\ $ (!\A[0]~input_o\)) ) ) ) # ( !\B[1]~input_o\ & ( !\Carry_in~input_o\ & ( \A[1]~input_o\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011110111101101111000110011001100111101111111011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_B[0]~input_o\,
	datab => \ALT_INV_A[1]~input_o\,
	datac => \ALT_INV_A[0]~input_o\,
	datae => \ALT_INV_B[1]~input_o\,
	dataf => \ALT_INV_Carry_in~input_o\,
	combout => \GEN_ADD:1:GEN_ADDi:CSA_i|carry_out~0_combout\);

-- Location: MLABCELL_X6_Y1_N6
\GEN_ADD:3:GEN_ADDi:CSA_i|carry_out~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \GEN_ADD:3:GEN_ADDi:CSA_i|carry_out~1_combout\ = ( \GEN_ADD:3:GEN_ADDi:CSA_i|Add1~0_combout\ & ( \GEN_ADD:1:GEN_ADDi:CSA_i|carry_out~0_combout\ & ( (!\GEN_ADD:2:GEN_ADDi:CSA_i|carry_out~0_combout\ & ((!\GEN_ADD:3:GEN_ADDi:CSA_i|Add1~1_combout\))) # 
-- (\GEN_ADD:2:GEN_ADDi:CSA_i|carry_out~0_combout\ & (!\GEN_ADD:3:GEN_ADDi:CSA_i|carry_out~0_combout\)) ) ) ) # ( !\GEN_ADD:3:GEN_ADDi:CSA_i|Add1~0_combout\ & ( \GEN_ADD:1:GEN_ADDi:CSA_i|carry_out~0_combout\ & ( 
-- (!\GEN_ADD:2:GEN_ADDi:CSA_i|carry_out~0_combout\ & ((\GEN_ADD:3:GEN_ADDi:CSA_i|Add1~1_combout\))) # (\GEN_ADD:2:GEN_ADDi:CSA_i|carry_out~0_combout\ & (!\GEN_ADD:3:GEN_ADDi:CSA_i|carry_out~0_combout\)) ) ) ) # ( \GEN_ADD:3:GEN_ADDi:CSA_i|Add1~0_combout\ & 
-- ( !\GEN_ADD:1:GEN_ADDi:CSA_i|carry_out~0_combout\ & ( (!\GEN_ADD:2:GEN_ADDi:CSA_i|Add1~0_combout\ & ((!\GEN_ADD:3:GEN_ADDi:CSA_i|Add1~1_combout\))) # (\GEN_ADD:2:GEN_ADDi:CSA_i|Add1~0_combout\ & (!\GEN_ADD:3:GEN_ADDi:CSA_i|carry_out~0_combout\)) ) ) ) # ( 
-- !\GEN_ADD:3:GEN_ADDi:CSA_i|Add1~0_combout\ & ( !\GEN_ADD:1:GEN_ADDi:CSA_i|carry_out~0_combout\ & ( (!\GEN_ADD:2:GEN_ADDi:CSA_i|Add1~0_combout\ & ((\GEN_ADD:3:GEN_ADDi:CSA_i|Add1~1_combout\))) # (\GEN_ADD:2:GEN_ADDi:CSA_i|Add1~0_combout\ & 
-- (!\GEN_ADD:3:GEN_ADDi:CSA_i|carry_out~0_combout\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011101000111010110010101100101000110011101010101100110010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \GEN_ADD:3:GEN_ADDi:CSA_i|ALT_INV_carry_out~0_combout\,
	datab => \GEN_ADD:3:GEN_ADDi:CSA_i|ALT_INV_Add1~1_combout\,
	datac => \GEN_ADD:2:GEN_ADDi:CSA_i|ALT_INV_Add1~0_combout\,
	datad => \GEN_ADD:2:GEN_ADDi:CSA_i|ALT_INV_carry_out~0_combout\,
	datae => \GEN_ADD:3:GEN_ADDi:CSA_i|ALT_INV_Add1~0_combout\,
	dataf => \GEN_ADD:1:GEN_ADDi:CSA_i|ALT_INV_carry_out~0_combout\,
	combout => \GEN_ADD:3:GEN_ADDi:CSA_i|carry_out~1_combout\);

-- Location: IOIBUF_X32_Y0_N35
\A[15]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(15),
	o => \A[15]~input_o\);

-- Location: IOIBUF_X34_Y0_N92
\B[15]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(15),
	o => \B[15]~input_o\);

-- Location: IOIBUF_X34_Y0_N75
\A[14]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(14),
	o => \A[14]~input_o\);

-- Location: IOIBUF_X32_Y0_N52
\B[14]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(14),
	o => \B[14]~input_o\);

-- Location: IOIBUF_X36_Y0_N18
\A[13]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(13),
	o => \A[13]~input_o\);

-- Location: IOIBUF_X36_Y0_N35
\B[13]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(13),
	o => \B[13]~input_o\);

-- Location: IOIBUF_X32_Y0_N18
\A[12]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(12),
	o => \A[12]~input_o\);

-- Location: IOIBUF_X34_Y0_N58
\B[12]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(12),
	o => \B[12]~input_o\);

-- Location: IOIBUF_X34_Y0_N41
\B[11]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(11),
	o => \B[11]~input_o\);

-- Location: IOIBUF_X36_Y0_N52
\A[11]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(11),
	o => \A[11]~input_o\);

-- Location: LABCELL_X33_Y1_N30
\GEN_ADD:5:GEN_ADDi:CSA_i|Add1~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \GEN_ADD:5:GEN_ADDi:CSA_i|Add1~5_sumout\ = SUM(( \A[11]~input_o\ ) + ( \B[11]~input_o\ ) + ( !VCC ))
-- \GEN_ADD:5:GEN_ADDi:CSA_i|Add1~6\ = CARRY(( \A[11]~input_o\ ) + ( \B[11]~input_o\ ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_B[11]~input_o\,
	datad => \ALT_INV_A[11]~input_o\,
	cin => GND,
	sumout => \GEN_ADD:5:GEN_ADDi:CSA_i|Add1~5_sumout\,
	cout => \GEN_ADD:5:GEN_ADDi:CSA_i|Add1~6\);

-- Location: LABCELL_X33_Y1_N33
\GEN_ADD:5:GEN_ADDi:CSA_i|Add1~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \GEN_ADD:5:GEN_ADDi:CSA_i|Add1~9_sumout\ = SUM(( \A[12]~input_o\ ) + ( \B[12]~input_o\ ) + ( \GEN_ADD:5:GEN_ADDi:CSA_i|Add1~6\ ))
-- \GEN_ADD:5:GEN_ADDi:CSA_i|Add1~10\ = CARRY(( \A[12]~input_o\ ) + ( \B[12]~input_o\ ) + ( \GEN_ADD:5:GEN_ADDi:CSA_i|Add1~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_A[12]~input_o\,
	dataf => \ALT_INV_B[12]~input_o\,
	cin => \GEN_ADD:5:GEN_ADDi:CSA_i|Add1~6\,
	sumout => \GEN_ADD:5:GEN_ADDi:CSA_i|Add1~9_sumout\,
	cout => \GEN_ADD:5:GEN_ADDi:CSA_i|Add1~10\);

-- Location: LABCELL_X33_Y1_N36
\GEN_ADD:5:GEN_ADDi:CSA_i|Add1~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \GEN_ADD:5:GEN_ADDi:CSA_i|Add1~13_sumout\ = SUM(( \B[13]~input_o\ ) + ( \A[13]~input_o\ ) + ( \GEN_ADD:5:GEN_ADDi:CSA_i|Add1~10\ ))
-- \GEN_ADD:5:GEN_ADDi:CSA_i|Add1~14\ = CARRY(( \B[13]~input_o\ ) + ( \A[13]~input_o\ ) + ( \GEN_ADD:5:GEN_ADDi:CSA_i|Add1~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_A[13]~input_o\,
	datad => \ALT_INV_B[13]~input_o\,
	cin => \GEN_ADD:5:GEN_ADDi:CSA_i|Add1~10\,
	sumout => \GEN_ADD:5:GEN_ADDi:CSA_i|Add1~13_sumout\,
	cout => \GEN_ADD:5:GEN_ADDi:CSA_i|Add1~14\);

-- Location: LABCELL_X33_Y1_N39
\GEN_ADD:5:GEN_ADDi:CSA_i|Add1~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \GEN_ADD:5:GEN_ADDi:CSA_i|Add1~17_sumout\ = SUM(( \B[14]~input_o\ ) + ( \A[14]~input_o\ ) + ( \GEN_ADD:5:GEN_ADDi:CSA_i|Add1~14\ ))
-- \GEN_ADD:5:GEN_ADDi:CSA_i|Add1~18\ = CARRY(( \B[14]~input_o\ ) + ( \A[14]~input_o\ ) + ( \GEN_ADD:5:GEN_ADDi:CSA_i|Add1~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010101010101000000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_A[14]~input_o\,
	datab => \ALT_INV_B[14]~input_o\,
	cin => \GEN_ADD:5:GEN_ADDi:CSA_i|Add1~14\,
	sumout => \GEN_ADD:5:GEN_ADDi:CSA_i|Add1~17_sumout\,
	cout => \GEN_ADD:5:GEN_ADDi:CSA_i|Add1~18\);

-- Location: LABCELL_X33_Y1_N42
\GEN_ADD:5:GEN_ADDi:CSA_i|Add1~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \GEN_ADD:5:GEN_ADDi:CSA_i|Add1~1_sumout\ = SUM(( \B[15]~input_o\ ) + ( \A[15]~input_o\ ) + ( \GEN_ADD:5:GEN_ADDi:CSA_i|Add1~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000110011001100110000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_A[15]~input_o\,
	datad => \ALT_INV_B[15]~input_o\,
	cin => \GEN_ADD:5:GEN_ADDi:CSA_i|Add1~18\,
	sumout => \GEN_ADD:5:GEN_ADDi:CSA_i|Add1~1_sumout\);

-- Location: IOIBUF_X28_Y0_N18
\B[10]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(10),
	o => \B[10]~input_o\);

-- Location: IOIBUF_X30_Y0_N35
\A[10]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(10),
	o => \A[10]~input_o\);

-- Location: IOIBUF_X28_Y0_N1
\B[9]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(9),
	o => \B[9]~input_o\);

-- Location: IOIBUF_X8_Y0_N52
\A[9]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(9),
	o => \A[9]~input_o\);

-- Location: IOIBUF_X30_Y0_N1
\B[8]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(8),
	o => \B[8]~input_o\);

-- Location: IOIBUF_X30_Y0_N52
\A[8]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(8),
	o => \A[8]~input_o\);

-- Location: IOIBUF_X30_Y0_N18
\B[7]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(7),
	o => \B[7]~input_o\);

-- Location: IOIBUF_X28_Y0_N35
\A[7]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(7),
	o => \A[7]~input_o\);

-- Location: LABCELL_X30_Y1_N0
\GEN_ADD:4:GEN_ADDi:CSA_i|t1[1]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \GEN_ADD:4:GEN_ADDi:CSA_i|t1[1]~1_sumout\ = SUM(( !\B[7]~input_o\ $ (\A[7]~input_o\) ) + ( !VCC ) + ( !VCC ))
-- \GEN_ADD:4:GEN_ADDi:CSA_i|t1[1]~2\ = CARRY(( !\B[7]~input_o\ $ (\A[7]~input_o\) ) + ( !VCC ) + ( !VCC ))
-- \GEN_ADD:4:GEN_ADDi:CSA_i|t1[1]~3\ = SHARE((\A[7]~input_o\) # (\B[7]~input_o\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000001111110011111100000000000000001100001111000011",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_B[7]~input_o\,
	datac => \ALT_INV_A[7]~input_o\,
	cin => GND,
	sharein => GND,
	sumout => \GEN_ADD:4:GEN_ADDi:CSA_i|t1[1]~1_sumout\,
	cout => \GEN_ADD:4:GEN_ADDi:CSA_i|t1[1]~2\,
	shareout => \GEN_ADD:4:GEN_ADDi:CSA_i|t1[1]~3\);

-- Location: LABCELL_X30_Y1_N3
\GEN_ADD:4:GEN_ADDi:CSA_i|t1[2]~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \GEN_ADD:4:GEN_ADDi:CSA_i|t1[2]~5_sumout\ = SUM(( !\B[8]~input_o\ $ (!\A[8]~input_o\) ) + ( \GEN_ADD:4:GEN_ADDi:CSA_i|t1[1]~3\ ) + ( \GEN_ADD:4:GEN_ADDi:CSA_i|t1[1]~2\ ))
-- \GEN_ADD:4:GEN_ADDi:CSA_i|t1[2]~6\ = CARRY(( !\B[8]~input_o\ $ (!\A[8]~input_o\) ) + ( \GEN_ADD:4:GEN_ADDi:CSA_i|t1[1]~3\ ) + ( \GEN_ADD:4:GEN_ADDi:CSA_i|t1[1]~2\ ))
-- \GEN_ADD:4:GEN_ADDi:CSA_i|t1[2]~7\ = SHARE((\B[8]~input_o\ & \A[8]~input_o\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000001010000010100000000000000000101101001011010",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_B[8]~input_o\,
	datac => \ALT_INV_A[8]~input_o\,
	cin => \GEN_ADD:4:GEN_ADDi:CSA_i|t1[1]~2\,
	sharein => \GEN_ADD:4:GEN_ADDi:CSA_i|t1[1]~3\,
	sumout => \GEN_ADD:4:GEN_ADDi:CSA_i|t1[2]~5_sumout\,
	cout => \GEN_ADD:4:GEN_ADDi:CSA_i|t1[2]~6\,
	shareout => \GEN_ADD:4:GEN_ADDi:CSA_i|t1[2]~7\);

-- Location: LABCELL_X30_Y1_N6
\GEN_ADD:4:GEN_ADDi:CSA_i|t1[3]~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \GEN_ADD:4:GEN_ADDi:CSA_i|t1[3]~9_sumout\ = SUM(( !\B[9]~input_o\ $ (!\A[9]~input_o\) ) + ( \GEN_ADD:4:GEN_ADDi:CSA_i|t1[2]~7\ ) + ( \GEN_ADD:4:GEN_ADDi:CSA_i|t1[2]~6\ ))
-- \GEN_ADD:4:GEN_ADDi:CSA_i|t1[3]~10\ = CARRY(( !\B[9]~input_o\ $ (!\A[9]~input_o\) ) + ( \GEN_ADD:4:GEN_ADDi:CSA_i|t1[2]~7\ ) + ( \GEN_ADD:4:GEN_ADDi:CSA_i|t1[2]~6\ ))
-- \GEN_ADD:4:GEN_ADDi:CSA_i|t1[3]~11\ = SHARE((\B[9]~input_o\ & \A[9]~input_o\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000110000001100000000000000000011110000111100",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_B[9]~input_o\,
	datac => \ALT_INV_A[9]~input_o\,
	cin => \GEN_ADD:4:GEN_ADDi:CSA_i|t1[2]~6\,
	sharein => \GEN_ADD:4:GEN_ADDi:CSA_i|t1[2]~7\,
	sumout => \GEN_ADD:4:GEN_ADDi:CSA_i|t1[3]~9_sumout\,
	cout => \GEN_ADD:4:GEN_ADDi:CSA_i|t1[3]~10\,
	shareout => \GEN_ADD:4:GEN_ADDi:CSA_i|t1[3]~11\);

-- Location: LABCELL_X30_Y1_N9
\GEN_ADD:4:GEN_ADDi:CSA_i|t1[4]~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \GEN_ADD:4:GEN_ADDi:CSA_i|t1[4]~13_sumout\ = SUM(( !\B[10]~input_o\ $ (!\A[10]~input_o\) ) + ( \GEN_ADD:4:GEN_ADDi:CSA_i|t1[3]~11\ ) + ( \GEN_ADD:4:GEN_ADDi:CSA_i|t1[3]~10\ ))
-- \GEN_ADD:4:GEN_ADDi:CSA_i|t1[4]~14\ = CARRY(( !\B[10]~input_o\ $ (!\A[10]~input_o\) ) + ( \GEN_ADD:4:GEN_ADDi:CSA_i|t1[3]~11\ ) + ( \GEN_ADD:4:GEN_ADDi:CSA_i|t1[3]~10\ ))
-- \GEN_ADD:4:GEN_ADDi:CSA_i|t1[4]~15\ = SHARE((\B[10]~input_o\ & \A[10]~input_o\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000001010000010100000000000000000101101001011010",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_B[10]~input_o\,
	datac => \ALT_INV_A[10]~input_o\,
	cin => \GEN_ADD:4:GEN_ADDi:CSA_i|t1[3]~10\,
	sharein => \GEN_ADD:4:GEN_ADDi:CSA_i|t1[3]~11\,
	sumout => \GEN_ADD:4:GEN_ADDi:CSA_i|t1[4]~13_sumout\,
	cout => \GEN_ADD:4:GEN_ADDi:CSA_i|t1[4]~14\,
	shareout => \GEN_ADD:4:GEN_ADDi:CSA_i|t1[4]~15\);

-- Location: LABCELL_X30_Y1_N12
\GEN_ADD:4:GEN_ADDi:CSA_i|Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \GEN_ADD:4:GEN_ADDi:CSA_i|Add0~1_sumout\ = SUM(( GND ) + ( \GEN_ADD:4:GEN_ADDi:CSA_i|t1[4]~15\ ) + ( \GEN_ADD:4:GEN_ADDi:CSA_i|t1[4]~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	cin => \GEN_ADD:4:GEN_ADDi:CSA_i|t1[4]~14\,
	sharein => \GEN_ADD:4:GEN_ADDi:CSA_i|t1[4]~15\,
	sumout => \GEN_ADD:4:GEN_ADDi:CSA_i|Add0~1_sumout\);

-- Location: LABCELL_X30_Y1_N30
\GEN_ADD:4:GEN_ADDi:CSA_i|Add1~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \GEN_ADD:4:GEN_ADDi:CSA_i|Add1~5_sumout\ = SUM(( \B[7]~input_o\ ) + ( \A[7]~input_o\ ) + ( !VCC ))
-- \GEN_ADD:4:GEN_ADDi:CSA_i|Add1~6\ = CARRY(( \B[7]~input_o\ ) + ( \A[7]~input_o\ ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_B[7]~input_o\,
	datac => \ALT_INV_A[7]~input_o\,
	cin => GND,
	sumout => \GEN_ADD:4:GEN_ADDi:CSA_i|Add1~5_sumout\,
	cout => \GEN_ADD:4:GEN_ADDi:CSA_i|Add1~6\);

-- Location: LABCELL_X30_Y1_N33
\GEN_ADD:4:GEN_ADDi:CSA_i|Add1~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \GEN_ADD:4:GEN_ADDi:CSA_i|Add1~9_sumout\ = SUM(( \B[8]~input_o\ ) + ( \A[8]~input_o\ ) + ( \GEN_ADD:4:GEN_ADDi:CSA_i|Add1~6\ ))
-- \GEN_ADD:4:GEN_ADDi:CSA_i|Add1~10\ = CARRY(( \B[8]~input_o\ ) + ( \A[8]~input_o\ ) + ( \GEN_ADD:4:GEN_ADDi:CSA_i|Add1~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_B[8]~input_o\,
	datac => \ALT_INV_A[8]~input_o\,
	cin => \GEN_ADD:4:GEN_ADDi:CSA_i|Add1~6\,
	sumout => \GEN_ADD:4:GEN_ADDi:CSA_i|Add1~9_sumout\,
	cout => \GEN_ADD:4:GEN_ADDi:CSA_i|Add1~10\);

-- Location: LABCELL_X30_Y1_N36
\GEN_ADD:4:GEN_ADDi:CSA_i|Add1~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \GEN_ADD:4:GEN_ADDi:CSA_i|Add1~13_sumout\ = SUM(( \B[9]~input_o\ ) + ( \A[9]~input_o\ ) + ( \GEN_ADD:4:GEN_ADDi:CSA_i|Add1~10\ ))
-- \GEN_ADD:4:GEN_ADDi:CSA_i|Add1~14\ = CARRY(( \B[9]~input_o\ ) + ( \A[9]~input_o\ ) + ( \GEN_ADD:4:GEN_ADDi:CSA_i|Add1~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_B[9]~input_o\,
	datac => \ALT_INV_A[9]~input_o\,
	cin => \GEN_ADD:4:GEN_ADDi:CSA_i|Add1~10\,
	sumout => \GEN_ADD:4:GEN_ADDi:CSA_i|Add1~13_sumout\,
	cout => \GEN_ADD:4:GEN_ADDi:CSA_i|Add1~14\);

-- Location: LABCELL_X30_Y1_N39
\GEN_ADD:4:GEN_ADDi:CSA_i|Add1~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \GEN_ADD:4:GEN_ADDi:CSA_i|Add1~1_sumout\ = SUM(( \B[10]~input_o\ ) + ( \A[10]~input_o\ ) + ( \GEN_ADD:4:GEN_ADDi:CSA_i|Add1~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_B[10]~input_o\,
	datac => \ALT_INV_A[10]~input_o\,
	cin => \GEN_ADD:4:GEN_ADDi:CSA_i|Add1~14\,
	sumout => \GEN_ADD:4:GEN_ADDi:CSA_i|Add1~1_sumout\);

-- Location: LABCELL_X33_Y1_N0
\GEN_ADD:5:GEN_ADDi:CSA_i|t1[1]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \GEN_ADD:5:GEN_ADDi:CSA_i|t1[1]~1_sumout\ = SUM(( !\B[11]~input_o\ $ (\A[11]~input_o\) ) + ( !VCC ) + ( !VCC ))
-- \GEN_ADD:5:GEN_ADDi:CSA_i|t1[1]~2\ = CARRY(( !\B[11]~input_o\ $ (\A[11]~input_o\) ) + ( !VCC ) + ( !VCC ))
-- \GEN_ADD:5:GEN_ADDi:CSA_i|t1[1]~3\ = SHARE((\A[11]~input_o\) # (\B[11]~input_o\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000011111111111100000000000000001111000000001111",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_B[11]~input_o\,
	datad => \ALT_INV_A[11]~input_o\,
	cin => GND,
	sharein => GND,
	sumout => \GEN_ADD:5:GEN_ADDi:CSA_i|t1[1]~1_sumout\,
	cout => \GEN_ADD:5:GEN_ADDi:CSA_i|t1[1]~2\,
	shareout => \GEN_ADD:5:GEN_ADDi:CSA_i|t1[1]~3\);

-- Location: LABCELL_X33_Y1_N3
\GEN_ADD:5:GEN_ADDi:CSA_i|t1[2]~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \GEN_ADD:5:GEN_ADDi:CSA_i|t1[2]~5_sumout\ = SUM(( !\B[12]~input_o\ $ (!\A[12]~input_o\) ) + ( \GEN_ADD:5:GEN_ADDi:CSA_i|t1[1]~3\ ) + ( \GEN_ADD:5:GEN_ADDi:CSA_i|t1[1]~2\ ))
-- \GEN_ADD:5:GEN_ADDi:CSA_i|t1[2]~6\ = CARRY(( !\B[12]~input_o\ $ (!\A[12]~input_o\) ) + ( \GEN_ADD:5:GEN_ADDi:CSA_i|t1[1]~3\ ) + ( \GEN_ADD:5:GEN_ADDi:CSA_i|t1[1]~2\ ))
-- \GEN_ADD:5:GEN_ADDi:CSA_i|t1[2]~7\ = SHARE((\B[12]~input_o\ & \A[12]~input_o\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000001010000010100000000000000000101101001011010",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_B[12]~input_o\,
	datac => \ALT_INV_A[12]~input_o\,
	cin => \GEN_ADD:5:GEN_ADDi:CSA_i|t1[1]~2\,
	sharein => \GEN_ADD:5:GEN_ADDi:CSA_i|t1[1]~3\,
	sumout => \GEN_ADD:5:GEN_ADDi:CSA_i|t1[2]~5_sumout\,
	cout => \GEN_ADD:5:GEN_ADDi:CSA_i|t1[2]~6\,
	shareout => \GEN_ADD:5:GEN_ADDi:CSA_i|t1[2]~7\);

-- Location: LABCELL_X33_Y1_N6
\GEN_ADD:5:GEN_ADDi:CSA_i|t1[3]~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \GEN_ADD:5:GEN_ADDi:CSA_i|t1[3]~9_sumout\ = SUM(( !\A[13]~input_o\ $ (!\B[13]~input_o\) ) + ( \GEN_ADD:5:GEN_ADDi:CSA_i|t1[2]~7\ ) + ( \GEN_ADD:5:GEN_ADDi:CSA_i|t1[2]~6\ ))
-- \GEN_ADD:5:GEN_ADDi:CSA_i|t1[3]~10\ = CARRY(( !\A[13]~input_o\ $ (!\B[13]~input_o\) ) + ( \GEN_ADD:5:GEN_ADDi:CSA_i|t1[2]~7\ ) + ( \GEN_ADD:5:GEN_ADDi:CSA_i|t1[2]~6\ ))
-- \GEN_ADD:5:GEN_ADDi:CSA_i|t1[3]~11\ = SHARE((\A[13]~input_o\ & \B[13]~input_o\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000111100000000000000000000111111110000",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_A[13]~input_o\,
	datad => \ALT_INV_B[13]~input_o\,
	cin => \GEN_ADD:5:GEN_ADDi:CSA_i|t1[2]~6\,
	sharein => \GEN_ADD:5:GEN_ADDi:CSA_i|t1[2]~7\,
	sumout => \GEN_ADD:5:GEN_ADDi:CSA_i|t1[3]~9_sumout\,
	cout => \GEN_ADD:5:GEN_ADDi:CSA_i|t1[3]~10\,
	shareout => \GEN_ADD:5:GEN_ADDi:CSA_i|t1[3]~11\);

-- Location: LABCELL_X33_Y1_N9
\GEN_ADD:5:GEN_ADDi:CSA_i|t1[4]~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \GEN_ADD:5:GEN_ADDi:CSA_i|t1[4]~13_sumout\ = SUM(( !\A[14]~input_o\ $ (!\B[14]~input_o\) ) + ( \GEN_ADD:5:GEN_ADDi:CSA_i|t1[3]~11\ ) + ( \GEN_ADD:5:GEN_ADDi:CSA_i|t1[3]~10\ ))
-- \GEN_ADD:5:GEN_ADDi:CSA_i|t1[4]~14\ = CARRY(( !\A[14]~input_o\ $ (!\B[14]~input_o\) ) + ( \GEN_ADD:5:GEN_ADDi:CSA_i|t1[3]~11\ ) + ( \GEN_ADD:5:GEN_ADDi:CSA_i|t1[3]~10\ ))
-- \GEN_ADD:5:GEN_ADDi:CSA_i|t1[4]~15\ = SHARE((\A[14]~input_o\ & \B[14]~input_o\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000100010001000100000000000000000110011001100110",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_A[14]~input_o\,
	datab => \ALT_INV_B[14]~input_o\,
	cin => \GEN_ADD:5:GEN_ADDi:CSA_i|t1[3]~10\,
	sharein => \GEN_ADD:5:GEN_ADDi:CSA_i|t1[3]~11\,
	sumout => \GEN_ADD:5:GEN_ADDi:CSA_i|t1[4]~13_sumout\,
	cout => \GEN_ADD:5:GEN_ADDi:CSA_i|t1[4]~14\,
	shareout => \GEN_ADD:5:GEN_ADDi:CSA_i|t1[4]~15\);

-- Location: LABCELL_X33_Y1_N12
\GEN_ADD:5:GEN_ADDi:CSA_i|t1[5]~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \GEN_ADD:5:GEN_ADDi:CSA_i|t1[5]~17_sumout\ = SUM(( !\A[15]~input_o\ $ (!\B[15]~input_o\) ) + ( \GEN_ADD:5:GEN_ADDi:CSA_i|t1[4]~15\ ) + ( \GEN_ADD:5:GEN_ADDi:CSA_i|t1[4]~14\ ))
-- \GEN_ADD:5:GEN_ADDi:CSA_i|t1[5]~18\ = CARRY(( !\A[15]~input_o\ $ (!\B[15]~input_o\) ) + ( \GEN_ADD:5:GEN_ADDi:CSA_i|t1[4]~15\ ) + ( \GEN_ADD:5:GEN_ADDi:CSA_i|t1[4]~14\ ))
-- \GEN_ADD:5:GEN_ADDi:CSA_i|t1[5]~19\ = SHARE((\A[15]~input_o\ & \B[15]~input_o\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000011001100000000000000000011001111001100",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_A[15]~input_o\,
	datad => \ALT_INV_B[15]~input_o\,
	cin => \GEN_ADD:5:GEN_ADDi:CSA_i|t1[4]~14\,
	sharein => \GEN_ADD:5:GEN_ADDi:CSA_i|t1[4]~15\,
	sumout => \GEN_ADD:5:GEN_ADDi:CSA_i|t1[5]~17_sumout\,
	cout => \GEN_ADD:5:GEN_ADDi:CSA_i|t1[5]~18\,
	shareout => \GEN_ADD:5:GEN_ADDi:CSA_i|t1[5]~19\);

-- Location: LABCELL_X33_Y1_N15
\GEN_ADD:5:GEN_ADDi:CSA_i|Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \GEN_ADD:5:GEN_ADDi:CSA_i|Add0~1_sumout\ = SUM(( GND ) + ( \GEN_ADD:5:GEN_ADDi:CSA_i|t1[5]~19\ ) + ( \GEN_ADD:5:GEN_ADDi:CSA_i|t1[5]~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	cin => \GEN_ADD:5:GEN_ADDi:CSA_i|t1[5]~18\,
	sharein => \GEN_ADD:5:GEN_ADDi:CSA_i|t1[5]~19\,
	sumout => \GEN_ADD:5:GEN_ADDi:CSA_i|Add0~1_sumout\);

-- Location: LABCELL_X33_Y1_N21
\GEN_ADD:5:GEN_ADDi:CSA_i|carry_out~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \GEN_ADD:5:GEN_ADDi:CSA_i|carry_out~0_combout\ = ( \GEN_ADD:5:GEN_ADDi:CSA_i|Add0~1_sumout\ & ( ((!\GEN_ADD:3:GEN_ADDi:CSA_i|carry_out~1_combout\ & ((\GEN_ADD:4:GEN_ADDi:CSA_i|Add1~1_sumout\))) # (\GEN_ADD:3:GEN_ADDi:CSA_i|carry_out~1_combout\ & 
-- (\GEN_ADD:4:GEN_ADDi:CSA_i|Add0~1_sumout\))) # (\GEN_ADD:5:GEN_ADDi:CSA_i|Add1~1_sumout\) ) ) # ( !\GEN_ADD:5:GEN_ADDi:CSA_i|Add0~1_sumout\ & ( (\GEN_ADD:5:GEN_ADDi:CSA_i|Add1~1_sumout\ & ((!\GEN_ADD:3:GEN_ADDi:CSA_i|carry_out~1_combout\ & 
-- ((!\GEN_ADD:4:GEN_ADDi:CSA_i|Add1~1_sumout\))) # (\GEN_ADD:3:GEN_ADDi:CSA_i|carry_out~1_combout\ & (!\GEN_ADD:4:GEN_ADDi:CSA_i|Add0~1_sumout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001000010000001100100001000000110111101111110011011110111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \GEN_ADD:3:GEN_ADDi:CSA_i|ALT_INV_carry_out~1_combout\,
	datab => \GEN_ADD:5:GEN_ADDi:CSA_i|ALT_INV_Add1~1_sumout\,
	datac => \GEN_ADD:4:GEN_ADDi:CSA_i|ALT_INV_Add0~1_sumout\,
	datad => \GEN_ADD:4:GEN_ADDi:CSA_i|ALT_INV_Add1~1_sumout\,
	dataf => \GEN_ADD:5:GEN_ADDi:CSA_i|ALT_INV_Add0~1_sumout\,
	combout => \GEN_ADD:5:GEN_ADDi:CSA_i|carry_out~0_combout\);

-- Location: LABCELL_X36_Y1_N6
\GEN_ADD:0:GEN_ADD0:CSA0|s[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \GEN_ADD:0:GEN_ADD0:CSA0|s[0]~0_combout\ = ( \Carry_in~input_o\ & ( !\B[0]~input_o\ $ (\A[0]~input_o\) ) ) # ( !\Carry_in~input_o\ & ( !\B[0]~input_o\ $ (!\A[0]~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101101001011010010110100101101010100101101001011010010110100101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_B[0]~input_o\,
	datac => \ALT_INV_A[0]~input_o\,
	dataf => \ALT_INV_Carry_in~input_o\,
	combout => \GEN_ADD:0:GEN_ADD0:CSA0|s[0]~0_combout\);

-- Location: LABCELL_X36_Y1_N45
\GEN_ADD:1:GEN_ADDi:CSA_i|s[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \GEN_ADD:1:GEN_ADDi:CSA_i|s[0]~0_combout\ = ( \B[1]~input_o\ & ( \Carry_in~input_o\ & ( !\A[1]~input_o\ $ (((\B[0]~input_o\) # (\A[0]~input_o\))) ) ) ) # ( !\B[1]~input_o\ & ( \Carry_in~input_o\ & ( !\A[1]~input_o\ $ (((!\A[0]~input_o\ & 
-- !\B[0]~input_o\))) ) ) ) # ( \B[1]~input_o\ & ( !\Carry_in~input_o\ & ( !\A[0]~input_o\ $ (!\A[1]~input_o\ $ (!\B[0]~input_o\)) ) ) ) # ( !\B[1]~input_o\ & ( !\Carry_in~input_o\ & ( !\A[0]~input_o\ $ (!\A[1]~input_o\ $ (\B[0]~input_o\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101101010100101101001010101101001011010111100001010010100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_A[0]~input_o\,
	datac => \ALT_INV_A[1]~input_o\,
	datad => \ALT_INV_B[0]~input_o\,
	datae => \ALT_INV_B[1]~input_o\,
	dataf => \ALT_INV_Carry_in~input_o\,
	combout => \GEN_ADD:1:GEN_ADDi:CSA_i|s[0]~0_combout\);

-- Location: MLABCELL_X6_Y1_N42
\GEN_ADD:2:GEN_ADDi:CSA_i|s[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \GEN_ADD:2:GEN_ADDi:CSA_i|s[0]~0_combout\ = ( \A[2]~input_o\ & ( !\GEN_ADD:1:GEN_ADDi:CSA_i|carry_out~0_combout\ $ (\B[2]~input_o\) ) ) # ( !\A[2]~input_o\ & ( !\GEN_ADD:1:GEN_ADDi:CSA_i|carry_out~0_combout\ $ (!\B[2]~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011110000111100001111000011110011000011110000111100001111000011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \GEN_ADD:1:GEN_ADDi:CSA_i|ALT_INV_carry_out~0_combout\,
	datac => \ALT_INV_B[2]~input_o\,
	dataf => \ALT_INV_A[2]~input_o\,
	combout => \GEN_ADD:2:GEN_ADDi:CSA_i|s[0]~0_combout\);

-- Location: MLABCELL_X6_Y1_N45
\GEN_ADD:2:GEN_ADDi:CSA_i|s[1]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \GEN_ADD:2:GEN_ADDi:CSA_i|s[1]~1_combout\ = ( \A[2]~input_o\ & ( !\B[3]~input_o\ $ (!\A[3]~input_o\ $ (((\GEN_ADD:1:GEN_ADDi:CSA_i|carry_out~0_combout\) # (\B[2]~input_o\)))) ) ) # ( !\A[2]~input_o\ & ( !\B[3]~input_o\ $ (!\A[3]~input_o\ $ 
-- (((\B[2]~input_o\ & \GEN_ADD:1:GEN_ADDi:CSA_i|carry_out~0_combout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001111011100001000111101110000101111000100001110111100010000111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_B[2]~input_o\,
	datab => \GEN_ADD:1:GEN_ADDi:CSA_i|ALT_INV_carry_out~0_combout\,
	datac => \ALT_INV_B[3]~input_o\,
	datad => \ALT_INV_A[3]~input_o\,
	dataf => \ALT_INV_A[2]~input_o\,
	combout => \GEN_ADD:2:GEN_ADDi:CSA_i|s[1]~1_combout\);

-- Location: MLABCELL_X6_Y1_N48
\GEN_ADD:3:GEN_ADDi:CSA_i|s[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \GEN_ADD:3:GEN_ADDi:CSA_i|s[0]~0_combout\ = ( \A[4]~input_o\ & ( \GEN_ADD:1:GEN_ADDi:CSA_i|carry_out~0_combout\ & ( !\GEN_ADD:2:GEN_ADDi:CSA_i|carry_out~0_combout\ $ (\B[4]~input_o\) ) ) ) # ( !\A[4]~input_o\ & ( 
-- \GEN_ADD:1:GEN_ADDi:CSA_i|carry_out~0_combout\ & ( !\GEN_ADD:2:GEN_ADDi:CSA_i|carry_out~0_combout\ $ (!\B[4]~input_o\) ) ) ) # ( \A[4]~input_o\ & ( !\GEN_ADD:1:GEN_ADDi:CSA_i|carry_out~0_combout\ & ( !\GEN_ADD:2:GEN_ADDi:CSA_i|Add1~0_combout\ $ 
-- (\B[4]~input_o\) ) ) ) # ( !\A[4]~input_o\ & ( !\GEN_ADD:1:GEN_ADDi:CSA_i|carry_out~0_combout\ & ( !\GEN_ADD:2:GEN_ADDi:CSA_i|Add1~0_combout\ $ (!\B[4]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101101001011010101001011010010100111100001111001100001111000011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \GEN_ADD:2:GEN_ADDi:CSA_i|ALT_INV_Add1~0_combout\,
	datab => \GEN_ADD:2:GEN_ADDi:CSA_i|ALT_INV_carry_out~0_combout\,
	datac => \ALT_INV_B[4]~input_o\,
	datae => \ALT_INV_A[4]~input_o\,
	dataf => \GEN_ADD:1:GEN_ADDi:CSA_i|ALT_INV_carry_out~0_combout\,
	combout => \GEN_ADD:3:GEN_ADDi:CSA_i|s[0]~0_combout\);

-- Location: MLABCELL_X6_Y1_N30
\GEN_ADD:3:GEN_ADDi:CSA_i|s[1]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \GEN_ADD:3:GEN_ADDi:CSA_i|s[1]~2_combout\ = ( !\GEN_ADD:1:GEN_ADDi:CSA_i|carry_out~0_combout\ & ( !\B[5]~input_o\ $ (!\A[5]~input_o\ $ (((!\A[4]~input_o\ & (\GEN_ADD:2:GEN_ADDi:CSA_i|Add1~0_combout\ & \B[4]~input_o\)) # (\A[4]~input_o\ & ((\B[4]~input_o\) 
-- # (\GEN_ADD:2:GEN_ADDi:CSA_i|Add1~0_combout\)))))) ) ) # ( \GEN_ADD:1:GEN_ADDi:CSA_i|carry_out~0_combout\ & ( !\B[5]~input_o\ $ (!\A[5]~input_o\ $ (((!\A[4]~input_o\ & (\GEN_ADD:2:GEN_ADDi:CSA_i|carry_out~0_combout\ & \B[4]~input_o\)) # (\A[4]~input_o\ & 
-- ((\B[4]~input_o\) # (\GEN_ADD:2:GEN_ADDi:CSA_i|carry_out~0_combout\)))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0101011001101010010101100110101010101001100101011010100110010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_B[5]~input_o\,
	datab => \ALT_INV_A[4]~input_o\,
	datac => \GEN_ADD:2:GEN_ADDi:CSA_i|ALT_INV_carry_out~0_combout\,
	datad => \ALT_INV_B[4]~input_o\,
	datae => \GEN_ADD:1:GEN_ADDi:CSA_i|ALT_INV_carry_out~0_combout\,
	dataf => \ALT_INV_A[5]~input_o\,
	datag => \GEN_ADD:2:GEN_ADDi:CSA_i|ALT_INV_Add1~0_combout\,
	combout => \GEN_ADD:3:GEN_ADDi:CSA_i|s[1]~2_combout\);

-- Location: MLABCELL_X6_Y1_N39
\GEN_ADD:3:GEN_ADDi:CSA_i|Add0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \GEN_ADD:3:GEN_ADDi:CSA_i|Add0~0_combout\ = ( \A[5]~input_o\ & ( (!\B[5]~input_o\ & (!\A[4]~input_o\ & !\B[4]~input_o\)) ) ) # ( !\A[5]~input_o\ & ( (!\B[5]~input_o\) # ((!\A[4]~input_o\ & !\B[4]~input_o\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1110101011101010111010101110101010000000100000001000000010000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_B[5]~input_o\,
	datab => \ALT_INV_A[4]~input_o\,
	datac => \ALT_INV_B[4]~input_o\,
	dataf => \ALT_INV_A[5]~input_o\,
	combout => \GEN_ADD:3:GEN_ADDi:CSA_i|Add0~0_combout\);

-- Location: MLABCELL_X6_Y1_N24
\GEN_ADD:3:GEN_ADDi:CSA_i|s[2]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \GEN_ADD:3:GEN_ADDi:CSA_i|s[2]~1_combout\ = ( \GEN_ADD:2:GEN_ADDi:CSA_i|carry_out~0_combout\ & ( \GEN_ADD:1:GEN_ADDi:CSA_i|carry_out~0_combout\ & ( !\GEN_ADD:3:GEN_ADDi:CSA_i|Add1~1_combout\ $ (\GEN_ADD:3:GEN_ADDi:CSA_i|Add0~0_combout\) ) ) ) # ( 
-- !\GEN_ADD:2:GEN_ADDi:CSA_i|carry_out~0_combout\ & ( \GEN_ADD:1:GEN_ADDi:CSA_i|carry_out~0_combout\ & ( !\GEN_ADD:3:GEN_ADDi:CSA_i|Add1~0_combout\ $ (!\GEN_ADD:3:GEN_ADDi:CSA_i|Add1~1_combout\) ) ) ) # ( \GEN_ADD:2:GEN_ADDi:CSA_i|carry_out~0_combout\ & ( 
-- !\GEN_ADD:1:GEN_ADDi:CSA_i|carry_out~0_combout\ & ( !\GEN_ADD:3:GEN_ADDi:CSA_i|Add1~1_combout\ $ (((!\GEN_ADD:2:GEN_ADDi:CSA_i|Add1~0_combout\ & (!\GEN_ADD:3:GEN_ADDi:CSA_i|Add1~0_combout\)) # (\GEN_ADD:2:GEN_ADDi:CSA_i|Add1~0_combout\ & 
-- ((\GEN_ADD:3:GEN_ADDi:CSA_i|Add0~0_combout\))))) ) ) ) # ( !\GEN_ADD:2:GEN_ADDi:CSA_i|carry_out~0_combout\ & ( !\GEN_ADD:1:GEN_ADDi:CSA_i|carry_out~0_combout\ & ( !\GEN_ADD:3:GEN_ADDi:CSA_i|Add1~1_combout\ $ (((!\GEN_ADD:2:GEN_ADDi:CSA_i|Add1~0_combout\ & 
-- (!\GEN_ADD:3:GEN_ADDi:CSA_i|Add1~0_combout\)) # (\GEN_ADD:2:GEN_ADDi:CSA_i|Add1~0_combout\ & ((\GEN_ADD:3:GEN_ADDi:CSA_i|Add0~0_combout\))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110110001100011011011000110001101100110011001101100110000110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \GEN_ADD:3:GEN_ADDi:CSA_i|ALT_INV_Add1~0_combout\,
	datab => \GEN_ADD:3:GEN_ADDi:CSA_i|ALT_INV_Add1~1_combout\,
	datac => \GEN_ADD:2:GEN_ADDi:CSA_i|ALT_INV_Add1~0_combout\,
	datad => \GEN_ADD:3:GEN_ADDi:CSA_i|ALT_INV_Add0~0_combout\,
	datae => \GEN_ADD:2:GEN_ADDi:CSA_i|ALT_INV_carry_out~0_combout\,
	dataf => \GEN_ADD:1:GEN_ADDi:CSA_i|ALT_INV_carry_out~0_combout\,
	combout => \GEN_ADD:3:GEN_ADDi:CSA_i|s[2]~1_combout\);

-- Location: LABCELL_X30_Y1_N51
\GEN_ADD:4:GEN_ADDi:CSA_i|s[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \GEN_ADD:4:GEN_ADDi:CSA_i|s[0]~0_combout\ = ( \GEN_ADD:4:GEN_ADDi:CSA_i|Add1~5_sumout\ & ( (!\GEN_ADD:3:GEN_ADDi:CSA_i|carry_out~1_combout\) # (\GEN_ADD:4:GEN_ADDi:CSA_i|t1[1]~1_sumout\) ) ) # ( !\GEN_ADD:4:GEN_ADDi:CSA_i|Add1~5_sumout\ & ( 
-- (\GEN_ADD:3:GEN_ADDi:CSA_i|carry_out~1_combout\ & \GEN_ADD:4:GEN_ADDi:CSA_i|t1[1]~1_sumout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000001010101000000000101010110101010111111111010101011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \GEN_ADD:3:GEN_ADDi:CSA_i|ALT_INV_carry_out~1_combout\,
	datad => \GEN_ADD:4:GEN_ADDi:CSA_i|ALT_INV_t1[1]~1_sumout\,
	dataf => \GEN_ADD:4:GEN_ADDi:CSA_i|ALT_INV_Add1~5_sumout\,
	combout => \GEN_ADD:4:GEN_ADDi:CSA_i|s[0]~0_combout\);

-- Location: LABCELL_X30_Y1_N27
\GEN_ADD:4:GEN_ADDi:CSA_i|s[1]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \GEN_ADD:4:GEN_ADDi:CSA_i|s[1]~1_combout\ = ( \GEN_ADD:4:GEN_ADDi:CSA_i|Add1~9_sumout\ & ( (!\GEN_ADD:3:GEN_ADDi:CSA_i|carry_out~1_combout\) # (\GEN_ADD:4:GEN_ADDi:CSA_i|t1[2]~5_sumout\) ) ) # ( !\GEN_ADD:4:GEN_ADDi:CSA_i|Add1~9_sumout\ & ( 
-- (\GEN_ADD:3:GEN_ADDi:CSA_i|carry_out~1_combout\ & \GEN_ADD:4:GEN_ADDi:CSA_i|t1[2]~5_sumout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000001010101000000000101010110101010111111111010101011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \GEN_ADD:3:GEN_ADDi:CSA_i|ALT_INV_carry_out~1_combout\,
	datad => \GEN_ADD:4:GEN_ADDi:CSA_i|ALT_INV_t1[2]~5_sumout\,
	dataf => \GEN_ADD:4:GEN_ADDi:CSA_i|ALT_INV_Add1~9_sumout\,
	combout => \GEN_ADD:4:GEN_ADDi:CSA_i|s[1]~1_combout\);

-- Location: LABCELL_X30_Y1_N24
\GEN_ADD:4:GEN_ADDi:CSA_i|s[2]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \GEN_ADD:4:GEN_ADDi:CSA_i|s[2]~2_combout\ = ( \GEN_ADD:4:GEN_ADDi:CSA_i|t1[3]~9_sumout\ & ( (\GEN_ADD:4:GEN_ADDi:CSA_i|Add1~13_sumout\) # (\GEN_ADD:3:GEN_ADDi:CSA_i|carry_out~1_combout\) ) ) # ( !\GEN_ADD:4:GEN_ADDi:CSA_i|t1[3]~9_sumout\ & ( 
-- (!\GEN_ADD:3:GEN_ADDi:CSA_i|carry_out~1_combout\ & \GEN_ADD:4:GEN_ADDi:CSA_i|Add1~13_sumout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000101000001010000010100000101001011111010111110101111101011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \GEN_ADD:3:GEN_ADDi:CSA_i|ALT_INV_carry_out~1_combout\,
	datac => \GEN_ADD:4:GEN_ADDi:CSA_i|ALT_INV_Add1~13_sumout\,
	dataf => \GEN_ADD:4:GEN_ADDi:CSA_i|ALT_INV_t1[3]~9_sumout\,
	combout => \GEN_ADD:4:GEN_ADDi:CSA_i|s[2]~2_combout\);

-- Location: LABCELL_X30_Y1_N48
\GEN_ADD:4:GEN_ADDi:CSA_i|s[3]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \GEN_ADD:4:GEN_ADDi:CSA_i|s[3]~3_combout\ = ( \GEN_ADD:4:GEN_ADDi:CSA_i|t1[4]~13_sumout\ & ( (\GEN_ADD:4:GEN_ADDi:CSA_i|Add1~1_sumout\) # (\GEN_ADD:3:GEN_ADDi:CSA_i|carry_out~1_combout\) ) ) # ( !\GEN_ADD:4:GEN_ADDi:CSA_i|t1[4]~13_sumout\ & ( 
-- (!\GEN_ADD:3:GEN_ADDi:CSA_i|carry_out~1_combout\ & \GEN_ADD:4:GEN_ADDi:CSA_i|Add1~1_sumout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000010101010000000001010101001010101111111110101010111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \GEN_ADD:3:GEN_ADDi:CSA_i|ALT_INV_carry_out~1_combout\,
	datad => \GEN_ADD:4:GEN_ADDi:CSA_i|ALT_INV_Add1~1_sumout\,
	dataf => \GEN_ADD:4:GEN_ADDi:CSA_i|ALT_INV_t1[4]~13_sumout\,
	combout => \GEN_ADD:4:GEN_ADDi:CSA_i|s[3]~3_combout\);

-- Location: LABCELL_X33_Y1_N54
\GEN_ADD:5:GEN_ADDi:CSA_i|s[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \GEN_ADD:5:GEN_ADDi:CSA_i|s[0]~0_combout\ = ( \GEN_ADD:5:GEN_ADDi:CSA_i|Add1~5_sumout\ & ( ((!\GEN_ADD:3:GEN_ADDi:CSA_i|carry_out~1_combout\ & (!\GEN_ADD:4:GEN_ADDi:CSA_i|Add1~1_sumout\)) # (\GEN_ADD:3:GEN_ADDi:CSA_i|carry_out~1_combout\ & 
-- ((!\GEN_ADD:4:GEN_ADDi:CSA_i|Add0~1_sumout\)))) # (\GEN_ADD:5:GEN_ADDi:CSA_i|t1[1]~1_sumout\) ) ) # ( !\GEN_ADD:5:GEN_ADDi:CSA_i|Add1~5_sumout\ & ( (\GEN_ADD:5:GEN_ADDi:CSA_i|t1[1]~1_sumout\ & ((!\GEN_ADD:3:GEN_ADDi:CSA_i|carry_out~1_combout\ & 
-- (\GEN_ADD:4:GEN_ADDi:CSA_i|Add1~1_sumout\)) # (\GEN_ADD:3:GEN_ADDi:CSA_i|carry_out~1_combout\ & ((\GEN_ADD:4:GEN_ADDi:CSA_i|Add0~1_sumout\))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001000000111000000100000011111011111100011111101111110001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \GEN_ADD:3:GEN_ADDi:CSA_i|ALT_INV_carry_out~1_combout\,
	datab => \GEN_ADD:4:GEN_ADDi:CSA_i|ALT_INV_Add1~1_sumout\,
	datac => \GEN_ADD:5:GEN_ADDi:CSA_i|ALT_INV_t1[1]~1_sumout\,
	datad => \GEN_ADD:4:GEN_ADDi:CSA_i|ALT_INV_Add0~1_sumout\,
	dataf => \GEN_ADD:5:GEN_ADDi:CSA_i|ALT_INV_Add1~5_sumout\,
	combout => \GEN_ADD:5:GEN_ADDi:CSA_i|s[0]~0_combout\);

-- Location: LABCELL_X33_Y1_N48
\GEN_ADD:5:GEN_ADDi:CSA_i|s[1]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \GEN_ADD:5:GEN_ADDi:CSA_i|s[1]~1_combout\ = ( \GEN_ADD:5:GEN_ADDi:CSA_i|Add1~9_sumout\ & ( ((!\GEN_ADD:3:GEN_ADDi:CSA_i|carry_out~1_combout\ & ((!\GEN_ADD:4:GEN_ADDi:CSA_i|Add1~1_sumout\))) # (\GEN_ADD:3:GEN_ADDi:CSA_i|carry_out~1_combout\ & 
-- (!\GEN_ADD:4:GEN_ADDi:CSA_i|Add0~1_sumout\))) # (\GEN_ADD:5:GEN_ADDi:CSA_i|t1[2]~5_sumout\) ) ) # ( !\GEN_ADD:5:GEN_ADDi:CSA_i|Add1~9_sumout\ & ( (\GEN_ADD:5:GEN_ADDi:CSA_i|t1[2]~5_sumout\ & ((!\GEN_ADD:3:GEN_ADDi:CSA_i|carry_out~1_combout\ & 
-- ((\GEN_ADD:4:GEN_ADDi:CSA_i|Add1~1_sumout\))) # (\GEN_ADD:3:GEN_ADDi:CSA_i|carry_out~1_combout\ & (\GEN_ADD:4:GEN_ADDi:CSA_i|Add0~1_sumout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000100001011000000010000101111101111010011111110111101001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \GEN_ADD:3:GEN_ADDi:CSA_i|ALT_INV_carry_out~1_combout\,
	datab => \GEN_ADD:4:GEN_ADDi:CSA_i|ALT_INV_Add0~1_sumout\,
	datac => \GEN_ADD:5:GEN_ADDi:CSA_i|ALT_INV_t1[2]~5_sumout\,
	datad => \GEN_ADD:4:GEN_ADDi:CSA_i|ALT_INV_Add1~1_sumout\,
	dataf => \GEN_ADD:5:GEN_ADDi:CSA_i|ALT_INV_Add1~9_sumout\,
	combout => \GEN_ADD:5:GEN_ADDi:CSA_i|s[1]~1_combout\);

-- Location: LABCELL_X33_Y1_N57
\GEN_ADD:5:GEN_ADDi:CSA_i|s[2]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \GEN_ADD:5:GEN_ADDi:CSA_i|s[2]~2_combout\ = ( \GEN_ADD:5:GEN_ADDi:CSA_i|t1[3]~9_sumout\ & ( ((!\GEN_ADD:3:GEN_ADDi:CSA_i|carry_out~1_combout\ & (\GEN_ADD:4:GEN_ADDi:CSA_i|Add1~1_sumout\)) # (\GEN_ADD:3:GEN_ADDi:CSA_i|carry_out~1_combout\ & 
-- ((\GEN_ADD:4:GEN_ADDi:CSA_i|Add0~1_sumout\)))) # (\GEN_ADD:5:GEN_ADDi:CSA_i|Add1~13_sumout\) ) ) # ( !\GEN_ADD:5:GEN_ADDi:CSA_i|t1[3]~9_sumout\ & ( (\GEN_ADD:5:GEN_ADDi:CSA_i|Add1~13_sumout\ & ((!\GEN_ADD:3:GEN_ADDi:CSA_i|carry_out~1_combout\ & 
-- (!\GEN_ADD:4:GEN_ADDi:CSA_i|Add1~1_sumout\)) # (\GEN_ADD:3:GEN_ADDi:CSA_i|carry_out~1_combout\ & ((!\GEN_ADD:4:GEN_ADDi:CSA_i|Add0~1_sumout\))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011011000000000001101100000100111111111110010011111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \GEN_ADD:3:GEN_ADDi:CSA_i|ALT_INV_carry_out~1_combout\,
	datab => \GEN_ADD:4:GEN_ADDi:CSA_i|ALT_INV_Add1~1_sumout\,
	datac => \GEN_ADD:4:GEN_ADDi:CSA_i|ALT_INV_Add0~1_sumout\,
	datad => \GEN_ADD:5:GEN_ADDi:CSA_i|ALT_INV_Add1~13_sumout\,
	dataf => \GEN_ADD:5:GEN_ADDi:CSA_i|ALT_INV_t1[3]~9_sumout\,
	combout => \GEN_ADD:5:GEN_ADDi:CSA_i|s[2]~2_combout\);

-- Location: LABCELL_X33_Y1_N51
\GEN_ADD:5:GEN_ADDi:CSA_i|s[3]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \GEN_ADD:5:GEN_ADDi:CSA_i|s[3]~3_combout\ = ( \GEN_ADD:5:GEN_ADDi:CSA_i|t1[4]~13_sumout\ & ( ((!\GEN_ADD:3:GEN_ADDi:CSA_i|carry_out~1_combout\ & ((\GEN_ADD:4:GEN_ADDi:CSA_i|Add1~1_sumout\))) # (\GEN_ADD:3:GEN_ADDi:CSA_i|carry_out~1_combout\ & 
-- (\GEN_ADD:4:GEN_ADDi:CSA_i|Add0~1_sumout\))) # (\GEN_ADD:5:GEN_ADDi:CSA_i|Add1~17_sumout\) ) ) # ( !\GEN_ADD:5:GEN_ADDi:CSA_i|t1[4]~13_sumout\ & ( (\GEN_ADD:5:GEN_ADDi:CSA_i|Add1~17_sumout\ & ((!\GEN_ADD:3:GEN_ADDi:CSA_i|carry_out~1_combout\ & 
-- ((!\GEN_ADD:4:GEN_ADDi:CSA_i|Add1~1_sumout\))) # (\GEN_ADD:3:GEN_ADDi:CSA_i|carry_out~1_combout\ & (!\GEN_ADD:4:GEN_ADDi:CSA_i|Add0~1_sumout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111000000100000011100000010000011111101111110001111110111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \GEN_ADD:3:GEN_ADDi:CSA_i|ALT_INV_carry_out~1_combout\,
	datab => \GEN_ADD:4:GEN_ADDi:CSA_i|ALT_INV_Add0~1_sumout\,
	datac => \GEN_ADD:5:GEN_ADDi:CSA_i|ALT_INV_Add1~17_sumout\,
	datad => \GEN_ADD:4:GEN_ADDi:CSA_i|ALT_INV_Add1~1_sumout\,
	dataf => \GEN_ADD:5:GEN_ADDi:CSA_i|ALT_INV_t1[4]~13_sumout\,
	combout => \GEN_ADD:5:GEN_ADDi:CSA_i|s[3]~3_combout\);

-- Location: LABCELL_X33_Y1_N18
\GEN_ADD:5:GEN_ADDi:CSA_i|s[4]~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \GEN_ADD:5:GEN_ADDi:CSA_i|s[4]~4_combout\ = ( \GEN_ADD:5:GEN_ADDi:CSA_i|t1[5]~17_sumout\ & ( ((!\GEN_ADD:3:GEN_ADDi:CSA_i|carry_out~1_combout\ & ((\GEN_ADD:4:GEN_ADDi:CSA_i|Add1~1_sumout\))) # (\GEN_ADD:3:GEN_ADDi:CSA_i|carry_out~1_combout\ & 
-- (\GEN_ADD:4:GEN_ADDi:CSA_i|Add0~1_sumout\))) # (\GEN_ADD:5:GEN_ADDi:CSA_i|Add1~1_sumout\) ) ) # ( !\GEN_ADD:5:GEN_ADDi:CSA_i|t1[5]~17_sumout\ & ( (\GEN_ADD:5:GEN_ADDi:CSA_i|Add1~1_sumout\ & ((!\GEN_ADD:3:GEN_ADDi:CSA_i|carry_out~1_combout\ & 
-- ((!\GEN_ADD:4:GEN_ADDi:CSA_i|Add1~1_sumout\))) # (\GEN_ADD:3:GEN_ADDi:CSA_i|carry_out~1_combout\ & (!\GEN_ADD:4:GEN_ADDi:CSA_i|Add0~1_sumout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001000010000001100100001000000110111101111110011011110111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \GEN_ADD:3:GEN_ADDi:CSA_i|ALT_INV_carry_out~1_combout\,
	datab => \GEN_ADD:5:GEN_ADDi:CSA_i|ALT_INV_Add1~1_sumout\,
	datac => \GEN_ADD:4:GEN_ADDi:CSA_i|ALT_INV_Add0~1_sumout\,
	datad => \GEN_ADD:4:GEN_ADDi:CSA_i|ALT_INV_Add1~1_sumout\,
	dataf => \GEN_ADD:5:GEN_ADDi:CSA_i|ALT_INV_t1[5]~17_sumout\,
	combout => \GEN_ADD:5:GEN_ADDi:CSA_i|s[4]~4_combout\);

-- Location: MLABCELL_X87_Y34_N3
\~QUARTUS_CREATED_GND~I\ : cyclonev_lcell_comb
-- Equation(s):

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
;
END structure;


