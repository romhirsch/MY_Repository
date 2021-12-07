-- Copyright (C) 2020  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 20.1.1 Build 720 11/11/2020 SJ Lite Edition"

-- DATE "10/16/2021 22:15:06"

-- 
-- Device: Altera EP4CE6F17C6 Package FBGA256
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	hard_block IS
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic
	);
END hard_block;

-- Design Ports Information
-- ~ALTERA_ASDO_DATA1~	=>  Location: PIN_C1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_FLASH_nCE_nCSO~	=>  Location: PIN_D2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DCLK~	=>  Location: PIN_H1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DATA0~	=>  Location: PIN_H2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_nCEO~	=>  Location: PIN_F16,	 I/O Standard: 2.5 V,	 Current Strength: 8mA


ARCHITECTURE structure OF hard_block IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~padout\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~padout\ : std_logic;
SIGNAL \~ALTERA_DATA0~~padout\ : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_DATA0~~ibuf_o\ : std_logic;

BEGIN

ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
END structure;


LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	mul1 IS
    PORT (
	clk : IN std_logic;
	rst : IN std_logic;
	start : IN std_logic;
	a : IN std_logic_vector(15 DOWNTO 0);
	b : IN std_logic_vector(15 DOWNTO 0);
	res : BUFFER std_logic_vector(31 DOWNTO 0);
	done : BUFFER std_logic
	);
END mul1;

-- Design Ports Information
-- res[0]	=>  Location: PIN_R12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- res[1]	=>  Location: PIN_B8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- res[2]	=>  Location: PIN_F10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- res[3]	=>  Location: PIN_F11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- res[4]	=>  Location: PIN_A10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- res[5]	=>  Location: PIN_K16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- res[6]	=>  Location: PIN_L13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- res[7]	=>  Location: PIN_F8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- res[8]	=>  Location: PIN_B7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- res[9]	=>  Location: PIN_A15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- res[10]	=>  Location: PIN_A8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- res[11]	=>  Location: PIN_J11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- res[12]	=>  Location: PIN_C15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- res[13]	=>  Location: PIN_B13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- res[14]	=>  Location: PIN_F9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- res[15]	=>  Location: PIN_P9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- res[16]	=>  Location: PIN_A7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- res[17]	=>  Location: PIN_F6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- res[18]	=>  Location: PIN_J12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- res[19]	=>  Location: PIN_J13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- res[20]	=>  Location: PIN_C16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- res[21]	=>  Location: PIN_C11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- res[22]	=>  Location: PIN_R10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- res[23]	=>  Location: PIN_F15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- res[24]	=>  Location: PIN_F14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- res[25]	=>  Location: PIN_L14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- res[26]	=>  Location: PIN_D15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- res[27]	=>  Location: PIN_L15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- res[28]	=>  Location: PIN_N16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- res[29]	=>  Location: PIN_T10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- res[30]	=>  Location: PIN_L16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- res[31]	=>  Location: PIN_D16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- done	=>  Location: PIN_K15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_E1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rst	=>  Location: PIN_M2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- start	=>  Location: PIN_G16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[1]	=>  Location: PIN_J16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[0]	=>  Location: PIN_G1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[0]	=>  Location: PIN_E9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[2]	=>  Location: PIN_E10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[3]	=>  Location: PIN_L10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[15]	=>  Location: PIN_B12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[14]	=>  Location: PIN_C14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[13]	=>  Location: PIN_D14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[12]	=>  Location: PIN_D11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[11]	=>  Location: PIN_A11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[10]	=>  Location: PIN_E11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[9]	=>  Location: PIN_A12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[8]	=>  Location: PIN_A13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[7]	=>  Location: PIN_B11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[6]	=>  Location: PIN_B14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[5]	=>  Location: PIN_D12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[4]	=>  Location: PIN_A14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[1]	=>  Location: PIN_D8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[2]	=>  Location: PIN_B9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[3]	=>  Location: PIN_E6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[4]	=>  Location: PIN_C9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[5]	=>  Location: PIN_C8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[6]	=>  Location: PIN_B10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[7]	=>  Location: PIN_F13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[8]	=>  Location: PIN_D9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[9]	=>  Location: PIN_M1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[10]	=>  Location: PIN_B16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[11]	=>  Location: PIN_F7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[12]	=>  Location: PIN_E8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[13]	=>  Location: PIN_A9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[14]	=>  Location: PIN_G15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[15]	=>  Location: PIN_G11,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF mul1 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_rst : std_logic;
SIGNAL ww_start : std_logic;
SIGNAL ww_a : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_b : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_res : std_logic_vector(31 DOWNTO 0);
SIGNAL ww_done : std_logic;
SIGNAL \rst~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \res[0]~output_o\ : std_logic;
SIGNAL \res[1]~output_o\ : std_logic;
SIGNAL \res[2]~output_o\ : std_logic;
SIGNAL \res[3]~output_o\ : std_logic;
SIGNAL \res[4]~output_o\ : std_logic;
SIGNAL \res[5]~output_o\ : std_logic;
SIGNAL \res[6]~output_o\ : std_logic;
SIGNAL \res[7]~output_o\ : std_logic;
SIGNAL \res[8]~output_o\ : std_logic;
SIGNAL \res[9]~output_o\ : std_logic;
SIGNAL \res[10]~output_o\ : std_logic;
SIGNAL \res[11]~output_o\ : std_logic;
SIGNAL \res[12]~output_o\ : std_logic;
SIGNAL \res[13]~output_o\ : std_logic;
SIGNAL \res[14]~output_o\ : std_logic;
SIGNAL \res[15]~output_o\ : std_logic;
SIGNAL \res[16]~output_o\ : std_logic;
SIGNAL \res[17]~output_o\ : std_logic;
SIGNAL \res[18]~output_o\ : std_logic;
SIGNAL \res[19]~output_o\ : std_logic;
SIGNAL \res[20]~output_o\ : std_logic;
SIGNAL \res[21]~output_o\ : std_logic;
SIGNAL \res[22]~output_o\ : std_logic;
SIGNAL \res[23]~output_o\ : std_logic;
SIGNAL \res[24]~output_o\ : std_logic;
SIGNAL \res[25]~output_o\ : std_logic;
SIGNAL \res[26]~output_o\ : std_logic;
SIGNAL \res[27]~output_o\ : std_logic;
SIGNAL \res[28]~output_o\ : std_logic;
SIGNAL \res[29]~output_o\ : std_logic;
SIGNAL \res[30]~output_o\ : std_logic;
SIGNAL \res[31]~output_o\ : std_logic;
SIGNAL \done~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \b[0]~input_o\ : std_logic;
SIGNAL \start~input_o\ : std_logic;
SIGNAL \b[5]~input_o\ : std_logic;
SIGNAL \b[9]~input_o\ : std_logic;
SIGNAL \b[13]~input_o\ : std_logic;
SIGNAL \rb~6_combout\ : std_logic;
SIGNAL \rst~input_o\ : std_logic;
SIGNAL \rst~inputclkctrl_outclk\ : std_logic;
SIGNAL \rb~10_combout\ : std_logic;
SIGNAL \rb~14_combout\ : std_logic;
SIGNAL \b[1]~input_o\ : std_logic;
SIGNAL \rb~0_combout\ : std_logic;
SIGNAL \b[2]~input_o\ : std_logic;
SIGNAL \b[6]~input_o\ : std_logic;
SIGNAL \b[10]~input_o\ : std_logic;
SIGNAL \b[14]~input_o\ : std_logic;
SIGNAL \rb~5_combout\ : std_logic;
SIGNAL \rb~9_combout\ : std_logic;
SIGNAL \rb~13_combout\ : std_logic;
SIGNAL \rb~2_combout\ : std_logic;
SIGNAL \Add0~2_combout\ : std_logic;
SIGNAL \b[7]~input_o\ : std_logic;
SIGNAL \b[11]~input_o\ : std_logic;
SIGNAL \b[15]~input_o\ : std_logic;
SIGNAL \rb~4_combout\ : std_logic;
SIGNAL \rb~8_combout\ : std_logic;
SIGNAL \rb~12_combout\ : std_logic;
SIGNAL \b[3]~input_o\ : std_logic;
SIGNAL \rb~3_combout\ : std_logic;
SIGNAL \Add0~3_combout\ : std_logic;
SIGNAL \end_op~3_combout\ : std_logic;
SIGNAL \b[12]~input_o\ : std_logic;
SIGNAL \rb~7_combout\ : std_logic;
SIGNAL \end_op~0_combout\ : std_logic;
SIGNAL \b[8]~input_o\ : std_logic;
SIGNAL \rb~11_combout\ : std_logic;
SIGNAL \end_op~1_combout\ : std_logic;
SIGNAL \b[4]~input_o\ : std_logic;
SIGNAL \rb~15_combout\ : std_logic;
SIGNAL \end_op~2_combout\ : std_logic;
SIGNAL \end_op~4_combout\ : std_logic;
SIGNAL \p~11_combout\ : std_logic;
SIGNAL \Add0~1_combout\ : std_logic;
SIGNAL \Add0~0_combout\ : std_logic;
SIGNAL \rcarry~1_combout\ : std_logic;
SIGNAL \rcarry~2_combout\ : std_logic;
SIGNAL \ld_clr~0_combout\ : std_logic;
SIGNAL \rcarry~q\ : std_logic;
SIGNAL \acc[20]~98_combout\ : std_logic;
SIGNAL \cs~feeder_combout\ : std_logic;
SIGNAL \cs~q\ : std_logic;
SIGNAL \rb~1_combout\ : std_logic;
SIGNAL \Add0~4_combout\ : std_logic;
SIGNAL \rcarry~0_combout\ : std_logic;
SIGNAL \a[0]~input_o\ : std_logic;
SIGNAL \A3~17_combout\ : std_logic;
SIGNAL \ra~0_combout\ : std_logic;
SIGNAL \p~4_combout\ : std_logic;
SIGNAL \p~5_combout\ : std_logic;
SIGNAL \p~6_combout\ : std_logic;
SIGNAL \acc[0]~34_combout\ : std_logic;
SIGNAL \p~8_combout\ : std_logic;
SIGNAL \p~307_combout\ : std_logic;
SIGNAL \a[1]~input_o\ : std_logic;
SIGNAL \A5~17_combout\ : std_logic;
SIGNAL \ra~1_combout\ : std_logic;
SIGNAL \Mux30~2_combout\ : std_logic;
SIGNAL \A3[1]~18_combout\ : std_logic;
SIGNAL \~GND~combout\ : std_logic;
SIGNAL \Add5~1_cout\ : std_logic;
SIGNAL \Add5~2_combout\ : std_logic;
SIGNAL \Add10~1_cout\ : std_logic;
SIGNAL \Add10~2_combout\ : std_logic;
SIGNAL \A7~62_combout\ : std_logic;
SIGNAL \Add1~1_cout\ : std_logic;
SIGNAL \Add1~2_combout\ : std_logic;
SIGNAL \Mux30~3_combout\ : std_logic;
SIGNAL \Mux30~0_combout\ : std_logic;
SIGNAL \Add3~1_cout\ : std_logic;
SIGNAL \Add3~2_combout\ : std_logic;
SIGNAL \Add7~1_cout\ : std_logic;
SIGNAL \Add7~2_combout\ : std_logic;
SIGNAL \Mux30~1_combout\ : std_logic;
SIGNAL \p~7_combout\ : std_logic;
SIGNAL \p~9_combout\ : std_logic;
SIGNAL \acc[0]~35\ : std_logic;
SIGNAL \acc[1]~36_combout\ : std_logic;
SIGNAL \p[2]~feeder_combout\ : std_logic;
SIGNAL \a[2]~input_o\ : std_logic;
SIGNAL \Add10~3\ : std_logic;
SIGNAL \Add10~4_combout\ : std_logic;
SIGNAL \A7~63_combout\ : std_logic;
SIGNAL \A3[1]~19\ : std_logic;
SIGNAL \A3[2]~20_combout\ : std_logic;
SIGNAL \Mux0~1_combout\ : std_logic;
SIGNAL \Mux0~0_combout\ : std_logic;
SIGNAL \A5[2]~18_combout\ : std_logic;
SIGNAL \A5[2]~feeder_combout\ : std_logic;
SIGNAL \ra~2_combout\ : std_logic;
SIGNAL \Mux29~0_combout\ : std_logic;
SIGNAL \Mux29~1_combout\ : std_logic;
SIGNAL \Mux29~2_combout\ : std_logic;
SIGNAL \p~10_combout\ : std_logic;
SIGNAL \Add6~1_cout\ : std_logic;
SIGNAL \Add6~2_combout\ : std_logic;
SIGNAL \Add2~1_cout\ : std_logic;
SIGNAL \Add2~2_combout\ : std_logic;
SIGNAL \Mux0~2_combout\ : std_logic;
SIGNAL \Add1~3\ : std_logic;
SIGNAL \Add1~4_combout\ : std_logic;
SIGNAL \Add5~3\ : std_logic;
SIGNAL \Add5~4_combout\ : std_logic;
SIGNAL \Mux29~3_combout\ : std_logic;
SIGNAL \Mux29~4_combout\ : std_logic;
SIGNAL \Add7~3\ : std_logic;
SIGNAL \Add7~4_combout\ : std_logic;
SIGNAL \Add3~3\ : std_logic;
SIGNAL \Add3~4_combout\ : std_logic;
SIGNAL \Mux0~3_combout\ : std_logic;
SIGNAL \Mux29~5_combout\ : std_logic;
SIGNAL \p~12_combout\ : std_logic;
SIGNAL \acc[1]~37\ : std_logic;
SIGNAL \acc[2]~38_combout\ : std_logic;
SIGNAL \Add6~3\ : std_logic;
SIGNAL \Add6~4_combout\ : std_logic;
SIGNAL \Add2~3\ : std_logic;
SIGNAL \Add2~4_combout\ : std_logic;
SIGNAL \a[3]~input_o\ : std_logic;
SIGNAL \A5[2]~19\ : std_logic;
SIGNAL \A5[3]~20_combout\ : std_logic;
SIGNAL \A5[3]~feeder_combout\ : std_logic;
SIGNAL \Add3~5\ : std_logic;
SIGNAL \Add3~6_combout\ : std_logic;
SIGNAL \p~24_combout\ : std_logic;
SIGNAL \ra~3_combout\ : std_logic;
SIGNAL \Add7~5\ : std_logic;
SIGNAL \Add7~6_combout\ : std_logic;
SIGNAL \p~25_combout\ : std_logic;
SIGNAL \p~13_combout\ : std_logic;
SIGNAL \p~16_combout\ : std_logic;
SIGNAL \p~20_combout\ : std_logic;
SIGNAL \Add10~5\ : std_logic;
SIGNAL \Add10~6_combout\ : std_logic;
SIGNAL \A7~64_combout\ : std_logic;
SIGNAL \A3[2]~21\ : std_logic;
SIGNAL \A3[3]~22_combout\ : std_logic;
SIGNAL \p~17_combout\ : std_logic;
SIGNAL \p~18_combout\ : std_logic;
SIGNAL \p~19_combout\ : std_logic;
SIGNAL \p~21_combout\ : std_logic;
SIGNAL \p~22_combout\ : std_logic;
SIGNAL \Add1~5\ : std_logic;
SIGNAL \Add1~6_combout\ : std_logic;
SIGNAL \Add5~5\ : std_logic;
SIGNAL \Add5~6_combout\ : std_logic;
SIGNAL \Add4~1_cout\ : std_logic;
SIGNAL \Add4~2_combout\ : std_logic;
SIGNAL \p~14_combout\ : std_logic;
SIGNAL \p~15_combout\ : std_logic;
SIGNAL \p~23_combout\ : std_logic;
SIGNAL \p~26_combout\ : std_logic;
SIGNAL \acc[2]~39\ : std_logic;
SIGNAL \acc[3]~40_combout\ : std_logic;
SIGNAL \a[4]~input_o\ : std_logic;
SIGNAL \A3[3]~23\ : std_logic;
SIGNAL \A3[4]~24_combout\ : std_logic;
SIGNAL \Add5~7\ : std_logic;
SIGNAL \Add5~8_combout\ : std_logic;
SIGNAL \Add4~3\ : std_logic;
SIGNAL \Add4~4_combout\ : std_logic;
SIGNAL \Add10~7\ : std_logic;
SIGNAL \Add10~8_combout\ : std_logic;
SIGNAL \A7~65_combout\ : std_logic;
SIGNAL \Add1~7\ : std_logic;
SIGNAL \Add1~8_combout\ : std_logic;
SIGNAL \p~27_combout\ : std_logic;
SIGNAL \p~28_combout\ : std_logic;
SIGNAL \A5[3]~21\ : std_logic;
SIGNAL \A5[4]~22_combout\ : std_logic;
SIGNAL \A5[4]~feeder_combout\ : std_logic;
SIGNAL \ra~4_combout\ : std_logic;
SIGNAL \p~29_combout\ : std_logic;
SIGNAL \p~30_combout\ : std_logic;
SIGNAL \p~31_combout\ : std_logic;
SIGNAL \p~32_combout\ : std_logic;
SIGNAL \p~33_combout\ : std_logic;
SIGNAL \Add7~7\ : std_logic;
SIGNAL \Add7~8_combout\ : std_logic;
SIGNAL \Add2~5\ : std_logic;
SIGNAL \Add2~6_combout\ : std_logic;
SIGNAL \Add6~5\ : std_logic;
SIGNAL \Add6~6_combout\ : std_logic;
SIGNAL \p~34_combout\ : std_logic;
SIGNAL \Add3~7\ : std_logic;
SIGNAL \Add3~8_combout\ : std_logic;
SIGNAL \p~35_combout\ : std_logic;
SIGNAL \p~36_combout\ : std_logic;
SIGNAL \acc[3]~41\ : std_logic;
SIGNAL \acc[4]~42_combout\ : std_logic;
SIGNAL \Add6~7\ : std_logic;
SIGNAL \Add6~8_combout\ : std_logic;
SIGNAL \a[5]~input_o\ : std_logic;
SIGNAL \ra~5_combout\ : std_logic;
SIGNAL \Add7~9\ : std_logic;
SIGNAL \Add7~10_combout\ : std_logic;
SIGNAL \Add2~7\ : std_logic;
SIGNAL \Add2~8_combout\ : std_logic;
SIGNAL \A5[4]~23\ : std_logic;
SIGNAL \A5[5]~24_combout\ : std_logic;
SIGNAL \Add3~9\ : std_logic;
SIGNAL \Add3~10_combout\ : std_logic;
SIGNAL \p~44_combout\ : std_logic;
SIGNAL \p~45_combout\ : std_logic;
SIGNAL \Add10~9\ : std_logic;
SIGNAL \Add10~10_combout\ : std_logic;
SIGNAL \A7~66_combout\ : std_logic;
SIGNAL \A3[4]~25\ : std_logic;
SIGNAL \A3[5]~26_combout\ : std_logic;
SIGNAL \p~39_combout\ : std_logic;
SIGNAL \p~40_combout\ : std_logic;
SIGNAL \p~41_combout\ : std_logic;
SIGNAL \p~42_combout\ : std_logic;
SIGNAL \Add5~9\ : std_logic;
SIGNAL \Add5~10_combout\ : std_logic;
SIGNAL \Add4~5\ : std_logic;
SIGNAL \Add4~6_combout\ : std_logic;
SIGNAL \p~37_combout\ : std_logic;
SIGNAL \Add1~9\ : std_logic;
SIGNAL \Add1~10_combout\ : std_logic;
SIGNAL \p~38_combout\ : std_logic;
SIGNAL \p~43_combout\ : std_logic;
SIGNAL \p~46_combout\ : std_logic;
SIGNAL \acc[4]~43\ : std_logic;
SIGNAL \acc[5]~44_combout\ : std_logic;
SIGNAL \a[6]~input_o\ : std_logic;
SIGNAL \A5[5]~25\ : std_logic;
SIGNAL \A5[6]~26_combout\ : std_logic;
SIGNAL \A5[6]~feeder_combout\ : std_logic;
SIGNAL \Add3~11\ : std_logic;
SIGNAL \Add3~12_combout\ : std_logic;
SIGNAL \Add2~9\ : std_logic;
SIGNAL \Add2~10_combout\ : std_logic;
SIGNAL \Add6~9\ : std_logic;
SIGNAL \Add6~10_combout\ : std_logic;
SIGNAL \p~54_combout\ : std_logic;
SIGNAL \ra~6_combout\ : std_logic;
SIGNAL \Add7~11\ : std_logic;
SIGNAL \Add7~12_combout\ : std_logic;
SIGNAL \p~55_combout\ : std_logic;
SIGNAL \Add10~11\ : std_logic;
SIGNAL \Add10~12_combout\ : std_logic;
SIGNAL \A7~67_combout\ : std_logic;
SIGNAL \Add1~11\ : std_logic;
SIGNAL \Add1~12_combout\ : std_logic;
SIGNAL \p~47_combout\ : std_logic;
SIGNAL \A3[5]~27\ : std_logic;
SIGNAL \A3[6]~28_combout\ : std_logic;
SIGNAL \Add5~11\ : std_logic;
SIGNAL \Add5~12_combout\ : std_logic;
SIGNAL \Add4~7\ : std_logic;
SIGNAL \Add4~8_combout\ : std_logic;
SIGNAL \p~48_combout\ : std_logic;
SIGNAL \p~49_combout\ : std_logic;
SIGNAL \p~50_combout\ : std_logic;
SIGNAL \p~51_combout\ : std_logic;
SIGNAL \p~52_combout\ : std_logic;
SIGNAL \p~53_combout\ : std_logic;
SIGNAL \p~56_combout\ : std_logic;
SIGNAL \acc[5]~45\ : std_logic;
SIGNAL \acc[6]~46_combout\ : std_logic;
SIGNAL \Add6~11\ : std_logic;
SIGNAL \Add6~12_combout\ : std_logic;
SIGNAL \a[7]~input_o\ : std_logic;
SIGNAL \A5[6]~27\ : std_logic;
SIGNAL \A5[7]~28_combout\ : std_logic;
SIGNAL \Add3~13\ : std_logic;
SIGNAL \Add3~14_combout\ : std_logic;
SIGNAL \Add2~11\ : std_logic;
SIGNAL \Add2~12_combout\ : std_logic;
SIGNAL \p~64_combout\ : std_logic;
SIGNAL \ra~7_combout\ : std_logic;
SIGNAL \Add7~13\ : std_logic;
SIGNAL \Add7~14_combout\ : std_logic;
SIGNAL \p~65_combout\ : std_logic;
SIGNAL \Add10~13\ : std_logic;
SIGNAL \Add10~14_combout\ : std_logic;
SIGNAL \A7~68_combout\ : std_logic;
SIGNAL \A3[6]~29\ : std_logic;
SIGNAL \A3[7]~30_combout\ : std_logic;
SIGNAL \p~59_combout\ : std_logic;
SIGNAL \p~60_combout\ : std_logic;
SIGNAL \p~61_combout\ : std_logic;
SIGNAL \p~62_combout\ : std_logic;
SIGNAL \Add5~13\ : std_logic;
SIGNAL \Add5~14_combout\ : std_logic;
SIGNAL \Add1~13\ : std_logic;
SIGNAL \Add1~14_combout\ : std_logic;
SIGNAL \Add4~9\ : std_logic;
SIGNAL \Add4~10_combout\ : std_logic;
SIGNAL \p~57_combout\ : std_logic;
SIGNAL \p~58_combout\ : std_logic;
SIGNAL \p~63_combout\ : std_logic;
SIGNAL \p~66_combout\ : std_logic;
SIGNAL \acc[6]~47\ : std_logic;
SIGNAL \acc[7]~48_combout\ : std_logic;
SIGNAL \a[8]~input_o\ : std_logic;
SIGNAL \Add10~15\ : std_logic;
SIGNAL \Add10~16_combout\ : std_logic;
SIGNAL \A7~69_combout\ : std_logic;
SIGNAL \Add1~15\ : std_logic;
SIGNAL \Add1~16_combout\ : std_logic;
SIGNAL \p~67_combout\ : std_logic;
SIGNAL \A3[7]~31\ : std_logic;
SIGNAL \A3[8]~32_combout\ : std_logic;
SIGNAL \A3[8]~feeder_combout\ : std_logic;
SIGNAL \Add5~15\ : std_logic;
SIGNAL \Add5~16_combout\ : std_logic;
SIGNAL \Add4~11\ : std_logic;
SIGNAL \Add4~12_combout\ : std_logic;
SIGNAL \p~68_combout\ : std_logic;
SIGNAL \ra~8_combout\ : std_logic;
SIGNAL \Add7~15\ : std_logic;
SIGNAL \Add7~16_combout\ : std_logic;
SIGNAL \A5[7]~29\ : std_logic;
SIGNAL \A5[8]~30_combout\ : std_logic;
SIGNAL \Add3~15\ : std_logic;
SIGNAL \Add3~16_combout\ : std_logic;
SIGNAL \Add6~13\ : std_logic;
SIGNAL \Add6~14_combout\ : std_logic;
SIGNAL \Add2~13\ : std_logic;
SIGNAL \Add2~14_combout\ : std_logic;
SIGNAL \p~74_combout\ : std_logic;
SIGNAL \p~75_combout\ : std_logic;
SIGNAL \p~69_combout\ : std_logic;
SIGNAL \p~70_combout\ : std_logic;
SIGNAL \p~71_combout\ : std_logic;
SIGNAL \p~72_combout\ : std_logic;
SIGNAL \p~73_combout\ : std_logic;
SIGNAL \p~76_combout\ : std_logic;
SIGNAL \acc[7]~49\ : std_logic;
SIGNAL \acc[8]~50_combout\ : std_logic;
SIGNAL \a[9]~input_o\ : std_logic;
SIGNAL \ra~9_combout\ : std_logic;
SIGNAL \Add7~17\ : std_logic;
SIGNAL \Add7~18_combout\ : std_logic;
SIGNAL \Add2~15\ : std_logic;
SIGNAL \Add2~16_combout\ : std_logic;
SIGNAL \A5[8]~31\ : std_logic;
SIGNAL \A5[9]~32_combout\ : std_logic;
SIGNAL \Add3~17\ : std_logic;
SIGNAL \Add3~18_combout\ : std_logic;
SIGNAL \p~84_combout\ : std_logic;
SIGNAL \Add6~15\ : std_logic;
SIGNAL \Add6~16_combout\ : std_logic;
SIGNAL \p~85_combout\ : std_logic;
SIGNAL \A3[8]~33\ : std_logic;
SIGNAL \A3[9]~34_combout\ : std_logic;
SIGNAL \Add5~17\ : std_logic;
SIGNAL \Add5~18_combout\ : std_logic;
SIGNAL \Add10~17\ : std_logic;
SIGNAL \Add10~18_combout\ : std_logic;
SIGNAL \A7~70_combout\ : std_logic;
SIGNAL \Add1~17\ : std_logic;
SIGNAL \Add1~18_combout\ : std_logic;
SIGNAL \Add4~13\ : std_logic;
SIGNAL \Add4~14_combout\ : std_logic;
SIGNAL \p~77_combout\ : std_logic;
SIGNAL \p~78_combout\ : std_logic;
SIGNAL \p~79_combout\ : std_logic;
SIGNAL \p~80_combout\ : std_logic;
SIGNAL \p~81_combout\ : std_logic;
SIGNAL \p~82_combout\ : std_logic;
SIGNAL \p~83_combout\ : std_logic;
SIGNAL \p~86_combout\ : std_logic;
SIGNAL \acc[8]~51\ : std_logic;
SIGNAL \acc[9]~52_combout\ : std_logic;
SIGNAL \a[10]~input_o\ : std_logic;
SIGNAL \A3[9]~35\ : std_logic;
SIGNAL \A3[10]~36_combout\ : std_logic;
SIGNAL \Add5~19\ : std_logic;
SIGNAL \Add5~20_combout\ : std_logic;
SIGNAL \Add4~15\ : std_logic;
SIGNAL \Add4~16_combout\ : std_logic;
SIGNAL \Add10~19\ : std_logic;
SIGNAL \Add10~20_combout\ : std_logic;
SIGNAL \A7~71_combout\ : std_logic;
SIGNAL \Add1~19\ : std_logic;
SIGNAL \Add1~20_combout\ : std_logic;
SIGNAL \p~87_combout\ : std_logic;
SIGNAL \p~88_combout\ : std_logic;
SIGNAL \ra~10_combout\ : std_logic;
SIGNAL \Add7~19\ : std_logic;
SIGNAL \Add7~20_combout\ : std_logic;
SIGNAL \A5[9]~33\ : std_logic;
SIGNAL \A5[10]~34_combout\ : std_logic;
SIGNAL \A5[10]~feeder_combout\ : std_logic;
SIGNAL \Add3~19\ : std_logic;
SIGNAL \Add3~20_combout\ : std_logic;
SIGNAL \Add2~17\ : std_logic;
SIGNAL \Add2~18_combout\ : std_logic;
SIGNAL \Add6~17\ : std_logic;
SIGNAL \Add6~18_combout\ : std_logic;
SIGNAL \p~94_combout\ : std_logic;
SIGNAL \p~95_combout\ : std_logic;
SIGNAL \p~89_combout\ : std_logic;
SIGNAL \p~90_combout\ : std_logic;
SIGNAL \p~91_combout\ : std_logic;
SIGNAL \p~92_combout\ : std_logic;
SIGNAL \p~93_combout\ : std_logic;
SIGNAL \p~96_combout\ : std_logic;
SIGNAL \acc[9]~53\ : std_logic;
SIGNAL \acc[10]~54_combout\ : std_logic;
SIGNAL \Add6~19\ : std_logic;
SIGNAL \Add6~20_combout\ : std_logic;
SIGNAL \a[11]~input_o\ : std_logic;
SIGNAL \ra~11_combout\ : std_logic;
SIGNAL \Add7~21\ : std_logic;
SIGNAL \Add7~22_combout\ : std_logic;
SIGNAL \Add2~19\ : std_logic;
SIGNAL \Add2~20_combout\ : std_logic;
SIGNAL \A5[10]~35\ : std_logic;
SIGNAL \A5[11]~36_combout\ : std_logic;
SIGNAL \A5[11]~feeder_combout\ : std_logic;
SIGNAL \Add3~21\ : std_logic;
SIGNAL \Add3~22_combout\ : std_logic;
SIGNAL \p~104_combout\ : std_logic;
SIGNAL \p~105_combout\ : std_logic;
SIGNAL \Add10~21\ : std_logic;
SIGNAL \Add10~22_combout\ : std_logic;
SIGNAL \A7~72_combout\ : std_logic;
SIGNAL \A3[10]~37\ : std_logic;
SIGNAL \A3[11]~38_combout\ : std_logic;
SIGNAL \p~99_combout\ : std_logic;
SIGNAL \p~100_combout\ : std_logic;
SIGNAL \p~101_combout\ : std_logic;
SIGNAL \p~102_combout\ : std_logic;
SIGNAL \Add1~21\ : std_logic;
SIGNAL \Add1~22_combout\ : std_logic;
SIGNAL \Add5~21\ : std_logic;
SIGNAL \Add5~22_combout\ : std_logic;
SIGNAL \Add4~17\ : std_logic;
SIGNAL \Add4~18_combout\ : std_logic;
SIGNAL \p~97_combout\ : std_logic;
SIGNAL \p~98_combout\ : std_logic;
SIGNAL \p~103_combout\ : std_logic;
SIGNAL \p~106_combout\ : std_logic;
SIGNAL \acc[10]~55\ : std_logic;
SIGNAL \acc[11]~56_combout\ : std_logic;
SIGNAL \a[12]~input_o\ : std_logic;
SIGNAL \A5[11]~37\ : std_logic;
SIGNAL \A5[12]~38_combout\ : std_logic;
SIGNAL \ra~12_combout\ : std_logic;
SIGNAL \Add10~23\ : std_logic;
SIGNAL \Add10~24_combout\ : std_logic;
SIGNAL \A7~73_combout\ : std_logic;
SIGNAL \A3[11]~39\ : std_logic;
SIGNAL \A3[12]~40_combout\ : std_logic;
SIGNAL \p~109_combout\ : std_logic;
SIGNAL \p~110_combout\ : std_logic;
SIGNAL \p~111_combout\ : std_logic;
SIGNAL \p~112_combout\ : std_logic;
SIGNAL \p~113_combout\ : std_logic;
SIGNAL \Add4~19\ : std_logic;
SIGNAL \Add4~20_combout\ : std_logic;
SIGNAL \Add1~23\ : std_logic;
SIGNAL \Add1~24_combout\ : std_logic;
SIGNAL \p~107_combout\ : std_logic;
SIGNAL \Add5~23\ : std_logic;
SIGNAL \Add5~24_combout\ : std_logic;
SIGNAL \p~108_combout\ : std_logic;
SIGNAL \Add7~23\ : std_logic;
SIGNAL \Add7~24_combout\ : std_logic;
SIGNAL \Add3~23\ : std_logic;
SIGNAL \Add3~24_combout\ : std_logic;
SIGNAL \Add2~21\ : std_logic;
SIGNAL \Add2~22_combout\ : std_logic;
SIGNAL \Add6~21\ : std_logic;
SIGNAL \Add6~22_combout\ : std_logic;
SIGNAL \p~114_combout\ : std_logic;
SIGNAL \p~115_combout\ : std_logic;
SIGNAL \p~116_combout\ : std_logic;
SIGNAL \acc[11]~57\ : std_logic;
SIGNAL \acc[12]~58_combout\ : std_logic;
SIGNAL \a[13]~input_o\ : std_logic;
SIGNAL \ra~13_combout\ : std_logic;
SIGNAL \Add7~25\ : std_logic;
SIGNAL \Add7~26_combout\ : std_logic;
SIGNAL \Add6~23\ : std_logic;
SIGNAL \Add6~24_combout\ : std_logic;
SIGNAL \Add2~23\ : std_logic;
SIGNAL \Add2~24_combout\ : std_logic;
SIGNAL \A5[12]~39\ : std_logic;
SIGNAL \A5[13]~40_combout\ : std_logic;
SIGNAL \Add3~25\ : std_logic;
SIGNAL \Add3~26_combout\ : std_logic;
SIGNAL \p~124_combout\ : std_logic;
SIGNAL \p~125_combout\ : std_logic;
SIGNAL \Add10~25\ : std_logic;
SIGNAL \Add10~26_combout\ : std_logic;
SIGNAL \A7~74_combout\ : std_logic;
SIGNAL \A3[12]~41\ : std_logic;
SIGNAL \A3[13]~42_combout\ : std_logic;
SIGNAL \p~119_combout\ : std_logic;
SIGNAL \p~120_combout\ : std_logic;
SIGNAL \p~121_combout\ : std_logic;
SIGNAL \p~122_combout\ : std_logic;
SIGNAL \Add1~25\ : std_logic;
SIGNAL \Add1~26_combout\ : std_logic;
SIGNAL \Add5~25\ : std_logic;
SIGNAL \Add5~26_combout\ : std_logic;
SIGNAL \Add4~21\ : std_logic;
SIGNAL \Add4~22_combout\ : std_logic;
SIGNAL \p~117_combout\ : std_logic;
SIGNAL \p~118_combout\ : std_logic;
SIGNAL \p~123_combout\ : std_logic;
SIGNAL \p~126_combout\ : std_logic;
SIGNAL \acc[12]~59\ : std_logic;
SIGNAL \acc[13]~60_combout\ : std_logic;
SIGNAL \a[14]~input_o\ : std_logic;
SIGNAL \A3[13]~43\ : std_logic;
SIGNAL \A3[14]~44_combout\ : std_logic;
SIGNAL \Add5~27\ : std_logic;
SIGNAL \Add5~28_combout\ : std_logic;
SIGNAL \Add4~23\ : std_logic;
SIGNAL \Add4~24_combout\ : std_logic;
SIGNAL \Add10~27\ : std_logic;
SIGNAL \Add10~28_combout\ : std_logic;
SIGNAL \A7~75_combout\ : std_logic;
SIGNAL \Add1~27\ : std_logic;
SIGNAL \Add1~28_combout\ : std_logic;
SIGNAL \p~127_combout\ : std_logic;
SIGNAL \p~128_combout\ : std_logic;
SIGNAL \ra~14_combout\ : std_logic;
SIGNAL \Add7~27\ : std_logic;
SIGNAL \Add7~28_combout\ : std_logic;
SIGNAL \Add2~25\ : std_logic;
SIGNAL \Add2~26_combout\ : std_logic;
SIGNAL \Add6~25\ : std_logic;
SIGNAL \Add6~26_combout\ : std_logic;
SIGNAL \p~134_combout\ : std_logic;
SIGNAL \A5[13]~41\ : std_logic;
SIGNAL \A5[14]~42_combout\ : std_logic;
SIGNAL \Add3~27\ : std_logic;
SIGNAL \Add3~28_combout\ : std_logic;
SIGNAL \p~135_combout\ : std_logic;
SIGNAL \p~129_combout\ : std_logic;
SIGNAL \p~130_combout\ : std_logic;
SIGNAL \p~131_combout\ : std_logic;
SIGNAL \p~132_combout\ : std_logic;
SIGNAL \p~133_combout\ : std_logic;
SIGNAL \p~136_combout\ : std_logic;
SIGNAL \acc[13]~61\ : std_logic;
SIGNAL \acc[14]~62_combout\ : std_logic;
SIGNAL \a[15]~input_o\ : std_logic;
SIGNAL \Add10~29\ : std_logic;
SIGNAL \Add10~30_combout\ : std_logic;
SIGNAL \A7~76_combout\ : std_logic;
SIGNAL \Add1~29\ : std_logic;
SIGNAL \Add1~30_combout\ : std_logic;
SIGNAL \A3[14]~45\ : std_logic;
SIGNAL \A3[15]~46_combout\ : std_logic;
SIGNAL \Add5~29\ : std_logic;
SIGNAL \Add5~30_combout\ : std_logic;
SIGNAL \Add4~25\ : std_logic;
SIGNAL \Add4~26_combout\ : std_logic;
SIGNAL \p~137_combout\ : std_logic;
SIGNAL \p~138_combout\ : std_logic;
SIGNAL \A5[14]~43\ : std_logic;
SIGNAL \A5[15]~44_combout\ : std_logic;
SIGNAL \ra~15_combout\ : std_logic;
SIGNAL \p~139_combout\ : std_logic;
SIGNAL \p~140_combout\ : std_logic;
SIGNAL \p~141_combout\ : std_logic;
SIGNAL \p~142_combout\ : std_logic;
SIGNAL \p~143_combout\ : std_logic;
SIGNAL \Add6~27\ : std_logic;
SIGNAL \Add6~28_combout\ : std_logic;
SIGNAL \Add7~29\ : std_logic;
SIGNAL \Add7~30_combout\ : std_logic;
SIGNAL \Add3~29\ : std_logic;
SIGNAL \Add3~30_combout\ : std_logic;
SIGNAL \Add2~27\ : std_logic;
SIGNAL \Add2~28_combout\ : std_logic;
SIGNAL \p~144_combout\ : std_logic;
SIGNAL \p~145_combout\ : std_logic;
SIGNAL \p~146_combout\ : std_logic;
SIGNAL \acc[14]~63\ : std_logic;
SIGNAL \acc[15]~64_combout\ : std_logic;
SIGNAL \ra~16_combout\ : std_logic;
SIGNAL \A5[15]~45\ : std_logic;
SIGNAL \A5[16]~46_combout\ : std_logic;
SIGNAL \Add10~31\ : std_logic;
SIGNAL \Add10~32_combout\ : std_logic;
SIGNAL \A7~77_combout\ : std_logic;
SIGNAL \A3[15]~47\ : std_logic;
SIGNAL \A3[16]~48_combout\ : std_logic;
SIGNAL \p~149_combout\ : std_logic;
SIGNAL \p~150_combout\ : std_logic;
SIGNAL \p~151_combout\ : std_logic;
SIGNAL \p~152_combout\ : std_logic;
SIGNAL \p~153_combout\ : std_logic;
SIGNAL \Add5~31\ : std_logic;
SIGNAL \Add5~32_combout\ : std_logic;
SIGNAL \Add4~27\ : std_logic;
SIGNAL \Add4~28_combout\ : std_logic;
SIGNAL \Add1~31\ : std_logic;
SIGNAL \Add1~32_combout\ : std_logic;
SIGNAL \p~147_combout\ : std_logic;
SIGNAL \p~148_combout\ : std_logic;
SIGNAL \Add3~31\ : std_logic;
SIGNAL \Add3~32_combout\ : std_logic;
SIGNAL \Add6~29\ : std_logic;
SIGNAL \Add6~30_combout\ : std_logic;
SIGNAL \Add2~29\ : std_logic;
SIGNAL \Add2~30_combout\ : std_logic;
SIGNAL \p~154_combout\ : std_logic;
SIGNAL \Add7~31\ : std_logic;
SIGNAL \Add7~32_combout\ : std_logic;
SIGNAL \p~155_combout\ : std_logic;
SIGNAL \p~156_combout\ : std_logic;
SIGNAL \acc[15]~65\ : std_logic;
SIGNAL \acc[16]~66_combout\ : std_logic;
SIGNAL \ra~17_combout\ : std_logic;
SIGNAL \A5[16]~47\ : std_logic;
SIGNAL \A5[17]~48_combout\ : std_logic;
SIGNAL \A3[16]~49\ : std_logic;
SIGNAL \A3[17]~50_combout\ : std_logic;
SIGNAL \p~159_combout\ : std_logic;
SIGNAL \Add10~33\ : std_logic;
SIGNAL \Add10~34_combout\ : std_logic;
SIGNAL \A7~78_combout\ : std_logic;
SIGNAL \p~160_combout\ : std_logic;
SIGNAL \p~161_combout\ : std_logic;
SIGNAL \p~162_combout\ : std_logic;
SIGNAL \Add1~33\ : std_logic;
SIGNAL \Add1~34_combout\ : std_logic;
SIGNAL \Add5~33\ : std_logic;
SIGNAL \Add5~34_combout\ : std_logic;
SIGNAL \Add4~29\ : std_logic;
SIGNAL \Add4~30_combout\ : std_logic;
SIGNAL \p~157_combout\ : std_logic;
SIGNAL \p~158_combout\ : std_logic;
SIGNAL \p~163_combout\ : std_logic;
SIGNAL \Add6~31\ : std_logic;
SIGNAL \Add6~32_combout\ : std_logic;
SIGNAL \Add3~33\ : std_logic;
SIGNAL \Add3~34_combout\ : std_logic;
SIGNAL \Add2~31\ : std_logic;
SIGNAL \Add2~32_combout\ : std_logic;
SIGNAL \p~164_combout\ : std_logic;
SIGNAL \Add7~33\ : std_logic;
SIGNAL \Add7~34_combout\ : std_logic;
SIGNAL \p~165_combout\ : std_logic;
SIGNAL \p~166_combout\ : std_logic;
SIGNAL \acc[16]~67\ : std_logic;
SIGNAL \acc[17]~68_combout\ : std_logic;
SIGNAL \A3~52_combout\ : std_logic;
SIGNAL \Add5~35\ : std_logic;
SIGNAL \Add5~36_combout\ : std_logic;
SIGNAL \Add10~35\ : std_logic;
SIGNAL \Add10~36_combout\ : std_logic;
SIGNAL \A7~79_combout\ : std_logic;
SIGNAL \Add1~35\ : std_logic;
SIGNAL \Add1~36_combout\ : std_logic;
SIGNAL \p~167_combout\ : std_logic;
SIGNAL \Add4~31\ : std_logic;
SIGNAL \Add4~32_combout\ : std_logic;
SIGNAL \p~168_combout\ : std_logic;
SIGNAL \A5[17]~49\ : std_logic;
SIGNAL \A5[18]~50_combout\ : std_logic;
SIGNAL \p~169_combout\ : std_logic;
SIGNAL \p~170_combout\ : std_logic;
SIGNAL \p~171_combout\ : std_logic;
SIGNAL \ra~18_combout\ : std_logic;
SIGNAL \p~172_combout\ : std_logic;
SIGNAL \p~173_combout\ : std_logic;
SIGNAL \Add7~35\ : std_logic;
SIGNAL \Add7~36_combout\ : std_logic;
SIGNAL \Add3~35\ : std_logic;
SIGNAL \Add3~36_combout\ : std_logic;
SIGNAL \Add6~33\ : std_logic;
SIGNAL \Add6~34_combout\ : std_logic;
SIGNAL \Add2~33\ : std_logic;
SIGNAL \Add2~34_combout\ : std_logic;
SIGNAL \p~174_combout\ : std_logic;
SIGNAL \p~175_combout\ : std_logic;
SIGNAL \p~176_combout\ : std_logic;
SIGNAL \acc[17]~69\ : std_logic;
SIGNAL \acc[18]~70_combout\ : std_logic;
SIGNAL \ra~19_combout\ : std_logic;
SIGNAL \Add7~37\ : std_logic;
SIGNAL \Add7~38_combout\ : std_logic;
SIGNAL \Add6~35\ : std_logic;
SIGNAL \Add6~36_combout\ : std_logic;
SIGNAL \Add2~35\ : std_logic;
SIGNAL \Add2~36_combout\ : std_logic;
SIGNAL \A5~52_combout\ : std_logic;
SIGNAL \Add3~37\ : std_logic;
SIGNAL \Add3~38_combout\ : std_logic;
SIGNAL \p~184_combout\ : std_logic;
SIGNAL \p~185_combout\ : std_logic;
SIGNAL \Add10~37\ : std_logic;
SIGNAL \Add10~38_combout\ : std_logic;
SIGNAL \A7~80_combout\ : std_logic;
SIGNAL \A3~53_combout\ : std_logic;
SIGNAL \p~179_combout\ : std_logic;
SIGNAL \p~180_combout\ : std_logic;
SIGNAL \p~181_combout\ : std_logic;
SIGNAL \p~182_combout\ : std_logic;
SIGNAL \Add1~37\ : std_logic;
SIGNAL \Add1~38_combout\ : std_logic;
SIGNAL \Add5~37\ : std_logic;
SIGNAL \Add5~38_combout\ : std_logic;
SIGNAL \Add4~33\ : std_logic;
SIGNAL \Add4~34_combout\ : std_logic;
SIGNAL \p~177_combout\ : std_logic;
SIGNAL \p~178_combout\ : std_logic;
SIGNAL \p~183_combout\ : std_logic;
SIGNAL \p~186_combout\ : std_logic;
SIGNAL \acc[18]~71\ : std_logic;
SIGNAL \acc[19]~72_combout\ : std_logic;
SIGNAL \Add4~35\ : std_logic;
SIGNAL \Add4~36_combout\ : std_logic;
SIGNAL \A3~54_combout\ : std_logic;
SIGNAL \Add5~39\ : std_logic;
SIGNAL \Add5~40_combout\ : std_logic;
SIGNAL \A7~81_combout\ : std_logic;
SIGNAL \Add1~39\ : std_logic;
SIGNAL \Add1~40_combout\ : std_logic;
SIGNAL \p~187_combout\ : std_logic;
SIGNAL \p~188_combout\ : std_logic;
SIGNAL \ra~20_combout\ : std_logic;
SIGNAL \Add7~39\ : std_logic;
SIGNAL \Add7~40_combout\ : std_logic;
SIGNAL \A5~53_combout\ : std_logic;
SIGNAL \Add3~39\ : std_logic;
SIGNAL \Add3~40_combout\ : std_logic;
SIGNAL \Add6~37\ : std_logic;
SIGNAL \Add6~38_combout\ : std_logic;
SIGNAL \Add2~37\ : std_logic;
SIGNAL \Add2~38_combout\ : std_logic;
SIGNAL \p~194_combout\ : std_logic;
SIGNAL \p~195_combout\ : std_logic;
SIGNAL \p~189_combout\ : std_logic;
SIGNAL \p~190_combout\ : std_logic;
SIGNAL \p~191_combout\ : std_logic;
SIGNAL \p~192_combout\ : std_logic;
SIGNAL \p~193_combout\ : std_logic;
SIGNAL \p~196_combout\ : std_logic;
SIGNAL \acc[19]~73\ : std_logic;
SIGNAL \acc[20]~74_combout\ : std_logic;
SIGNAL \ra~21_combout\ : std_logic;
SIGNAL \A5~54_combout\ : std_logic;
SIGNAL \A7~82_combout\ : std_logic;
SIGNAL \A3~55_combout\ : std_logic;
SIGNAL \p~199_combout\ : std_logic;
SIGNAL \p~200_combout\ : std_logic;
SIGNAL \p~201_combout\ : std_logic;
SIGNAL \p~202_combout\ : std_logic;
SIGNAL \Add1~41\ : std_logic;
SIGNAL \Add1~42_combout\ : std_logic;
SIGNAL \Add4~37\ : std_logic;
SIGNAL \Add4~38_combout\ : std_logic;
SIGNAL \p~197_combout\ : std_logic;
SIGNAL \Add5~41\ : std_logic;
SIGNAL \Add5~42_combout\ : std_logic;
SIGNAL \p~198_combout\ : std_logic;
SIGNAL \p~203_combout\ : std_logic;
SIGNAL \Add6~39\ : std_logic;
SIGNAL \Add6~40_combout\ : std_logic;
SIGNAL \Add7~41\ : std_logic;
SIGNAL \Add7~42_combout\ : std_logic;
SIGNAL \Add2~39\ : std_logic;
SIGNAL \Add2~40_combout\ : std_logic;
SIGNAL \Add3~41\ : std_logic;
SIGNAL \Add3~42_combout\ : std_logic;
SIGNAL \p~204_combout\ : std_logic;
SIGNAL \p~205_combout\ : std_logic;
SIGNAL \p~206_combout\ : std_logic;
SIGNAL \acc[20]~75\ : std_logic;
SIGNAL \acc[21]~76_combout\ : std_logic;
SIGNAL \ra~22_combout\ : std_logic;
SIGNAL \A5~55_combout\ : std_logic;
SIGNAL \A3~56_combout\ : std_logic;
SIGNAL \A7~83_combout\ : std_logic;
SIGNAL \p~209_combout\ : std_logic;
SIGNAL \p~210_combout\ : std_logic;
SIGNAL \p~211_combout\ : std_logic;
SIGNAL \p~212_combout\ : std_logic;
SIGNAL \p~213_combout\ : std_logic;
SIGNAL \Add5~43\ : std_logic;
SIGNAL \Add5~44_combout\ : std_logic;
SIGNAL \Add1~43\ : std_logic;
SIGNAL \Add1~44_combout\ : std_logic;
SIGNAL \p~207_combout\ : std_logic;
SIGNAL \Add4~39\ : std_logic;
SIGNAL \Add4~40_combout\ : std_logic;
SIGNAL \p~208_combout\ : std_logic;
SIGNAL \Add3~43\ : std_logic;
SIGNAL \Add3~44_combout\ : std_logic;
SIGNAL \Add7~43\ : std_logic;
SIGNAL \Add7~44_combout\ : std_logic;
SIGNAL \Add2~41\ : std_logic;
SIGNAL \Add2~42_combout\ : std_logic;
SIGNAL \Add6~41\ : std_logic;
SIGNAL \Add6~42_combout\ : std_logic;
SIGNAL \p~214_combout\ : std_logic;
SIGNAL \p~215_combout\ : std_logic;
SIGNAL \p~216_combout\ : std_logic;
SIGNAL \acc[21]~77\ : std_logic;
SIGNAL \acc[22]~78_combout\ : std_logic;
SIGNAL \Add6~43\ : std_logic;
SIGNAL \Add6~44_combout\ : std_logic;
SIGNAL \ra~23_combout\ : std_logic;
SIGNAL \Add7~45\ : std_logic;
SIGNAL \Add7~46_combout\ : std_logic;
SIGNAL \A5~56_combout\ : std_logic;
SIGNAL \Add3~45\ : std_logic;
SIGNAL \Add3~46_combout\ : std_logic;
SIGNAL \Add2~43\ : std_logic;
SIGNAL \Add2~44_combout\ : std_logic;
SIGNAL \p~224_combout\ : std_logic;
SIGNAL \p~225_combout\ : std_logic;
SIGNAL \A7~84_combout\ : std_logic;
SIGNAL \A3~57_combout\ : std_logic;
SIGNAL \p~219_combout\ : std_logic;
SIGNAL \p~220_combout\ : std_logic;
SIGNAL \p~221_combout\ : std_logic;
SIGNAL \p~222_combout\ : std_logic;
SIGNAL \Add1~45\ : std_logic;
SIGNAL \Add1~46_combout\ : std_logic;
SIGNAL \Add4~41\ : std_logic;
SIGNAL \Add4~42_combout\ : std_logic;
SIGNAL \p~217_combout\ : std_logic;
SIGNAL \Add5~45\ : std_logic;
SIGNAL \Add5~46_combout\ : std_logic;
SIGNAL \p~218_combout\ : std_logic;
SIGNAL \p~223_combout\ : std_logic;
SIGNAL \p~226_combout\ : std_logic;
SIGNAL \acc[22]~79\ : std_logic;
SIGNAL \acc[23]~80_combout\ : std_logic;
SIGNAL \A3~58_combout\ : std_logic;
SIGNAL \Add5~47\ : std_logic;
SIGNAL \Add5~48_combout\ : std_logic;
SIGNAL \Add4~43\ : std_logic;
SIGNAL \Add4~44_combout\ : std_logic;
SIGNAL \A7~85_combout\ : std_logic;
SIGNAL \Add1~47\ : std_logic;
SIGNAL \Add1~48_combout\ : std_logic;
SIGNAL \p~227_combout\ : std_logic;
SIGNAL \p~228_combout\ : std_logic;
SIGNAL \ra~24_combout\ : std_logic;
SIGNAL \A5~57_combout\ : std_logic;
SIGNAL \p~229_combout\ : std_logic;
SIGNAL \p~230_combout\ : std_logic;
SIGNAL \p~231_combout\ : std_logic;
SIGNAL \p~232_combout\ : std_logic;
SIGNAL \p~233_combout\ : std_logic;
SIGNAL \Add7~47\ : std_logic;
SIGNAL \Add7~48_combout\ : std_logic;
SIGNAL \Add3~47\ : std_logic;
SIGNAL \Add3~48_combout\ : std_logic;
SIGNAL \Add6~45\ : std_logic;
SIGNAL \Add6~46_combout\ : std_logic;
SIGNAL \Add2~45\ : std_logic;
SIGNAL \Add2~46_combout\ : std_logic;
SIGNAL \p~234_combout\ : std_logic;
SIGNAL \p~235_combout\ : std_logic;
SIGNAL \p~236_combout\ : std_logic;
SIGNAL \acc[23]~81\ : std_logic;
SIGNAL \acc[24]~82_combout\ : std_logic;
SIGNAL \Add6~47\ : std_logic;
SIGNAL \Add6~48_combout\ : std_logic;
SIGNAL \ra~25_combout\ : std_logic;
SIGNAL \Add7~49\ : std_logic;
SIGNAL \Add7~50_combout\ : std_logic;
SIGNAL \A5~58_combout\ : std_logic;
SIGNAL \Add3~49\ : std_logic;
SIGNAL \Add3~50_combout\ : std_logic;
SIGNAL \Add2~47\ : std_logic;
SIGNAL \Add2~48_combout\ : std_logic;
SIGNAL \p~244_combout\ : std_logic;
SIGNAL \p~245_combout\ : std_logic;
SIGNAL \A7~86_combout\ : std_logic;
SIGNAL \A3~59_combout\ : std_logic;
SIGNAL \p~239_combout\ : std_logic;
SIGNAL \p~240_combout\ : std_logic;
SIGNAL \p~241_combout\ : std_logic;
SIGNAL \p~242_combout\ : std_logic;
SIGNAL \Add1~49\ : std_logic;
SIGNAL \Add1~50_combout\ : std_logic;
SIGNAL \Add4~45\ : std_logic;
SIGNAL \Add4~46_combout\ : std_logic;
SIGNAL \p~237_combout\ : std_logic;
SIGNAL \Add5~49\ : std_logic;
SIGNAL \Add5~50_combout\ : std_logic;
SIGNAL \p~238_combout\ : std_logic;
SIGNAL \p~243_combout\ : std_logic;
SIGNAL \p~246_combout\ : std_logic;
SIGNAL \acc[24]~83\ : std_logic;
SIGNAL \acc[25]~84_combout\ : std_logic;
SIGNAL \Add4~47\ : std_logic;
SIGNAL \Add4~48_combout\ : std_logic;
SIGNAL \A3~60_combout\ : std_logic;
SIGNAL \Add5~51\ : std_logic;
SIGNAL \Add5~52_combout\ : std_logic;
SIGNAL \A7~87_combout\ : std_logic;
SIGNAL \Add1~51\ : std_logic;
SIGNAL \Add1~52_combout\ : std_logic;
SIGNAL \p~247_combout\ : std_logic;
SIGNAL \p~248_combout\ : std_logic;
SIGNAL \A5~59_combout\ : std_logic;
SIGNAL \ra~26_combout\ : std_logic;
SIGNAL \p~249_combout\ : std_logic;
SIGNAL \p~250_combout\ : std_logic;
SIGNAL \p~251_combout\ : std_logic;
SIGNAL \p~252_combout\ : std_logic;
SIGNAL \p~253_combout\ : std_logic;
SIGNAL \Add3~51\ : std_logic;
SIGNAL \Add3~52_combout\ : std_logic;
SIGNAL \Add6~49\ : std_logic;
SIGNAL \Add6~50_combout\ : std_logic;
SIGNAL \Add2~49\ : std_logic;
SIGNAL \Add2~50_combout\ : std_logic;
SIGNAL \p~254_combout\ : std_logic;
SIGNAL \Add7~51\ : std_logic;
SIGNAL \Add7~52_combout\ : std_logic;
SIGNAL \p~255_combout\ : std_logic;
SIGNAL \p~256_combout\ : std_logic;
SIGNAL \acc[25]~85\ : std_logic;
SIGNAL \acc[26]~86_combout\ : std_logic;
SIGNAL \A5~60_combout\ : std_logic;
SIGNAL \ra~27_combout\ : std_logic;
SIGNAL \A7~88_combout\ : std_logic;
SIGNAL \A3~61_combout\ : std_logic;
SIGNAL \p~259_combout\ : std_logic;
SIGNAL \p~260_combout\ : std_logic;
SIGNAL \p~261_combout\ : std_logic;
SIGNAL \p~262_combout\ : std_logic;
SIGNAL \Add1~53\ : std_logic;
SIGNAL \Add1~54_combout\ : std_logic;
SIGNAL \Add4~49\ : std_logic;
SIGNAL \Add4~50_combout\ : std_logic;
SIGNAL \p~257_combout\ : std_logic;
SIGNAL \Add5~53\ : std_logic;
SIGNAL \Add5~54_combout\ : std_logic;
SIGNAL \p~258_combout\ : std_logic;
SIGNAL \p~263_combout\ : std_logic;
SIGNAL \Add7~53\ : std_logic;
SIGNAL \Add7~54_combout\ : std_logic;
SIGNAL \Add6~51\ : std_logic;
SIGNAL \Add6~52_combout\ : std_logic;
SIGNAL \Add2~51\ : std_logic;
SIGNAL \Add2~52_combout\ : std_logic;
SIGNAL \Add3~53\ : std_logic;
SIGNAL \Add3~54_combout\ : std_logic;
SIGNAL \p~264_combout\ : std_logic;
SIGNAL \p~265_combout\ : std_logic;
SIGNAL \p~266_combout\ : std_logic;
SIGNAL \acc[26]~87\ : std_logic;
SIGNAL \acc[27]~88_combout\ : std_logic;
SIGNAL \A5~61_combout\ : std_logic;
SIGNAL \ra~28_combout\ : std_logic;
SIGNAL \A3~62_combout\ : std_logic;
SIGNAL \p~269_combout\ : std_logic;
SIGNAL \A7~89_combout\ : std_logic;
SIGNAL \p~270_combout\ : std_logic;
SIGNAL \p~271_combout\ : std_logic;
SIGNAL \p~272_combout\ : std_logic;
SIGNAL \p~273_combout\ : std_logic;
SIGNAL \Add1~55\ : std_logic;
SIGNAL \Add1~56_combout\ : std_logic;
SIGNAL \Add5~55\ : std_logic;
SIGNAL \Add5~56_combout\ : std_logic;
SIGNAL \Add4~51\ : std_logic;
SIGNAL \Add4~52_combout\ : std_logic;
SIGNAL \p~267_combout\ : std_logic;
SIGNAL \p~268_combout\ : std_logic;
SIGNAL \Add3~55\ : std_logic;
SIGNAL \Add3~56_combout\ : std_logic;
SIGNAL \Add2~53\ : std_logic;
SIGNAL \Add2~54_combout\ : std_logic;
SIGNAL \Add6~53\ : std_logic;
SIGNAL \Add6~54_combout\ : std_logic;
SIGNAL \p~274_combout\ : std_logic;
SIGNAL \Add7~55\ : std_logic;
SIGNAL \Add7~56_combout\ : std_logic;
SIGNAL \p~275_combout\ : std_logic;
SIGNAL \p~276_combout\ : std_logic;
SIGNAL \acc[27]~89\ : std_logic;
SIGNAL \acc[28]~90_combout\ : std_logic;
SIGNAL \ra~29_combout\ : std_logic;
SIGNAL \Add7~57\ : std_logic;
SIGNAL \Add7~58_combout\ : std_logic;
SIGNAL \Add2~55\ : std_logic;
SIGNAL \Add2~56_combout\ : std_logic;
SIGNAL \Add6~55\ : std_logic;
SIGNAL \Add6~56_combout\ : std_logic;
SIGNAL \p~284_combout\ : std_logic;
SIGNAL \A5~62_combout\ : std_logic;
SIGNAL \Add3~57\ : std_logic;
SIGNAL \Add3~58_combout\ : std_logic;
SIGNAL \p~285_combout\ : std_logic;
SIGNAL \p~279_combout\ : std_logic;
SIGNAL \A3~63_combout\ : std_logic;
SIGNAL \A7~90_combout\ : std_logic;
SIGNAL \p~280_combout\ : std_logic;
SIGNAL \p~281_combout\ : std_logic;
SIGNAL \p~282_combout\ : std_logic;
SIGNAL \Add1~57\ : std_logic;
SIGNAL \Add1~58_combout\ : std_logic;
SIGNAL \Add5~57\ : std_logic;
SIGNAL \Add5~58_combout\ : std_logic;
SIGNAL \Add4~53\ : std_logic;
SIGNAL \Add4~54_combout\ : std_logic;
SIGNAL \p~277_combout\ : std_logic;
SIGNAL \p~278_combout\ : std_logic;
SIGNAL \p~283_combout\ : std_logic;
SIGNAL \p~286_combout\ : std_logic;
SIGNAL \acc[28]~91\ : std_logic;
SIGNAL \acc[29]~92_combout\ : std_logic;
SIGNAL \ra~30_combout\ : std_logic;
SIGNAL \A5~63_combout\ : std_logic;
SIGNAL \A7~91_combout\ : std_logic;
SIGNAL \A3~64_combout\ : std_logic;
SIGNAL \p~289_combout\ : std_logic;
SIGNAL \p~290_combout\ : std_logic;
SIGNAL \p~291_combout\ : std_logic;
SIGNAL \p~292_combout\ : std_logic;
SIGNAL \p~293_combout\ : std_logic;
SIGNAL \Add3~59\ : std_logic;
SIGNAL \Add3~60_combout\ : std_logic;
SIGNAL \Add7~59\ : std_logic;
SIGNAL \Add7~60_combout\ : std_logic;
SIGNAL \Add6~57\ : std_logic;
SIGNAL \Add6~58_combout\ : std_logic;
SIGNAL \Add2~57\ : std_logic;
SIGNAL \Add2~58_combout\ : std_logic;
SIGNAL \p~294_combout\ : std_logic;
SIGNAL \p~295_combout\ : std_logic;
SIGNAL \Add5~59\ : std_logic;
SIGNAL \Add5~60_combout\ : std_logic;
SIGNAL \Add1~59\ : std_logic;
SIGNAL \Add1~60_combout\ : std_logic;
SIGNAL \Add4~55\ : std_logic;
SIGNAL \Add4~56_combout\ : std_logic;
SIGNAL \p~287_combout\ : std_logic;
SIGNAL \p~288_combout\ : std_logic;
SIGNAL \p~296_combout\ : std_logic;
SIGNAL \acc[29]~93\ : std_logic;
SIGNAL \acc[30]~94_combout\ : std_logic;
SIGNAL \ra~31_combout\ : std_logic;
SIGNAL \Add7~61\ : std_logic;
SIGNAL \Add7~62_combout\ : std_logic;
SIGNAL \A5~64_combout\ : std_logic;
SIGNAL \Add3~61\ : std_logic;
SIGNAL \Add3~62_combout\ : std_logic;
SIGNAL \Add2~59\ : std_logic;
SIGNAL \Add2~60_combout\ : std_logic;
SIGNAL \Add6~59\ : std_logic;
SIGNAL \Add6~60_combout\ : std_logic;
SIGNAL \p~304_combout\ : std_logic;
SIGNAL \p~305_combout\ : std_logic;
SIGNAL \A7~92_combout\ : std_logic;
SIGNAL \A3~65_combout\ : std_logic;
SIGNAL \p~299_combout\ : std_logic;
SIGNAL \p~300_combout\ : std_logic;
SIGNAL \p~301_combout\ : std_logic;
SIGNAL \p~302_combout\ : std_logic;
SIGNAL \Add1~61\ : std_logic;
SIGNAL \Add1~62_combout\ : std_logic;
SIGNAL \Add5~61\ : std_logic;
SIGNAL \Add5~62_combout\ : std_logic;
SIGNAL \Add4~57\ : std_logic;
SIGNAL \Add4~58_combout\ : std_logic;
SIGNAL \p~297_combout\ : std_logic;
SIGNAL \p~298_combout\ : std_logic;
SIGNAL \p~303_combout\ : std_logic;
SIGNAL \p~306_combout\ : std_logic;
SIGNAL \acc[30]~95\ : std_logic;
SIGNAL \acc[31]~96_combout\ : std_logic;
SIGNAL \done_v~0_combout\ : std_logic;
SIGNAL \done_v~q\ : std_logic;
SIGNAL acc : std_logic_vector(31 DOWNTO 0);
SIGNAL A3 : std_logic_vector(31 DOWNTO 0);
SIGNAL A5 : std_logic_vector(31 DOWNTO 0);
SIGNAL p : std_logic_vector(31 DOWNTO 0);
SIGNAL rb : std_logic_vector(15 DOWNTO 0);
SIGNAL ra : std_logic_vector(31 DOWNTO 0);
SIGNAL A7 : std_logic_vector(31 DOWNTO 0);
SIGNAL \ALT_INV_ld_clr~0_combout\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_clk <= clk;
ww_rst <= rst;
ww_start <= start;
ww_a <= a;
ww_b <= b;
res <= ww_res;
done <= ww_done;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\rst~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \rst~input_o\);

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);
\ALT_INV_ld_clr~0_combout\ <= NOT \ld_clr~0_combout\;
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: IOOBUF_X23_Y0_N2
\res[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => acc(0),
	devoe => ww_devoe,
	o => \res[0]~output_o\);

-- Location: IOOBUF_X16_Y24_N23
\res[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => acc(1),
	devoe => ww_devoe,
	o => \res[1]~output_o\);

-- Location: IOOBUF_X23_Y24_N9
\res[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => acc(2),
	devoe => ww_devoe,
	o => \res[2]~output_o\);

-- Location: IOOBUF_X23_Y24_N23
\res[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => acc(3),
	devoe => ww_devoe,
	o => \res[3]~output_o\);

-- Location: IOOBUF_X21_Y24_N9
\res[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => acc(4),
	devoe => ww_devoe,
	o => \res[4]~output_o\);

-- Location: IOOBUF_X34_Y9_N16
\res[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => acc(5),
	devoe => ww_devoe,
	o => \res[5]~output_o\);

-- Location: IOOBUF_X34_Y8_N23
\res[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => acc(6),
	devoe => ww_devoe,
	o => \res[6]~output_o\);

-- Location: IOOBUF_X13_Y24_N23
\res[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => acc(7),
	devoe => ww_devoe,
	o => \res[7]~output_o\);

-- Location: IOOBUF_X11_Y24_N9
\res[8]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => acc(8),
	devoe => ww_devoe,
	o => \res[8]~output_o\);

-- Location: IOOBUF_X21_Y24_N2
\res[9]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => acc(9),
	devoe => ww_devoe,
	o => \res[9]~output_o\);

-- Location: IOOBUF_X16_Y24_N16
\res[10]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => acc(10),
	devoe => ww_devoe,
	o => \res[10]~output_o\);

-- Location: IOOBUF_X34_Y9_N23
\res[11]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => acc(11),
	devoe => ww_devoe,
	o => \res[11]~output_o\);

-- Location: IOOBUF_X34_Y20_N2
\res[12]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => acc(12),
	devoe => ww_devoe,
	o => \res[12]~output_o\);

-- Location: IOOBUF_X30_Y24_N23
\res[13]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => acc(13),
	devoe => ww_devoe,
	o => \res[13]~output_o\);

-- Location: IOOBUF_X23_Y24_N16
\res[14]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => acc(14),
	devoe => ww_devoe,
	o => \res[14]~output_o\);

-- Location: IOOBUF_X25_Y0_N2
\res[15]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => acc(15),
	devoe => ww_devoe,
	o => \res[15]~output_o\);

-- Location: IOOBUF_X11_Y24_N2
\res[16]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => acc(16),
	devoe => ww_devoe,
	o => \res[16]~output_o\);

-- Location: IOOBUF_X11_Y24_N16
\res[17]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => acc(17),
	devoe => ww_devoe,
	o => \res[17]~output_o\);

-- Location: IOOBUF_X34_Y11_N9
\res[18]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => acc(18),
	devoe => ww_devoe,
	o => \res[18]~output_o\);

-- Location: IOOBUF_X34_Y11_N2
\res[19]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => acc(19),
	devoe => ww_devoe,
	o => \res[19]~output_o\);

-- Location: IOOBUF_X34_Y20_N9
\res[20]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => acc(20),
	devoe => ww_devoe,
	o => \res[20]~output_o\);

-- Location: IOOBUF_X23_Y24_N2
\res[21]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => acc(21),
	devoe => ww_devoe,
	o => \res[21]~output_o\);

-- Location: IOOBUF_X21_Y0_N9
\res[22]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => acc(22),
	devoe => ww_devoe,
	o => \res[22]~output_o\);

-- Location: IOOBUF_X34_Y18_N16
\res[23]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => acc(23),
	devoe => ww_devoe,
	o => \res[23]~output_o\);

-- Location: IOOBUF_X34_Y19_N16
\res[24]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => acc(24),
	devoe => ww_devoe,
	o => \res[24]~output_o\);

-- Location: IOOBUF_X34_Y7_N9
\res[25]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => acc(25),
	devoe => ww_devoe,
	o => \res[25]~output_o\);

-- Location: IOOBUF_X34_Y19_N2
\res[26]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => acc(26),
	devoe => ww_devoe,
	o => \res[26]~output_o\);

-- Location: IOOBUF_X34_Y8_N9
\res[27]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => acc(27),
	devoe => ww_devoe,
	o => \res[27]~output_o\);

-- Location: IOOBUF_X34_Y7_N23
\res[28]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => acc(28),
	devoe => ww_devoe,
	o => \res[28]~output_o\);

-- Location: IOOBUF_X21_Y0_N2
\res[29]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => acc(29),
	devoe => ww_devoe,
	o => \res[29]~output_o\);

-- Location: IOOBUF_X34_Y8_N16
\res[30]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => acc(30),
	devoe => ww_devoe,
	o => \res[30]~output_o\);

-- Location: IOOBUF_X34_Y19_N9
\res[31]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => acc(31),
	devoe => ww_devoe,
	o => \res[31]~output_o\);

-- Location: IOOBUF_X34_Y9_N9
\done~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \done_v~q\,
	devoe => ww_devoe,
	o => \done~output_o\);

-- Location: IOIBUF_X0_Y11_N8
\clk~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: CLKCTRL_G2
\clk~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk~inputclkctrl_outclk\);

-- Location: IOIBUF_X0_Y18_N22
\b[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(0),
	o => \b[0]~input_o\);

-- Location: IOIBUF_X34_Y17_N22
\start~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_start,
	o => \start~input_o\);

-- Location: IOIBUF_X30_Y24_N1
\b[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(5),
	o => \b[5]~input_o\);

-- Location: IOIBUF_X25_Y24_N1
\b[9]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(9),
	o => \b[9]~input_o\);

-- Location: IOIBUF_X32_Y24_N15
\b[13]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(13),
	o => \b[13]~input_o\);

-- Location: LCCOMB_X25_Y20_N0
\rb~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \rb~6_combout\ = (\b[13]~input_o\ & (\start~input_o\ & !\cs~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b[13]~input_o\,
	datac => \start~input_o\,
	datad => \cs~q\,
	combout => \rb~6_combout\);

-- Location: IOIBUF_X0_Y11_N15
\rst~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rst,
	o => \rst~input_o\);

-- Location: CLKCTRL_G4
\rst~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \rst~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \rst~inputclkctrl_outclk\);

-- Location: FF_X25_Y20_N1
\rb[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \rb~6_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rb(13));

-- Location: LCCOMB_X25_Y20_N26
\rb~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \rb~10_combout\ = (\start~input_o\ & ((\cs~q\ & ((rb(13)))) # (!\cs~q\ & (\b[9]~input_o\)))) # (!\start~input_o\ & (((rb(13)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b[9]~input_o\,
	datab => rb(13),
	datac => \start~input_o\,
	datad => \cs~q\,
	combout => \rb~10_combout\);

-- Location: FF_X25_Y20_N27
\rb[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \rb~10_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rb(9));

-- Location: LCCOMB_X25_Y20_N8
\rb~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \rb~14_combout\ = (\start~input_o\ & ((\cs~q\ & ((rb(9)))) # (!\cs~q\ & (\b[5]~input_o\)))) # (!\start~input_o\ & (((rb(9)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b[5]~input_o\,
	datab => \start~input_o\,
	datac => rb(9),
	datad => \cs~q\,
	combout => \rb~14_combout\);

-- Location: FF_X25_Y20_N9
\rb[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \rb~14_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rb(5));

-- Location: IOIBUF_X34_Y9_N1
\b[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(1),
	o => \b[1]~input_o\);

-- Location: LCCOMB_X23_Y18_N16
\rb~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \rb~0_combout\ = (\cs~q\ & (rb(5))) # (!\cs~q\ & ((\start~input_o\ & ((\b[1]~input_o\))) # (!\start~input_o\ & (rb(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => rb(5),
	datab => \b[1]~input_o\,
	datac => \cs~q\,
	datad => \start~input_o\,
	combout => \rb~0_combout\);

-- Location: FF_X23_Y18_N17
\rb[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \rb~0_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rb(1));

-- Location: IOIBUF_X28_Y24_N22
\b[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(2),
	o => \b[2]~input_o\);

-- Location: IOIBUF_X28_Y24_N8
\b[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(6),
	o => \b[6]~input_o\);

-- Location: IOIBUF_X28_Y24_N15
\b[10]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(10),
	o => \b[10]~input_o\);

-- Location: IOIBUF_X32_Y24_N8
\b[14]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(14),
	o => \b[14]~input_o\);

-- Location: LCCOMB_X25_Y20_N18
\rb~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \rb~5_combout\ = (!\cs~q\ & (\b[14]~input_o\ & \start~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \cs~q\,
	datab => \b[14]~input_o\,
	datad => \start~input_o\,
	combout => \rb~5_combout\);

-- Location: FF_X25_Y20_N19
\rb[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \rb~5_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rb(14));

-- Location: LCCOMB_X25_Y20_N4
\rb~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \rb~9_combout\ = (\start~input_o\ & ((\cs~q\ & ((rb(14)))) # (!\cs~q\ & (\b[10]~input_o\)))) # (!\start~input_o\ & (((rb(14)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b[10]~input_o\,
	datab => rb(14),
	datac => \start~input_o\,
	datad => \cs~q\,
	combout => \rb~9_combout\);

-- Location: FF_X25_Y20_N5
\rb[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \rb~9_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rb(10));

-- Location: LCCOMB_X25_Y20_N6
\rb~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \rb~13_combout\ = (\start~input_o\ & ((\cs~q\ & ((rb(10)))) # (!\cs~q\ & (\b[6]~input_o\)))) # (!\start~input_o\ & (((rb(10)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b[6]~input_o\,
	datab => rb(10),
	datac => \start~input_o\,
	datad => \cs~q\,
	combout => \rb~13_combout\);

-- Location: FF_X25_Y20_N7
\rb[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \rb~13_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rb(6));

-- Location: LCCOMB_X24_Y20_N20
\rb~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \rb~2_combout\ = (\cs~q\ & (((rb(6))))) # (!\cs~q\ & ((\start~input_o\ & (\b[2]~input_o\)) # (!\start~input_o\ & ((rb(6))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111101000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \cs~q\,
	datab => \b[2]~input_o\,
	datac => \start~input_o\,
	datad => rb(6),
	combout => \rb~2_combout\);

-- Location: FF_X24_Y20_N21
\rb[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \rb~2_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rb(2));

-- Location: LCCOMB_X23_Y18_N8
\Add0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~2_combout\ = (!rb(0)) # (!rb(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => rb(2),
	datad => rb(0),
	combout => \Add0~2_combout\);

-- Location: IOIBUF_X25_Y24_N22
\b[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(7),
	o => \b[7]~input_o\);

-- Location: IOIBUF_X25_Y24_N15
\b[11]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(11),
	o => \b[11]~input_o\);

-- Location: IOIBUF_X25_Y24_N8
\b[15]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(15),
	o => \b[15]~input_o\);

-- Location: LCCOMB_X25_Y20_N20
\rb~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \rb~4_combout\ = (!\cs~q\ & (\b[15]~input_o\ & \start~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \cs~q\,
	datab => \b[15]~input_o\,
	datad => \start~input_o\,
	combout => \rb~4_combout\);

-- Location: FF_X25_Y20_N21
\rb[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \rb~4_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rb(15));

-- Location: LCCOMB_X25_Y20_N30
\rb~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \rb~8_combout\ = (\start~input_o\ & ((\cs~q\ & ((rb(15)))) # (!\cs~q\ & (\b[11]~input_o\)))) # (!\start~input_o\ & (((rb(15)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b[11]~input_o\,
	datab => rb(15),
	datac => \start~input_o\,
	datad => \cs~q\,
	combout => \rb~8_combout\);

-- Location: FF_X25_Y20_N31
\rb[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \rb~8_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rb(11));

-- Location: LCCOMB_X25_Y20_N24
\rb~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \rb~12_combout\ = (\start~input_o\ & ((\cs~q\ & ((rb(11)))) # (!\cs~q\ & (\b[7]~input_o\)))) # (!\start~input_o\ & (((rb(11)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \start~input_o\,
	datab => \b[7]~input_o\,
	datac => rb(11),
	datad => \cs~q\,
	combout => \rb~12_combout\);

-- Location: FF_X25_Y20_N25
\rb[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \rb~12_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rb(7));

-- Location: IOIBUF_X25_Y0_N8
\b[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(3),
	o => \b[3]~input_o\);

-- Location: LCCOMB_X24_Y16_N0
\rb~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \rb~3_combout\ = (\start~input_o\ & ((\cs~q\ & (rb(7))) # (!\cs~q\ & ((\b[3]~input_o\))))) # (!\start~input_o\ & (rb(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111010100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => rb(7),
	datab => \start~input_o\,
	datac => \cs~q\,
	datad => \b[3]~input_o\,
	combout => \rb~3_combout\);

-- Location: FF_X24_Y16_N1
\rb[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \rb~3_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rb(3));

-- Location: LCCOMB_X23_Y18_N22
\Add0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~3_combout\ = rb(3) $ (((\rcarry~q\ & (rb(1) & !\Add0~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011100001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rcarry~q\,
	datab => rb(1),
	datac => \Add0~2_combout\,
	datad => rb(3),
	combout => \Add0~3_combout\);

-- Location: LCCOMB_X24_Y16_N22
\end_op~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \end_op~3_combout\ = (rb(2)) # ((rb(3)) # ((rb(1)) # (rb(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => rb(2),
	datab => rb(3),
	datac => rb(1),
	datad => rb(0),
	combout => \end_op~3_combout\);

-- Location: IOIBUF_X32_Y24_N22
\b[12]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(12),
	o => \b[12]~input_o\);

-- Location: LCCOMB_X25_Y20_N22
\rb~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \rb~7_combout\ = (\b[12]~input_o\ & (\start~input_o\ & !\cs~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b[12]~input_o\,
	datac => \start~input_o\,
	datad => \cs~q\,
	combout => \rb~7_combout\);

-- Location: FF_X25_Y20_N23
\rb[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \rb~7_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rb(12));

-- Location: LCCOMB_X25_Y20_N12
\end_op~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \end_op~0_combout\ = (rb(12)) # ((rb(14)) # ((rb(13)) # (rb(15))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => rb(12),
	datab => rb(14),
	datac => rb(13),
	datad => rb(15),
	combout => \end_op~0_combout\);

-- Location: IOIBUF_X30_Y24_N8
\b[8]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(8),
	o => \b[8]~input_o\);

-- Location: LCCOMB_X25_Y20_N16
\rb~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \rb~11_combout\ = (\start~input_o\ & ((\cs~q\ & (rb(12))) # (!\cs~q\ & ((\b[8]~input_o\))))) # (!\start~input_o\ & (rb(12)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => rb(12),
	datab => \start~input_o\,
	datac => \b[8]~input_o\,
	datad => \cs~q\,
	combout => \rb~11_combout\);

-- Location: FF_X25_Y20_N17
\rb[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \rb~11_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rb(8));

-- Location: LCCOMB_X25_Y20_N14
\end_op~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \end_op~1_combout\ = (rb(11)) # ((rb(10)) # ((rb(9)) # (rb(8))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => rb(11),
	datab => rb(10),
	datac => rb(9),
	datad => rb(8),
	combout => \end_op~1_combout\);

-- Location: IOIBUF_X28_Y24_N1
\b[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(4),
	o => \b[4]~input_o\);

-- Location: LCCOMB_X25_Y20_N10
\rb~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \rb~15_combout\ = (\start~input_o\ & ((\cs~q\ & ((rb(8)))) # (!\cs~q\ & (\b[4]~input_o\)))) # (!\start~input_o\ & (((rb(8)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b[4]~input_o\,
	datab => rb(8),
	datac => \start~input_o\,
	datad => \cs~q\,
	combout => \rb~15_combout\);

-- Location: FF_X25_Y20_N11
\rb[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \rb~15_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rb(4));

-- Location: LCCOMB_X25_Y20_N28
\end_op~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \end_op~2_combout\ = (rb(6)) # ((rb(7)) # ((rb(5)) # (rb(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => rb(6),
	datab => rb(7),
	datac => rb(5),
	datad => rb(4),
	combout => \end_op~2_combout\);

-- Location: LCCOMB_X24_Y16_N24
\end_op~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \end_op~4_combout\ = (\end_op~3_combout\) # ((\end_op~0_combout\) # ((\end_op~1_combout\) # (\end_op~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \end_op~3_combout\,
	datab => \end_op~0_combout\,
	datac => \end_op~1_combout\,
	datad => \end_op~2_combout\,
	combout => \end_op~4_combout\);

-- Location: LCCOMB_X24_Y16_N14
\p~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~11_combout\ = (\cs~q\ & (\Add0~3_combout\ & ((\rcarry~q\) # (\end_op~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \cs~q\,
	datab => \rcarry~q\,
	datac => \Add0~3_combout\,
	datad => \end_op~4_combout\,
	combout => \p~11_combout\);

-- Location: LCCOMB_X24_Y18_N30
\Add0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~1_combout\ = rb(2) $ (((rb(0) & (\rcarry~q\ & rb(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => rb(0),
	datab => \rcarry~q\,
	datac => rb(1),
	datad => rb(2),
	combout => \Add0~1_combout\);

-- Location: LCCOMB_X24_Y14_N12
\Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~0_combout\ = rb(1) $ (((\rcarry~q\ & rb(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \rcarry~q\,
	datac => rb(1),
	datad => rb(0),
	combout => \Add0~0_combout\);

-- Location: LCCOMB_X24_Y18_N6
\rcarry~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcarry~1_combout\ = (\p~11_combout\ & ((\Add0~4_combout\) # ((\Add0~1_combout\) # (\Add0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \p~11_combout\,
	datab => \Add0~4_combout\,
	datac => \Add0~1_combout\,
	datad => \Add0~0_combout\,
	combout => \rcarry~1_combout\);

-- Location: LCCOMB_X24_Y18_N24
\rcarry~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcarry~2_combout\ = (\rcarry~1_combout\) # ((!\cs~q\ & \rcarry~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \cs~q\,
	datac => \rcarry~q\,
	datad => \rcarry~1_combout\,
	combout => \rcarry~2_combout\);

-- Location: LCCOMB_X18_Y15_N8
\ld_clr~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ld_clr~0_combout\ = (!\cs~q\ & \start~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \cs~q\,
	datad => \start~input_o\,
	combout => \ld_clr~0_combout\);

-- Location: FF_X24_Y18_N25
rcarry : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \rcarry~2_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	sclr => \ld_clr~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rcarry~q\);

-- Location: LCCOMB_X24_Y17_N12
\acc[20]~98\ : cycloneive_lcell_comb
-- Equation(s):
-- \acc[20]~98_combout\ = (\cs~q\ & ((\rcarry~q\) # ((\end_op~4_combout\)))) # (!\cs~q\ & (((\start~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rcarry~q\,
	datab => \end_op~4_combout\,
	datac => \cs~q\,
	datad => \start~input_o\,
	combout => \acc[20]~98_combout\);

-- Location: LCCOMB_X24_Y17_N8
\cs~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \cs~feeder_combout\ = \acc[20]~98_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \acc[20]~98_combout\,
	combout => \cs~feeder_combout\);

-- Location: FF_X24_Y17_N9
cs : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \cs~feeder_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cs~q\);

-- Location: LCCOMB_X23_Y18_N26
\rb~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \rb~1_combout\ = (\start~input_o\ & ((\cs~q\ & ((rb(4)))) # (!\cs~q\ & (\b[0]~input_o\)))) # (!\start~input_o\ & (((rb(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101100001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b[0]~input_o\,
	datab => \start~input_o\,
	datac => \cs~q\,
	datad => rb(4),
	combout => \rb~1_combout\);

-- Location: FF_X23_Y18_N27
\rb[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \rb~1_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rb(0));

-- Location: LCCOMB_X23_Y18_N30
\Add0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~4_combout\ = rb(0) $ (\rcarry~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => rb(0),
	datad => \rcarry~q\,
	combout => \Add0~4_combout\);

-- Location: LCCOMB_X24_Y16_N10
\rcarry~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcarry~0_combout\ = ((!\rcarry~q\ & !\end_op~4_combout\)) # (!\cs~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \rcarry~q\,
	datac => \cs~q\,
	datad => \end_op~4_combout\,
	combout => \rcarry~0_combout\);

-- Location: FF_X22_Y16_N1
\p[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \p~6_combout\,
	ena => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => p(0));

-- Location: IOIBUF_X18_Y24_N22
\a[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(0),
	o => \a[0]~input_o\);

-- Location: LCCOMB_X24_Y21_N0
\A3~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \A3~17_combout\ = (\a[0]~input_o\ & (!\cs~q\ & \start~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \a[0]~input_o\,
	datab => \cs~q\,
	datac => \start~input_o\,
	combout => \A3~17_combout\);

-- Location: FF_X26_Y18_N1
\A3[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \A3~17_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => A3(0));

-- Location: FF_X23_Y20_N1
\A7[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \A3~17_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => A7(0));

-- Location: LCCOMB_X21_Y18_N0
\ra~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ra~0_combout\ = (\a[0]~input_o\ & (((!\end_op~4_combout\ & !\rcarry~q\)) # (!\cs~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \cs~q\,
	datab => \end_op~4_combout\,
	datac => \a[0]~input_o\,
	datad => \rcarry~q\,
	combout => \ra~0_combout\);

-- Location: FF_X21_Y18_N1
\ra[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \ra~0_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ra(0));

-- Location: LCCOMB_X23_Y18_N28
\p~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~4_combout\ = (A7(0) & ((ra(0)) # (\Add0~1_combout\ $ (\Add0~3_combout\)))) # (!A7(0) & (ra(0) & (\Add0~1_combout\ $ (!\Add0~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => A7(0),
	datab => ra(0),
	datac => \Add0~1_combout\,
	datad => \Add0~3_combout\,
	combout => \p~4_combout\);

-- Location: LCCOMB_X22_Y16_N18
\p~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~5_combout\ = (\Add0~0_combout\ & ((\Add0~1_combout\ & ((\p~4_combout\))) # (!\Add0~1_combout\ & (A3(0))))) # (!\Add0~0_combout\ & ((\Add0~1_combout\ & (A3(0))) # (!\Add0~1_combout\ & ((\p~4_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~0_combout\,
	datab => A3(0),
	datac => \p~4_combout\,
	datad => \Add0~1_combout\,
	combout => \p~5_combout\);

-- Location: LCCOMB_X22_Y16_N0
\p~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~6_combout\ = (\rcarry~0_combout\ & (((p(0))))) # (!\rcarry~0_combout\ & (\Add0~4_combout\ & ((\p~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~4_combout\,
	datab => \rcarry~0_combout\,
	datac => p(0),
	datad => \p~5_combout\,
	combout => \p~6_combout\);

-- Location: LCCOMB_X23_Y16_N0
\acc[0]~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \acc[0]~34_combout\ = (\p~6_combout\ & (acc(0) $ (VCC))) # (!\p~6_combout\ & (acc(0) & VCC))
-- \acc[0]~35\ = CARRY((\p~6_combout\ & acc(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \p~6_combout\,
	datab => acc(0),
	datad => VCC,
	combout => \acc[0]~34_combout\,
	cout => \acc[0]~35\);

-- Location: FF_X23_Y16_N1
\acc[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \acc[0]~34_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	sclr => \ld_clr~0_combout\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => acc(0));

-- Location: LCCOMB_X23_Y18_N12
\p~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~8_combout\ = (\Add0~1_combout\ & ((\Add0~3_combout\ & (ra(0))) # (!\Add0~3_combout\ & ((A3(0)))))) # (!\Add0~1_combout\ & ((\Add0~3_combout\ & ((A3(0)))) # (!\Add0~3_combout\ & (ra(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111010000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~1_combout\,
	datab => ra(0),
	datac => \Add0~3_combout\,
	datad => A3(0),
	combout => \p~8_combout\);

-- Location: LCCOMB_X23_Y18_N14
\p~307\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~307_combout\ = (\p~8_combout\ & ((rb(1) & (!rb(0) & !\rcarry~q\)) # (!rb(1) & (rb(0) & \rcarry~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \p~8_combout\,
	datab => rb(1),
	datac => rb(0),
	datad => \rcarry~q\,
	combout => \p~307_combout\);

-- Location: FF_X23_Y18_N1
\p[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \p~9_combout\,
	ena => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => p(1));

-- Location: IOIBUF_X13_Y24_N8
\a[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(1),
	o => \a[1]~input_o\);

-- Location: LCCOMB_X19_Y18_N10
\A5~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \A5~17_combout\ = (\a[1]~input_o\ & (!\cs~q\ & \start~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \a[1]~input_o\,
	datab => \cs~q\,
	datad => \start~input_o\,
	combout => \A5~17_combout\);

-- Location: FF_X18_Y18_N15
\A5[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \A5~17_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => A5(1));

-- Location: LCCOMB_X21_Y16_N0
\ra~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \ra~1_combout\ = (\a[1]~input_o\ & (((!\rcarry~q\ & !\end_op~4_combout\)) # (!\cs~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \a[1]~input_o\,
	datab => \rcarry~q\,
	datac => \end_op~4_combout\,
	datad => \cs~q\,
	combout => \ra~1_combout\);

-- Location: FF_X21_Y16_N1
\ra[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \ra~1_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ra(1));

-- Location: LCCOMB_X23_Y18_N2
\Mux30~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux30~2_combout\ = (\Add0~1_combout\ & ((A5(1)) # ((\Add0~3_combout\)))) # (!\Add0~1_combout\ & (((!\Add0~3_combout\ & ra(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~1_combout\,
	datab => A5(1),
	datac => \Add0~3_combout\,
	datad => ra(1),
	combout => \Mux30~2_combout\);

-- Location: LCCOMB_X25_Y18_N16
\A3[1]~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \A3[1]~18_combout\ = (\a[1]~input_o\ & (\a[0]~input_o\ $ (VCC))) # (!\a[1]~input_o\ & (\a[0]~input_o\ & VCC))
-- \A3[1]~19\ = CARRY((\a[1]~input_o\ & \a[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \a[1]~input_o\,
	datab => \a[0]~input_o\,
	datad => VCC,
	combout => \A3[1]~18_combout\,
	cout => \A3[1]~19\);

-- Location: LCCOMB_X19_Y18_N6
\~GND\ : cycloneive_lcell_comb
-- Equation(s):
-- \~GND~combout\ = GND

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \~GND~combout\);

-- Location: FF_X25_Y18_N17
\A3[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \A3[1]~18_combout\,
	asdata => \~GND~combout\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => \ALT_INV_ld_clr~0_combout\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => A3(1));

-- Location: LCCOMB_X26_Y18_N0
\Add5~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add5~1_cout\ = CARRY(!A3(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => A3(0),
	datad => VCC,
	cout => \Add5~1_cout\);

-- Location: LCCOMB_X26_Y18_N2
\Add5~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add5~2_combout\ = (A3(1) & ((\Add5~1_cout\) # (GND))) # (!A3(1) & (!\Add5~1_cout\))
-- \Add5~3\ = CARRY((A3(1)) # (!\Add5~1_cout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => A3(1),
	datad => VCC,
	cin => \Add5~1_cout\,
	combout => \Add5~2_combout\,
	cout => \Add5~3\);

-- Location: LCCOMB_X24_Y21_N12
\Add10~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add10~1_cout\ = CARRY(!\a[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \a[0]~input_o\,
	datad => VCC,
	cout => \Add10~1_cout\);

-- Location: LCCOMB_X24_Y21_N14
\Add10~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add10~2_combout\ = (\a[1]~input_o\ & ((\Add10~1_cout\) # (GND))) # (!\a[1]~input_o\ & (!\Add10~1_cout\))
-- \Add10~3\ = CARRY((\a[1]~input_o\) # (!\Add10~1_cout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \a[1]~input_o\,
	datad => VCC,
	cin => \Add10~1_cout\,
	combout => \Add10~2_combout\,
	cout => \Add10~3\);

-- Location: LCCOMB_X24_Y21_N10
\A7~62\ : cycloneive_lcell_comb
-- Equation(s):
-- \A7~62_combout\ = (!\cs~q\ & (\start~input_o\ & \Add10~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \cs~q\,
	datac => \start~input_o\,
	datad => \Add10~2_combout\,
	combout => \A7~62_combout\);

-- Location: FF_X23_Y20_N11
\A7[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \A7~62_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => A7(1));

-- Location: LCCOMB_X23_Y20_N0
\Add1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~1_cout\ = CARRY(!A7(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => A7(0),
	datad => VCC,
	cout => \Add1~1_cout\);

-- Location: LCCOMB_X23_Y20_N2
\Add1~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~2_combout\ = (A7(1) & ((\Add1~1_cout\) # (GND))) # (!A7(1) & (!\Add1~1_cout\))
-- \Add1~3\ = CARRY((A7(1)) # (!\Add1~1_cout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => A7(1),
	datad => VCC,
	cin => \Add1~1_cout\,
	combout => \Add1~2_combout\,
	cout => \Add1~3\);

-- Location: LCCOMB_X23_Y18_N4
\Mux30~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux30~3_combout\ = (\Add0~3_combout\ & ((\Mux30~2_combout\ & (\Add5~2_combout\)) # (!\Mux30~2_combout\ & ((\Add1~2_combout\))))) # (!\Add0~3_combout\ & (\Mux30~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~3_combout\,
	datab => \Mux30~2_combout\,
	datac => \Add5~2_combout\,
	datad => \Add1~2_combout\,
	combout => \Mux30~3_combout\);

-- Location: LCCOMB_X23_Y18_N18
\Mux30~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux30~0_combout\ = (\Add0~1_combout\ & ((A7(1)) # ((\Add0~3_combout\)))) # (!\Add0~1_combout\ & (((A3(1) & !\Add0~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => A7(1),
	datab => A3(1),
	datac => \Add0~1_combout\,
	datad => \Add0~3_combout\,
	combout => \Mux30~0_combout\);

-- Location: LCCOMB_X18_Y18_N0
\Add3~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~1_cout\ = CARRY(!A3(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => A3(0),
	datad => VCC,
	cout => \Add3~1_cout\);

-- Location: LCCOMB_X18_Y18_N2
\Add3~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~2_combout\ = (A5(1) & ((\Add3~1_cout\) # (GND))) # (!A5(1) & (!\Add3~1_cout\))
-- \Add3~3\ = CARRY((A5(1)) # (!\Add3~1_cout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => A5(1),
	datad => VCC,
	cin => \Add3~1_cout\,
	combout => \Add3~2_combout\,
	cout => \Add3~3\);

-- Location: LCCOMB_X23_Y14_N0
\Add7~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add7~1_cout\ = CARRY(!ra(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => ra(0),
	datad => VCC,
	cout => \Add7~1_cout\);

-- Location: LCCOMB_X23_Y14_N2
\Add7~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add7~2_combout\ = (ra(1) & ((\Add7~1_cout\) # (GND))) # (!ra(1) & (!\Add7~1_cout\))
-- \Add7~3\ = CARRY((ra(1)) # (!\Add7~1_cout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => ra(1),
	datad => VCC,
	cin => \Add7~1_cout\,
	combout => \Add7~2_combout\,
	cout => \Add7~3\);

-- Location: LCCOMB_X23_Y18_N24
\Mux30~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux30~1_combout\ = (\Add0~3_combout\ & ((\Mux30~0_combout\ & ((\Add7~2_combout\))) # (!\Mux30~0_combout\ & (\Add3~2_combout\)))) # (!\Add0~3_combout\ & (\Mux30~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110001100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~3_combout\,
	datab => \Mux30~0_combout\,
	datac => \Add3~2_combout\,
	datad => \Add7~2_combout\,
	combout => \Mux30~1_combout\);

-- Location: LCCOMB_X23_Y18_N6
\p~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~7_combout\ = (\Add0~4_combout\ & ((\Add0~0_combout\ & ((\Mux30~1_combout\))) # (!\Add0~0_combout\ & (\Mux30~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~4_combout\,
	datab => \Add0~0_combout\,
	datac => \Mux30~3_combout\,
	datad => \Mux30~1_combout\,
	combout => \p~7_combout\);

-- Location: LCCOMB_X23_Y18_N0
\p~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~9_combout\ = (\rcarry~0_combout\ & (((p(1))))) # (!\rcarry~0_combout\ & ((\p~307_combout\) # ((\p~7_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010111100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rcarry~0_combout\,
	datab => \p~307_combout\,
	datac => p(1),
	datad => \p~7_combout\,
	combout => \p~9_combout\);

-- Location: LCCOMB_X23_Y16_N2
\acc[1]~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \acc[1]~36_combout\ = (\p~9_combout\ & ((acc(1) & (\acc[0]~35\ & VCC)) # (!acc(1) & (!\acc[0]~35\)))) # (!\p~9_combout\ & ((acc(1) & (!\acc[0]~35\)) # (!acc(1) & ((\acc[0]~35\) # (GND)))))
-- \acc[1]~37\ = CARRY((\p~9_combout\ & (!acc(1) & !\acc[0]~35\)) # (!\p~9_combout\ & ((!\acc[0]~35\) # (!acc(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \p~9_combout\,
	datab => acc(1),
	datad => VCC,
	cin => \acc[0]~35\,
	combout => \acc[1]~36_combout\,
	cout => \acc[1]~37\);

-- Location: FF_X23_Y16_N3
\acc[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \acc[1]~36_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	sclr => \ld_clr~0_combout\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => acc(1));

-- Location: LCCOMB_X24_Y14_N22
\p[2]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \p[2]~feeder_combout\ = \p~12_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \p~12_combout\,
	combout => \p[2]~feeder_combout\);

-- Location: FF_X24_Y14_N23
\p[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \p[2]~feeder_combout\,
	ena => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => p(2));

-- Location: IOIBUF_X16_Y24_N8
\a[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(2),
	o => \a[2]~input_o\);

-- Location: LCCOMB_X24_Y21_N16
\Add10~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add10~4_combout\ = (\a[2]~input_o\ & (!\Add10~3\ & VCC)) # (!\a[2]~input_o\ & (\Add10~3\ $ (GND)))
-- \Add10~5\ = CARRY((!\a[2]~input_o\ & !\Add10~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \a[2]~input_o\,
	datad => VCC,
	cin => \Add10~3\,
	combout => \Add10~4_combout\,
	cout => \Add10~5\);

-- Location: LCCOMB_X22_Y20_N6
\A7~63\ : cycloneive_lcell_comb
-- Equation(s):
-- \A7~63_combout\ = (\Add10~4_combout\ & (!\cs~q\ & \start~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add10~4_combout\,
	datac => \cs~q\,
	datad => \start~input_o\,
	combout => \A7~63_combout\);

-- Location: FF_X23_Y20_N25
\A7[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \A7~63_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => A7(2));

-- Location: LCCOMB_X25_Y18_N18
\A3[2]~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \A3[2]~20_combout\ = (\a[2]~input_o\ & ((\a[1]~input_o\ & (\A3[1]~19\ & VCC)) # (!\a[1]~input_o\ & (!\A3[1]~19\)))) # (!\a[2]~input_o\ & ((\a[1]~input_o\ & (!\A3[1]~19\)) # (!\a[1]~input_o\ & ((\A3[1]~19\) # (GND)))))
-- \A3[2]~21\ = CARRY((\a[2]~input_o\ & (!\a[1]~input_o\ & !\A3[1]~19\)) # (!\a[2]~input_o\ & ((!\A3[1]~19\) # (!\a[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \a[2]~input_o\,
	datab => \a[1]~input_o\,
	datad => VCC,
	cin => \A3[1]~19\,
	combout => \A3[2]~20_combout\,
	cout => \A3[2]~21\);

-- Location: FF_X25_Y18_N19
\A3[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \A3[2]~20_combout\,
	asdata => \~GND~combout\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => \ALT_INV_ld_clr~0_combout\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => A3(2));

-- Location: LCCOMB_X24_Y14_N28
\Mux0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux0~1_combout\ = (\Add0~1_combout\ & (A7(2))) # (!\Add0~1_combout\ & ((A3(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => A7(2),
	datac => A3(2),
	datad => \Add0~1_combout\,
	combout => \Mux0~1_combout\);

-- Location: LCCOMB_X24_Y18_N4
\Mux0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux0~0_combout\ = (\Add0~1_combout\ & (A3(1))) # (!\Add0~1_combout\ & ((ra(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => A3(1),
	datac => \Add0~1_combout\,
	datad => ra(1),
	combout => \Mux0~0_combout\);

-- Location: LCCOMB_X19_Y18_N16
\A5[2]~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \A5[2]~18_combout\ = (\a[0]~input_o\ & (\a[2]~input_o\ $ (VCC))) # (!\a[0]~input_o\ & (\a[2]~input_o\ & VCC))
-- \A5[2]~19\ = CARRY((\a[0]~input_o\ & \a[2]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \a[0]~input_o\,
	datab => \a[2]~input_o\,
	datad => VCC,
	combout => \A5[2]~18_combout\,
	cout => \A5[2]~19\);

-- Location: LCCOMB_X19_Y18_N8
\A5[2]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \A5[2]~feeder_combout\ = \A5[2]~18_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \A5[2]~18_combout\,
	combout => \A5[2]~feeder_combout\);

-- Location: FF_X19_Y18_N9
\A5[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \A5[2]~feeder_combout\,
	asdata => \~GND~combout\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => \ALT_INV_ld_clr~0_combout\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => A5(2));

-- Location: LCCOMB_X24_Y16_N28
\ra~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \ra~2_combout\ = (\a[2]~input_o\ & (((!\end_op~4_combout\ & !\rcarry~q\)) # (!\cs~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101011100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \cs~q\,
	datab => \end_op~4_combout\,
	datac => \rcarry~q\,
	datad => \a[2]~input_o\,
	combout => \ra~2_combout\);

-- Location: FF_X24_Y16_N29
\ra[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \ra~2_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ra(2));

-- Location: LCCOMB_X24_Y14_N0
\Mux29~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux29~0_combout\ = (\Add0~4_combout\ & ((\Add0~1_combout\ & (A5(2))) # (!\Add0~1_combout\ & ((ra(2)))))) # (!\Add0~4_combout\ & (((\Add0~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011110010110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => A5(2),
	datab => \Add0~4_combout\,
	datac => \Add0~1_combout\,
	datad => ra(2),
	combout => \Mux29~0_combout\);

-- Location: LCCOMB_X24_Y14_N6
\Mux29~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux29~1_combout\ = (\Add0~0_combout\ & (\Add0~4_combout\)) # (!\Add0~0_combout\ & (\Mux29~0_combout\ & ((\Add0~4_combout\) # (ra(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~0_combout\,
	datab => \Add0~4_combout\,
	datac => ra(0),
	datad => \Mux29~0_combout\,
	combout => \Mux29~1_combout\);

-- Location: LCCOMB_X24_Y14_N10
\Mux29~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux29~2_combout\ = (\Add0~0_combout\ & ((\Mux29~1_combout\ & (\Mux0~1_combout\)) # (!\Mux29~1_combout\ & ((\Mux0~0_combout\))))) # (!\Add0~0_combout\ & (((\Mux29~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~0_combout\,
	datab => \Mux0~1_combout\,
	datac => \Mux0~0_combout\,
	datad => \Mux29~1_combout\,
	combout => \Mux29~2_combout\);

-- Location: LCCOMB_X24_Y14_N4
\p~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~10_combout\ = (\rcarry~0_combout\ & (p(2))) # (!\rcarry~0_combout\ & (((!\Add0~3_combout\ & \Mux29~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000101110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => p(2),
	datab => \rcarry~0_combout\,
	datac => \Add0~3_combout\,
	datad => \Mux29~2_combout\,
	combout => \p~10_combout\);

-- Location: LCCOMB_X21_Y16_N2
\Add6~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add6~1_cout\ = CARRY(!ra(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => ra(0),
	datad => VCC,
	cout => \Add6~1_cout\);

-- Location: LCCOMB_X21_Y16_N4
\Add6~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add6~2_combout\ = (ra(1) & ((\Add6~1_cout\) # (GND))) # (!ra(1) & (!\Add6~1_cout\))
-- \Add6~3\ = CARRY((ra(1)) # (!\Add6~1_cout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => ra(1),
	datad => VCC,
	cin => \Add6~1_cout\,
	combout => \Add6~2_combout\,
	cout => \Add6~3\);

-- Location: LCCOMB_X26_Y16_N2
\Add2~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~1_cout\ = CARRY(!A3(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => A3(0),
	datad => VCC,
	cout => \Add2~1_cout\);

-- Location: LCCOMB_X26_Y16_N4
\Add2~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~2_combout\ = (A3(1) & ((\Add2~1_cout\) # (GND))) # (!A3(1) & (!\Add2~1_cout\))
-- \Add2~3\ = CARRY((A3(1)) # (!\Add2~1_cout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => A3(1),
	datad => VCC,
	cin => \Add2~1_cout\,
	combout => \Add2~2_combout\,
	cout => \Add2~3\);

-- Location: LCCOMB_X24_Y14_N14
\Mux0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux0~2_combout\ = (\Add0~1_combout\ & (\Add6~2_combout\)) # (!\Add0~1_combout\ & ((\Add2~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~1_combout\,
	datac => \Add6~2_combout\,
	datad => \Add2~2_combout\,
	combout => \Mux0~2_combout\);

-- Location: LCCOMB_X23_Y20_N4
\Add1~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~4_combout\ = (A7(2) & (!\Add1~3\ & VCC)) # (!A7(2) & (\Add1~3\ $ (GND)))
-- \Add1~5\ = CARRY((!A7(2) & !\Add1~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => A7(2),
	datad => VCC,
	cin => \Add1~3\,
	combout => \Add1~4_combout\,
	cout => \Add1~5\);

-- Location: LCCOMB_X26_Y18_N4
\Add5~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add5~4_combout\ = (A3(2) & (!\Add5~3\ & VCC)) # (!A3(2) & (\Add5~3\ $ (GND)))
-- \Add5~5\ = CARRY((!A3(2) & !\Add5~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => A3(2),
	datad => VCC,
	cin => \Add5~3\,
	combout => \Add5~4_combout\,
	cout => \Add5~5\);

-- Location: LCCOMB_X24_Y14_N16
\Mux29~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux29~3_combout\ = (\Add0~4_combout\ & ((\Add0~1_combout\ & ((\Add5~4_combout\))) # (!\Add0~1_combout\ & (\Add1~4_combout\)))) # (!\Add0~4_combout\ & (((\Add0~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100000111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~4_combout\,
	datab => \Add0~4_combout\,
	datac => \Add0~1_combout\,
	datad => \Add5~4_combout\,
	combout => \Mux29~3_combout\);

-- Location: LCCOMB_X24_Y14_N30
\Mux29~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux29~4_combout\ = (\Add0~0_combout\ & (\Add0~4_combout\)) # (!\Add0~0_combout\ & (\Mux29~3_combout\ & ((\Add0~4_combout\) # (ra(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~0_combout\,
	datab => \Add0~4_combout\,
	datac => ra(0),
	datad => \Mux29~3_combout\,
	combout => \Mux29~4_combout\);

-- Location: LCCOMB_X23_Y14_N4
\Add7~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add7~4_combout\ = (ra(2) & (!\Add7~3\ & VCC)) # (!ra(2) & (\Add7~3\ $ (GND)))
-- \Add7~5\ = CARRY((!ra(2) & !\Add7~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => ra(2),
	datad => VCC,
	cin => \Add7~3\,
	combout => \Add7~4_combout\,
	cout => \Add7~5\);

-- Location: LCCOMB_X18_Y18_N4
\Add3~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~4_combout\ = (A5(2) & (!\Add3~3\ & VCC)) # (!A5(2) & (\Add3~3\ $ (GND)))
-- \Add3~5\ = CARRY((!A5(2) & !\Add3~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => A5(2),
	datad => VCC,
	cin => \Add3~3\,
	combout => \Add3~4_combout\,
	cout => \Add3~5\);

-- Location: LCCOMB_X24_Y14_N24
\Mux0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux0~3_combout\ = (\Add0~1_combout\ & (\Add7~4_combout\)) # (!\Add0~1_combout\ & ((\Add3~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~1_combout\,
	datac => \Add7~4_combout\,
	datad => \Add3~4_combout\,
	combout => \Mux0~3_combout\);

-- Location: LCCOMB_X24_Y14_N18
\Mux29~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux29~5_combout\ = (\Add0~0_combout\ & ((\Mux29~4_combout\ & ((\Mux0~3_combout\))) # (!\Mux29~4_combout\ & (\Mux0~2_combout\)))) # (!\Add0~0_combout\ & (((\Mux29~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100001011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~0_combout\,
	datab => \Mux0~2_combout\,
	datac => \Mux29~4_combout\,
	datad => \Mux0~3_combout\,
	combout => \Mux29~5_combout\);

-- Location: LCCOMB_X24_Y14_N20
\p~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~12_combout\ = (\p~10_combout\) # ((\p~11_combout\ & \Mux29~5_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \p~11_combout\,
	datac => \p~10_combout\,
	datad => \Mux29~5_combout\,
	combout => \p~12_combout\);

-- Location: LCCOMB_X23_Y16_N4
\acc[2]~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \acc[2]~38_combout\ = ((acc(2) $ (\p~12_combout\ $ (!\acc[1]~37\)))) # (GND)
-- \acc[2]~39\ = CARRY((acc(2) & ((\p~12_combout\) # (!\acc[1]~37\))) # (!acc(2) & (\p~12_combout\ & !\acc[1]~37\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => acc(2),
	datab => \p~12_combout\,
	datad => VCC,
	cin => \acc[1]~37\,
	combout => \acc[2]~38_combout\,
	cout => \acc[2]~39\);

-- Location: FF_X23_Y16_N5
\acc[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \acc[2]~38_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	sclr => \ld_clr~0_combout\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => acc(2));

-- Location: LCCOMB_X21_Y16_N6
\Add6~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add6~4_combout\ = (ra(2) & (!\Add6~3\ & VCC)) # (!ra(2) & (\Add6~3\ $ (GND)))
-- \Add6~5\ = CARRY((!ra(2) & !\Add6~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => ra(2),
	datad => VCC,
	cin => \Add6~3\,
	combout => \Add6~4_combout\,
	cout => \Add6~5\);

-- Location: LCCOMB_X26_Y16_N6
\Add2~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~4_combout\ = (A3(2) & (!\Add2~3\ & VCC)) # (!A3(2) & (\Add2~3\ $ (GND)))
-- \Add2~5\ = CARRY((!A3(2) & !\Add2~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => A3(2),
	datad => VCC,
	cin => \Add2~3\,
	combout => \Add2~4_combout\,
	cout => \Add2~5\);

-- Location: IOIBUF_X7_Y24_N8
\a[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(3),
	o => \a[3]~input_o\);

-- Location: LCCOMB_X19_Y18_N18
\A5[3]~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \A5[3]~20_combout\ = (\a[1]~input_o\ & ((\a[3]~input_o\ & (\A5[2]~19\ & VCC)) # (!\a[3]~input_o\ & (!\A5[2]~19\)))) # (!\a[1]~input_o\ & ((\a[3]~input_o\ & (!\A5[2]~19\)) # (!\a[3]~input_o\ & ((\A5[2]~19\) # (GND)))))
-- \A5[3]~21\ = CARRY((\a[1]~input_o\ & (!\a[3]~input_o\ & !\A5[2]~19\)) # (!\a[1]~input_o\ & ((!\A5[2]~19\) # (!\a[3]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \a[1]~input_o\,
	datab => \a[3]~input_o\,
	datad => VCC,
	cin => \A5[2]~19\,
	combout => \A5[3]~20_combout\,
	cout => \A5[3]~21\);

-- Location: LCCOMB_X19_Y18_N14
\A5[3]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \A5[3]~feeder_combout\ = \A5[3]~20_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \A5[3]~20_combout\,
	combout => \A5[3]~feeder_combout\);

-- Location: FF_X19_Y18_N15
\A5[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \A5[3]~feeder_combout\,
	asdata => \~GND~combout\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => \ALT_INV_ld_clr~0_combout\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => A5(3));

-- Location: LCCOMB_X18_Y18_N6
\Add3~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~6_combout\ = (A5(3) & ((\Add3~5\) # (GND))) # (!A5(3) & (!\Add3~5\))
-- \Add3~7\ = CARRY((A5(3)) # (!\Add3~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => A5(3),
	datad => VCC,
	cin => \Add3~5\,
	combout => \Add3~6_combout\,
	cout => \Add3~7\);

-- Location: LCCOMB_X22_Y19_N8
\p~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~24_combout\ = (\Add0~1_combout\ & (((\Add0~4_combout\)))) # (!\Add0~1_combout\ & ((\Add0~4_combout\ & ((\Add3~6_combout\))) # (!\Add0~4_combout\ & (\Add2~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add2~4_combout\,
	datab => \Add0~1_combout\,
	datac => \Add0~4_combout\,
	datad => \Add3~6_combout\,
	combout => \p~24_combout\);

-- Location: LCCOMB_X21_Y14_N24
\ra~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \ra~3_combout\ = (\a[3]~input_o\ & (((!\end_op~4_combout\ & !\rcarry~q\)) # (!\cs~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \end_op~4_combout\,
	datab => \rcarry~q\,
	datac => \a[3]~input_o\,
	datad => \cs~q\,
	combout => \ra~3_combout\);

-- Location: FF_X21_Y14_N25
\ra[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \ra~3_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ra(3));

-- Location: LCCOMB_X23_Y14_N6
\Add7~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add7~6_combout\ = (ra(3) & ((\Add7~5\) # (GND))) # (!ra(3) & (!\Add7~5\))
-- \Add7~7\ = CARRY((ra(3)) # (!\Add7~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => ra(3),
	datad => VCC,
	cin => \Add7~5\,
	combout => \Add7~6_combout\,
	cout => \Add7~7\);

-- Location: LCCOMB_X22_Y19_N6
\p~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~25_combout\ = (\Add0~1_combout\ & ((\p~24_combout\ & ((\Add7~6_combout\))) # (!\p~24_combout\ & (\Add6~4_combout\)))) # (!\Add0~1_combout\ & (((\p~24_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100001011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~1_combout\,
	datab => \Add6~4_combout\,
	datac => \p~24_combout\,
	datad => \Add7~6_combout\,
	combout => \p~25_combout\);

-- Location: LCCOMB_X24_Y16_N12
\p~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~13_combout\ = (\rcarry~0_combout\) # ((\Add0~0_combout\ & \Add0~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add0~0_combout\,
	datac => \Add0~3_combout\,
	datad => \rcarry~0_combout\,
	combout => \p~13_combout\);

-- Location: FF_X22_Y19_N21
\p[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \p~26_combout\,
	ena => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => p(3));

-- Location: LCCOMB_X24_Y18_N22
\p~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~16_combout\ = (!rb(1) & (\rcarry~q\ $ (rb(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010000010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => rb(1),
	datab => \rcarry~q\,
	datac => rb(0),
	combout => \p~16_combout\);

-- Location: LCCOMB_X23_Y18_N10
\p~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~20_combout\ = (rb(0) & ((rb(1) & ((!\rcarry~q\))) # (!rb(1) & ((rb(2)) # (\rcarry~q\))))) # (!rb(0) & ((rb(1)) # ((rb(2) & \rcarry~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111011011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => rb(0),
	datab => rb(1),
	datac => rb(2),
	datad => \rcarry~q\,
	combout => \p~20_combout\);

-- Location: LCCOMB_X24_Y21_N18
\Add10~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add10~6_combout\ = (\a[0]~input_o\ & ((\a[3]~input_o\ & (!\Add10~5\)) # (!\a[3]~input_o\ & (\Add10~5\ & VCC)))) # (!\a[0]~input_o\ & ((\a[3]~input_o\ & ((\Add10~5\) # (GND))) # (!\a[3]~input_o\ & (!\Add10~5\))))
-- \Add10~7\ = CARRY((\a[0]~input_o\ & (\a[3]~input_o\ & !\Add10~5\)) # (!\a[0]~input_o\ & ((\a[3]~input_o\) # (!\Add10~5\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \a[0]~input_o\,
	datab => \a[3]~input_o\,
	datad => VCC,
	cin => \Add10~5\,
	combout => \Add10~6_combout\,
	cout => \Add10~7\);

-- Location: LCCOMB_X24_Y20_N26
\A7~64\ : cycloneive_lcell_comb
-- Equation(s):
-- \A7~64_combout\ = (\start~input_o\ & (\Add10~6_combout\ & !\cs~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \start~input_o\,
	datab => \Add10~6_combout\,
	datad => \cs~q\,
	combout => \A7~64_combout\);

-- Location: FF_X23_Y20_N21
\A7[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \A7~64_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => A7(3));

-- Location: LCCOMB_X25_Y18_N20
\A3[3]~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \A3[3]~22_combout\ = ((\a[2]~input_o\ $ (\a[3]~input_o\ $ (!\A3[2]~21\)))) # (GND)
-- \A3[3]~23\ = CARRY((\a[2]~input_o\ & ((\a[3]~input_o\) # (!\A3[2]~21\))) # (!\a[2]~input_o\ & (\a[3]~input_o\ & !\A3[2]~21\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \a[2]~input_o\,
	datab => \a[3]~input_o\,
	datad => VCC,
	cin => \A3[2]~21\,
	combout => \A3[3]~22_combout\,
	cout => \A3[3]~23\);

-- Location: FF_X25_Y18_N21
\A3[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \A3[3]~22_combout\,
	asdata => \~GND~combout\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => \ALT_INV_ld_clr~0_combout\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => A3(3));

-- Location: LCCOMB_X24_Y18_N20
\p~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~17_combout\ = (\Add0~1_combout\ & (((\Add0~4_combout\)))) # (!\Add0~1_combout\ & ((\Add0~4_combout\ & (A3(3))) # (!\Add0~4_combout\ & ((ra(2))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => A3(3),
	datab => ra(2),
	datac => \Add0~1_combout\,
	datad => \Add0~4_combout\,
	combout => \p~17_combout\);

-- Location: LCCOMB_X24_Y18_N14
\p~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~18_combout\ = (\Add0~1_combout\ & ((\p~17_combout\ & (A7(3))) # (!\p~17_combout\ & ((A3(2)))))) # (!\Add0~1_combout\ & (((\p~17_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => A7(3),
	datab => A3(2),
	datac => \Add0~1_combout\,
	datad => \p~17_combout\,
	combout => \p~18_combout\);

-- Location: LCCOMB_X24_Y18_N16
\p~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~19_combout\ = (rb(1) & (((!rb(2)) # (!rb(0))) # (!\rcarry~q\))) # (!rb(1) & ((\rcarry~q\ & (rb(0))) # (!\rcarry~q\ & (!rb(0) & rb(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110101111101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => rb(1),
	datab => \rcarry~q\,
	datac => rb(0),
	datad => rb(2),
	combout => \p~19_combout\);

-- Location: LCCOMB_X24_Y18_N18
\p~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~21_combout\ = (\p~20_combout\ & (((\p~18_combout\) # (!\p~19_combout\)))) # (!\p~20_combout\ & (ra(1) & ((\p~19_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \p~20_combout\,
	datab => ra(1),
	datac => \p~18_combout\,
	datad => \p~19_combout\,
	combout => \p~21_combout\);

-- Location: LCCOMB_X24_Y18_N0
\p~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~22_combout\ = (\p~16_combout\ & ((\p~21_combout\ & (A5(3))) # (!\p~21_combout\ & ((ra(3)))))) # (!\p~16_combout\ & (((\p~21_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => A5(3),
	datab => ra(3),
	datac => \p~16_combout\,
	datad => \p~21_combout\,
	combout => \p~22_combout\);

-- Location: LCCOMB_X23_Y20_N6
\Add1~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~6_combout\ = (A7(3) & ((\Add1~5\) # (GND))) # (!A7(3) & (!\Add1~5\))
-- \Add1~7\ = CARRY((A7(3)) # (!\Add1~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => A7(3),
	datad => VCC,
	cin => \Add1~5\,
	combout => \Add1~6_combout\,
	cout => \Add1~7\);

-- Location: LCCOMB_X26_Y18_N6
\Add5~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add5~6_combout\ = (A3(3) & ((\Add5~5\) # (GND))) # (!A3(3) & (!\Add5~5\))
-- \Add5~7\ = CARRY((A3(3)) # (!\Add5~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => A3(3),
	datad => VCC,
	cin => \Add5~5\,
	combout => \Add5~6_combout\,
	cout => \Add5~7\);

-- Location: LCCOMB_X21_Y18_N2
\Add4~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add4~1_cout\ = CARRY(!ra(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => ra(0),
	datad => VCC,
	cout => \Add4~1_cout\);

-- Location: LCCOMB_X21_Y18_N4
\Add4~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add4~2_combout\ = (ra(1) & ((\Add4~1_cout\) # (GND))) # (!ra(1) & (!\Add4~1_cout\))
-- \Add4~3\ = CARRY((ra(1)) # (!\Add4~1_cout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => ra(1),
	datad => VCC,
	cin => \Add4~1_cout\,
	combout => \Add4~2_combout\,
	cout => \Add4~3\);

-- Location: LCCOMB_X22_Y19_N18
\p~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~14_combout\ = (\Add0~4_combout\ & (((\Add0~1_combout\)))) # (!\Add0~4_combout\ & ((\Add0~1_combout\ & ((\Add4~2_combout\))) # (!\Add0~1_combout\ & (ra(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~4_combout\,
	datab => ra(0),
	datac => \Add4~2_combout\,
	datad => \Add0~1_combout\,
	combout => \p~14_combout\);

-- Location: LCCOMB_X22_Y19_N28
\p~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~15_combout\ = (\Add0~4_combout\ & ((\p~14_combout\ & ((\Add5~6_combout\))) # (!\p~14_combout\ & (\Add1~6_combout\)))) # (!\Add0~4_combout\ & (((\p~14_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~4_combout\,
	datab => \Add1~6_combout\,
	datac => \Add5~6_combout\,
	datad => \p~14_combout\,
	combout => \p~15_combout\);

-- Location: LCCOMB_X22_Y19_N2
\p~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~23_combout\ = (\p~11_combout\ & (((\p~13_combout\) # (\p~15_combout\)))) # (!\p~11_combout\ & (\p~22_combout\ & (!\p~13_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \p~11_combout\,
	datab => \p~22_combout\,
	datac => \p~13_combout\,
	datad => \p~15_combout\,
	combout => \p~23_combout\);

-- Location: LCCOMB_X22_Y19_N20
\p~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~26_combout\ = (\p~13_combout\ & ((\p~23_combout\ & (\p~25_combout\)) # (!\p~23_combout\ & ((p(3)))))) # (!\p~13_combout\ & (((\p~23_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \p~25_combout\,
	datab => \p~13_combout\,
	datac => p(3),
	datad => \p~23_combout\,
	combout => \p~26_combout\);

-- Location: LCCOMB_X23_Y16_N6
\acc[3]~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \acc[3]~40_combout\ = (acc(3) & ((\p~26_combout\ & (\acc[2]~39\ & VCC)) # (!\p~26_combout\ & (!\acc[2]~39\)))) # (!acc(3) & ((\p~26_combout\ & (!\acc[2]~39\)) # (!\p~26_combout\ & ((\acc[2]~39\) # (GND)))))
-- \acc[3]~41\ = CARRY((acc(3) & (!\p~26_combout\ & !\acc[2]~39\)) # (!acc(3) & ((!\acc[2]~39\) # (!\p~26_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => acc(3),
	datab => \p~26_combout\,
	datad => VCC,
	cin => \acc[2]~39\,
	combout => \acc[3]~40_combout\,
	cout => \acc[3]~41\);

-- Location: FF_X23_Y16_N7
\acc[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \acc[3]~40_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	sclr => \ld_clr~0_combout\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => acc(3));

-- Location: IOIBUF_X18_Y24_N8
\a[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(4),
	o => \a[4]~input_o\);

-- Location: LCCOMB_X25_Y18_N22
\A3[4]~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \A3[4]~24_combout\ = (\a[4]~input_o\ & ((\a[3]~input_o\ & (\A3[3]~23\ & VCC)) # (!\a[3]~input_o\ & (!\A3[3]~23\)))) # (!\a[4]~input_o\ & ((\a[3]~input_o\ & (!\A3[3]~23\)) # (!\a[3]~input_o\ & ((\A3[3]~23\) # (GND)))))
-- \A3[4]~25\ = CARRY((\a[4]~input_o\ & (!\a[3]~input_o\ & !\A3[3]~23\)) # (!\a[4]~input_o\ & ((!\A3[3]~23\) # (!\a[3]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \a[4]~input_o\,
	datab => \a[3]~input_o\,
	datad => VCC,
	cin => \A3[3]~23\,
	combout => \A3[4]~24_combout\,
	cout => \A3[4]~25\);

-- Location: FF_X25_Y18_N23
\A3[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \A3[4]~24_combout\,
	asdata => A3(0),
	clrn => \rst~inputclkctrl_outclk\,
	sload => \ALT_INV_ld_clr~0_combout\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => A3(4));

-- Location: LCCOMB_X26_Y18_N8
\Add5~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add5~8_combout\ = (A3(4) & (!\Add5~7\ & VCC)) # (!A3(4) & (\Add5~7\ $ (GND)))
-- \Add5~9\ = CARRY((!A3(4) & !\Add5~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => A3(4),
	datad => VCC,
	cin => \Add5~7\,
	combout => \Add5~8_combout\,
	cout => \Add5~9\);

-- Location: LCCOMB_X21_Y18_N6
\Add4~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add4~4_combout\ = (ra(2) & (!\Add4~3\ & VCC)) # (!ra(2) & (\Add4~3\ $ (GND)))
-- \Add4~5\ = CARRY((!ra(2) & !\Add4~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => ra(2),
	datad => VCC,
	cin => \Add4~3\,
	combout => \Add4~4_combout\,
	cout => \Add4~5\);

-- Location: LCCOMB_X24_Y21_N20
\Add10~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add10~8_combout\ = ((\a[4]~input_o\ $ (\a[1]~input_o\ $ (\Add10~7\)))) # (GND)
-- \Add10~9\ = CARRY((\a[4]~input_o\ & (\a[1]~input_o\ & !\Add10~7\)) # (!\a[4]~input_o\ & ((\a[1]~input_o\) # (!\Add10~7\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \a[4]~input_o\,
	datab => \a[1]~input_o\,
	datad => VCC,
	cin => \Add10~7\,
	combout => \Add10~8_combout\,
	cout => \Add10~9\);

-- Location: LCCOMB_X24_Y21_N4
\A7~65\ : cycloneive_lcell_comb
-- Equation(s):
-- \A7~65_combout\ = (\start~input_o\ & ((\cs~q\ & (A7(0))) # (!\cs~q\ & ((\Add10~8_combout\))))) # (!\start~input_o\ & (A7(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \start~input_o\,
	datab => A7(0),
	datac => \cs~q\,
	datad => \Add10~8_combout\,
	combout => \A7~65_combout\);

-- Location: FF_X23_Y20_N5
\A7[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \A7~65_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => A7(4));

-- Location: LCCOMB_X23_Y20_N8
\Add1~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~8_combout\ = (A7(4) & (!\Add1~7\ & VCC)) # (!A7(4) & (\Add1~7\ $ (GND)))
-- \Add1~9\ = CARRY((!A7(4) & !\Add1~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => A7(4),
	datad => VCC,
	cin => \Add1~7\,
	combout => \Add1~8_combout\,
	cout => \Add1~9\);

-- Location: LCCOMB_X24_Y16_N2
\p~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~27_combout\ = (\Add0~1_combout\ & (((\Add0~4_combout\)))) # (!\Add0~1_combout\ & ((\Add0~4_combout\ & (\Add1~8_combout\)) # (!\Add0~4_combout\ & ((ra(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~8_combout\,
	datab => \Add0~1_combout\,
	datac => ra(1),
	datad => \Add0~4_combout\,
	combout => \p~27_combout\);

-- Location: LCCOMB_X24_Y16_N8
\p~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~28_combout\ = (\Add0~1_combout\ & ((\p~27_combout\ & (\Add5~8_combout\)) # (!\p~27_combout\ & ((\Add4~4_combout\))))) # (!\Add0~1_combout\ & (((\p~27_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add5~8_combout\,
	datab => \Add0~1_combout\,
	datac => \Add4~4_combout\,
	datad => \p~27_combout\,
	combout => \p~28_combout\);

-- Location: FF_X24_Y16_N27
\p[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \p~36_combout\,
	ena => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => p(4));

-- Location: LCCOMB_X19_Y18_N20
\A5[4]~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \A5[4]~22_combout\ = ((\a[4]~input_o\ $ (\a[2]~input_o\ $ (!\A5[3]~21\)))) # (GND)
-- \A5[4]~23\ = CARRY((\a[4]~input_o\ & ((\a[2]~input_o\) # (!\A5[3]~21\))) # (!\a[4]~input_o\ & (\a[2]~input_o\ & !\A5[3]~21\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \a[4]~input_o\,
	datab => \a[2]~input_o\,
	datad => VCC,
	cin => \A5[3]~21\,
	combout => \A5[4]~22_combout\,
	cout => \A5[4]~23\);

-- Location: LCCOMB_X19_Y18_N4
\A5[4]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \A5[4]~feeder_combout\ = \A5[4]~22_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \A5[4]~22_combout\,
	combout => \A5[4]~feeder_combout\);

-- Location: FF_X19_Y18_N5
\A5[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \A5[4]~feeder_combout\,
	asdata => A3(0),
	clrn => \rst~inputclkctrl_outclk\,
	sload => \ALT_INV_ld_clr~0_combout\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => A5(4));

-- Location: LCCOMB_X24_Y18_N10
\ra~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \ra~4_combout\ = (\rcarry~0_combout\ & (\a[4]~input_o\)) # (!\rcarry~0_combout\ & ((ra(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rcarry~0_combout\,
	datab => \a[4]~input_o\,
	datac => ra(0),
	combout => \ra~4_combout\);

-- Location: FF_X24_Y18_N11
\ra[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \ra~4_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ra(4));

-- Location: LCCOMB_X24_Y16_N16
\p~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~29_combout\ = (\Add0~4_combout\ & (((\Add0~1_combout\)))) # (!\Add0~4_combout\ & ((\Add0~1_combout\ & ((A3(3)))) # (!\Add0~1_combout\ & (ra(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => ra(3),
	datab => \Add0~4_combout\,
	datac => A3(3),
	datad => \Add0~1_combout\,
	combout => \p~29_combout\);

-- Location: LCCOMB_X24_Y16_N30
\p~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~30_combout\ = (\Add0~4_combout\ & ((\p~29_combout\ & (A7(4))) # (!\p~29_combout\ & ((A3(4)))))) # (!\Add0~4_combout\ & (((\p~29_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => A7(4),
	datab => \Add0~4_combout\,
	datac => A3(4),
	datad => \p~29_combout\,
	combout => \p~30_combout\);

-- Location: LCCOMB_X24_Y16_N20
\p~31\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~31_combout\ = (\p~19_combout\ & ((\p~20_combout\ & ((\p~30_combout\))) # (!\p~20_combout\ & (ra(2))))) # (!\p~19_combout\ & (((\p~20_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \p~19_combout\,
	datab => ra(2),
	datac => \p~30_combout\,
	datad => \p~20_combout\,
	combout => \p~31_combout\);

-- Location: LCCOMB_X24_Y16_N6
\p~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~32_combout\ = (\p~16_combout\ & ((\p~31_combout\ & (A5(4))) # (!\p~31_combout\ & ((ra(4)))))) # (!\p~16_combout\ & (((\p~31_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => A5(4),
	datab => ra(4),
	datac => \p~16_combout\,
	datad => \p~31_combout\,
	combout => \p~32_combout\);

-- Location: LCCOMB_X24_Y16_N4
\p~33\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~33_combout\ = (\p~13_combout\ & ((\p~11_combout\) # ((p(4))))) # (!\p~13_combout\ & (!\p~11_combout\ & ((\p~32_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \p~13_combout\,
	datab => \p~11_combout\,
	datac => p(4),
	datad => \p~32_combout\,
	combout => \p~33_combout\);

-- Location: LCCOMB_X23_Y14_N8
\Add7~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add7~8_combout\ = (ra(4) & (!\Add7~7\ & VCC)) # (!ra(4) & (\Add7~7\ $ (GND)))
-- \Add7~9\ = CARRY((!ra(4) & !\Add7~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => ra(4),
	datad => VCC,
	cin => \Add7~7\,
	combout => \Add7~8_combout\,
	cout => \Add7~9\);

-- Location: LCCOMB_X26_Y16_N8
\Add2~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~6_combout\ = (A3(3) & ((\Add2~5\) # (GND))) # (!A3(3) & (!\Add2~5\))
-- \Add2~7\ = CARRY((A3(3)) # (!\Add2~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => A3(3),
	datad => VCC,
	cin => \Add2~5\,
	combout => \Add2~6_combout\,
	cout => \Add2~7\);

-- Location: LCCOMB_X21_Y16_N8
\Add6~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add6~6_combout\ = (ra(3) & ((\Add6~5\) # (GND))) # (!ra(3) & (!\Add6~5\))
-- \Add6~7\ = CARRY((ra(3)) # (!\Add6~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => ra(3),
	datad => VCC,
	cin => \Add6~5\,
	combout => \Add6~6_combout\,
	cout => \Add6~7\);

-- Location: LCCOMB_X26_Y16_N0
\p~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~34_combout\ = (\Add0~1_combout\ & ((\Add0~4_combout\) # ((\Add6~6_combout\)))) # (!\Add0~1_combout\ & (!\Add0~4_combout\ & (\Add2~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~1_combout\,
	datab => \Add0~4_combout\,
	datac => \Add2~6_combout\,
	datad => \Add6~6_combout\,
	combout => \p~34_combout\);

-- Location: LCCOMB_X18_Y18_N8
\Add3~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~8_combout\ = (A5(4) & (!\Add3~7\ & VCC)) # (!A5(4) & (\Add3~7\ $ (GND)))
-- \Add3~9\ = CARRY((!A5(4) & !\Add3~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => A5(4),
	datad => VCC,
	cin => \Add3~7\,
	combout => \Add3~8_combout\,
	cout => \Add3~9\);

-- Location: LCCOMB_X24_Y16_N18
\p~35\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~35_combout\ = (\Add0~4_combout\ & ((\p~34_combout\ & (\Add7~8_combout\)) # (!\p~34_combout\ & ((\Add3~8_combout\))))) # (!\Add0~4_combout\ & (((\p~34_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011110010110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add7~8_combout\,
	datab => \Add0~4_combout\,
	datac => \p~34_combout\,
	datad => \Add3~8_combout\,
	combout => \p~35_combout\);

-- Location: LCCOMB_X24_Y16_N26
\p~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~36_combout\ = (\p~11_combout\ & ((\p~33_combout\ & ((\p~35_combout\))) # (!\p~33_combout\ & (\p~28_combout\)))) # (!\p~11_combout\ & (((\p~33_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100000111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \p~28_combout\,
	datab => \p~11_combout\,
	datac => \p~33_combout\,
	datad => \p~35_combout\,
	combout => \p~36_combout\);

-- Location: LCCOMB_X23_Y16_N8
\acc[4]~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \acc[4]~42_combout\ = ((acc(4) $ (\p~36_combout\ $ (!\acc[3]~41\)))) # (GND)
-- \acc[4]~43\ = CARRY((acc(4) & ((\p~36_combout\) # (!\acc[3]~41\))) # (!acc(4) & (\p~36_combout\ & !\acc[3]~41\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => acc(4),
	datab => \p~36_combout\,
	datad => VCC,
	cin => \acc[3]~41\,
	combout => \acc[4]~42_combout\,
	cout => \acc[4]~43\);

-- Location: FF_X23_Y16_N9
\acc[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \acc[4]~42_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	sclr => \ld_clr~0_combout\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => acc(4));

-- Location: LCCOMB_X21_Y16_N10
\Add6~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add6~8_combout\ = (ra(4) & (!\Add6~7\ & VCC)) # (!ra(4) & (\Add6~7\ $ (GND)))
-- \Add6~9\ = CARRY((!ra(4) & !\Add6~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => ra(4),
	datad => VCC,
	cin => \Add6~7\,
	combout => \Add6~8_combout\,
	cout => \Add6~9\);

-- Location: IOIBUF_X13_Y24_N1
\a[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(5),
	o => \a[5]~input_o\);

-- Location: LCCOMB_X25_Y18_N14
\ra~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \ra~5_combout\ = (\rcarry~0_combout\ & ((\a[5]~input_o\))) # (!\rcarry~0_combout\ & (ra(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => ra(1),
	datac => \a[5]~input_o\,
	datad => \rcarry~0_combout\,
	combout => \ra~5_combout\);

-- Location: FF_X25_Y18_N15
\ra[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \ra~5_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ra(5));

-- Location: LCCOMB_X23_Y14_N10
\Add7~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add7~10_combout\ = (ra(5) & ((\Add7~9\) # (GND))) # (!ra(5) & (!\Add7~9\))
-- \Add7~11\ = CARRY((ra(5)) # (!\Add7~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => ra(5),
	datad => VCC,
	cin => \Add7~9\,
	combout => \Add7~10_combout\,
	cout => \Add7~11\);

-- Location: LCCOMB_X26_Y16_N10
\Add2~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~8_combout\ = (A3(4) & (!\Add2~7\ & VCC)) # (!A3(4) & (\Add2~7\ $ (GND)))
-- \Add2~9\ = CARRY((!A3(4) & !\Add2~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => A3(4),
	datad => VCC,
	cin => \Add2~7\,
	combout => \Add2~8_combout\,
	cout => \Add2~9\);

-- Location: LCCOMB_X19_Y18_N22
\A5[5]~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \A5[5]~24_combout\ = (\a[5]~input_o\ & ((\a[3]~input_o\ & (\A5[4]~23\ & VCC)) # (!\a[3]~input_o\ & (!\A5[4]~23\)))) # (!\a[5]~input_o\ & ((\a[3]~input_o\ & (!\A5[4]~23\)) # (!\a[3]~input_o\ & ((\A5[4]~23\) # (GND)))))
-- \A5[5]~25\ = CARRY((\a[5]~input_o\ & (!\a[3]~input_o\ & !\A5[4]~23\)) # (!\a[5]~input_o\ & ((!\A5[4]~23\) # (!\a[3]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \a[5]~input_o\,
	datab => \a[3]~input_o\,
	datad => VCC,
	cin => \A5[4]~23\,
	combout => \A5[5]~24_combout\,
	cout => \A5[5]~25\);

-- Location: FF_X19_Y18_N23
\A5[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \A5[5]~24_combout\,
	asdata => A5(1),
	clrn => \rst~inputclkctrl_outclk\,
	sload => \ALT_INV_ld_clr~0_combout\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => A5(5));

-- Location: LCCOMB_X18_Y18_N10
\Add3~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~10_combout\ = (A5(5) & ((\Add3~9\) # (GND))) # (!A5(5) & (!\Add3~9\))
-- \Add3~11\ = CARRY((A5(5)) # (!\Add3~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => A5(5),
	datad => VCC,
	cin => \Add3~9\,
	combout => \Add3~10_combout\,
	cout => \Add3~11\);

-- Location: LCCOMB_X24_Y15_N20
\p~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~44_combout\ = (\Add0~1_combout\ & (\Add0~4_combout\)) # (!\Add0~1_combout\ & ((\Add0~4_combout\ & ((\Add3~10_combout\))) # (!\Add0~4_combout\ & (\Add2~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~1_combout\,
	datab => \Add0~4_combout\,
	datac => \Add2~8_combout\,
	datad => \Add3~10_combout\,
	combout => \p~44_combout\);

-- Location: LCCOMB_X24_Y15_N6
\p~45\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~45_combout\ = (\Add0~1_combout\ & ((\p~44_combout\ & ((\Add7~10_combout\))) # (!\p~44_combout\ & (\Add6~8_combout\)))) # (!\Add0~1_combout\ & (((\p~44_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~1_combout\,
	datab => \Add6~8_combout\,
	datac => \Add7~10_combout\,
	datad => \p~44_combout\,
	combout => \p~45_combout\);

-- Location: FF_X24_Y15_N1
\p[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \p~46_combout\,
	ena => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => p(5));

-- Location: LCCOMB_X24_Y21_N22
\Add10~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add10~10_combout\ = (\a[2]~input_o\ & ((\a[5]~input_o\ & (!\Add10~9\)) # (!\a[5]~input_o\ & (\Add10~9\ & VCC)))) # (!\a[2]~input_o\ & ((\a[5]~input_o\ & ((\Add10~9\) # (GND))) # (!\a[5]~input_o\ & (!\Add10~9\))))
-- \Add10~11\ = CARRY((\a[2]~input_o\ & (\a[5]~input_o\ & !\Add10~9\)) # (!\a[2]~input_o\ & ((\a[5]~input_o\) # (!\Add10~9\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \a[2]~input_o\,
	datab => \a[5]~input_o\,
	datad => VCC,
	cin => \Add10~9\,
	combout => \Add10~10_combout\,
	cout => \Add10~11\);

-- Location: LCCOMB_X24_Y21_N6
\A7~66\ : cycloneive_lcell_comb
-- Equation(s):
-- \A7~66_combout\ = (\cs~q\ & (((A7(1))))) # (!\cs~q\ & ((\start~input_o\ & (\Add10~10_combout\)) # (!\start~input_o\ & ((A7(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111100100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add10~10_combout\,
	datab => \cs~q\,
	datac => \start~input_o\,
	datad => A7(1),
	combout => \A7~66_combout\);

-- Location: FF_X24_Y20_N27
\A7[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \A7~66_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => A7(5));

-- Location: LCCOMB_X25_Y18_N24
\A3[5]~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \A3[5]~26_combout\ = ((\a[5]~input_o\ $ (\a[4]~input_o\ $ (!\A3[4]~25\)))) # (GND)
-- \A3[5]~27\ = CARRY((\a[5]~input_o\ & ((\a[4]~input_o\) # (!\A3[4]~25\))) # (!\a[5]~input_o\ & (\a[4]~input_o\ & !\A3[4]~25\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \a[5]~input_o\,
	datab => \a[4]~input_o\,
	datad => VCC,
	cin => \A3[4]~25\,
	combout => \A3[5]~26_combout\,
	cout => \A3[5]~27\);

-- Location: FF_X25_Y18_N25
\A3[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \A3[5]~26_combout\,
	asdata => A3(1),
	clrn => \rst~inputclkctrl_outclk\,
	sload => \ALT_INV_ld_clr~0_combout\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => A3(5));

-- Location: LCCOMB_X24_Y18_N12
\p~39\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~39_combout\ = (\Add0~1_combout\ & (((\Add0~4_combout\)))) # (!\Add0~1_combout\ & ((\Add0~4_combout\ & ((A3(5)))) # (!\Add0~4_combout\ & (ra(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => ra(4),
	datab => A3(5),
	datac => \Add0~1_combout\,
	datad => \Add0~4_combout\,
	combout => \p~39_combout\);

-- Location: LCCOMB_X25_Y18_N0
\p~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~40_combout\ = (\Add0~1_combout\ & ((\p~39_combout\ & ((A7(5)))) # (!\p~39_combout\ & (A3(4))))) # (!\Add0~1_combout\ & (((\p~39_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => A3(4),
	datab => \Add0~1_combout\,
	datac => A7(5),
	datad => \p~39_combout\,
	combout => \p~40_combout\);

-- Location: LCCOMB_X25_Y18_N12
\p~41\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~41_combout\ = (\p~20_combout\ & (((\p~40_combout\) # (!\p~19_combout\)))) # (!\p~20_combout\ & (ra(3) & (\p~19_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \p~20_combout\,
	datab => ra(3),
	datac => \p~19_combout\,
	datad => \p~40_combout\,
	combout => \p~41_combout\);

-- Location: LCCOMB_X25_Y18_N8
\p~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~42_combout\ = (\p~16_combout\ & ((\p~41_combout\ & (A5(5))) # (!\p~41_combout\ & ((ra(5)))))) # (!\p~16_combout\ & (((\p~41_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => A5(5),
	datab => \p~16_combout\,
	datac => ra(5),
	datad => \p~41_combout\,
	combout => \p~42_combout\);

-- Location: LCCOMB_X26_Y18_N10
\Add5~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add5~10_combout\ = (A3(5) & ((\Add5~9\) # (GND))) # (!A3(5) & (!\Add5~9\))
-- \Add5~11\ = CARRY((A3(5)) # (!\Add5~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => A3(5),
	datad => VCC,
	cin => \Add5~9\,
	combout => \Add5~10_combout\,
	cout => \Add5~11\);

-- Location: LCCOMB_X21_Y18_N8
\Add4~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add4~6_combout\ = (ra(3) & ((\Add4~5\) # (GND))) # (!ra(3) & (!\Add4~5\))
-- \Add4~7\ = CARRY((ra(3)) # (!\Add4~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => ra(3),
	datad => VCC,
	cin => \Add4~5\,
	combout => \Add4~6_combout\,
	cout => \Add4~7\);

-- Location: LCCOMB_X24_Y15_N30
\p~37\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~37_combout\ = (\Add0~4_combout\ & (((\Add0~1_combout\)))) # (!\Add0~4_combout\ & ((\Add0~1_combout\ & ((\Add4~6_combout\))) # (!\Add0~1_combout\ & (ra(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => ra(2),
	datab => \Add0~4_combout\,
	datac => \Add0~1_combout\,
	datad => \Add4~6_combout\,
	combout => \p~37_combout\);

-- Location: LCCOMB_X23_Y20_N10
\Add1~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~10_combout\ = (A7(5) & ((\Add1~9\) # (GND))) # (!A7(5) & (!\Add1~9\))
-- \Add1~11\ = CARRY((A7(5)) # (!\Add1~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => A7(5),
	datad => VCC,
	cin => \Add1~9\,
	combout => \Add1~10_combout\,
	cout => \Add1~11\);

-- Location: LCCOMB_X24_Y15_N24
\p~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~38_combout\ = (\Add0~4_combout\ & ((\p~37_combout\ & (\Add5~10_combout\)) # (!\p~37_combout\ & ((\Add1~10_combout\))))) # (!\Add0~4_combout\ & (((\p~37_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011110010110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add5~10_combout\,
	datab => \Add0~4_combout\,
	datac => \p~37_combout\,
	datad => \Add1~10_combout\,
	combout => \p~38_combout\);

-- Location: LCCOMB_X24_Y15_N2
\p~43\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~43_combout\ = (\p~13_combout\ & (\p~11_combout\)) # (!\p~13_combout\ & ((\p~11_combout\ & ((\p~38_combout\))) # (!\p~11_combout\ & (\p~42_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \p~13_combout\,
	datab => \p~11_combout\,
	datac => \p~42_combout\,
	datad => \p~38_combout\,
	combout => \p~43_combout\);

-- Location: LCCOMB_X24_Y15_N0
\p~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~46_combout\ = (\p~13_combout\ & ((\p~43_combout\ & (\p~45_combout\)) # (!\p~43_combout\ & ((p(5)))))) # (!\p~13_combout\ & (((\p~43_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \p~45_combout\,
	datab => \p~13_combout\,
	datac => p(5),
	datad => \p~43_combout\,
	combout => \p~46_combout\);

-- Location: LCCOMB_X23_Y16_N10
\acc[5]~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \acc[5]~44_combout\ = (acc(5) & ((\p~46_combout\ & (\acc[4]~43\ & VCC)) # (!\p~46_combout\ & (!\acc[4]~43\)))) # (!acc(5) & ((\p~46_combout\ & (!\acc[4]~43\)) # (!\p~46_combout\ & ((\acc[4]~43\) # (GND)))))
-- \acc[5]~45\ = CARRY((acc(5) & (!\p~46_combout\ & !\acc[4]~43\)) # (!acc(5) & ((!\acc[4]~43\) # (!\p~46_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => acc(5),
	datab => \p~46_combout\,
	datad => VCC,
	cin => \acc[4]~43\,
	combout => \acc[5]~44_combout\,
	cout => \acc[5]~45\);

-- Location: FF_X23_Y16_N11
\acc[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \acc[5]~44_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	sclr => \ld_clr~0_combout\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => acc(5));

-- Location: IOIBUF_X21_Y24_N15
\a[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(6),
	o => \a[6]~input_o\);

-- Location: LCCOMB_X19_Y18_N24
\A5[6]~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \A5[6]~26_combout\ = ((\a[6]~input_o\ $ (\a[4]~input_o\ $ (!\A5[5]~25\)))) # (GND)
-- \A5[6]~27\ = CARRY((\a[6]~input_o\ & ((\a[4]~input_o\) # (!\A5[5]~25\))) # (!\a[6]~input_o\ & (\a[4]~input_o\ & !\A5[5]~25\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \a[6]~input_o\,
	datab => \a[4]~input_o\,
	datad => VCC,
	cin => \A5[5]~25\,
	combout => \A5[6]~26_combout\,
	cout => \A5[6]~27\);

-- Location: LCCOMB_X19_Y18_N2
\A5[6]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \A5[6]~feeder_combout\ = \A5[6]~26_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \A5[6]~26_combout\,
	combout => \A5[6]~feeder_combout\);

-- Location: FF_X19_Y18_N3
\A5[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \A5[6]~feeder_combout\,
	asdata => A5(2),
	clrn => \rst~inputclkctrl_outclk\,
	sload => \ALT_INV_ld_clr~0_combout\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => A5(6));

-- Location: LCCOMB_X18_Y18_N12
\Add3~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~12_combout\ = (A5(6) & (!\Add3~11\ & VCC)) # (!A5(6) & (\Add3~11\ $ (GND)))
-- \Add3~13\ = CARRY((!A5(6) & !\Add3~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => A5(6),
	datad => VCC,
	cin => \Add3~11\,
	combout => \Add3~12_combout\,
	cout => \Add3~13\);

-- Location: LCCOMB_X26_Y16_N12
\Add2~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~10_combout\ = (A3(5) & ((\Add2~9\) # (GND))) # (!A3(5) & (!\Add2~9\))
-- \Add2~11\ = CARRY((A3(5)) # (!\Add2~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => A3(5),
	datad => VCC,
	cin => \Add2~9\,
	combout => \Add2~10_combout\,
	cout => \Add2~11\);

-- Location: LCCOMB_X21_Y16_N12
\Add6~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add6~10_combout\ = (ra(5) & ((\Add6~9\) # (GND))) # (!ra(5) & (!\Add6~9\))
-- \Add6~11\ = CARRY((ra(5)) # (!\Add6~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => ra(5),
	datad => VCC,
	cin => \Add6~9\,
	combout => \Add6~10_combout\,
	cout => \Add6~11\);

-- Location: LCCOMB_X22_Y16_N26
\p~54\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~54_combout\ = (\Add0~4_combout\ & (\Add0~1_combout\)) # (!\Add0~4_combout\ & ((\Add0~1_combout\ & ((\Add6~10_combout\))) # (!\Add0~1_combout\ & (\Add2~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~4_combout\,
	datab => \Add0~1_combout\,
	datac => \Add2~10_combout\,
	datad => \Add6~10_combout\,
	combout => \p~54_combout\);

-- Location: LCCOMB_X21_Y14_N10
\ra~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \ra~6_combout\ = (\rcarry~0_combout\ & (\a[6]~input_o\)) # (!\rcarry~0_combout\ & ((ra(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \a[6]~input_o\,
	datac => ra(2),
	datad => \rcarry~0_combout\,
	combout => \ra~6_combout\);

-- Location: FF_X21_Y14_N11
\ra[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \ra~6_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ra(6));

-- Location: LCCOMB_X23_Y14_N12
\Add7~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add7~12_combout\ = (ra(6) & (!\Add7~11\ & VCC)) # (!ra(6) & (\Add7~11\ $ (GND)))
-- \Add7~13\ = CARRY((!ra(6) & !\Add7~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => ra(6),
	datad => VCC,
	cin => \Add7~11\,
	combout => \Add7~12_combout\,
	cout => \Add7~13\);

-- Location: LCCOMB_X22_Y16_N12
\p~55\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~55_combout\ = (\Add0~4_combout\ & ((\p~54_combout\ & ((\Add7~12_combout\))) # (!\p~54_combout\ & (\Add3~12_combout\)))) # (!\Add0~4_combout\ & (((\p~54_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100001011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~4_combout\,
	datab => \Add3~12_combout\,
	datac => \p~54_combout\,
	datad => \Add7~12_combout\,
	combout => \p~55_combout\);

-- Location: LCCOMB_X24_Y21_N24
\Add10~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add10~12_combout\ = ((\a[6]~input_o\ $ (\a[3]~input_o\ $ (\Add10~11\)))) # (GND)
-- \Add10~13\ = CARRY((\a[6]~input_o\ & (\a[3]~input_o\ & !\Add10~11\)) # (!\a[6]~input_o\ & ((\a[3]~input_o\) # (!\Add10~11\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \a[6]~input_o\,
	datab => \a[3]~input_o\,
	datad => VCC,
	cin => \Add10~11\,
	combout => \Add10~12_combout\,
	cout => \Add10~13\);

-- Location: LCCOMB_X24_Y17_N18
\A7~67\ : cycloneive_lcell_comb
-- Equation(s):
-- \A7~67_combout\ = (\cs~q\ & (((A7(2))))) # (!\cs~q\ & ((\start~input_o\ & (\Add10~12_combout\)) # (!\start~input_o\ & ((A7(2))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add10~12_combout\,
	datab => \cs~q\,
	datac => A7(2),
	datad => \start~input_o\,
	combout => \A7~67_combout\);

-- Location: FF_X24_Y17_N19
\A7[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \A7~67_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => A7(6));

-- Location: LCCOMB_X23_Y20_N12
\Add1~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~12_combout\ = (A7(6) & (!\Add1~11\ & VCC)) # (!A7(6) & (\Add1~11\ $ (GND)))
-- \Add1~13\ = CARRY((!A7(6) & !\Add1~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => A7(6),
	datad => VCC,
	cin => \Add1~11\,
	combout => \Add1~12_combout\,
	cout => \Add1~13\);

-- Location: LCCOMB_X22_Y20_N12
\p~47\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~47_combout\ = (\Add0~4_combout\ & ((\Add0~1_combout\) # ((\Add1~12_combout\)))) # (!\Add0~4_combout\ & (!\Add0~1_combout\ & ((ra(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~4_combout\,
	datab => \Add0~1_combout\,
	datac => \Add1~12_combout\,
	datad => ra(3),
	combout => \p~47_combout\);

-- Location: LCCOMB_X25_Y18_N26
\A3[6]~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \A3[6]~28_combout\ = (\a[6]~input_o\ & ((\a[5]~input_o\ & (\A3[5]~27\ & VCC)) # (!\a[5]~input_o\ & (!\A3[5]~27\)))) # (!\a[6]~input_o\ & ((\a[5]~input_o\ & (!\A3[5]~27\)) # (!\a[5]~input_o\ & ((\A3[5]~27\) # (GND)))))
-- \A3[6]~29\ = CARRY((\a[6]~input_o\ & (!\a[5]~input_o\ & !\A3[5]~27\)) # (!\a[6]~input_o\ & ((!\A3[5]~27\) # (!\a[5]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \a[6]~input_o\,
	datab => \a[5]~input_o\,
	datad => VCC,
	cin => \A3[5]~27\,
	combout => \A3[6]~28_combout\,
	cout => \A3[6]~29\);

-- Location: FF_X25_Y18_N27
\A3[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \A3[6]~28_combout\,
	asdata => A3(2),
	clrn => \rst~inputclkctrl_outclk\,
	sload => \ALT_INV_ld_clr~0_combout\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => A3(6));

-- Location: LCCOMB_X26_Y18_N12
\Add5~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add5~12_combout\ = (A3(6) & (!\Add5~11\ & VCC)) # (!A3(6) & (\Add5~11\ $ (GND)))
-- \Add5~13\ = CARRY((!A3(6) & !\Add5~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => A3(6),
	datad => VCC,
	cin => \Add5~11\,
	combout => \Add5~12_combout\,
	cout => \Add5~13\);

-- Location: LCCOMB_X21_Y18_N10
\Add4~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add4~8_combout\ = (ra(4) & (!\Add4~7\ & VCC)) # (!ra(4) & (\Add4~7\ $ (GND)))
-- \Add4~9\ = CARRY((!ra(4) & !\Add4~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => ra(4),
	datad => VCC,
	cin => \Add4~7\,
	combout => \Add4~8_combout\,
	cout => \Add4~9\);

-- Location: LCCOMB_X22_Y20_N22
\p~48\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~48_combout\ = (\p~47_combout\ & (((\Add5~12_combout\)) # (!\Add0~1_combout\))) # (!\p~47_combout\ & (\Add0~1_combout\ & ((\Add4~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011010100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \p~47_combout\,
	datab => \Add0~1_combout\,
	datac => \Add5~12_combout\,
	datad => \Add4~8_combout\,
	combout => \p~48_combout\);

-- Location: FF_X22_Y16_N17
\p[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \p~56_combout\,
	ena => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => p(6));

-- Location: LCCOMB_X25_Y18_N2
\p~49\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~49_combout\ = (\Add0~4_combout\ & (((\Add0~1_combout\)))) # (!\Add0~4_combout\ & ((\Add0~1_combout\ & (A3(5))) # (!\Add0~1_combout\ & ((ra(5))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => A3(5),
	datab => ra(5),
	datac => \Add0~4_combout\,
	datad => \Add0~1_combout\,
	combout => \p~49_combout\);

-- Location: LCCOMB_X25_Y18_N10
\p~50\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~50_combout\ = (\Add0~4_combout\ & ((\p~49_combout\ & ((A7(6)))) # (!\p~49_combout\ & (A3(6))))) # (!\Add0~4_combout\ & (((\p~49_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => A3(6),
	datab => \Add0~4_combout\,
	datac => A7(6),
	datad => \p~49_combout\,
	combout => \p~50_combout\);

-- Location: LCCOMB_X19_Y16_N16
\p~51\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~51_combout\ = (\p~19_combout\ & ((\p~20_combout\ & ((\p~50_combout\))) # (!\p~20_combout\ & (ra(4))))) # (!\p~19_combout\ & (((\p~20_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100000111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => ra(4),
	datab => \p~19_combout\,
	datac => \p~20_combout\,
	datad => \p~50_combout\,
	combout => \p~51_combout\);

-- Location: LCCOMB_X19_Y16_N2
\p~52\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~52_combout\ = (\p~16_combout\ & ((\p~51_combout\ & (A5(6))) # (!\p~51_combout\ & ((ra(6)))))) # (!\p~16_combout\ & (((\p~51_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => A5(6),
	datab => ra(6),
	datac => \p~16_combout\,
	datad => \p~51_combout\,
	combout => \p~52_combout\);

-- Location: LCCOMB_X19_Y16_N4
\p~53\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~53_combout\ = (\p~11_combout\ & (((\p~13_combout\)))) # (!\p~11_combout\ & ((\p~13_combout\ & (p(6))) # (!\p~13_combout\ & ((\p~52_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \p~11_combout\,
	datab => p(6),
	datac => \p~13_combout\,
	datad => \p~52_combout\,
	combout => \p~53_combout\);

-- Location: LCCOMB_X22_Y16_N16
\p~56\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~56_combout\ = (\p~11_combout\ & ((\p~53_combout\ & (\p~55_combout\)) # (!\p~53_combout\ & ((\p~48_combout\))))) # (!\p~11_combout\ & (((\p~53_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \p~55_combout\,
	datab => \p~11_combout\,
	datac => \p~48_combout\,
	datad => \p~53_combout\,
	combout => \p~56_combout\);

-- Location: LCCOMB_X23_Y16_N12
\acc[6]~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \acc[6]~46_combout\ = ((\p~56_combout\ $ (acc(6) $ (!\acc[5]~45\)))) # (GND)
-- \acc[6]~47\ = CARRY((\p~56_combout\ & ((acc(6)) # (!\acc[5]~45\))) # (!\p~56_combout\ & (acc(6) & !\acc[5]~45\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \p~56_combout\,
	datab => acc(6),
	datad => VCC,
	cin => \acc[5]~45\,
	combout => \acc[6]~46_combout\,
	cout => \acc[6]~47\);

-- Location: FF_X23_Y16_N13
\acc[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \acc[6]~46_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	sclr => \ld_clr~0_combout\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => acc(6));

-- Location: LCCOMB_X21_Y16_N14
\Add6~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add6~12_combout\ = (ra(6) & (!\Add6~11\ & VCC)) # (!ra(6) & (\Add6~11\ $ (GND)))
-- \Add6~13\ = CARRY((!ra(6) & !\Add6~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => ra(6),
	datad => VCC,
	cin => \Add6~11\,
	combout => \Add6~12_combout\,
	cout => \Add6~13\);

-- Location: IOIBUF_X34_Y17_N1
\a[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(7),
	o => \a[7]~input_o\);

-- Location: LCCOMB_X19_Y18_N26
\A5[7]~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \A5[7]~28_combout\ = (\a[5]~input_o\ & ((\a[7]~input_o\ & (\A5[6]~27\ & VCC)) # (!\a[7]~input_o\ & (!\A5[6]~27\)))) # (!\a[5]~input_o\ & ((\a[7]~input_o\ & (!\A5[6]~27\)) # (!\a[7]~input_o\ & ((\A5[6]~27\) # (GND)))))
-- \A5[7]~29\ = CARRY((\a[5]~input_o\ & (!\a[7]~input_o\ & !\A5[6]~27\)) # (!\a[5]~input_o\ & ((!\A5[6]~27\) # (!\a[7]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \a[5]~input_o\,
	datab => \a[7]~input_o\,
	datad => VCC,
	cin => \A5[6]~27\,
	combout => \A5[7]~28_combout\,
	cout => \A5[7]~29\);

-- Location: FF_X19_Y18_N27
\A5[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \A5[7]~28_combout\,
	asdata => A5(3),
	clrn => \rst~inputclkctrl_outclk\,
	sload => \ALT_INV_ld_clr~0_combout\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => A5(7));

-- Location: LCCOMB_X18_Y18_N14
\Add3~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~14_combout\ = (A5(7) & ((\Add3~13\) # (GND))) # (!A5(7) & (!\Add3~13\))
-- \Add3~15\ = CARRY((A5(7)) # (!\Add3~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => A5(7),
	datad => VCC,
	cin => \Add3~13\,
	combout => \Add3~14_combout\,
	cout => \Add3~15\);

-- Location: LCCOMB_X26_Y16_N14
\Add2~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~12_combout\ = (A3(6) & (!\Add2~11\ & VCC)) # (!A3(6) & (\Add2~11\ $ (GND)))
-- \Add2~13\ = CARRY((!A3(6) & !\Add2~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => A3(6),
	datad => VCC,
	cin => \Add2~11\,
	combout => \Add2~12_combout\,
	cout => \Add2~13\);

-- Location: LCCOMB_X19_Y16_N30
\p~64\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~64_combout\ = (\Add0~1_combout\ & (\Add0~4_combout\)) # (!\Add0~1_combout\ & ((\Add0~4_combout\ & (\Add3~14_combout\)) # (!\Add0~4_combout\ & ((\Add2~12_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~1_combout\,
	datab => \Add0~4_combout\,
	datac => \Add3~14_combout\,
	datad => \Add2~12_combout\,
	combout => \p~64_combout\);

-- Location: LCCOMB_X21_Y14_N20
\ra~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \ra~7_combout\ = (\rcarry~0_combout\ & (\a[7]~input_o\)) # (!\rcarry~0_combout\ & ((ra(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \a[7]~input_o\,
	datac => ra(3),
	datad => \rcarry~0_combout\,
	combout => \ra~7_combout\);

-- Location: FF_X21_Y14_N21
\ra[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \ra~7_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ra(7));

-- Location: LCCOMB_X23_Y14_N14
\Add7~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add7~14_combout\ = (ra(7) & ((\Add7~13\) # (GND))) # (!ra(7) & (!\Add7~13\))
-- \Add7~15\ = CARRY((ra(7)) # (!\Add7~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => ra(7),
	datad => VCC,
	cin => \Add7~13\,
	combout => \Add7~14_combout\,
	cout => \Add7~15\);

-- Location: LCCOMB_X19_Y16_N20
\p~65\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~65_combout\ = (\Add0~1_combout\ & ((\p~64_combout\ & ((\Add7~14_combout\))) # (!\p~64_combout\ & (\Add6~12_combout\)))) # (!\Add0~1_combout\ & (((\p~64_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100001011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~1_combout\,
	datab => \Add6~12_combout\,
	datac => \p~64_combout\,
	datad => \Add7~14_combout\,
	combout => \p~65_combout\);

-- Location: FF_X19_Y16_N27
\p[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \p~66_combout\,
	ena => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => p(7));

-- Location: LCCOMB_X24_Y21_N26
\Add10~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add10~14_combout\ = (\a[4]~input_o\ & ((\a[7]~input_o\ & (!\Add10~13\)) # (!\a[7]~input_o\ & (\Add10~13\ & VCC)))) # (!\a[4]~input_o\ & ((\a[7]~input_o\ & ((\Add10~13\) # (GND))) # (!\a[7]~input_o\ & (!\Add10~13\))))
-- \Add10~15\ = CARRY((\a[4]~input_o\ & (\a[7]~input_o\ & !\Add10~13\)) # (!\a[4]~input_o\ & ((\a[7]~input_o\) # (!\Add10~13\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \a[4]~input_o\,
	datab => \a[7]~input_o\,
	datad => VCC,
	cin => \Add10~13\,
	combout => \Add10~14_combout\,
	cout => \Add10~15\);

-- Location: LCCOMB_X24_Y21_N8
\A7~68\ : cycloneive_lcell_comb
-- Equation(s):
-- \A7~68_combout\ = (\start~input_o\ & ((\cs~q\ & ((A7(3)))) # (!\cs~q\ & (\Add10~14_combout\)))) # (!\start~input_o\ & (((A7(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110100100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \start~input_o\,
	datab => \cs~q\,
	datac => \Add10~14_combout\,
	datad => A7(3),
	combout => \A7~68_combout\);

-- Location: FF_X23_Y20_N13
\A7[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \A7~68_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => A7(7));

-- Location: LCCOMB_X25_Y18_N28
\A3[7]~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \A3[7]~30_combout\ = ((\a[6]~input_o\ $ (\a[7]~input_o\ $ (!\A3[6]~29\)))) # (GND)
-- \A3[7]~31\ = CARRY((\a[6]~input_o\ & ((\a[7]~input_o\) # (!\A3[6]~29\))) # (!\a[6]~input_o\ & (\a[7]~input_o\ & !\A3[6]~29\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \a[6]~input_o\,
	datab => \a[7]~input_o\,
	datad => VCC,
	cin => \A3[6]~29\,
	combout => \A3[7]~30_combout\,
	cout => \A3[7]~31\);

-- Location: FF_X25_Y18_N29
\A3[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \A3[7]~30_combout\,
	asdata => A3(3),
	clrn => \rst~inputclkctrl_outclk\,
	sload => \ALT_INV_ld_clr~0_combout\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => A3(7));

-- Location: LCCOMB_X19_Y16_N28
\p~59\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~59_combout\ = (\Add0~1_combout\ & (((\Add0~4_combout\)))) # (!\Add0~1_combout\ & ((\Add0~4_combout\ & ((A3(7)))) # (!\Add0~4_combout\ & (ra(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => ra(6),
	datab => A3(7),
	datac => \Add0~1_combout\,
	datad => \Add0~4_combout\,
	combout => \p~59_combout\);

-- Location: LCCOMB_X19_Y16_N18
\p~60\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~60_combout\ = (\Add0~1_combout\ & ((\p~59_combout\ & ((A7(7)))) # (!\p~59_combout\ & (A3(6))))) # (!\Add0~1_combout\ & (((\p~59_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => A3(6),
	datab => A7(7),
	datac => \Add0~1_combout\,
	datad => \p~59_combout\,
	combout => \p~60_combout\);

-- Location: LCCOMB_X19_Y16_N8
\p~61\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~61_combout\ = (\p~19_combout\ & ((\p~20_combout\ & ((\p~60_combout\))) # (!\p~20_combout\ & (ra(5))))) # (!\p~19_combout\ & (((\p~20_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100000111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => ra(5),
	datab => \p~19_combout\,
	datac => \p~20_combout\,
	datad => \p~60_combout\,
	combout => \p~61_combout\);

-- Location: LCCOMB_X19_Y16_N22
\p~62\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~62_combout\ = (\p~61_combout\ & ((A5(7)) # ((!\p~16_combout\)))) # (!\p~61_combout\ & (((ra(7) & \p~16_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => A5(7),
	datab => ra(7),
	datac => \p~61_combout\,
	datad => \p~16_combout\,
	combout => \p~62_combout\);

-- Location: LCCOMB_X26_Y18_N14
\Add5~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add5~14_combout\ = (A3(7) & ((\Add5~13\) # (GND))) # (!A3(7) & (!\Add5~13\))
-- \Add5~15\ = CARRY((A3(7)) # (!\Add5~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => A3(7),
	datad => VCC,
	cin => \Add5~13\,
	combout => \Add5~14_combout\,
	cout => \Add5~15\);

-- Location: LCCOMB_X23_Y20_N14
\Add1~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~14_combout\ = (A7(7) & ((\Add1~13\) # (GND))) # (!A7(7) & (!\Add1~13\))
-- \Add1~15\ = CARRY((A7(7)) # (!\Add1~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => A7(7),
	datad => VCC,
	cin => \Add1~13\,
	combout => \Add1~14_combout\,
	cout => \Add1~15\);

-- Location: LCCOMB_X21_Y18_N12
\Add4~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add4~10_combout\ = (ra(5) & ((\Add4~9\) # (GND))) # (!ra(5) & (!\Add4~9\))
-- \Add4~11\ = CARRY((ra(5)) # (!\Add4~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => ra(5),
	datad => VCC,
	cin => \Add4~9\,
	combout => \Add4~10_combout\,
	cout => \Add4~11\);

-- Location: LCCOMB_X19_Y16_N12
\p~57\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~57_combout\ = (\Add0~4_combout\ & (((\Add0~1_combout\)))) # (!\Add0~4_combout\ & ((\Add0~1_combout\ & ((\Add4~10_combout\))) # (!\Add0~1_combout\ & (ra(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => ra(4),
	datab => \Add0~4_combout\,
	datac => \Add0~1_combout\,
	datad => \Add4~10_combout\,
	combout => \p~57_combout\);

-- Location: LCCOMB_X19_Y16_N10
\p~58\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~58_combout\ = (\Add0~4_combout\ & ((\p~57_combout\ & (\Add5~14_combout\)) # (!\p~57_combout\ & ((\Add1~14_combout\))))) # (!\Add0~4_combout\ & (((\p~57_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add5~14_combout\,
	datab => \Add0~4_combout\,
	datac => \Add1~14_combout\,
	datad => \p~57_combout\,
	combout => \p~58_combout\);

-- Location: LCCOMB_X19_Y16_N0
\p~63\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~63_combout\ = (\p~11_combout\ & ((\p~13_combout\) # ((\p~58_combout\)))) # (!\p~11_combout\ & (!\p~13_combout\ & (\p~62_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \p~11_combout\,
	datab => \p~13_combout\,
	datac => \p~62_combout\,
	datad => \p~58_combout\,
	combout => \p~63_combout\);

-- Location: LCCOMB_X19_Y16_N26
\p~66\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~66_combout\ = (\p~13_combout\ & ((\p~63_combout\ & (\p~65_combout\)) # (!\p~63_combout\ & ((p(7)))))) # (!\p~13_combout\ & (((\p~63_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \p~13_combout\,
	datab => \p~65_combout\,
	datac => p(7),
	datad => \p~63_combout\,
	combout => \p~66_combout\);

-- Location: LCCOMB_X23_Y16_N14
\acc[7]~48\ : cycloneive_lcell_comb
-- Equation(s):
-- \acc[7]~48_combout\ = (\p~66_combout\ & ((acc(7) & (\acc[6]~47\ & VCC)) # (!acc(7) & (!\acc[6]~47\)))) # (!\p~66_combout\ & ((acc(7) & (!\acc[6]~47\)) # (!acc(7) & ((\acc[6]~47\) # (GND)))))
-- \acc[7]~49\ = CARRY((\p~66_combout\ & (!acc(7) & !\acc[6]~47\)) # (!\p~66_combout\ & ((!\acc[6]~47\) # (!acc(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \p~66_combout\,
	datab => acc(7),
	datad => VCC,
	cin => \acc[6]~47\,
	combout => \acc[7]~48_combout\,
	cout => \acc[7]~49\);

-- Location: FF_X23_Y16_N15
\acc[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \acc[7]~48_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	sclr => \ld_clr~0_combout\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => acc(7));

-- Location: IOIBUF_X18_Y24_N15
\a[8]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(8),
	o => \a[8]~input_o\);

-- Location: LCCOMB_X24_Y21_N28
\Add10~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add10~16_combout\ = ((\a[8]~input_o\ $ (\a[5]~input_o\ $ (\Add10~15\)))) # (GND)
-- \Add10~17\ = CARRY((\a[8]~input_o\ & (\a[5]~input_o\ & !\Add10~15\)) # (!\a[8]~input_o\ & ((\a[5]~input_o\) # (!\Add10~15\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \a[8]~input_o\,
	datab => \a[5]~input_o\,
	datad => VCC,
	cin => \Add10~15\,
	combout => \Add10~16_combout\,
	cout => \Add10~17\);

-- Location: LCCOMB_X24_Y20_N24
\A7~69\ : cycloneive_lcell_comb
-- Equation(s):
-- \A7~69_combout\ = (\start~input_o\ & ((\cs~q\ & (A7(4))) # (!\cs~q\ & ((\Add10~16_combout\))))) # (!\start~input_o\ & (A7(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \start~input_o\,
	datab => A7(4),
	datac => \Add10~16_combout\,
	datad => \cs~q\,
	combout => \A7~69_combout\);

-- Location: FF_X23_Y20_N23
\A7[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \A7~69_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => A7(8));

-- Location: LCCOMB_X23_Y20_N16
\Add1~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~16_combout\ = (A7(8) & (!\Add1~15\ & VCC)) # (!A7(8) & (\Add1~15\ $ (GND)))
-- \Add1~17\ = CARRY((!A7(8) & !\Add1~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => A7(8),
	datad => VCC,
	cin => \Add1~15\,
	combout => \Add1~16_combout\,
	cout => \Add1~17\);

-- Location: LCCOMB_X24_Y19_N28
\p~67\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~67_combout\ = (\Add0~1_combout\ & (((\Add0~4_combout\)))) # (!\Add0~1_combout\ & ((\Add0~4_combout\ & ((\Add1~16_combout\))) # (!\Add0~4_combout\ & (ra(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~1_combout\,
	datab => ra(5),
	datac => \Add1~16_combout\,
	datad => \Add0~4_combout\,
	combout => \p~67_combout\);

-- Location: LCCOMB_X25_Y18_N30
\A3[8]~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \A3[8]~32_combout\ = (\a[8]~input_o\ & ((\a[7]~input_o\ & (\A3[7]~31\ & VCC)) # (!\a[7]~input_o\ & (!\A3[7]~31\)))) # (!\a[8]~input_o\ & ((\a[7]~input_o\ & (!\A3[7]~31\)) # (!\a[7]~input_o\ & ((\A3[7]~31\) # (GND)))))
-- \A3[8]~33\ = CARRY((\a[8]~input_o\ & (!\a[7]~input_o\ & !\A3[7]~31\)) # (!\a[8]~input_o\ & ((!\A3[7]~31\) # (!\a[7]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \a[8]~input_o\,
	datab => \a[7]~input_o\,
	datad => VCC,
	cin => \A3[7]~31\,
	combout => \A3[8]~32_combout\,
	cout => \A3[8]~33\);

-- Location: LCCOMB_X25_Y18_N6
\A3[8]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \A3[8]~feeder_combout\ = \A3[8]~32_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A3[8]~32_combout\,
	combout => \A3[8]~feeder_combout\);

-- Location: FF_X25_Y18_N7
\A3[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \A3[8]~feeder_combout\,
	asdata => A3(4),
	clrn => \rst~inputclkctrl_outclk\,
	sload => \ALT_INV_ld_clr~0_combout\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => A3(8));

-- Location: LCCOMB_X26_Y18_N16
\Add5~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add5~16_combout\ = (A3(8) & (!\Add5~15\ & VCC)) # (!A3(8) & (\Add5~15\ $ (GND)))
-- \Add5~17\ = CARRY((!A3(8) & !\Add5~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => A3(8),
	datad => VCC,
	cin => \Add5~15\,
	combout => \Add5~16_combout\,
	cout => \Add5~17\);

-- Location: LCCOMB_X21_Y18_N14
\Add4~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add4~12_combout\ = (ra(6) & (!\Add4~11\ & VCC)) # (!ra(6) & (\Add4~11\ $ (GND)))
-- \Add4~13\ = CARRY((!ra(6) & !\Add4~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => ra(6),
	datad => VCC,
	cin => \Add4~11\,
	combout => \Add4~12_combout\,
	cout => \Add4~13\);

-- Location: LCCOMB_X24_Y19_N22
\p~68\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~68_combout\ = (\Add0~1_combout\ & ((\p~67_combout\ & (\Add5~16_combout\)) # (!\p~67_combout\ & ((\Add4~12_combout\))))) # (!\Add0~1_combout\ & (\p~67_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~1_combout\,
	datab => \p~67_combout\,
	datac => \Add5~16_combout\,
	datad => \Add4~12_combout\,
	combout => \p~68_combout\);

-- Location: LCCOMB_X19_Y18_N0
\ra~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \ra~8_combout\ = (\rcarry~0_combout\ & (\a[8]~input_o\)) # (!\rcarry~0_combout\ & ((ra(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \a[8]~input_o\,
	datac => ra(4),
	datad => \rcarry~0_combout\,
	combout => \ra~8_combout\);

-- Location: FF_X21_Y18_N21
\ra[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \ra~8_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ra(8));

-- Location: LCCOMB_X23_Y14_N16
\Add7~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add7~16_combout\ = (ra(8) & (!\Add7~15\ & VCC)) # (!ra(8) & (\Add7~15\ $ (GND)))
-- \Add7~17\ = CARRY((!ra(8) & !\Add7~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => ra(8),
	datad => VCC,
	cin => \Add7~15\,
	combout => \Add7~16_combout\,
	cout => \Add7~17\);

-- Location: LCCOMB_X19_Y18_N28
\A5[8]~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \A5[8]~30_combout\ = ((\a[6]~input_o\ $ (\a[8]~input_o\ $ (!\A5[7]~29\)))) # (GND)
-- \A5[8]~31\ = CARRY((\a[6]~input_o\ & ((\a[8]~input_o\) # (!\A5[7]~29\))) # (!\a[6]~input_o\ & (\a[8]~input_o\ & !\A5[7]~29\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \a[6]~input_o\,
	datab => \a[8]~input_o\,
	datad => VCC,
	cin => \A5[7]~29\,
	combout => \A5[8]~30_combout\,
	cout => \A5[8]~31\);

-- Location: FF_X19_Y18_N29
\A5[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \A5[8]~30_combout\,
	asdata => A5(4),
	clrn => \rst~inputclkctrl_outclk\,
	sload => \ALT_INV_ld_clr~0_combout\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => A5(8));

-- Location: LCCOMB_X18_Y18_N16
\Add3~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~16_combout\ = (A5(8) & (!\Add3~15\ & VCC)) # (!A5(8) & (\Add3~15\ $ (GND)))
-- \Add3~17\ = CARRY((!A5(8) & !\Add3~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => A5(8),
	datad => VCC,
	cin => \Add3~15\,
	combout => \Add3~16_combout\,
	cout => \Add3~17\);

-- Location: LCCOMB_X21_Y16_N16
\Add6~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add6~14_combout\ = (ra(7) & ((\Add6~13\) # (GND))) # (!ra(7) & (!\Add6~13\))
-- \Add6~15\ = CARRY((ra(7)) # (!\Add6~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => ra(7),
	datad => VCC,
	cin => \Add6~13\,
	combout => \Add6~14_combout\,
	cout => \Add6~15\);

-- Location: LCCOMB_X26_Y16_N16
\Add2~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~14_combout\ = (A3(7) & ((\Add2~13\) # (GND))) # (!A3(7) & (!\Add2~13\))
-- \Add2~15\ = CARRY((A3(7)) # (!\Add2~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => A3(7),
	datad => VCC,
	cin => \Add2~13\,
	combout => \Add2~14_combout\,
	cout => \Add2~15\);

-- Location: LCCOMB_X24_Y19_N0
\p~74\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~74_combout\ = (\Add0~1_combout\ & ((\Add0~4_combout\) # ((\Add6~14_combout\)))) # (!\Add0~1_combout\ & (!\Add0~4_combout\ & ((\Add2~14_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~1_combout\,
	datab => \Add0~4_combout\,
	datac => \Add6~14_combout\,
	datad => \Add2~14_combout\,
	combout => \p~74_combout\);

-- Location: LCCOMB_X24_Y19_N14
\p~75\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~75_combout\ = (\Add0~4_combout\ & ((\p~74_combout\ & (\Add7~16_combout\)) # (!\p~74_combout\ & ((\Add3~16_combout\))))) # (!\Add0~4_combout\ & (((\p~74_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~4_combout\,
	datab => \Add7~16_combout\,
	datac => \Add3~16_combout\,
	datad => \p~74_combout\,
	combout => \p~75_combout\);

-- Location: FF_X24_Y19_N21
\p[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \p~76_combout\,
	ena => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => p(8));

-- Location: LCCOMB_X21_Y19_N0
\p~69\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~69_combout\ = (\Add0~4_combout\ & (((\Add0~1_combout\)))) # (!\Add0~4_combout\ & ((\Add0~1_combout\ & (A3(7))) # (!\Add0~1_combout\ & ((ra(7))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => A3(7),
	datab => ra(7),
	datac => \Add0~4_combout\,
	datad => \Add0~1_combout\,
	combout => \p~69_combout\);

-- Location: LCCOMB_X21_Y19_N18
\p~70\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~70_combout\ = (\Add0~4_combout\ & ((\p~69_combout\ & ((A7(8)))) # (!\p~69_combout\ & (A3(8))))) # (!\Add0~4_combout\ & (((\p~69_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => A3(8),
	datab => A7(8),
	datac => \Add0~4_combout\,
	datad => \p~69_combout\,
	combout => \p~70_combout\);

-- Location: LCCOMB_X21_Y19_N12
\p~71\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~71_combout\ = (\p~19_combout\ & ((\p~20_combout\ & ((\p~70_combout\))) # (!\p~20_combout\ & (ra(6))))) # (!\p~19_combout\ & (((\p~20_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100001011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \p~19_combout\,
	datab => ra(6),
	datac => \p~20_combout\,
	datad => \p~70_combout\,
	combout => \p~71_combout\);

-- Location: LCCOMB_X21_Y19_N2
\p~72\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~72_combout\ = (\p~16_combout\ & ((\p~71_combout\ & (A5(8))) # (!\p~71_combout\ & ((ra(8)))))) # (!\p~16_combout\ & (((\p~71_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => A5(8),
	datab => ra(8),
	datac => \p~16_combout\,
	datad => \p~71_combout\,
	combout => \p~72_combout\);

-- Location: LCCOMB_X24_Y19_N2
\p~73\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~73_combout\ = (\p~13_combout\ & ((p(8)) # ((\p~11_combout\)))) # (!\p~13_combout\ & (((!\p~11_combout\ & \p~72_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \p~13_combout\,
	datab => p(8),
	datac => \p~11_combout\,
	datad => \p~72_combout\,
	combout => \p~73_combout\);

-- Location: LCCOMB_X24_Y19_N20
\p~76\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~76_combout\ = (\p~11_combout\ & ((\p~73_combout\ & ((\p~75_combout\))) # (!\p~73_combout\ & (\p~68_combout\)))) # (!\p~11_combout\ & (((\p~73_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \p~68_combout\,
	datab => \p~11_combout\,
	datac => \p~75_combout\,
	datad => \p~73_combout\,
	combout => \p~76_combout\);

-- Location: LCCOMB_X23_Y16_N16
\acc[8]~50\ : cycloneive_lcell_comb
-- Equation(s):
-- \acc[8]~50_combout\ = ((acc(8) $ (\p~76_combout\ $ (!\acc[7]~49\)))) # (GND)
-- \acc[8]~51\ = CARRY((acc(8) & ((\p~76_combout\) # (!\acc[7]~49\))) # (!acc(8) & (\p~76_combout\ & !\acc[7]~49\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => acc(8),
	datab => \p~76_combout\,
	datad => VCC,
	cin => \acc[7]~49\,
	combout => \acc[8]~50_combout\,
	cout => \acc[8]~51\);

-- Location: FF_X23_Y16_N17
\acc[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \acc[8]~50_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	sclr => \ld_clr~0_combout\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => acc(8));

-- Location: IOIBUF_X0_Y11_N22
\a[9]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(9),
	o => \a[9]~input_o\);

-- Location: LCCOMB_X24_Y18_N26
\ra~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \ra~9_combout\ = (\rcarry~0_combout\ & ((\a[9]~input_o\))) # (!\rcarry~0_combout\ & (ra(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rcarry~0_combout\,
	datab => ra(5),
	datad => \a[9]~input_o\,
	combout => \ra~9_combout\);

-- Location: FF_X24_Y18_N27
\ra[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \ra~9_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ra(9));

-- Location: LCCOMB_X23_Y14_N18
\Add7~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add7~18_combout\ = (ra(9) & ((\Add7~17\) # (GND))) # (!ra(9) & (!\Add7~17\))
-- \Add7~19\ = CARRY((ra(9)) # (!\Add7~17\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => ra(9),
	datad => VCC,
	cin => \Add7~17\,
	combout => \Add7~18_combout\,
	cout => \Add7~19\);

-- Location: LCCOMB_X26_Y16_N18
\Add2~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~16_combout\ = (A3(8) & (!\Add2~15\ & VCC)) # (!A3(8) & (\Add2~15\ $ (GND)))
-- \Add2~17\ = CARRY((!A3(8) & !\Add2~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => A3(8),
	datad => VCC,
	cin => \Add2~15\,
	combout => \Add2~16_combout\,
	cout => \Add2~17\);

-- Location: LCCOMB_X19_Y18_N30
\A5[9]~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \A5[9]~32_combout\ = (\a[9]~input_o\ & ((\a[7]~input_o\ & (\A5[8]~31\ & VCC)) # (!\a[7]~input_o\ & (!\A5[8]~31\)))) # (!\a[9]~input_o\ & ((\a[7]~input_o\ & (!\A5[8]~31\)) # (!\a[7]~input_o\ & ((\A5[8]~31\) # (GND)))))
-- \A5[9]~33\ = CARRY((\a[9]~input_o\ & (!\a[7]~input_o\ & !\A5[8]~31\)) # (!\a[9]~input_o\ & ((!\A5[8]~31\) # (!\a[7]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \a[9]~input_o\,
	datab => \a[7]~input_o\,
	datad => VCC,
	cin => \A5[8]~31\,
	combout => \A5[9]~32_combout\,
	cout => \A5[9]~33\);

-- Location: FF_X19_Y18_N31
\A5[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \A5[9]~32_combout\,
	asdata => A5(5),
	clrn => \rst~inputclkctrl_outclk\,
	sload => \ALT_INV_ld_clr~0_combout\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => A5(9));

-- Location: LCCOMB_X18_Y18_N18
\Add3~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~18_combout\ = (A5(9) & ((\Add3~17\) # (GND))) # (!A5(9) & (!\Add3~17\))
-- \Add3~19\ = CARRY((A5(9)) # (!\Add3~17\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => A5(9),
	datad => VCC,
	cin => \Add3~17\,
	combout => \Add3~18_combout\,
	cout => \Add3~19\);

-- Location: LCCOMB_X22_Y16_N4
\p~84\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~84_combout\ = (\Add0~4_combout\ & ((\Add0~1_combout\) # ((\Add3~18_combout\)))) # (!\Add0~4_combout\ & (!\Add0~1_combout\ & (\Add2~16_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~4_combout\,
	datab => \Add0~1_combout\,
	datac => \Add2~16_combout\,
	datad => \Add3~18_combout\,
	combout => \p~84_combout\);

-- Location: LCCOMB_X21_Y16_N18
\Add6~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add6~16_combout\ = (ra(8) & (!\Add6~15\ & VCC)) # (!ra(8) & (\Add6~15\ $ (GND)))
-- \Add6~17\ = CARRY((!ra(8) & !\Add6~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => ra(8),
	datad => VCC,
	cin => \Add6~15\,
	combout => \Add6~16_combout\,
	cout => \Add6~17\);

-- Location: LCCOMB_X22_Y16_N14
\p~85\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~85_combout\ = (\Add0~1_combout\ & ((\p~84_combout\ & (\Add7~18_combout\)) # (!\p~84_combout\ & ((\Add6~16_combout\))))) # (!\Add0~1_combout\ & (((\p~84_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011110010110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add7~18_combout\,
	datab => \Add0~1_combout\,
	datac => \p~84_combout\,
	datad => \Add6~16_combout\,
	combout => \p~85_combout\);

-- Location: FF_X22_Y16_N11
\p[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \p~86_combout\,
	ena => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => p(9));

-- Location: LCCOMB_X25_Y17_N0
\A3[9]~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \A3[9]~34_combout\ = ((\a[8]~input_o\ $ (\a[9]~input_o\ $ (!\A3[8]~33\)))) # (GND)
-- \A3[9]~35\ = CARRY((\a[8]~input_o\ & ((\a[9]~input_o\) # (!\A3[8]~33\))) # (!\a[8]~input_o\ & (\a[9]~input_o\ & !\A3[8]~33\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \a[8]~input_o\,
	datab => \a[9]~input_o\,
	datad => VCC,
	cin => \A3[8]~33\,
	combout => \A3[9]~34_combout\,
	cout => \A3[9]~35\);

-- Location: FF_X25_Y17_N1
\A3[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \A3[9]~34_combout\,
	asdata => A3(5),
	clrn => \rst~inputclkctrl_outclk\,
	sload => \ALT_INV_ld_clr~0_combout\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => A3(9));

-- Location: LCCOMB_X26_Y18_N18
\Add5~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add5~18_combout\ = (A3(9) & ((\Add5~17\) # (GND))) # (!A3(9) & (!\Add5~17\))
-- \Add5~19\ = CARRY((A3(9)) # (!\Add5~17\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => A3(9),
	datad => VCC,
	cin => \Add5~17\,
	combout => \Add5~18_combout\,
	cout => \Add5~19\);

-- Location: LCCOMB_X24_Y21_N30
\Add10~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add10~18_combout\ = (\a[6]~input_o\ & ((\a[9]~input_o\ & (!\Add10~17\)) # (!\a[9]~input_o\ & (\Add10~17\ & VCC)))) # (!\a[6]~input_o\ & ((\a[9]~input_o\ & ((\Add10~17\) # (GND))) # (!\a[9]~input_o\ & (!\Add10~17\))))
-- \Add10~19\ = CARRY((\a[6]~input_o\ & (\a[9]~input_o\ & !\Add10~17\)) # (!\a[6]~input_o\ & ((\a[9]~input_o\) # (!\Add10~17\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \a[6]~input_o\,
	datab => \a[9]~input_o\,
	datad => VCC,
	cin => \Add10~17\,
	combout => \Add10~18_combout\,
	cout => \Add10~19\);

-- Location: LCCOMB_X22_Y20_N16
\A7~70\ : cycloneive_lcell_comb
-- Equation(s):
-- \A7~70_combout\ = (\cs~q\ & (((A7(5))))) # (!\cs~q\ & ((\start~input_o\ & (\Add10~18_combout\)) # (!\start~input_o\ & ((A7(5))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add10~18_combout\,
	datab => A7(5),
	datac => \cs~q\,
	datad => \start~input_o\,
	combout => \A7~70_combout\);

-- Location: FF_X23_Y20_N27
\A7[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \A7~70_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => A7(9));

-- Location: LCCOMB_X23_Y20_N18
\Add1~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~18_combout\ = (A7(9) & ((\Add1~17\) # (GND))) # (!A7(9) & (!\Add1~17\))
-- \Add1~19\ = CARRY((A7(9)) # (!\Add1~17\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => A7(9),
	datad => VCC,
	cin => \Add1~17\,
	combout => \Add1~18_combout\,
	cout => \Add1~19\);

-- Location: LCCOMB_X21_Y18_N16
\Add4~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add4~14_combout\ = (ra(7) & ((\Add4~13\) # (GND))) # (!ra(7) & (!\Add4~13\))
-- \Add4~15\ = CARRY((ra(7)) # (!\Add4~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => ra(7),
	datad => VCC,
	cin => \Add4~13\,
	combout => \Add4~14_combout\,
	cout => \Add4~15\);

-- Location: LCCOMB_X22_Y16_N20
\p~77\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~77_combout\ = (\Add0~4_combout\ & (((\Add0~1_combout\)))) # (!\Add0~4_combout\ & ((\Add0~1_combout\ & ((\Add4~14_combout\))) # (!\Add0~1_combout\ & (ra(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~4_combout\,
	datab => ra(6),
	datac => \Add4~14_combout\,
	datad => \Add0~1_combout\,
	combout => \p~77_combout\);

-- Location: LCCOMB_X22_Y16_N30
\p~78\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~78_combout\ = (\Add0~4_combout\ & ((\p~77_combout\ & (\Add5~18_combout\)) # (!\p~77_combout\ & ((\Add1~18_combout\))))) # (!\Add0~4_combout\ & (((\p~77_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~4_combout\,
	datab => \Add5~18_combout\,
	datac => \Add1~18_combout\,
	datad => \p~77_combout\,
	combout => \p~78_combout\);

-- Location: LCCOMB_X22_Y16_N8
\p~79\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~79_combout\ = (\Add0~4_combout\ & ((A3(9)) # ((\Add0~1_combout\)))) # (!\Add0~4_combout\ & (((ra(8) & !\Add0~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => A3(9),
	datab => ra(8),
	datac => \Add0~4_combout\,
	datad => \Add0~1_combout\,
	combout => \p~79_combout\);

-- Location: LCCOMB_X19_Y16_N6
\p~80\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~80_combout\ = (\Add0~1_combout\ & ((\p~79_combout\ & ((A7(9)))) # (!\p~79_combout\ & (A3(8))))) # (!\Add0~1_combout\ & (((\p~79_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => A3(8),
	datab => A7(9),
	datac => \Add0~1_combout\,
	datad => \p~79_combout\,
	combout => \p~80_combout\);

-- Location: LCCOMB_X19_Y16_N24
\p~81\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~81_combout\ = (\p~19_combout\ & ((\p~20_combout\ & ((\p~80_combout\))) # (!\p~20_combout\ & (ra(7))))) # (!\p~19_combout\ & (((\p~20_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100000111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => ra(7),
	datab => \p~19_combout\,
	datac => \p~20_combout\,
	datad => \p~80_combout\,
	combout => \p~81_combout\);

-- Location: LCCOMB_X19_Y16_N14
\p~82\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~82_combout\ = (\p~16_combout\ & ((\p~81_combout\ & ((A5(9)))) # (!\p~81_combout\ & (ra(9))))) # (!\p~16_combout\ & (((\p~81_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => ra(9),
	datab => A5(9),
	datac => \p~16_combout\,
	datad => \p~81_combout\,
	combout => \p~82_combout\);

-- Location: LCCOMB_X22_Y16_N6
\p~83\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~83_combout\ = (\p~13_combout\ & (\p~11_combout\)) # (!\p~13_combout\ & ((\p~11_combout\ & (\p~78_combout\)) # (!\p~11_combout\ & ((\p~82_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \p~13_combout\,
	datab => \p~11_combout\,
	datac => \p~78_combout\,
	datad => \p~82_combout\,
	combout => \p~83_combout\);

-- Location: LCCOMB_X22_Y16_N10
\p~86\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~86_combout\ = (\p~13_combout\ & ((\p~83_combout\ & (\p~85_combout\)) # (!\p~83_combout\ & ((p(9)))))) # (!\p~13_combout\ & (((\p~83_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \p~13_combout\,
	datab => \p~85_combout\,
	datac => p(9),
	datad => \p~83_combout\,
	combout => \p~86_combout\);

-- Location: LCCOMB_X23_Y16_N18
\acc[9]~52\ : cycloneive_lcell_comb
-- Equation(s):
-- \acc[9]~52_combout\ = (\p~86_combout\ & ((acc(9) & (\acc[8]~51\ & VCC)) # (!acc(9) & (!\acc[8]~51\)))) # (!\p~86_combout\ & ((acc(9) & (!\acc[8]~51\)) # (!acc(9) & ((\acc[8]~51\) # (GND)))))
-- \acc[9]~53\ = CARRY((\p~86_combout\ & (!acc(9) & !\acc[8]~51\)) # (!\p~86_combout\ & ((!\acc[8]~51\) # (!acc(9)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \p~86_combout\,
	datab => acc(9),
	datad => VCC,
	cin => \acc[8]~51\,
	combout => \acc[9]~52_combout\,
	cout => \acc[9]~53\);

-- Location: FF_X23_Y16_N19
\acc[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \acc[9]~52_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	sclr => \ld_clr~0_combout\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => acc(9));

-- Location: IOIBUF_X34_Y18_N1
\a[10]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(10),
	o => \a[10]~input_o\);

-- Location: LCCOMB_X25_Y17_N2
\A3[10]~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \A3[10]~36_combout\ = (\a[10]~input_o\ & ((\a[9]~input_o\ & (\A3[9]~35\ & VCC)) # (!\a[9]~input_o\ & (!\A3[9]~35\)))) # (!\a[10]~input_o\ & ((\a[9]~input_o\ & (!\A3[9]~35\)) # (!\a[9]~input_o\ & ((\A3[9]~35\) # (GND)))))
-- \A3[10]~37\ = CARRY((\a[10]~input_o\ & (!\a[9]~input_o\ & !\A3[9]~35\)) # (!\a[10]~input_o\ & ((!\A3[9]~35\) # (!\a[9]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \a[10]~input_o\,
	datab => \a[9]~input_o\,
	datad => VCC,
	cin => \A3[9]~35\,
	combout => \A3[10]~36_combout\,
	cout => \A3[10]~37\);

-- Location: FF_X25_Y17_N3
\A3[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \A3[10]~36_combout\,
	asdata => A3(6),
	clrn => \rst~inputclkctrl_outclk\,
	sload => \ALT_INV_ld_clr~0_combout\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => A3(10));

-- Location: LCCOMB_X26_Y18_N20
\Add5~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add5~20_combout\ = (A3(10) & (!\Add5~19\ & VCC)) # (!A3(10) & (\Add5~19\ $ (GND)))
-- \Add5~21\ = CARRY((!A3(10) & !\Add5~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => A3(10),
	datad => VCC,
	cin => \Add5~19\,
	combout => \Add5~20_combout\,
	cout => \Add5~21\);

-- Location: LCCOMB_X21_Y18_N18
\Add4~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add4~16_combout\ = (ra(8) & (!\Add4~15\ & VCC)) # (!ra(8) & (\Add4~15\ $ (GND)))
-- \Add4~17\ = CARRY((!ra(8) & !\Add4~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => ra(8),
	datad => VCC,
	cin => \Add4~15\,
	combout => \Add4~16_combout\,
	cout => \Add4~17\);

-- Location: LCCOMB_X24_Y20_N0
\Add10~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add10~20_combout\ = ((\a[10]~input_o\ $ (\a[7]~input_o\ $ (\Add10~19\)))) # (GND)
-- \Add10~21\ = CARRY((\a[10]~input_o\ & (\a[7]~input_o\ & !\Add10~19\)) # (!\a[10]~input_o\ & ((\a[7]~input_o\) # (!\Add10~19\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \a[10]~input_o\,
	datab => \a[7]~input_o\,
	datad => VCC,
	cin => \Add10~19\,
	combout => \Add10~20_combout\,
	cout => \Add10~21\);

-- Location: LCCOMB_X24_Y17_N4
\A7~71\ : cycloneive_lcell_comb
-- Equation(s):
-- \A7~71_combout\ = (\cs~q\ & (A7(6))) # (!\cs~q\ & ((\start~input_o\ & ((\Add10~20_combout\))) # (!\start~input_o\ & (A7(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => A7(6),
	datab => \cs~q\,
	datac => \Add10~20_combout\,
	datad => \start~input_o\,
	combout => \A7~71_combout\);

-- Location: FF_X24_Y17_N5
\A7[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \A7~71_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => A7(10));

-- Location: LCCOMB_X23_Y20_N20
\Add1~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~20_combout\ = (A7(10) & (!\Add1~19\ & VCC)) # (!A7(10) & (\Add1~19\ $ (GND)))
-- \Add1~21\ = CARRY((!A7(10) & !\Add1~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => A7(10),
	datad => VCC,
	cin => \Add1~19\,
	combout => \Add1~20_combout\,
	cout => \Add1~21\);

-- Location: LCCOMB_X23_Y17_N24
\p~87\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~87_combout\ = (\Add0~4_combout\ & (((\Add0~1_combout\) # (\Add1~20_combout\)))) # (!\Add0~4_combout\ & (ra(7) & (!\Add0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~4_combout\,
	datab => ra(7),
	datac => \Add0~1_combout\,
	datad => \Add1~20_combout\,
	combout => \p~87_combout\);

-- Location: LCCOMB_X23_Y17_N2
\p~88\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~88_combout\ = (\Add0~1_combout\ & ((\p~87_combout\ & (\Add5~20_combout\)) # (!\p~87_combout\ & ((\Add4~16_combout\))))) # (!\Add0~1_combout\ & (((\p~87_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add5~20_combout\,
	datab => \Add0~1_combout\,
	datac => \Add4~16_combout\,
	datad => \p~87_combout\,
	combout => \p~88_combout\);

-- Location: LCCOMB_X22_Y17_N12
\ra~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \ra~10_combout\ = (\rcarry~0_combout\ & ((\a[10]~input_o\))) # (!\rcarry~0_combout\ & (ra(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => ra(6),
	datac => \a[10]~input_o\,
	datad => \rcarry~0_combout\,
	combout => \ra~10_combout\);

-- Location: FF_X22_Y17_N13
\ra[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \ra~10_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ra(10));

-- Location: LCCOMB_X23_Y14_N20
\Add7~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add7~20_combout\ = (ra(10) & (!\Add7~19\ & VCC)) # (!ra(10) & (\Add7~19\ $ (GND)))
-- \Add7~21\ = CARRY((!ra(10) & !\Add7~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => ra(10),
	datad => VCC,
	cin => \Add7~19\,
	combout => \Add7~20_combout\,
	cout => \Add7~21\);

-- Location: LCCOMB_X19_Y17_N0
\A5[10]~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \A5[10]~34_combout\ = ((\a[8]~input_o\ $ (\a[10]~input_o\ $ (!\A5[9]~33\)))) # (GND)
-- \A5[10]~35\ = CARRY((\a[8]~input_o\ & ((\a[10]~input_o\) # (!\A5[9]~33\))) # (!\a[8]~input_o\ & (\a[10]~input_o\ & !\A5[9]~33\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \a[8]~input_o\,
	datab => \a[10]~input_o\,
	datad => VCC,
	cin => \A5[9]~33\,
	combout => \A5[10]~34_combout\,
	cout => \A5[10]~35\);

-- Location: LCCOMB_X19_Y17_N22
\A5[10]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \A5[10]~feeder_combout\ = \A5[10]~34_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \A5[10]~34_combout\,
	combout => \A5[10]~feeder_combout\);

-- Location: FF_X19_Y17_N23
\A5[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \A5[10]~feeder_combout\,
	asdata => A5(6),
	clrn => \rst~inputclkctrl_outclk\,
	sload => \ALT_INV_ld_clr~0_combout\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => A5(10));

-- Location: LCCOMB_X18_Y18_N20
\Add3~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~20_combout\ = (A5(10) & (!\Add3~19\ & VCC)) # (!A5(10) & (\Add3~19\ $ (GND)))
-- \Add3~21\ = CARRY((!A5(10) & !\Add3~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => A5(10),
	datad => VCC,
	cin => \Add3~19\,
	combout => \Add3~20_combout\,
	cout => \Add3~21\);

-- Location: LCCOMB_X26_Y16_N20
\Add2~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~18_combout\ = (A3(9) & ((\Add2~17\) # (GND))) # (!A3(9) & (!\Add2~17\))
-- \Add2~19\ = CARRY((A3(9)) # (!\Add2~17\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => A3(9),
	datad => VCC,
	cin => \Add2~17\,
	combout => \Add2~18_combout\,
	cout => \Add2~19\);

-- Location: LCCOMB_X21_Y16_N20
\Add6~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add6~18_combout\ = (ra(9) & ((\Add6~17\) # (GND))) # (!ra(9) & (!\Add6~17\))
-- \Add6~19\ = CARRY((ra(9)) # (!\Add6~17\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => ra(9),
	datad => VCC,
	cin => \Add6~17\,
	combout => \Add6~18_combout\,
	cout => \Add6~19\);

-- Location: LCCOMB_X22_Y16_N24
\p~94\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~94_combout\ = (\Add0~4_combout\ & (\Add0~1_combout\)) # (!\Add0~4_combout\ & ((\Add0~1_combout\ & ((\Add6~18_combout\))) # (!\Add0~1_combout\ & (\Add2~18_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~4_combout\,
	datab => \Add0~1_combout\,
	datac => \Add2~18_combout\,
	datad => \Add6~18_combout\,
	combout => \p~94_combout\);

-- Location: LCCOMB_X22_Y16_N22
\p~95\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~95_combout\ = (\Add0~4_combout\ & ((\p~94_combout\ & (\Add7~20_combout\)) # (!\p~94_combout\ & ((\Add3~20_combout\))))) # (!\Add0~4_combout\ & (((\p~94_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~4_combout\,
	datab => \Add7~20_combout\,
	datac => \Add3~20_combout\,
	datad => \p~94_combout\,
	combout => \p~95_combout\);

-- Location: FF_X23_Y17_N29
\p[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \p~96_combout\,
	ena => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => p(10));

-- Location: LCCOMB_X19_Y17_N24
\p~89\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~89_combout\ = (\Add0~4_combout\ & (((\Add0~1_combout\)))) # (!\Add0~4_combout\ & ((\Add0~1_combout\ & (A3(9))) # (!\Add0~1_combout\ & ((ra(9))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => A3(9),
	datab => ra(9),
	datac => \Add0~4_combout\,
	datad => \Add0~1_combout\,
	combout => \p~89_combout\);

-- Location: LCCOMB_X19_Y17_N18
\p~90\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~90_combout\ = (\Add0~4_combout\ & ((\p~89_combout\ & (A7(10))) # (!\p~89_combout\ & ((A3(10)))))) # (!\Add0~4_combout\ & (((\p~89_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => A7(10),
	datab => A3(10),
	datac => \Add0~4_combout\,
	datad => \p~89_combout\,
	combout => \p~90_combout\);

-- Location: LCCOMB_X19_Y17_N28
\p~91\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~91_combout\ = (\p~20_combout\ & (((\p~90_combout\)) # (!\p~19_combout\))) # (!\p~20_combout\ & (\p~19_combout\ & (ra(8))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \p~20_combout\,
	datab => \p~19_combout\,
	datac => ra(8),
	datad => \p~90_combout\,
	combout => \p~91_combout\);

-- Location: LCCOMB_X19_Y17_N20
\p~92\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~92_combout\ = (\p~16_combout\ & ((\p~91_combout\ & ((A5(10)))) # (!\p~91_combout\ & (ra(10))))) # (!\p~16_combout\ & (((\p~91_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => ra(10),
	datab => \p~16_combout\,
	datac => A5(10),
	datad => \p~91_combout\,
	combout => \p~92_combout\);

-- Location: LCCOMB_X23_Y17_N10
\p~93\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~93_combout\ = (\p~11_combout\ & (((\p~13_combout\)))) # (!\p~11_combout\ & ((\p~13_combout\ & (p(10))) # (!\p~13_combout\ & ((\p~92_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \p~11_combout\,
	datab => p(10),
	datac => \p~13_combout\,
	datad => \p~92_combout\,
	combout => \p~93_combout\);

-- Location: LCCOMB_X23_Y17_N28
\p~96\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~96_combout\ = (\p~11_combout\ & ((\p~93_combout\ & ((\p~95_combout\))) # (!\p~93_combout\ & (\p~88_combout\)))) # (!\p~11_combout\ & (((\p~93_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \p~11_combout\,
	datab => \p~88_combout\,
	datac => \p~95_combout\,
	datad => \p~93_combout\,
	combout => \p~96_combout\);

-- Location: LCCOMB_X23_Y16_N20
\acc[10]~54\ : cycloneive_lcell_comb
-- Equation(s):
-- \acc[10]~54_combout\ = ((\p~96_combout\ $ (acc(10) $ (!\acc[9]~53\)))) # (GND)
-- \acc[10]~55\ = CARRY((\p~96_combout\ & ((acc(10)) # (!\acc[9]~53\))) # (!\p~96_combout\ & (acc(10) & !\acc[9]~53\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \p~96_combout\,
	datab => acc(10),
	datad => VCC,
	cin => \acc[9]~53\,
	combout => \acc[10]~54_combout\,
	cout => \acc[10]~55\);

-- Location: FF_X23_Y16_N21
\acc[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \acc[10]~54_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	sclr => \ld_clr~0_combout\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => acc(10));

-- Location: LCCOMB_X21_Y16_N22
\Add6~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add6~20_combout\ = (ra(10) & (!\Add6~19\ & VCC)) # (!ra(10) & (\Add6~19\ $ (GND)))
-- \Add6~21\ = CARRY((!ra(10) & !\Add6~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => ra(10),
	datad => VCC,
	cin => \Add6~19\,
	combout => \Add6~20_combout\,
	cout => \Add6~21\);

-- Location: IOIBUF_X11_Y24_N22
\a[11]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(11),
	o => \a[11]~input_o\);

-- Location: LCCOMB_X23_Y18_N20
\ra~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \ra~11_combout\ = (\rcarry~0_combout\ & ((\a[11]~input_o\))) # (!\rcarry~0_combout\ & (ra(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rcarry~0_combout\,
	datab => ra(7),
	datad => \a[11]~input_o\,
	combout => \ra~11_combout\);

-- Location: FF_X23_Y18_N21
\ra[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \ra~11_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ra(11));

-- Location: LCCOMB_X23_Y14_N22
\Add7~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add7~22_combout\ = (ra(11) & ((\Add7~21\) # (GND))) # (!ra(11) & (!\Add7~21\))
-- \Add7~23\ = CARRY((ra(11)) # (!\Add7~21\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => ra(11),
	datad => VCC,
	cin => \Add7~21\,
	combout => \Add7~22_combout\,
	cout => \Add7~23\);

-- Location: LCCOMB_X26_Y16_N22
\Add2~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~20_combout\ = (A3(10) & (!\Add2~19\ & VCC)) # (!A3(10) & (\Add2~19\ $ (GND)))
-- \Add2~21\ = CARRY((!A3(10) & !\Add2~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => A3(10),
	datad => VCC,
	cin => \Add2~19\,
	combout => \Add2~20_combout\,
	cout => \Add2~21\);

-- Location: LCCOMB_X19_Y17_N2
\A5[11]~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \A5[11]~36_combout\ = (\a[11]~input_o\ & ((\a[9]~input_o\ & (\A5[10]~35\ & VCC)) # (!\a[9]~input_o\ & (!\A5[10]~35\)))) # (!\a[11]~input_o\ & ((\a[9]~input_o\ & (!\A5[10]~35\)) # (!\a[9]~input_o\ & ((\A5[10]~35\) # (GND)))))
-- \A5[11]~37\ = CARRY((\a[11]~input_o\ & (!\a[9]~input_o\ & !\A5[10]~35\)) # (!\a[11]~input_o\ & ((!\A5[10]~35\) # (!\a[9]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \a[11]~input_o\,
	datab => \a[9]~input_o\,
	datad => VCC,
	cin => \A5[10]~35\,
	combout => \A5[11]~36_combout\,
	cout => \A5[11]~37\);

-- Location: LCCOMB_X19_Y17_N26
\A5[11]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \A5[11]~feeder_combout\ = \A5[11]~36_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \A5[11]~36_combout\,
	combout => \A5[11]~feeder_combout\);

-- Location: FF_X19_Y17_N27
\A5[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \A5[11]~feeder_combout\,
	asdata => A5(7),
	clrn => \rst~inputclkctrl_outclk\,
	sload => \ALT_INV_ld_clr~0_combout\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => A5(11));

-- Location: LCCOMB_X18_Y18_N22
\Add3~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~22_combout\ = (A5(11) & ((\Add3~21\) # (GND))) # (!A5(11) & (!\Add3~21\))
-- \Add3~23\ = CARRY((A5(11)) # (!\Add3~21\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => A5(11),
	datad => VCC,
	cin => \Add3~21\,
	combout => \Add3~22_combout\,
	cout => \Add3~23\);

-- Location: LCCOMB_X22_Y16_N28
\p~104\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~104_combout\ = (\Add0~4_combout\ & ((\Add0~1_combout\) # ((\Add3~22_combout\)))) # (!\Add0~4_combout\ & (!\Add0~1_combout\ & (\Add2~20_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~4_combout\,
	datab => \Add0~1_combout\,
	datac => \Add2~20_combout\,
	datad => \Add3~22_combout\,
	combout => \p~104_combout\);

-- Location: LCCOMB_X22_Y16_N2
\p~105\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~105_combout\ = (\Add0~1_combout\ & ((\p~104_combout\ & ((\Add7~22_combout\))) # (!\p~104_combout\ & (\Add6~20_combout\)))) # (!\Add0~1_combout\ & (((\p~104_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~1_combout\,
	datab => \Add6~20_combout\,
	datac => \Add7~22_combout\,
	datad => \p~104_combout\,
	combout => \p~105_combout\);

-- Location: FF_X25_Y16_N9
\p[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \p~106_combout\,
	ena => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => p(11));

-- Location: LCCOMB_X24_Y20_N2
\Add10~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add10~22_combout\ = (\a[11]~input_o\ & ((\a[8]~input_o\ & (!\Add10~21\)) # (!\a[8]~input_o\ & ((\Add10~21\) # (GND))))) # (!\a[11]~input_o\ & ((\a[8]~input_o\ & (\Add10~21\ & VCC)) # (!\a[8]~input_o\ & (!\Add10~21\))))
-- \Add10~23\ = CARRY((\a[11]~input_o\ & ((!\Add10~21\) # (!\a[8]~input_o\))) # (!\a[11]~input_o\ & (!\a[8]~input_o\ & !\Add10~21\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \a[11]~input_o\,
	datab => \a[8]~input_o\,
	datad => VCC,
	cin => \Add10~21\,
	combout => \Add10~22_combout\,
	cout => \Add10~23\);

-- Location: LCCOMB_X22_Y20_N20
\A7~72\ : cycloneive_lcell_comb
-- Equation(s):
-- \A7~72_combout\ = (\cs~q\ & (A7(7))) # (!\cs~q\ & ((\start~input_o\ & ((\Add10~22_combout\))) # (!\start~input_o\ & (A7(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => A7(7),
	datab => \Add10~22_combout\,
	datac => \cs~q\,
	datad => \start~input_o\,
	combout => \A7~72_combout\);

-- Location: FF_X22_Y20_N21
\A7[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \A7~72_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => A7(11));

-- Location: LCCOMB_X25_Y17_N4
\A3[11]~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \A3[11]~38_combout\ = ((\a[10]~input_o\ $ (\a[11]~input_o\ $ (!\A3[10]~37\)))) # (GND)
-- \A3[11]~39\ = CARRY((\a[10]~input_o\ & ((\a[11]~input_o\) # (!\A3[10]~37\))) # (!\a[10]~input_o\ & (\a[11]~input_o\ & !\A3[10]~37\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \a[10]~input_o\,
	datab => \a[11]~input_o\,
	datad => VCC,
	cin => \A3[10]~37\,
	combout => \A3[11]~38_combout\,
	cout => \A3[11]~39\);

-- Location: FF_X25_Y17_N5
\A3[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \A3[11]~38_combout\,
	asdata => A3(7),
	clrn => \rst~inputclkctrl_outclk\,
	sload => \ALT_INV_ld_clr~0_combout\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => A3(11));

-- Location: LCCOMB_X25_Y16_N26
\p~99\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~99_combout\ = (\Add0~4_combout\ & (((A3(11)) # (\Add0~1_combout\)))) # (!\Add0~4_combout\ & (ra(10) & ((!\Add0~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => ra(10),
	datab => A3(11),
	datac => \Add0~4_combout\,
	datad => \Add0~1_combout\,
	combout => \p~99_combout\);

-- Location: LCCOMB_X25_Y16_N12
\p~100\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~100_combout\ = (\p~99_combout\ & (((A7(11)) # (!\Add0~1_combout\)))) # (!\p~99_combout\ & (A3(10) & ((\Add0~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => A3(10),
	datab => A7(11),
	datac => \p~99_combout\,
	datad => \Add0~1_combout\,
	combout => \p~100_combout\);

-- Location: LCCOMB_X25_Y16_N22
\p~101\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~101_combout\ = (\p~19_combout\ & ((\p~20_combout\ & ((\p~100_combout\))) # (!\p~20_combout\ & (ra(9))))) # (!\p~19_combout\ & (((\p~20_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \p~19_combout\,
	datab => ra(9),
	datac => \p~100_combout\,
	datad => \p~20_combout\,
	combout => \p~101_combout\);

-- Location: LCCOMB_X25_Y16_N0
\p~102\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~102_combout\ = (\p~101_combout\ & ((A5(11)) # ((!\p~16_combout\)))) # (!\p~101_combout\ & (((\p~16_combout\ & ra(11)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101101010001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \p~101_combout\,
	datab => A5(11),
	datac => \p~16_combout\,
	datad => ra(11),
	combout => \p~102_combout\);

-- Location: LCCOMB_X23_Y20_N22
\Add1~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~22_combout\ = (A7(11) & ((\Add1~21\) # (GND))) # (!A7(11) & (!\Add1~21\))
-- \Add1~23\ = CARRY((A7(11)) # (!\Add1~21\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => A7(11),
	datad => VCC,
	cin => \Add1~21\,
	combout => \Add1~22_combout\,
	cout => \Add1~23\);

-- Location: LCCOMB_X26_Y18_N22
\Add5~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add5~22_combout\ = (A3(11) & ((\Add5~21\) # (GND))) # (!A3(11) & (!\Add5~21\))
-- \Add5~23\ = CARRY((A3(11)) # (!\Add5~21\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => A3(11),
	datad => VCC,
	cin => \Add5~21\,
	combout => \Add5~22_combout\,
	cout => \Add5~23\);

-- Location: LCCOMB_X21_Y18_N20
\Add4~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add4~18_combout\ = (ra(9) & ((\Add4~17\) # (GND))) # (!ra(9) & (!\Add4~17\))
-- \Add4~19\ = CARRY((ra(9)) # (!\Add4~17\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => ra(9),
	datad => VCC,
	cin => \Add4~17\,
	combout => \Add4~18_combout\,
	cout => \Add4~19\);

-- Location: LCCOMB_X25_Y16_N10
\p~97\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~97_combout\ = (\Add0~4_combout\ & (\Add0~1_combout\)) # (!\Add0~4_combout\ & ((\Add0~1_combout\ & ((\Add4~18_combout\))) # (!\Add0~1_combout\ & (ra(8)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~4_combout\,
	datab => \Add0~1_combout\,
	datac => ra(8),
	datad => \Add4~18_combout\,
	combout => \p~97_combout\);

-- Location: LCCOMB_X25_Y16_N16
\p~98\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~98_combout\ = (\Add0~4_combout\ & ((\p~97_combout\ & ((\Add5~22_combout\))) # (!\p~97_combout\ & (\Add1~22_combout\)))) # (!\Add0~4_combout\ & (((\p~97_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~4_combout\,
	datab => \Add1~22_combout\,
	datac => \Add5~22_combout\,
	datad => \p~97_combout\,
	combout => \p~98_combout\);

-- Location: LCCOMB_X25_Y16_N18
\p~103\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~103_combout\ = (\p~13_combout\ & (((\p~11_combout\)))) # (!\p~13_combout\ & ((\p~11_combout\ & ((\p~98_combout\))) # (!\p~11_combout\ & (\p~102_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \p~13_combout\,
	datab => \p~102_combout\,
	datac => \p~11_combout\,
	datad => \p~98_combout\,
	combout => \p~103_combout\);

-- Location: LCCOMB_X25_Y16_N8
\p~106\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~106_combout\ = (\p~13_combout\ & ((\p~103_combout\ & (\p~105_combout\)) # (!\p~103_combout\ & ((p(11)))))) # (!\p~13_combout\ & (((\p~103_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \p~13_combout\,
	datab => \p~105_combout\,
	datac => p(11),
	datad => \p~103_combout\,
	combout => \p~106_combout\);

-- Location: LCCOMB_X23_Y16_N22
\acc[11]~56\ : cycloneive_lcell_comb
-- Equation(s):
-- \acc[11]~56_combout\ = (acc(11) & ((\p~106_combout\ & (\acc[10]~55\ & VCC)) # (!\p~106_combout\ & (!\acc[10]~55\)))) # (!acc(11) & ((\p~106_combout\ & (!\acc[10]~55\)) # (!\p~106_combout\ & ((\acc[10]~55\) # (GND)))))
-- \acc[11]~57\ = CARRY((acc(11) & (!\p~106_combout\ & !\acc[10]~55\)) # (!acc(11) & ((!\acc[10]~55\) # (!\p~106_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => acc(11),
	datab => \p~106_combout\,
	datad => VCC,
	cin => \acc[10]~55\,
	combout => \acc[11]~56_combout\,
	cout => \acc[11]~57\);

-- Location: FF_X23_Y16_N23
\acc[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \acc[11]~56_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	sclr => \ld_clr~0_combout\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => acc(11));

-- Location: FF_X22_Y18_N13
\p[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \p~116_combout\,
	ena => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => p(12));

-- Location: IOIBUF_X13_Y24_N15
\a[12]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(12),
	o => \a[12]~input_o\);

-- Location: LCCOMB_X19_Y17_N4
\A5[12]~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \A5[12]~38_combout\ = ((\a[12]~input_o\ $ (\a[10]~input_o\ $ (!\A5[11]~37\)))) # (GND)
-- \A5[12]~39\ = CARRY((\a[12]~input_o\ & ((\a[10]~input_o\) # (!\A5[11]~37\))) # (!\a[12]~input_o\ & (\a[10]~input_o\ & !\A5[11]~37\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \a[12]~input_o\,
	datab => \a[10]~input_o\,
	datad => VCC,
	cin => \A5[11]~37\,
	combout => \A5[12]~38_combout\,
	cout => \A5[12]~39\);

-- Location: FF_X19_Y17_N5
\A5[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \A5[12]~38_combout\,
	asdata => A5(8),
	clrn => \rst~inputclkctrl_outclk\,
	sload => \ALT_INV_ld_clr~0_combout\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => A5(12));

-- Location: LCCOMB_X21_Y14_N2
\ra~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \ra~12_combout\ = (\rcarry~0_combout\ & ((\a[12]~input_o\))) # (!\rcarry~0_combout\ & (ra(8)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => ra(8),
	datac => \a[12]~input_o\,
	datad => \rcarry~0_combout\,
	combout => \ra~12_combout\);

-- Location: FF_X22_Y18_N7
\ra[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \ra~12_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ra(12));

-- Location: LCCOMB_X24_Y20_N4
\Add10~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add10~24_combout\ = ((\a[12]~input_o\ $ (\a[9]~input_o\ $ (\Add10~23\)))) # (GND)
-- \Add10~25\ = CARRY((\a[12]~input_o\ & (\a[9]~input_o\ & !\Add10~23\)) # (!\a[12]~input_o\ & ((\a[9]~input_o\) # (!\Add10~23\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \a[12]~input_o\,
	datab => \a[9]~input_o\,
	datad => VCC,
	cin => \Add10~23\,
	combout => \Add10~24_combout\,
	cout => \Add10~25\);

-- Location: LCCOMB_X24_Y20_N28
\A7~73\ : cycloneive_lcell_comb
-- Equation(s):
-- \A7~73_combout\ = (\cs~q\ & (((A7(8))))) # (!\cs~q\ & ((\start~input_o\ & (\Add10~24_combout\)) # (!\start~input_o\ & ((A7(8))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111101000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \cs~q\,
	datab => \Add10~24_combout\,
	datac => \start~input_o\,
	datad => A7(8),
	combout => \A7~73_combout\);

-- Location: FF_X24_Y20_N29
\A7[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \A7~73_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => A7(12));

-- Location: LCCOMB_X25_Y17_N6
\A3[12]~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \A3[12]~40_combout\ = (\a[12]~input_o\ & ((\a[11]~input_o\ & (\A3[11]~39\ & VCC)) # (!\a[11]~input_o\ & (!\A3[11]~39\)))) # (!\a[12]~input_o\ & ((\a[11]~input_o\ & (!\A3[11]~39\)) # (!\a[11]~input_o\ & ((\A3[11]~39\) # (GND)))))
-- \A3[12]~41\ = CARRY((\a[12]~input_o\ & (!\a[11]~input_o\ & !\A3[11]~39\)) # (!\a[12]~input_o\ & ((!\A3[11]~39\) # (!\a[11]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \a[12]~input_o\,
	datab => \a[11]~input_o\,
	datad => VCC,
	cin => \A3[11]~39\,
	combout => \A3[12]~40_combout\,
	cout => \A3[12]~41\);

-- Location: FF_X25_Y17_N7
\A3[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \A3[12]~40_combout\,
	asdata => A3(8),
	clrn => \rst~inputclkctrl_outclk\,
	sload => \ALT_INV_ld_clr~0_combout\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => A3(12));

-- Location: LCCOMB_X24_Y18_N28
\p~109\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~109_combout\ = (\Add0~1_combout\ & (((A3(11)) # (\Add0~4_combout\)))) # (!\Add0~1_combout\ & (ra(11) & ((!\Add0~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => ra(11),
	datab => A3(11),
	datac => \Add0~1_combout\,
	datad => \Add0~4_combout\,
	combout => \p~109_combout\);

-- Location: LCCOMB_X24_Y18_N2
\p~110\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~110_combout\ = (\Add0~4_combout\ & ((\p~109_combout\ & (A7(12))) # (!\p~109_combout\ & ((A3(12)))))) # (!\Add0~4_combout\ & (((\p~109_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => A7(12),
	datab => \Add0~4_combout\,
	datac => A3(12),
	datad => \p~109_combout\,
	combout => \p~110_combout\);

-- Location: LCCOMB_X24_Y18_N8
\p~111\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~111_combout\ = (\p~19_combout\ & ((\p~20_combout\ & ((\p~110_combout\))) # (!\p~20_combout\ & (ra(10))))) # (!\p~19_combout\ & (((\p~20_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100000111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => ra(10),
	datab => \p~19_combout\,
	datac => \p~20_combout\,
	datad => \p~110_combout\,
	combout => \p~111_combout\);

-- Location: LCCOMB_X22_Y18_N6
\p~112\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~112_combout\ = (\p~16_combout\ & ((\p~111_combout\ & (A5(12))) # (!\p~111_combout\ & ((ra(12)))))) # (!\p~16_combout\ & (((\p~111_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => A5(12),
	datab => \p~16_combout\,
	datac => ra(12),
	datad => \p~111_combout\,
	combout => \p~112_combout\);

-- Location: LCCOMB_X22_Y18_N4
\p~113\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~113_combout\ = (\p~11_combout\ & (((\p~13_combout\)))) # (!\p~11_combout\ & ((\p~13_combout\ & (p(12))) # (!\p~13_combout\ & ((\p~112_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => p(12),
	datab => \p~11_combout\,
	datac => \p~13_combout\,
	datad => \p~112_combout\,
	combout => \p~113_combout\);

-- Location: LCCOMB_X21_Y18_N22
\Add4~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add4~20_combout\ = (ra(10) & (!\Add4~19\ & VCC)) # (!ra(10) & (\Add4~19\ $ (GND)))
-- \Add4~21\ = CARRY((!ra(10) & !\Add4~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => ra(10),
	datad => VCC,
	cin => \Add4~19\,
	combout => \Add4~20_combout\,
	cout => \Add4~21\);

-- Location: LCCOMB_X23_Y20_N24
\Add1~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~24_combout\ = (A7(12) & (!\Add1~23\ & VCC)) # (!A7(12) & (\Add1~23\ $ (GND)))
-- \Add1~25\ = CARRY((!A7(12) & !\Add1~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => A7(12),
	datad => VCC,
	cin => \Add1~23\,
	combout => \Add1~24_combout\,
	cout => \Add1~25\);

-- Location: LCCOMB_X22_Y18_N8
\p~107\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~107_combout\ = (\Add0~4_combout\ & ((\Add1~24_combout\) # ((\Add0~1_combout\)))) # (!\Add0~4_combout\ & (((ra(9) & !\Add0~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~4_combout\,
	datab => \Add1~24_combout\,
	datac => ra(9),
	datad => \Add0~1_combout\,
	combout => \p~107_combout\);

-- Location: LCCOMB_X26_Y18_N24
\Add5~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add5~24_combout\ = (A3(12) & (!\Add5~23\ & VCC)) # (!A3(12) & (\Add5~23\ $ (GND)))
-- \Add5~25\ = CARRY((!A3(12) & !\Add5~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => A3(12),
	datad => VCC,
	cin => \Add5~23\,
	combout => \Add5~24_combout\,
	cout => \Add5~25\);

-- Location: LCCOMB_X22_Y18_N30
\p~108\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~108_combout\ = (\Add0~1_combout\ & ((\p~107_combout\ & ((\Add5~24_combout\))) # (!\p~107_combout\ & (\Add4~20_combout\)))) # (!\Add0~1_combout\ & (((\p~107_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100000111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add4~20_combout\,
	datab => \Add0~1_combout\,
	datac => \p~107_combout\,
	datad => \Add5~24_combout\,
	combout => \p~108_combout\);

-- Location: LCCOMB_X23_Y14_N24
\Add7~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add7~24_combout\ = (ra(12) & (!\Add7~23\ & VCC)) # (!ra(12) & (\Add7~23\ $ (GND)))
-- \Add7~25\ = CARRY((!ra(12) & !\Add7~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => ra(12),
	datad => VCC,
	cin => \Add7~23\,
	combout => \Add7~24_combout\,
	cout => \Add7~25\);

-- Location: LCCOMB_X18_Y18_N24
\Add3~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~24_combout\ = (A5(12) & (!\Add3~23\ & VCC)) # (!A5(12) & (\Add3~23\ $ (GND)))
-- \Add3~25\ = CARRY((!A5(12) & !\Add3~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => A5(12),
	datad => VCC,
	cin => \Add3~23\,
	combout => \Add3~24_combout\,
	cout => \Add3~25\);

-- Location: LCCOMB_X26_Y16_N24
\Add2~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~22_combout\ = (A3(11) & ((\Add2~21\) # (GND))) # (!A3(11) & (!\Add2~21\))
-- \Add2~23\ = CARRY((A3(11)) # (!\Add2~21\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => A3(11),
	datad => VCC,
	cin => \Add2~21\,
	combout => \Add2~22_combout\,
	cout => \Add2~23\);

-- Location: LCCOMB_X21_Y16_N24
\Add6~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add6~22_combout\ = (ra(11) & ((\Add6~21\) # (GND))) # (!ra(11) & (!\Add6~21\))
-- \Add6~23\ = CARRY((ra(11)) # (!\Add6~21\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => ra(11),
	datad => VCC,
	cin => \Add6~21\,
	combout => \Add6~22_combout\,
	cout => \Add6~23\);

-- Location: LCCOMB_X22_Y18_N18
\p~114\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~114_combout\ = (\Add0~4_combout\ & (\Add0~1_combout\)) # (!\Add0~4_combout\ & ((\Add0~1_combout\ & ((\Add6~22_combout\))) # (!\Add0~1_combout\ & (\Add2~22_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~4_combout\,
	datab => \Add0~1_combout\,
	datac => \Add2~22_combout\,
	datad => \Add6~22_combout\,
	combout => \p~114_combout\);

-- Location: LCCOMB_X22_Y18_N0
\p~115\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~115_combout\ = (\Add0~4_combout\ & ((\p~114_combout\ & (\Add7~24_combout\)) # (!\p~114_combout\ & ((\Add3~24_combout\))))) # (!\Add0~4_combout\ & (((\p~114_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~4_combout\,
	datab => \Add7~24_combout\,
	datac => \Add3~24_combout\,
	datad => \p~114_combout\,
	combout => \p~115_combout\);

-- Location: LCCOMB_X22_Y18_N12
\p~116\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~116_combout\ = (\p~11_combout\ & ((\p~113_combout\ & ((\p~115_combout\))) # (!\p~113_combout\ & (\p~108_combout\)))) # (!\p~11_combout\ & (\p~113_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110001100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \p~11_combout\,
	datab => \p~113_combout\,
	datac => \p~108_combout\,
	datad => \p~115_combout\,
	combout => \p~116_combout\);

-- Location: LCCOMB_X23_Y16_N24
\acc[12]~58\ : cycloneive_lcell_comb
-- Equation(s):
-- \acc[12]~58_combout\ = ((\p~116_combout\ $ (acc(12) $ (!\acc[11]~57\)))) # (GND)
-- \acc[12]~59\ = CARRY((\p~116_combout\ & ((acc(12)) # (!\acc[11]~57\))) # (!\p~116_combout\ & (acc(12) & !\acc[11]~57\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \p~116_combout\,
	datab => acc(12),
	datad => VCC,
	cin => \acc[11]~57\,
	combout => \acc[12]~58_combout\,
	cout => \acc[12]~59\);

-- Location: FF_X23_Y16_N25
\acc[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \acc[12]~58_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	sclr => \ld_clr~0_combout\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => acc(12));

-- Location: IOIBUF_X16_Y24_N1
\a[13]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(13),
	o => \a[13]~input_o\);

-- Location: LCCOMB_X25_Y18_N4
\ra~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \ra~13_combout\ = (\rcarry~0_combout\ & (\a[13]~input_o\)) # (!\rcarry~0_combout\ & ((ra(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rcarry~0_combout\,
	datac => \a[13]~input_o\,
	datad => ra(9),
	combout => \ra~13_combout\);

-- Location: FF_X25_Y18_N5
\ra[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \ra~13_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ra(13));

-- Location: LCCOMB_X23_Y14_N26
\Add7~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add7~26_combout\ = (ra(13) & ((\Add7~25\) # (GND))) # (!ra(13) & (!\Add7~25\))
-- \Add7~27\ = CARRY((ra(13)) # (!\Add7~25\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => ra(13),
	datad => VCC,
	cin => \Add7~25\,
	combout => \Add7~26_combout\,
	cout => \Add7~27\);

-- Location: LCCOMB_X21_Y16_N26
\Add6~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add6~24_combout\ = (ra(12) & (!\Add6~23\ & VCC)) # (!ra(12) & (\Add6~23\ $ (GND)))
-- \Add6~25\ = CARRY((!ra(12) & !\Add6~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => ra(12),
	datad => VCC,
	cin => \Add6~23\,
	combout => \Add6~24_combout\,
	cout => \Add6~25\);

-- Location: LCCOMB_X26_Y16_N26
\Add2~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~24_combout\ = (A3(12) & (!\Add2~23\ & VCC)) # (!A3(12) & (\Add2~23\ $ (GND)))
-- \Add2~25\ = CARRY((!A3(12) & !\Add2~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => A3(12),
	datad => VCC,
	cin => \Add2~23\,
	combout => \Add2~24_combout\,
	cout => \Add2~25\);

-- Location: LCCOMB_X19_Y17_N6
\A5[13]~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \A5[13]~40_combout\ = (\a[11]~input_o\ & ((\a[13]~input_o\ & (\A5[12]~39\ & VCC)) # (!\a[13]~input_o\ & (!\A5[12]~39\)))) # (!\a[11]~input_o\ & ((\a[13]~input_o\ & (!\A5[12]~39\)) # (!\a[13]~input_o\ & ((\A5[12]~39\) # (GND)))))
-- \A5[13]~41\ = CARRY((\a[11]~input_o\ & (!\a[13]~input_o\ & !\A5[12]~39\)) # (!\a[11]~input_o\ & ((!\A5[12]~39\) # (!\a[13]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \a[11]~input_o\,
	datab => \a[13]~input_o\,
	datad => VCC,
	cin => \A5[12]~39\,
	combout => \A5[13]~40_combout\,
	cout => \A5[13]~41\);

-- Location: FF_X19_Y17_N7
\A5[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \A5[13]~40_combout\,
	asdata => A5(9),
	clrn => \rst~inputclkctrl_outclk\,
	sload => \ALT_INV_ld_clr~0_combout\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => A5(13));

-- Location: LCCOMB_X18_Y18_N26
\Add3~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~26_combout\ = (A5(13) & ((\Add3~25\) # (GND))) # (!A5(13) & (!\Add3~25\))
-- \Add3~27\ = CARRY((A5(13)) # (!\Add3~25\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => A5(13),
	datad => VCC,
	cin => \Add3~25\,
	combout => \Add3~26_combout\,
	cout => \Add3~27\);

-- Location: LCCOMB_X25_Y16_N20
\p~124\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~124_combout\ = (\Add0~1_combout\ & (((\Add0~4_combout\)))) # (!\Add0~1_combout\ & ((\Add0~4_combout\ & ((\Add3~26_combout\))) # (!\Add0~4_combout\ & (\Add2~24_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add2~24_combout\,
	datab => \Add0~1_combout\,
	datac => \Add0~4_combout\,
	datad => \Add3~26_combout\,
	combout => \p~124_combout\);

-- Location: LCCOMB_X25_Y16_N14
\p~125\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~125_combout\ = (\Add0~1_combout\ & ((\p~124_combout\ & (\Add7~26_combout\)) # (!\p~124_combout\ & ((\Add6~24_combout\))))) # (!\Add0~1_combout\ & (((\p~124_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add7~26_combout\,
	datab => \Add6~24_combout\,
	datac => \Add0~1_combout\,
	datad => \p~124_combout\,
	combout => \p~125_combout\);

-- Location: FF_X25_Y16_N29
\p[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \p~126_combout\,
	ena => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => p(13));

-- Location: LCCOMB_X24_Y20_N6
\Add10~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add10~26_combout\ = (\a[10]~input_o\ & ((\a[13]~input_o\ & (!\Add10~25\)) # (!\a[13]~input_o\ & (\Add10~25\ & VCC)))) # (!\a[10]~input_o\ & ((\a[13]~input_o\ & ((\Add10~25\) # (GND))) # (!\a[13]~input_o\ & (!\Add10~25\))))
-- \Add10~27\ = CARRY((\a[10]~input_o\ & (\a[13]~input_o\ & !\Add10~25\)) # (!\a[10]~input_o\ & ((\a[13]~input_o\) # (!\Add10~25\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \a[10]~input_o\,
	datab => \a[13]~input_o\,
	datad => VCC,
	cin => \Add10~25\,
	combout => \Add10~26_combout\,
	cout => \Add10~27\);

-- Location: LCCOMB_X24_Y17_N14
\A7~74\ : cycloneive_lcell_comb
-- Equation(s):
-- \A7~74_combout\ = (\cs~q\ & (A7(9))) # (!\cs~q\ & ((\start~input_o\ & ((\Add10~26_combout\))) # (!\start~input_o\ & (A7(9)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => A7(9),
	datab => \cs~q\,
	datac => \Add10~26_combout\,
	datad => \start~input_o\,
	combout => \A7~74_combout\);

-- Location: FF_X23_Y20_N19
\A7[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \A7~74_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => A7(13));

-- Location: LCCOMB_X25_Y17_N8
\A3[13]~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \A3[13]~42_combout\ = ((\a[12]~input_o\ $ (\a[13]~input_o\ $ (!\A3[12]~41\)))) # (GND)
-- \A3[13]~43\ = CARRY((\a[12]~input_o\ & ((\a[13]~input_o\) # (!\A3[12]~41\))) # (!\a[12]~input_o\ & (\a[13]~input_o\ & !\A3[12]~41\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \a[12]~input_o\,
	datab => \a[13]~input_o\,
	datad => VCC,
	cin => \A3[12]~41\,
	combout => \A3[13]~42_combout\,
	cout => \A3[13]~43\);

-- Location: FF_X25_Y17_N9
\A3[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \A3[13]~42_combout\,
	asdata => A3(9),
	clrn => \rst~inputclkctrl_outclk\,
	sload => \ALT_INV_ld_clr~0_combout\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => A3(13));

-- Location: LCCOMB_X22_Y18_N10
\p~119\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~119_combout\ = (\Add0~4_combout\ & (((A3(13)) # (\Add0~1_combout\)))) # (!\Add0~4_combout\ & (ra(12) & ((!\Add0~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~4_combout\,
	datab => ra(12),
	datac => A3(13),
	datad => \Add0~1_combout\,
	combout => \p~119_combout\);

-- Location: LCCOMB_X22_Y18_N20
\p~120\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~120_combout\ = (\Add0~1_combout\ & ((\p~119_combout\ & ((A7(13)))) # (!\p~119_combout\ & (A3(12))))) # (!\Add0~1_combout\ & (((\p~119_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => A3(12),
	datab => \Add0~1_combout\,
	datac => A7(13),
	datad => \p~119_combout\,
	combout => \p~120_combout\);

-- Location: LCCOMB_X25_Y16_N30
\p~121\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~121_combout\ = (\p~20_combout\ & (((\p~120_combout\) # (!\p~19_combout\)))) # (!\p~20_combout\ & (ra(11) & (\p~19_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \p~20_combout\,
	datab => ra(11),
	datac => \p~19_combout\,
	datad => \p~120_combout\,
	combout => \p~121_combout\);

-- Location: LCCOMB_X25_Y16_N4
\p~122\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~122_combout\ = (\p~16_combout\ & ((\p~121_combout\ & ((A5(13)))) # (!\p~121_combout\ & (ra(13))))) # (!\p~16_combout\ & (((\p~121_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100001011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \p~16_combout\,
	datab => ra(13),
	datac => \p~121_combout\,
	datad => A5(13),
	combout => \p~122_combout\);

-- Location: LCCOMB_X23_Y20_N26
\Add1~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~26_combout\ = (A7(13) & ((\Add1~25\) # (GND))) # (!A7(13) & (!\Add1~25\))
-- \Add1~27\ = CARRY((A7(13)) # (!\Add1~25\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => A7(13),
	datad => VCC,
	cin => \Add1~25\,
	combout => \Add1~26_combout\,
	cout => \Add1~27\);

-- Location: LCCOMB_X26_Y18_N26
\Add5~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add5~26_combout\ = (A3(13) & ((\Add5~25\) # (GND))) # (!A3(13) & (!\Add5~25\))
-- \Add5~27\ = CARRY((A3(13)) # (!\Add5~25\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => A3(13),
	datad => VCC,
	cin => \Add5~25\,
	combout => \Add5~26_combout\,
	cout => \Add5~27\);

-- Location: LCCOMB_X21_Y18_N24
\Add4~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add4~22_combout\ = (ra(11) & ((\Add4~21\) # (GND))) # (!ra(11) & (!\Add4~21\))
-- \Add4~23\ = CARRY((ra(11)) # (!\Add4~21\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => ra(11),
	datad => VCC,
	cin => \Add4~21\,
	combout => \Add4~22_combout\,
	cout => \Add4~23\);

-- Location: LCCOMB_X25_Y16_N6
\p~117\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~117_combout\ = (\Add0~1_combout\ & (((\Add0~4_combout\) # (\Add4~22_combout\)))) # (!\Add0~1_combout\ & (ra(10) & (!\Add0~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => ra(10),
	datab => \Add0~1_combout\,
	datac => \Add0~4_combout\,
	datad => \Add4~22_combout\,
	combout => \p~117_combout\);

-- Location: LCCOMB_X25_Y16_N24
\p~118\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~118_combout\ = (\Add0~4_combout\ & ((\p~117_combout\ & ((\Add5~26_combout\))) # (!\p~117_combout\ & (\Add1~26_combout\)))) # (!\Add0~4_combout\ & (((\p~117_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~4_combout\,
	datab => \Add1~26_combout\,
	datac => \Add5~26_combout\,
	datad => \p~117_combout\,
	combout => \p~118_combout\);

-- Location: LCCOMB_X25_Y16_N2
\p~123\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~123_combout\ = (\p~13_combout\ & (\p~11_combout\)) # (!\p~13_combout\ & ((\p~11_combout\ & ((\p~118_combout\))) # (!\p~11_combout\ & (\p~122_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \p~13_combout\,
	datab => \p~11_combout\,
	datac => \p~122_combout\,
	datad => \p~118_combout\,
	combout => \p~123_combout\);

-- Location: LCCOMB_X25_Y16_N28
\p~126\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~126_combout\ = (\p~13_combout\ & ((\p~123_combout\ & (\p~125_combout\)) # (!\p~123_combout\ & ((p(13)))))) # (!\p~13_combout\ & (((\p~123_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \p~13_combout\,
	datab => \p~125_combout\,
	datac => p(13),
	datad => \p~123_combout\,
	combout => \p~126_combout\);

-- Location: LCCOMB_X23_Y16_N26
\acc[13]~60\ : cycloneive_lcell_comb
-- Equation(s):
-- \acc[13]~60_combout\ = (\p~126_combout\ & ((acc(13) & (\acc[12]~59\ & VCC)) # (!acc(13) & (!\acc[12]~59\)))) # (!\p~126_combout\ & ((acc(13) & (!\acc[12]~59\)) # (!acc(13) & ((\acc[12]~59\) # (GND)))))
-- \acc[13]~61\ = CARRY((\p~126_combout\ & (!acc(13) & !\acc[12]~59\)) # (!\p~126_combout\ & ((!\acc[12]~59\) # (!acc(13)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \p~126_combout\,
	datab => acc(13),
	datad => VCC,
	cin => \acc[12]~59\,
	combout => \acc[13]~60_combout\,
	cout => \acc[13]~61\);

-- Location: FF_X23_Y16_N27
\acc[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \acc[13]~60_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	sclr => \ld_clr~0_combout\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => acc(13));

-- Location: IOIBUF_X34_Y17_N15
\a[14]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(14),
	o => \a[14]~input_o\);

-- Location: LCCOMB_X25_Y17_N10
\A3[14]~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \A3[14]~44_combout\ = (\a[14]~input_o\ & ((\a[13]~input_o\ & (\A3[13]~43\ & VCC)) # (!\a[13]~input_o\ & (!\A3[13]~43\)))) # (!\a[14]~input_o\ & ((\a[13]~input_o\ & (!\A3[13]~43\)) # (!\a[13]~input_o\ & ((\A3[13]~43\) # (GND)))))
-- \A3[14]~45\ = CARRY((\a[14]~input_o\ & (!\a[13]~input_o\ & !\A3[13]~43\)) # (!\a[14]~input_o\ & ((!\A3[13]~43\) # (!\a[13]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \a[14]~input_o\,
	datab => \a[13]~input_o\,
	datad => VCC,
	cin => \A3[13]~43\,
	combout => \A3[14]~44_combout\,
	cout => \A3[14]~45\);

-- Location: FF_X25_Y17_N11
\A3[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \A3[14]~44_combout\,
	asdata => A3(10),
	clrn => \rst~inputclkctrl_outclk\,
	sload => \ALT_INV_ld_clr~0_combout\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => A3(14));

-- Location: LCCOMB_X26_Y18_N28
\Add5~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add5~28_combout\ = (A3(14) & (!\Add5~27\ & VCC)) # (!A3(14) & (\Add5~27\ $ (GND)))
-- \Add5~29\ = CARRY((!A3(14) & !\Add5~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => A3(14),
	datad => VCC,
	cin => \Add5~27\,
	combout => \Add5~28_combout\,
	cout => \Add5~29\);

-- Location: LCCOMB_X21_Y18_N26
\Add4~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add4~24_combout\ = (ra(12) & (!\Add4~23\ & VCC)) # (!ra(12) & (\Add4~23\ $ (GND)))
-- \Add4~25\ = CARRY((!ra(12) & !\Add4~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => ra(12),
	datad => VCC,
	cin => \Add4~23\,
	combout => \Add4~24_combout\,
	cout => \Add4~25\);

-- Location: LCCOMB_X24_Y20_N8
\Add10~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add10~28_combout\ = ((\a[14]~input_o\ $ (\a[11]~input_o\ $ (\Add10~27\)))) # (GND)
-- \Add10~29\ = CARRY((\a[14]~input_o\ & (\a[11]~input_o\ & !\Add10~27\)) # (!\a[14]~input_o\ & ((\a[11]~input_o\) # (!\Add10~27\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \a[14]~input_o\,
	datab => \a[11]~input_o\,
	datad => VCC,
	cin => \Add10~27\,
	combout => \Add10~28_combout\,
	cout => \Add10~29\);

-- Location: LCCOMB_X22_Y20_N26
\A7~75\ : cycloneive_lcell_comb
-- Equation(s):
-- \A7~75_combout\ = (\start~input_o\ & ((\cs~q\ & ((A7(10)))) # (!\cs~q\ & (\Add10~28_combout\)))) # (!\start~input_o\ & (((A7(10)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101100001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add10~28_combout\,
	datab => \start~input_o\,
	datac => \cs~q\,
	datad => A7(10),
	combout => \A7~75_combout\);

-- Location: FF_X23_Y20_N31
\A7[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \A7~75_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => A7(14));

-- Location: LCCOMB_X23_Y20_N28
\Add1~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~28_combout\ = (A7(14) & (!\Add1~27\ & VCC)) # (!A7(14) & (\Add1~27\ $ (GND)))
-- \Add1~29\ = CARRY((!A7(14) & !\Add1~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => A7(14),
	datad => VCC,
	cin => \Add1~27\,
	combout => \Add1~28_combout\,
	cout => \Add1~29\);

-- Location: LCCOMB_X22_Y14_N12
\p~127\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~127_combout\ = (\Add0~4_combout\ & ((\Add0~1_combout\) # ((\Add1~28_combout\)))) # (!\Add0~4_combout\ & (!\Add0~1_combout\ & (ra(11))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~4_combout\,
	datab => \Add0~1_combout\,
	datac => ra(11),
	datad => \Add1~28_combout\,
	combout => \p~127_combout\);

-- Location: LCCOMB_X22_Y14_N30
\p~128\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~128_combout\ = (\Add0~1_combout\ & ((\p~127_combout\ & (\Add5~28_combout\)) # (!\p~127_combout\ & ((\Add4~24_combout\))))) # (!\Add0~1_combout\ & (((\p~127_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add5~28_combout\,
	datab => \Add0~1_combout\,
	datac => \Add4~24_combout\,
	datad => \p~127_combout\,
	combout => \p~128_combout\);

-- Location: LCCOMB_X22_Y17_N30
\ra~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \ra~14_combout\ = (\rcarry~0_combout\ & ((\a[14]~input_o\))) # (!\rcarry~0_combout\ & (ra(10)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => ra(10),
	datac => \a[14]~input_o\,
	datad => \rcarry~0_combout\,
	combout => \ra~14_combout\);

-- Location: FF_X22_Y17_N31
\ra[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \ra~14_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ra(14));

-- Location: LCCOMB_X23_Y14_N28
\Add7~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add7~28_combout\ = (ra(14) & (!\Add7~27\ & VCC)) # (!ra(14) & (\Add7~27\ $ (GND)))
-- \Add7~29\ = CARRY((!ra(14) & !\Add7~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => ra(14),
	datad => VCC,
	cin => \Add7~27\,
	combout => \Add7~28_combout\,
	cout => \Add7~29\);

-- Location: LCCOMB_X26_Y16_N28
\Add2~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~26_combout\ = (A3(13) & ((\Add2~25\) # (GND))) # (!A3(13) & (!\Add2~25\))
-- \Add2~27\ = CARRY((A3(13)) # (!\Add2~25\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => A3(13),
	datad => VCC,
	cin => \Add2~25\,
	combout => \Add2~26_combout\,
	cout => \Add2~27\);

-- Location: LCCOMB_X21_Y16_N28
\Add6~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add6~26_combout\ = (ra(13) & ((\Add6~25\) # (GND))) # (!ra(13) & (!\Add6~25\))
-- \Add6~27\ = CARRY((ra(13)) # (!\Add6~25\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => ra(13),
	datad => VCC,
	cin => \Add6~25\,
	combout => \Add6~26_combout\,
	cout => \Add6~27\);

-- Location: LCCOMB_X22_Y14_N4
\p~134\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~134_combout\ = (\Add0~4_combout\ & (\Add0~1_combout\)) # (!\Add0~4_combout\ & ((\Add0~1_combout\ & ((\Add6~26_combout\))) # (!\Add0~1_combout\ & (\Add2~26_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~4_combout\,
	datab => \Add0~1_combout\,
	datac => \Add2~26_combout\,
	datad => \Add6~26_combout\,
	combout => \p~134_combout\);

-- Location: LCCOMB_X19_Y17_N8
\A5[14]~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \A5[14]~42_combout\ = ((\a[12]~input_o\ $ (\a[14]~input_o\ $ (!\A5[13]~41\)))) # (GND)
-- \A5[14]~43\ = CARRY((\a[12]~input_o\ & ((\a[14]~input_o\) # (!\A5[13]~41\))) # (!\a[12]~input_o\ & (\a[14]~input_o\ & !\A5[13]~41\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \a[12]~input_o\,
	datab => \a[14]~input_o\,
	datad => VCC,
	cin => \A5[13]~41\,
	combout => \A5[14]~42_combout\,
	cout => \A5[14]~43\);

-- Location: FF_X19_Y17_N9
\A5[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \A5[14]~42_combout\,
	asdata => A5(10),
	clrn => \rst~inputclkctrl_outclk\,
	sload => \ALT_INV_ld_clr~0_combout\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => A5(14));

-- Location: LCCOMB_X18_Y18_N28
\Add3~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~28_combout\ = (A5(14) & (!\Add3~27\ & VCC)) # (!A5(14) & (\Add3~27\ $ (GND)))
-- \Add3~29\ = CARRY((!A5(14) & !\Add3~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => A5(14),
	datad => VCC,
	cin => \Add3~27\,
	combout => \Add3~28_combout\,
	cout => \Add3~29\);

-- Location: LCCOMB_X22_Y14_N14
\p~135\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~135_combout\ = (\Add0~4_combout\ & ((\p~134_combout\ & (\Add7~28_combout\)) # (!\p~134_combout\ & ((\Add3~28_combout\))))) # (!\Add0~4_combout\ & (((\p~134_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101101011010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~4_combout\,
	datab => \Add7~28_combout\,
	datac => \p~134_combout\,
	datad => \Add3~28_combout\,
	combout => \p~135_combout\);

-- Location: FF_X22_Y14_N17
\p[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \p~136_combout\,
	ena => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => p(14));

-- Location: LCCOMB_X25_Y17_N18
\p~129\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~129_combout\ = (\Add0~4_combout\ & (((\Add0~1_combout\)))) # (!\Add0~4_combout\ & ((\Add0~1_combout\ & ((A3(13)))) # (!\Add0~1_combout\ & (ra(13)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => ra(13),
	datab => A3(13),
	datac => \Add0~4_combout\,
	datad => \Add0~1_combout\,
	combout => \p~129_combout\);

-- Location: LCCOMB_X25_Y17_N20
\p~130\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~130_combout\ = (\Add0~4_combout\ & ((\p~129_combout\ & ((A7(14)))) # (!\p~129_combout\ & (A3(14))))) # (!\Add0~4_combout\ & (((\p~129_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => A3(14),
	datab => A7(14),
	datac => \Add0~4_combout\,
	datad => \p~129_combout\,
	combout => \p~130_combout\);

-- Location: LCCOMB_X22_Y14_N6
\p~131\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~131_combout\ = (\p~20_combout\ & (((\p~130_combout\) # (!\p~19_combout\)))) # (!\p~20_combout\ & (ra(12) & (\p~19_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110000101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => ra(12),
	datab => \p~20_combout\,
	datac => \p~19_combout\,
	datad => \p~130_combout\,
	combout => \p~131_combout\);

-- Location: LCCOMB_X22_Y14_N24
\p~132\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~132_combout\ = (\p~16_combout\ & ((\p~131_combout\ & (A5(14))) # (!\p~131_combout\ & ((ra(14)))))) # (!\p~16_combout\ & (((\p~131_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => A5(14),
	datab => ra(14),
	datac => \p~16_combout\,
	datad => \p~131_combout\,
	combout => \p~132_combout\);

-- Location: LCCOMB_X22_Y14_N10
\p~133\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~133_combout\ = (\p~11_combout\ & (((\p~13_combout\)))) # (!\p~11_combout\ & ((\p~13_combout\ & (p(14))) # (!\p~13_combout\ & ((\p~132_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \p~11_combout\,
	datab => p(14),
	datac => \p~13_combout\,
	datad => \p~132_combout\,
	combout => \p~133_combout\);

-- Location: LCCOMB_X22_Y14_N16
\p~136\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~136_combout\ = (\p~11_combout\ & ((\p~133_combout\ & ((\p~135_combout\))) # (!\p~133_combout\ & (\p~128_combout\)))) # (!\p~11_combout\ & (((\p~133_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \p~128_combout\,
	datab => \p~11_combout\,
	datac => \p~135_combout\,
	datad => \p~133_combout\,
	combout => \p~136_combout\);

-- Location: LCCOMB_X23_Y16_N28
\acc[14]~62\ : cycloneive_lcell_comb
-- Equation(s):
-- \acc[14]~62_combout\ = ((acc(14) $ (\p~136_combout\ $ (!\acc[13]~61\)))) # (GND)
-- \acc[14]~63\ = CARRY((acc(14) & ((\p~136_combout\) # (!\acc[13]~61\))) # (!acc(14) & (\p~136_combout\ & !\acc[13]~61\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => acc(14),
	datab => \p~136_combout\,
	datad => VCC,
	cin => \acc[13]~61\,
	combout => \acc[14]~62_combout\,
	cout => \acc[14]~63\);

-- Location: FF_X23_Y16_N29
\acc[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \acc[14]~62_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	sclr => \ld_clr~0_combout\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => acc(14));

-- Location: IOIBUF_X34_Y20_N15
\a[15]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(15),
	o => \a[15]~input_o\);

-- Location: LCCOMB_X24_Y20_N10
\Add10~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add10~30_combout\ = (\a[12]~input_o\ & ((\a[15]~input_o\ & (!\Add10~29\)) # (!\a[15]~input_o\ & (\Add10~29\ & VCC)))) # (!\a[12]~input_o\ & ((\a[15]~input_o\ & ((\Add10~29\) # (GND))) # (!\a[15]~input_o\ & (!\Add10~29\))))
-- \Add10~31\ = CARRY((\a[12]~input_o\ & (\a[15]~input_o\ & !\Add10~29\)) # (!\a[12]~input_o\ & ((\a[15]~input_o\) # (!\Add10~29\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \a[12]~input_o\,
	datab => \a[15]~input_o\,
	datad => VCC,
	cin => \Add10~29\,
	combout => \Add10~30_combout\,
	cout => \Add10~31\);

-- Location: LCCOMB_X22_Y20_N4
\A7~76\ : cycloneive_lcell_comb
-- Equation(s):
-- \A7~76_combout\ = (\cs~q\ & (A7(11))) # (!\cs~q\ & ((\start~input_o\ & ((\Add10~30_combout\))) # (!\start~input_o\ & (A7(11)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \cs~q\,
	datab => A7(11),
	datac => \Add10~30_combout\,
	datad => \start~input_o\,
	combout => \A7~76_combout\);

-- Location: FF_X23_Y20_N29
\A7[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \A7~76_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => A7(15));

-- Location: LCCOMB_X23_Y20_N30
\Add1~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~30_combout\ = (A7(15) & ((\Add1~29\) # (GND))) # (!A7(15) & (!\Add1~29\))
-- \Add1~31\ = CARRY((A7(15)) # (!\Add1~29\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => A7(15),
	datad => VCC,
	cin => \Add1~29\,
	combout => \Add1~30_combout\,
	cout => \Add1~31\);

-- Location: LCCOMB_X25_Y17_N12
\A3[15]~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \A3[15]~46_combout\ = ((\a[14]~input_o\ $ (\a[15]~input_o\ $ (!\A3[14]~45\)))) # (GND)
-- \A3[15]~47\ = CARRY((\a[14]~input_o\ & ((\a[15]~input_o\) # (!\A3[14]~45\))) # (!\a[14]~input_o\ & (\a[15]~input_o\ & !\A3[14]~45\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \a[14]~input_o\,
	datab => \a[15]~input_o\,
	datad => VCC,
	cin => \A3[14]~45\,
	combout => \A3[15]~46_combout\,
	cout => \A3[15]~47\);

-- Location: FF_X25_Y17_N13
\A3[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \A3[15]~46_combout\,
	asdata => A3(11),
	clrn => \rst~inputclkctrl_outclk\,
	sload => \ALT_INV_ld_clr~0_combout\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => A3(15));

-- Location: LCCOMB_X26_Y18_N30
\Add5~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add5~30_combout\ = (A3(15) & ((\Add5~29\) # (GND))) # (!A3(15) & (!\Add5~29\))
-- \Add5~31\ = CARRY((A3(15)) # (!\Add5~29\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => A3(15),
	datad => VCC,
	cin => \Add5~29\,
	combout => \Add5~30_combout\,
	cout => \Add5~31\);

-- Location: LCCOMB_X21_Y18_N28
\Add4~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add4~26_combout\ = (ra(13) & ((\Add4~25\) # (GND))) # (!ra(13) & (!\Add4~25\))
-- \Add4~27\ = CARRY((ra(13)) # (!\Add4~25\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => ra(13),
	datad => VCC,
	cin => \Add4~25\,
	combout => \Add4~26_combout\,
	cout => \Add4~27\);

-- Location: LCCOMB_X22_Y18_N24
\p~137\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~137_combout\ = (\Add0~4_combout\ & (\Add0~1_combout\)) # (!\Add0~4_combout\ & ((\Add0~1_combout\ & ((\Add4~26_combout\))) # (!\Add0~1_combout\ & (ra(12)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~4_combout\,
	datab => \Add0~1_combout\,
	datac => ra(12),
	datad => \Add4~26_combout\,
	combout => \p~137_combout\);

-- Location: LCCOMB_X22_Y18_N22
\p~138\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~138_combout\ = (\Add0~4_combout\ & ((\p~137_combout\ & ((\Add5~30_combout\))) # (!\p~137_combout\ & (\Add1~30_combout\)))) # (!\Add0~4_combout\ & (((\p~137_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~30_combout\,
	datab => \Add5~30_combout\,
	datac => \Add0~4_combout\,
	datad => \p~137_combout\,
	combout => \p~138_combout\);

-- Location: LCCOMB_X19_Y17_N10
\A5[15]~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \A5[15]~44_combout\ = (\a[15]~input_o\ & ((\a[13]~input_o\ & (\A5[14]~43\ & VCC)) # (!\a[13]~input_o\ & (!\A5[14]~43\)))) # (!\a[15]~input_o\ & ((\a[13]~input_o\ & (!\A5[14]~43\)) # (!\a[13]~input_o\ & ((\A5[14]~43\) # (GND)))))
-- \A5[15]~45\ = CARRY((\a[15]~input_o\ & (!\a[13]~input_o\ & !\A5[14]~43\)) # (!\a[15]~input_o\ & ((!\A5[14]~43\) # (!\a[13]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \a[15]~input_o\,
	datab => \a[13]~input_o\,
	datad => VCC,
	cin => \A5[14]~43\,
	combout => \A5[15]~44_combout\,
	cout => \A5[15]~45\);

-- Location: FF_X19_Y17_N11
\A5[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \A5[15]~44_combout\,
	asdata => A5(11),
	clrn => \rst~inputclkctrl_outclk\,
	sload => \ALT_INV_ld_clr~0_combout\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => A5(15));

-- Location: LCCOMB_X25_Y15_N8
\ra~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \ra~15_combout\ = (\rcarry~0_combout\ & (\a[15]~input_o\)) # (!\rcarry~0_combout\ & ((ra(11))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \rcarry~0_combout\,
	datac => \a[15]~input_o\,
	datad => ra(11),
	combout => \ra~15_combout\);

-- Location: FF_X25_Y15_N9
\ra[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \ra~15_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ra(15));

-- Location: LCCOMB_X25_Y17_N26
\p~139\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~139_combout\ = (\Add0~4_combout\ & ((A3(15)) # ((\Add0~1_combout\)))) # (!\Add0~4_combout\ & (((ra(14) & !\Add0~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => A3(15),
	datab => ra(14),
	datac => \Add0~4_combout\,
	datad => \Add0~1_combout\,
	combout => \p~139_combout\);

-- Location: LCCOMB_X25_Y17_N28
\p~140\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~140_combout\ = (\p~139_combout\ & (((A7(15)) # (!\Add0~1_combout\)))) # (!\p~139_combout\ & (A3(14) & ((\Add0~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => A3(14),
	datab => A7(15),
	datac => \p~139_combout\,
	datad => \Add0~1_combout\,
	combout => \p~140_combout\);

-- Location: LCCOMB_X25_Y17_N30
\p~141\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~141_combout\ = (\p~20_combout\ & (((\p~140_combout\) # (!\p~19_combout\)))) # (!\p~20_combout\ & (ra(13) & (\p~19_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110000101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => ra(13),
	datab => \p~20_combout\,
	datac => \p~19_combout\,
	datad => \p~140_combout\,
	combout => \p~141_combout\);

-- Location: LCCOMB_X22_Y18_N16
\p~142\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~142_combout\ = (\p~16_combout\ & ((\p~141_combout\ & (A5(15))) # (!\p~141_combout\ & ((ra(15)))))) # (!\p~16_combout\ & (((\p~141_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => A5(15),
	datab => \p~16_combout\,
	datac => ra(15),
	datad => \p~141_combout\,
	combout => \p~142_combout\);

-- Location: LCCOMB_X22_Y18_N26
\p~143\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~143_combout\ = (\p~11_combout\ & ((\p~13_combout\) # ((\p~138_combout\)))) # (!\p~11_combout\ & (!\p~13_combout\ & ((\p~142_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \p~11_combout\,
	datab => \p~13_combout\,
	datac => \p~138_combout\,
	datad => \p~142_combout\,
	combout => \p~143_combout\);

-- Location: FF_X22_Y18_N15
\p[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \p~146_combout\,
	ena => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => p(15));

-- Location: LCCOMB_X21_Y16_N30
\Add6~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add6~28_combout\ = (ra(14) & (!\Add6~27\ & VCC)) # (!ra(14) & (\Add6~27\ $ (GND)))
-- \Add6~29\ = CARRY((!ra(14) & !\Add6~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => ra(14),
	datad => VCC,
	cin => \Add6~27\,
	combout => \Add6~28_combout\,
	cout => \Add6~29\);

-- Location: LCCOMB_X23_Y14_N30
\Add7~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add7~30_combout\ = (ra(15) & ((\Add7~29\) # (GND))) # (!ra(15) & (!\Add7~29\))
-- \Add7~31\ = CARRY((ra(15)) # (!\Add7~29\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => ra(15),
	datad => VCC,
	cin => \Add7~29\,
	combout => \Add7~30_combout\,
	cout => \Add7~31\);

-- Location: LCCOMB_X18_Y18_N30
\Add3~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~30_combout\ = (A5(15) & ((\Add3~29\) # (GND))) # (!A5(15) & (!\Add3~29\))
-- \Add3~31\ = CARRY((A5(15)) # (!\Add3~29\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => A5(15),
	datad => VCC,
	cin => \Add3~29\,
	combout => \Add3~30_combout\,
	cout => \Add3~31\);

-- Location: LCCOMB_X26_Y16_N30
\Add2~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~28_combout\ = (A3(14) & (!\Add2~27\ & VCC)) # (!A3(14) & (\Add2~27\ $ (GND)))
-- \Add2~29\ = CARRY((!A3(14) & !\Add2~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => A3(14),
	datad => VCC,
	cin => \Add2~27\,
	combout => \Add2~28_combout\,
	cout => \Add2~29\);

-- Location: LCCOMB_X22_Y18_N28
\p~144\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~144_combout\ = (\Add0~4_combout\ & ((\Add0~1_combout\) # ((\Add3~30_combout\)))) # (!\Add0~4_combout\ & (!\Add0~1_combout\ & ((\Add2~28_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~4_combout\,
	datab => \Add0~1_combout\,
	datac => \Add3~30_combout\,
	datad => \Add2~28_combout\,
	combout => \p~144_combout\);

-- Location: LCCOMB_X22_Y18_N2
\p~145\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~145_combout\ = (\Add0~1_combout\ & ((\p~144_combout\ & ((\Add7~30_combout\))) # (!\p~144_combout\ & (\Add6~28_combout\)))) # (!\Add0~1_combout\ & (((\p~144_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add6~28_combout\,
	datab => \Add0~1_combout\,
	datac => \Add7~30_combout\,
	datad => \p~144_combout\,
	combout => \p~145_combout\);

-- Location: LCCOMB_X22_Y18_N14
\p~146\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~146_combout\ = (\p~143_combout\ & (((\p~145_combout\)) # (!\p~13_combout\))) # (!\p~143_combout\ & (\p~13_combout\ & (p(15))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \p~143_combout\,
	datab => \p~13_combout\,
	datac => p(15),
	datad => \p~145_combout\,
	combout => \p~146_combout\);

-- Location: LCCOMB_X23_Y16_N30
\acc[15]~64\ : cycloneive_lcell_comb
-- Equation(s):
-- \acc[15]~64_combout\ = (acc(15) & ((\p~146_combout\ & (\acc[14]~63\ & VCC)) # (!\p~146_combout\ & (!\acc[14]~63\)))) # (!acc(15) & ((\p~146_combout\ & (!\acc[14]~63\)) # (!\p~146_combout\ & ((\acc[14]~63\) # (GND)))))
-- \acc[15]~65\ = CARRY((acc(15) & (!\p~146_combout\ & !\acc[14]~63\)) # (!acc(15) & ((!\acc[14]~63\) # (!\p~146_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => acc(15),
	datab => \p~146_combout\,
	datad => VCC,
	cin => \acc[14]~63\,
	combout => \acc[15]~64_combout\,
	cout => \acc[15]~65\);

-- Location: FF_X23_Y16_N31
\acc[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \acc[15]~64_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	sclr => \ld_clr~0_combout\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => acc(15));

-- Location: FF_X19_Y15_N15
\p[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \p~156_combout\,
	ena => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => p(16));

-- Location: LCCOMB_X22_Y13_N14
\ra~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \ra~16_combout\ = (\cs~q\ & (ra(12) & ((\end_op~4_combout\) # (\rcarry~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \cs~q\,
	datab => \end_op~4_combout\,
	datac => ra(12),
	datad => \rcarry~q\,
	combout => \ra~16_combout\);

-- Location: FF_X22_Y13_N15
\ra[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \ra~16_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ra(16));

-- Location: LCCOMB_X19_Y17_N12
\A5[16]~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \A5[16]~46_combout\ = (\a[14]~input_o\ & (\A5[15]~45\ $ (GND))) # (!\a[14]~input_o\ & (!\A5[15]~45\ & VCC))
-- \A5[16]~47\ = CARRY((\a[14]~input_o\ & !\A5[15]~45\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \a[14]~input_o\,
	datad => VCC,
	cin => \A5[15]~45\,
	combout => \A5[16]~46_combout\,
	cout => \A5[16]~47\);

-- Location: FF_X19_Y17_N13
\A5[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \A5[16]~46_combout\,
	asdata => A5(12),
	clrn => \rst~inputclkctrl_outclk\,
	sload => \ALT_INV_ld_clr~0_combout\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => A5(16));

-- Location: LCCOMB_X24_Y20_N12
\Add10~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add10~32_combout\ = (\a[13]~input_o\ & ((GND) # (!\Add10~31\))) # (!\a[13]~input_o\ & (\Add10~31\ $ (GND)))
-- \Add10~33\ = CARRY((\a[13]~input_o\) # (!\Add10~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \a[13]~input_o\,
	datad => VCC,
	cin => \Add10~31\,
	combout => \Add10~32_combout\,
	cout => \Add10~33\);

-- Location: LCCOMB_X24_Y21_N2
\A7~77\ : cycloneive_lcell_comb
-- Equation(s):
-- \A7~77_combout\ = (\cs~q\ & (((A7(12))))) # (!\cs~q\ & ((\start~input_o\ & (\Add10~32_combout\)) # (!\start~input_o\ & ((A7(12))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111100100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add10~32_combout\,
	datab => \cs~q\,
	datac => \start~input_o\,
	datad => A7(12),
	combout => \A7~77_combout\);

-- Location: FF_X23_Y19_N13
\A7[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \A7~77_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => A7(16));

-- Location: LCCOMB_X25_Y17_N14
\A3[16]~48\ : cycloneive_lcell_comb
-- Equation(s):
-- \A3[16]~48_combout\ = (\a[15]~input_o\ & (!\A3[15]~47\)) # (!\a[15]~input_o\ & ((\A3[15]~47\) # (GND)))
-- \A3[16]~49\ = CARRY((!\A3[15]~47\) # (!\a[15]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \a[15]~input_o\,
	datad => VCC,
	cin => \A3[15]~47\,
	combout => \A3[16]~48_combout\,
	cout => \A3[16]~49\);

-- Location: FF_X25_Y17_N15
\A3[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \A3[16]~48_combout\,
	asdata => A3(12),
	clrn => \rst~inputclkctrl_outclk\,
	sload => \ALT_INV_ld_clr~0_combout\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => A3(16));

-- Location: LCCOMB_X25_Y15_N2
\p~149\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~149_combout\ = (\Add0~4_combout\ & (((\Add0~1_combout\)))) # (!\Add0~4_combout\ & ((\Add0~1_combout\ & ((A3(15)))) # (!\Add0~1_combout\ & (ra(15)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => ra(15),
	datab => A3(15),
	datac => \Add0~4_combout\,
	datad => \Add0~1_combout\,
	combout => \p~149_combout\);

-- Location: LCCOMB_X25_Y15_N12
\p~150\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~150_combout\ = (\Add0~4_combout\ & ((\p~149_combout\ & (A7(16))) # (!\p~149_combout\ & ((A3(16)))))) # (!\Add0~4_combout\ & (((\p~149_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => A7(16),
	datab => A3(16),
	datac => \Add0~4_combout\,
	datad => \p~149_combout\,
	combout => \p~150_combout\);

-- Location: LCCOMB_X25_Y15_N22
\p~151\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~151_combout\ = (\p~19_combout\ & ((\p~20_combout\ & ((\p~150_combout\))) # (!\p~20_combout\ & (ra(14))))) # (!\p~19_combout\ & (((\p~20_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100000111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => ra(14),
	datab => \p~19_combout\,
	datac => \p~20_combout\,
	datad => \p~150_combout\,
	combout => \p~151_combout\);

-- Location: LCCOMB_X25_Y15_N4
\p~152\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~152_combout\ = (\p~151_combout\ & (((A5(16)) # (!\p~16_combout\)))) # (!\p~151_combout\ & (ra(16) & ((\p~16_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => ra(16),
	datab => A5(16),
	datac => \p~151_combout\,
	datad => \p~16_combout\,
	combout => \p~152_combout\);

-- Location: LCCOMB_X19_Y15_N8
\p~153\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~153_combout\ = (\p~11_combout\ & (((\p~13_combout\)))) # (!\p~11_combout\ & ((\p~13_combout\ & (p(16))) # (!\p~13_combout\ & ((\p~152_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \p~11_combout\,
	datab => p(16),
	datac => \p~13_combout\,
	datad => \p~152_combout\,
	combout => \p~153_combout\);

-- Location: LCCOMB_X26_Y17_N0
\Add5~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add5~32_combout\ = (A3(16) & (!\Add5~31\ & VCC)) # (!A3(16) & (\Add5~31\ $ (GND)))
-- \Add5~33\ = CARRY((!A3(16) & !\Add5~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => A3(16),
	datad => VCC,
	cin => \Add5~31\,
	combout => \Add5~32_combout\,
	cout => \Add5~33\);

-- Location: LCCOMB_X21_Y18_N30
\Add4~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add4~28_combout\ = (ra(14) & (!\Add4~27\ & VCC)) # (!ra(14) & (\Add4~27\ $ (GND)))
-- \Add4~29\ = CARRY((!ra(14) & !\Add4~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => ra(14),
	datad => VCC,
	cin => \Add4~27\,
	combout => \Add4~28_combout\,
	cout => \Add4~29\);

-- Location: LCCOMB_X23_Y19_N0
\Add1~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~32_combout\ = (A7(16) & (!\Add1~31\ & VCC)) # (!A7(16) & (\Add1~31\ $ (GND)))
-- \Add1~33\ = CARRY((!A7(16) & !\Add1~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => A7(16),
	datad => VCC,
	cin => \Add1~31\,
	combout => \Add1~32_combout\,
	cout => \Add1~33\);

-- Location: LCCOMB_X19_Y18_N12
\p~147\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~147_combout\ = (\Add0~4_combout\ & (((\Add0~1_combout\) # (\Add1~32_combout\)))) # (!\Add0~4_combout\ & (ra(13) & (!\Add0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => ra(13),
	datab => \Add0~4_combout\,
	datac => \Add0~1_combout\,
	datad => \Add1~32_combout\,
	combout => \p~147_combout\);

-- Location: LCCOMB_X19_Y15_N4
\p~148\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~148_combout\ = (\Add0~1_combout\ & ((\p~147_combout\ & (\Add5~32_combout\)) # (!\p~147_combout\ & ((\Add4~28_combout\))))) # (!\Add0~1_combout\ & (((\p~147_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~1_combout\,
	datab => \Add5~32_combout\,
	datac => \Add4~28_combout\,
	datad => \p~147_combout\,
	combout => \p~148_combout\);

-- Location: LCCOMB_X18_Y17_N0
\Add3~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~32_combout\ = (A5(16) & (!\Add3~31\ & VCC)) # (!A5(16) & (\Add3~31\ $ (GND)))
-- \Add3~33\ = CARRY((!A5(16) & !\Add3~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => A5(16),
	datad => VCC,
	cin => \Add3~31\,
	combout => \Add3~32_combout\,
	cout => \Add3~33\);

-- Location: LCCOMB_X21_Y15_N0
\Add6~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add6~30_combout\ = (ra(15) & ((\Add6~29\) # (GND))) # (!ra(15) & (!\Add6~29\))
-- \Add6~31\ = CARRY((ra(15)) # (!\Add6~29\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => ra(15),
	datad => VCC,
	cin => \Add6~29\,
	combout => \Add6~30_combout\,
	cout => \Add6~31\);

-- Location: LCCOMB_X26_Y15_N0
\Add2~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~30_combout\ = (A3(15) & ((\Add2~29\) # (GND))) # (!A3(15) & (!\Add2~29\))
-- \Add2~31\ = CARRY((A3(15)) # (!\Add2~29\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => A3(15),
	datad => VCC,
	cin => \Add2~29\,
	combout => \Add2~30_combout\,
	cout => \Add2~31\);

-- Location: LCCOMB_X19_Y15_N30
\p~154\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~154_combout\ = (\Add0~1_combout\ & ((\Add0~4_combout\) # ((\Add6~30_combout\)))) # (!\Add0~1_combout\ & (!\Add0~4_combout\ & ((\Add2~30_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~1_combout\,
	datab => \Add0~4_combout\,
	datac => \Add6~30_combout\,
	datad => \Add2~30_combout\,
	combout => \p~154_combout\);

-- Location: LCCOMB_X23_Y13_N0
\Add7~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add7~32_combout\ = (ra(16) & (!\Add7~31\ & VCC)) # (!ra(16) & (\Add7~31\ $ (GND)))
-- \Add7~33\ = CARRY((!ra(16) & !\Add7~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => ra(16),
	datad => VCC,
	cin => \Add7~31\,
	combout => \Add7~32_combout\,
	cout => \Add7~33\);

-- Location: LCCOMB_X19_Y15_N0
\p~155\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~155_combout\ = (\Add0~4_combout\ & ((\p~154_combout\ & ((\Add7~32_combout\))) # (!\p~154_combout\ & (\Add3~32_combout\)))) # (!\Add0~4_combout\ & (((\p~154_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100001011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~4_combout\,
	datab => \Add3~32_combout\,
	datac => \p~154_combout\,
	datad => \Add7~32_combout\,
	combout => \p~155_combout\);

-- Location: LCCOMB_X19_Y15_N14
\p~156\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~156_combout\ = (\p~11_combout\ & ((\p~153_combout\ & ((\p~155_combout\))) # (!\p~153_combout\ & (\p~148_combout\)))) # (!\p~11_combout\ & (\p~153_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110001100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \p~11_combout\,
	datab => \p~153_combout\,
	datac => \p~148_combout\,
	datad => \p~155_combout\,
	combout => \p~156_combout\);

-- Location: LCCOMB_X23_Y15_N0
\acc[16]~66\ : cycloneive_lcell_comb
-- Equation(s):
-- \acc[16]~66_combout\ = ((\p~156_combout\ $ (acc(16) $ (!\acc[15]~65\)))) # (GND)
-- \acc[16]~67\ = CARRY((\p~156_combout\ & ((acc(16)) # (!\acc[15]~65\))) # (!\p~156_combout\ & (acc(16) & !\acc[15]~65\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \p~156_combout\,
	datab => acc(16),
	datad => VCC,
	cin => \acc[15]~65\,
	combout => \acc[16]~66_combout\,
	cout => \acc[16]~67\);

-- Location: FF_X23_Y15_N1
\acc[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \acc[16]~66_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	sclr => \ld_clr~0_combout\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => acc(16));

-- Location: LCCOMB_X22_Y13_N16
\ra~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \ra~17_combout\ = (\cs~q\ & (ra(13) & ((\end_op~4_combout\) # (\rcarry~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \cs~q\,
	datab => \end_op~4_combout\,
	datac => ra(13),
	datad => \rcarry~q\,
	combout => \ra~17_combout\);

-- Location: FF_X22_Y13_N17
\ra[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \ra~17_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ra(17));

-- Location: LCCOMB_X19_Y17_N14
\A5[17]~48\ : cycloneive_lcell_comb
-- Equation(s):
-- \A5[17]~48_combout\ = (\a[15]~input_o\ & (!\A5[16]~47\)) # (!\a[15]~input_o\ & ((\A5[16]~47\) # (GND)))
-- \A5[17]~49\ = CARRY((!\A5[16]~47\) # (!\a[15]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \a[15]~input_o\,
	datad => VCC,
	cin => \A5[16]~47\,
	combout => \A5[17]~48_combout\,
	cout => \A5[17]~49\);

-- Location: FF_X19_Y17_N15
\A5[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \A5[17]~48_combout\,
	asdata => A5(13),
	clrn => \rst~inputclkctrl_outclk\,
	sload => \ALT_INV_ld_clr~0_combout\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => A5(17));

-- Location: LCCOMB_X25_Y17_N16
\A3[17]~50\ : cycloneive_lcell_comb
-- Equation(s):
-- \A3[17]~50_combout\ = !\A3[16]~49\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \A3[16]~49\,
	combout => \A3[17]~50_combout\);

-- Location: FF_X25_Y17_N17
\A3[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \A3[17]~50_combout\,
	asdata => A3(13),
	clrn => \rst~inputclkctrl_outclk\,
	sload => \ALT_INV_ld_clr~0_combout\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => A3(17));

-- Location: LCCOMB_X22_Y17_N10
\p~159\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~159_combout\ = (\Add0~4_combout\ & ((A3(17)) # ((\Add0~1_combout\)))) # (!\Add0~4_combout\ & (((ra(16) & !\Add0~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => A3(17),
	datab => ra(16),
	datac => \Add0~4_combout\,
	datad => \Add0~1_combout\,
	combout => \p~159_combout\);

-- Location: LCCOMB_X24_Y20_N14
\Add10~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add10~34_combout\ = (\a[14]~input_o\ & (\Add10~33\ & VCC)) # (!\a[14]~input_o\ & (!\Add10~33\))
-- \Add10~35\ = CARRY((!\a[14]~input_o\ & !\Add10~33\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \a[14]~input_o\,
	datad => VCC,
	cin => \Add10~33\,
	combout => \Add10~34_combout\,
	cout => \Add10~35\);

-- Location: LCCOMB_X24_Y20_N30
\A7~78\ : cycloneive_lcell_comb
-- Equation(s):
-- \A7~78_combout\ = (\cs~q\ & (((A7(13))))) # (!\cs~q\ & ((\start~input_o\ & (\Add10~34_combout\)) # (!\start~input_o\ & ((A7(13))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111101000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \cs~q\,
	datab => \Add10~34_combout\,
	datac => \start~input_o\,
	datad => A7(13),
	combout => \A7~78_combout\);

-- Location: FF_X24_Y20_N31
\A7[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \A7~78_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => A7(17));

-- Location: LCCOMB_X22_Y17_N28
\p~160\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~160_combout\ = (\p~159_combout\ & (((A7(17)) # (!\Add0~1_combout\)))) # (!\p~159_combout\ & (A3(16) & ((\Add0~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \p~159_combout\,
	datab => A3(16),
	datac => A7(17),
	datad => \Add0~1_combout\,
	combout => \p~160_combout\);

-- Location: LCCOMB_X22_Y17_N22
\p~161\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~161_combout\ = (\p~20_combout\ & (((\p~160_combout\)) # (!\p~19_combout\))) # (!\p~20_combout\ & (\p~19_combout\ & (ra(15))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \p~20_combout\,
	datab => \p~19_combout\,
	datac => ra(15),
	datad => \p~160_combout\,
	combout => \p~161_combout\);

-- Location: LCCOMB_X22_Y17_N8
\p~162\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~162_combout\ = (\p~161_combout\ & (((A5(17)) # (!\p~16_combout\)))) # (!\p~161_combout\ & (ra(17) & ((\p~16_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => ra(17),
	datab => A5(17),
	datac => \p~161_combout\,
	datad => \p~16_combout\,
	combout => \p~162_combout\);

-- Location: LCCOMB_X23_Y19_N2
\Add1~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~34_combout\ = (A7(17) & ((\Add1~33\) # (GND))) # (!A7(17) & (!\Add1~33\))
-- \Add1~35\ = CARRY((A7(17)) # (!\Add1~33\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => A7(17),
	datad => VCC,
	cin => \Add1~33\,
	combout => \Add1~34_combout\,
	cout => \Add1~35\);

-- Location: LCCOMB_X26_Y17_N2
\Add5~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add5~34_combout\ = (A3(17) & ((\Add5~33\) # (GND))) # (!A3(17) & (!\Add5~33\))
-- \Add5~35\ = CARRY((A3(17)) # (!\Add5~33\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => A3(17),
	datad => VCC,
	cin => \Add5~33\,
	combout => \Add5~34_combout\,
	cout => \Add5~35\);

-- Location: LCCOMB_X21_Y17_N0
\Add4~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add4~30_combout\ = (ra(15) & ((\Add4~29\) # (GND))) # (!ra(15) & (!\Add4~29\))
-- \Add4~31\ = CARRY((ra(15)) # (!\Add4~29\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => ra(15),
	datad => VCC,
	cin => \Add4~29\,
	combout => \Add4~30_combout\,
	cout => \Add4~31\);

-- Location: LCCOMB_X22_Y17_N14
\p~157\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~157_combout\ = (\Add0~4_combout\ & (((\Add0~1_combout\)))) # (!\Add0~4_combout\ & ((\Add0~1_combout\ & ((\Add4~30_combout\))) # (!\Add0~1_combout\ & (ra(14)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => ra(14),
	datab => \Add0~4_combout\,
	datac => \Add4~30_combout\,
	datad => \Add0~1_combout\,
	combout => \p~157_combout\);

-- Location: LCCOMB_X22_Y17_N16
\p~158\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~158_combout\ = (\p~157_combout\ & (((\Add5~34_combout\) # (!\Add0~4_combout\)))) # (!\p~157_combout\ & (\Add1~34_combout\ & ((\Add0~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~34_combout\,
	datab => \Add5~34_combout\,
	datac => \p~157_combout\,
	datad => \Add0~4_combout\,
	combout => \p~158_combout\);

-- Location: LCCOMB_X22_Y17_N26
\p~163\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~163_combout\ = (\p~11_combout\ & ((\p~13_combout\) # ((\p~158_combout\)))) # (!\p~11_combout\ & (!\p~13_combout\ & (\p~162_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \p~11_combout\,
	datab => \p~13_combout\,
	datac => \p~162_combout\,
	datad => \p~158_combout\,
	combout => \p~163_combout\);

-- Location: FF_X22_Y17_N21
\p[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \p~166_combout\,
	ena => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => p(17));

-- Location: LCCOMB_X21_Y15_N2
\Add6~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add6~32_combout\ = (ra(16) & (!\Add6~31\ & VCC)) # (!ra(16) & (\Add6~31\ $ (GND)))
-- \Add6~33\ = CARRY((!ra(16) & !\Add6~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => ra(16),
	datad => VCC,
	cin => \Add6~31\,
	combout => \Add6~32_combout\,
	cout => \Add6~33\);

-- Location: LCCOMB_X18_Y17_N2
\Add3~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~34_combout\ = (A5(17) & ((\Add3~33\) # (GND))) # (!A5(17) & (!\Add3~33\))
-- \Add3~35\ = CARRY((A5(17)) # (!\Add3~33\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => A5(17),
	datad => VCC,
	cin => \Add3~33\,
	combout => \Add3~34_combout\,
	cout => \Add3~35\);

-- Location: LCCOMB_X26_Y15_N2
\Add2~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~32_combout\ = (A3(16) & (!\Add2~31\ & VCC)) # (!A3(16) & (\Add2~31\ $ (GND)))
-- \Add2~33\ = CARRY((!A3(16) & !\Add2~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => A3(16),
	datad => VCC,
	cin => \Add2~31\,
	combout => \Add2~32_combout\,
	cout => \Add2~33\);

-- Location: LCCOMB_X22_Y17_N4
\p~164\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~164_combout\ = (\Add0~1_combout\ & (\Add0~4_combout\)) # (!\Add0~1_combout\ & ((\Add0~4_combout\ & (\Add3~34_combout\)) # (!\Add0~4_combout\ & ((\Add2~32_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~1_combout\,
	datab => \Add0~4_combout\,
	datac => \Add3~34_combout\,
	datad => \Add2~32_combout\,
	combout => \p~164_combout\);

-- Location: LCCOMB_X23_Y13_N2
\Add7~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add7~34_combout\ = (ra(17) & ((\Add7~33\) # (GND))) # (!ra(17) & (!\Add7~33\))
-- \Add7~35\ = CARRY((ra(17)) # (!\Add7~33\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => ra(17),
	datad => VCC,
	cin => \Add7~33\,
	combout => \Add7~34_combout\,
	cout => \Add7~35\);

-- Location: LCCOMB_X22_Y17_N2
\p~165\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~165_combout\ = (\Add0~1_combout\ & ((\p~164_combout\ & ((\Add7~34_combout\))) # (!\p~164_combout\ & (\Add6~32_combout\)))) # (!\Add0~1_combout\ & (((\p~164_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100001011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~1_combout\,
	datab => \Add6~32_combout\,
	datac => \p~164_combout\,
	datad => \Add7~34_combout\,
	combout => \p~165_combout\);

-- Location: LCCOMB_X22_Y17_N20
\p~166\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~166_combout\ = (\p~163_combout\ & (((\p~165_combout\)) # (!\p~13_combout\))) # (!\p~163_combout\ & (\p~13_combout\ & (p(17))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \p~163_combout\,
	datab => \p~13_combout\,
	datac => p(17),
	datad => \p~165_combout\,
	combout => \p~166_combout\);

-- Location: LCCOMB_X23_Y15_N2
\acc[17]~68\ : cycloneive_lcell_comb
-- Equation(s):
-- \acc[17]~68_combout\ = (acc(17) & ((\p~166_combout\ & (\acc[16]~67\ & VCC)) # (!\p~166_combout\ & (!\acc[16]~67\)))) # (!acc(17) & ((\p~166_combout\ & (!\acc[16]~67\)) # (!\p~166_combout\ & ((\acc[16]~67\) # (GND)))))
-- \acc[17]~69\ = CARRY((acc(17) & (!\p~166_combout\ & !\acc[16]~67\)) # (!acc(17) & ((!\acc[16]~67\) # (!\p~166_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => acc(17),
	datab => \p~166_combout\,
	datad => VCC,
	cin => \acc[16]~67\,
	combout => \acc[17]~68_combout\,
	cout => \acc[17]~69\);

-- Location: FF_X23_Y15_N3
\acc[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \acc[17]~68_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	sclr => \ld_clr~0_combout\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => acc(17));

-- Location: LCCOMB_X25_Y17_N24
\A3~52\ : cycloneive_lcell_comb
-- Equation(s):
-- \A3~52_combout\ = (A3(14) & ((\cs~q\) # (!\start~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => A3(14),
	datab => \start~input_o\,
	datad => \cs~q\,
	combout => \A3~52_combout\);

-- Location: FF_X26_Y17_N27
\A3[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \A3~52_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => A3(18));

-- Location: LCCOMB_X26_Y17_N4
\Add5~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add5~36_combout\ = (A3(18) & (!\Add5~35\ & VCC)) # (!A3(18) & (\Add5~35\ $ (GND)))
-- \Add5~37\ = CARRY((!A3(18) & !\Add5~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => A3(18),
	datad => VCC,
	cin => \Add5~35\,
	combout => \Add5~36_combout\,
	cout => \Add5~37\);

-- Location: LCCOMB_X24_Y20_N16
\Add10~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add10~36_combout\ = (\a[15]~input_o\ & ((GND) # (!\Add10~35\))) # (!\a[15]~input_o\ & (\Add10~35\ $ (GND)))
-- \Add10~37\ = CARRY((\a[15]~input_o\) # (!\Add10~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \a[15]~input_o\,
	datad => VCC,
	cin => \Add10~35\,
	combout => \Add10~36_combout\,
	cout => \Add10~37\);

-- Location: LCCOMB_X24_Y20_N22
\A7~79\ : cycloneive_lcell_comb
-- Equation(s):
-- \A7~79_combout\ = (\cs~q\ & (((A7(14))))) # (!\cs~q\ & ((\start~input_o\ & (\Add10~36_combout\)) # (!\start~input_o\ & ((A7(14))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111101000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \cs~q\,
	datab => \Add10~36_combout\,
	datac => \start~input_o\,
	datad => A7(14),
	combout => \A7~79_combout\);

-- Location: FF_X23_Y19_N23
\A7[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \A7~79_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => A7(18));

-- Location: LCCOMB_X23_Y19_N4
\Add1~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~36_combout\ = (A7(18) & (!\Add1~35\ & VCC)) # (!A7(18) & (\Add1~35\ $ (GND)))
-- \Add1~37\ = CARRY((!A7(18) & !\Add1~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => A7(18),
	datad => VCC,
	cin => \Add1~35\,
	combout => \Add1~36_combout\,
	cout => \Add1~37\);

-- Location: LCCOMB_X22_Y14_N8
\p~167\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~167_combout\ = (\Add0~4_combout\ & ((\Add0~1_combout\) # ((\Add1~36_combout\)))) # (!\Add0~4_combout\ & (!\Add0~1_combout\ & (ra(15))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~4_combout\,
	datab => \Add0~1_combout\,
	datac => ra(15),
	datad => \Add1~36_combout\,
	combout => \p~167_combout\);

-- Location: LCCOMB_X21_Y17_N2
\Add4~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add4~32_combout\ = (ra(16) & (!\Add4~31\ & VCC)) # (!ra(16) & (\Add4~31\ $ (GND)))
-- \Add4~33\ = CARRY((!ra(16) & !\Add4~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => ra(16),
	datad => VCC,
	cin => \Add4~31\,
	combout => \Add4~32_combout\,
	cout => \Add4~33\);

-- Location: LCCOMB_X22_Y14_N2
\p~168\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~168_combout\ = (\Add0~1_combout\ & ((\p~167_combout\ & (\Add5~36_combout\)) # (!\p~167_combout\ & ((\Add4~32_combout\))))) # (!\Add0~1_combout\ & (((\p~167_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101101011010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~1_combout\,
	datab => \Add5~36_combout\,
	datac => \p~167_combout\,
	datad => \Add4~32_combout\,
	combout => \p~168_combout\);

-- Location: FF_X22_Y14_N1
\p[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \p~176_combout\,
	ena => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => p(18));

-- Location: LCCOMB_X19_Y17_N16
\A5[18]~50\ : cycloneive_lcell_comb
-- Equation(s):
-- \A5[18]~50_combout\ = !\A5[17]~49\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \A5[17]~49\,
	combout => \A5[18]~50_combout\);

-- Location: FF_X19_Y17_N17
\A5[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \A5[18]~50_combout\,
	asdata => A5(14),
	clrn => \rst~inputclkctrl_outclk\,
	sload => \ALT_INV_ld_clr~0_combout\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => A5(18));

-- Location: LCCOMB_X22_Y17_N24
\p~169\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~169_combout\ = (\Add0~4_combout\ & (((\Add0~1_combout\)))) # (!\Add0~4_combout\ & ((\Add0~1_combout\ & (A3(17))) # (!\Add0~1_combout\ & ((ra(17))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => A3(17),
	datab => \Add0~4_combout\,
	datac => ra(17),
	datad => \Add0~1_combout\,
	combout => \p~169_combout\);

-- Location: LCCOMB_X22_Y17_N6
\p~170\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~170_combout\ = (\Add0~4_combout\ & ((\p~169_combout\ & ((A7(18)))) # (!\p~169_combout\ & (A3(18))))) # (!\Add0~4_combout\ & (((\p~169_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => A3(18),
	datab => A7(18),
	datac => \Add0~4_combout\,
	datad => \p~169_combout\,
	combout => \p~170_combout\);

-- Location: LCCOMB_X22_Y14_N26
\p~171\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~171_combout\ = (\p~20_combout\ & (((\p~170_combout\) # (!\p~19_combout\)))) # (!\p~20_combout\ & (ra(16) & (\p~19_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110000101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => ra(16),
	datab => \p~20_combout\,
	datac => \p~19_combout\,
	datad => \p~170_combout\,
	combout => \p~171_combout\);

-- Location: LCCOMB_X24_Y17_N30
\ra~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \ra~18_combout\ = (\cs~q\ & (ra(14) & ((\rcarry~q\) # (\end_op~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rcarry~q\,
	datab => \end_op~4_combout\,
	datac => \cs~q\,
	datad => ra(14),
	combout => \ra~18_combout\);

-- Location: FF_X24_Y17_N31
\ra[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \ra~18_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ra(18));

-- Location: LCCOMB_X22_Y14_N20
\p~172\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~172_combout\ = (\p~16_combout\ & ((\p~171_combout\ & (A5(18))) # (!\p~171_combout\ & ((ra(18)))))) # (!\p~16_combout\ & (((\p~171_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101101011010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \p~16_combout\,
	datab => A5(18),
	datac => \p~171_combout\,
	datad => ra(18),
	combout => \p~172_combout\);

-- Location: LCCOMB_X22_Y14_N22
\p~173\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~173_combout\ = (\p~11_combout\ & (((\p~13_combout\)))) # (!\p~11_combout\ & ((\p~13_combout\ & (p(18))) # (!\p~13_combout\ & ((\p~172_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \p~11_combout\,
	datab => p(18),
	datac => \p~13_combout\,
	datad => \p~172_combout\,
	combout => \p~173_combout\);

-- Location: LCCOMB_X23_Y13_N4
\Add7~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add7~36_combout\ = (ra(18) & (!\Add7~35\ & VCC)) # (!ra(18) & (\Add7~35\ $ (GND)))
-- \Add7~37\ = CARRY((!ra(18) & !\Add7~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => ra(18),
	datad => VCC,
	cin => \Add7~35\,
	combout => \Add7~36_combout\,
	cout => \Add7~37\);

-- Location: LCCOMB_X18_Y17_N4
\Add3~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~36_combout\ = (A5(18) & (!\Add3~35\ & VCC)) # (!A5(18) & (\Add3~35\ $ (GND)))
-- \Add3~37\ = CARRY((!A5(18) & !\Add3~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => A5(18),
	datad => VCC,
	cin => \Add3~35\,
	combout => \Add3~36_combout\,
	cout => \Add3~37\);

-- Location: LCCOMB_X21_Y15_N4
\Add6~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add6~34_combout\ = (ra(17) & ((\Add6~33\) # (GND))) # (!ra(17) & (!\Add6~33\))
-- \Add6~35\ = CARRY((ra(17)) # (!\Add6~33\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => ra(17),
	datad => VCC,
	cin => \Add6~33\,
	combout => \Add6~34_combout\,
	cout => \Add6~35\);

-- Location: LCCOMB_X26_Y15_N4
\Add2~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~34_combout\ = (A3(17) & ((\Add2~33\) # (GND))) # (!A3(17) & (!\Add2~33\))
-- \Add2~35\ = CARRY((A3(17)) # (!\Add2~33\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => A3(17),
	datad => VCC,
	cin => \Add2~33\,
	combout => \Add2~34_combout\,
	cout => \Add2~35\);

-- Location: LCCOMB_X22_Y14_N28
\p~174\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~174_combout\ = (\Add0~4_combout\ & (\Add0~1_combout\)) # (!\Add0~4_combout\ & ((\Add0~1_combout\ & (\Add6~34_combout\)) # (!\Add0~1_combout\ & ((\Add2~34_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~4_combout\,
	datab => \Add0~1_combout\,
	datac => \Add6~34_combout\,
	datad => \Add2~34_combout\,
	combout => \p~174_combout\);

-- Location: LCCOMB_X22_Y14_N18
\p~175\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~175_combout\ = (\Add0~4_combout\ & ((\p~174_combout\ & (\Add7~36_combout\)) # (!\p~174_combout\ & ((\Add3~36_combout\))))) # (!\Add0~4_combout\ & (((\p~174_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~4_combout\,
	datab => \Add7~36_combout\,
	datac => \Add3~36_combout\,
	datad => \p~174_combout\,
	combout => \p~175_combout\);

-- Location: LCCOMB_X22_Y14_N0
\p~176\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~176_combout\ = (\p~11_combout\ & ((\p~173_combout\ & ((\p~175_combout\))) # (!\p~173_combout\ & (\p~168_combout\)))) # (!\p~11_combout\ & (((\p~173_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100001011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \p~11_combout\,
	datab => \p~168_combout\,
	datac => \p~173_combout\,
	datad => \p~175_combout\,
	combout => \p~176_combout\);

-- Location: LCCOMB_X23_Y15_N4
\acc[18]~70\ : cycloneive_lcell_comb
-- Equation(s):
-- \acc[18]~70_combout\ = ((\p~176_combout\ $ (acc(18) $ (!\acc[17]~69\)))) # (GND)
-- \acc[18]~71\ = CARRY((\p~176_combout\ & ((acc(18)) # (!\acc[17]~69\))) # (!\p~176_combout\ & (acc(18) & !\acc[17]~69\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \p~176_combout\,
	datab => acc(18),
	datad => VCC,
	cin => \acc[17]~69\,
	combout => \acc[18]~70_combout\,
	cout => \acc[18]~71\);

-- Location: FF_X23_Y15_N5
\acc[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \acc[18]~70_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	sclr => \ld_clr~0_combout\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => acc(18));

-- Location: LCCOMB_X21_Y14_N4
\ra~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \ra~19_combout\ = (\cs~q\ & (ra(15) & ((\end_op~4_combout\) # (\rcarry~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \cs~q\,
	datab => ra(15),
	datac => \end_op~4_combout\,
	datad => \rcarry~q\,
	combout => \ra~19_combout\);

-- Location: FF_X21_Y15_N19
\ra[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \ra~19_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ra(19));

-- Location: LCCOMB_X23_Y13_N6
\Add7~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add7~38_combout\ = (ra(19) & ((\Add7~37\) # (GND))) # (!ra(19) & (!\Add7~37\))
-- \Add7~39\ = CARRY((ra(19)) # (!\Add7~37\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => ra(19),
	datad => VCC,
	cin => \Add7~37\,
	combout => \Add7~38_combout\,
	cout => \Add7~39\);

-- Location: LCCOMB_X21_Y15_N6
\Add6~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add6~36_combout\ = (ra(18) & (!\Add6~35\ & VCC)) # (!ra(18) & (\Add6~35\ $ (GND)))
-- \Add6~37\ = CARRY((!ra(18) & !\Add6~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => ra(18),
	datad => VCC,
	cin => \Add6~35\,
	combout => \Add6~36_combout\,
	cout => \Add6~37\);

-- Location: LCCOMB_X26_Y15_N6
\Add2~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~36_combout\ = (A3(18) & (!\Add2~35\ & VCC)) # (!A3(18) & (\Add2~35\ $ (GND)))
-- \Add2~37\ = CARRY((!A3(18) & !\Add2~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => A3(18),
	datad => VCC,
	cin => \Add2~35\,
	combout => \Add2~36_combout\,
	cout => \Add2~37\);

-- Location: LCCOMB_X18_Y15_N26
\A5~52\ : cycloneive_lcell_comb
-- Equation(s):
-- \A5~52_combout\ = (A5(15) & ((\cs~q\) # (!\start~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \cs~q\,
	datab => A5(15),
	datad => \start~input_o\,
	combout => \A5~52_combout\);

-- Location: FF_X18_Y17_N13
\A5[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \A5~52_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => A5(19));

-- Location: LCCOMB_X18_Y17_N6
\Add3~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~38_combout\ = (A5(19) & ((\Add3~37\) # (GND))) # (!A5(19) & (!\Add3~37\))
-- \Add3~39\ = CARRY((A5(19)) # (!\Add3~37\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => A5(19),
	datad => VCC,
	cin => \Add3~37\,
	combout => \Add3~38_combout\,
	cout => \Add3~39\);

-- Location: LCCOMB_X19_Y15_N24
\p~184\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~184_combout\ = (\Add0~1_combout\ & (\Add0~4_combout\)) # (!\Add0~1_combout\ & ((\Add0~4_combout\ & ((\Add3~38_combout\))) # (!\Add0~4_combout\ & (\Add2~36_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~1_combout\,
	datab => \Add0~4_combout\,
	datac => \Add2~36_combout\,
	datad => \Add3~38_combout\,
	combout => \p~184_combout\);

-- Location: LCCOMB_X19_Y15_N10
\p~185\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~185_combout\ = (\Add0~1_combout\ & ((\p~184_combout\ & (\Add7~38_combout\)) # (!\p~184_combout\ & ((\Add6~36_combout\))))) # (!\Add0~1_combout\ & (((\p~184_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~1_combout\,
	datab => \Add7~38_combout\,
	datac => \Add6~36_combout\,
	datad => \p~184_combout\,
	combout => \p~185_combout\);

-- Location: FF_X19_Y15_N7
\p[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \p~186_combout\,
	ena => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => p(19));

-- Location: LCCOMB_X24_Y20_N18
\Add10~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add10~38_combout\ = !\Add10~37\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Add10~37\,
	combout => \Add10~38_combout\);

-- Location: LCCOMB_X26_Y19_N4
\A7~80\ : cycloneive_lcell_comb
-- Equation(s):
-- \A7~80_combout\ = (\start~input_o\ & ((\cs~q\ & (A7(15))) # (!\cs~q\ & ((\Add10~38_combout\))))) # (!\start~input_o\ & (A7(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => A7(15),
	datab => \start~input_o\,
	datac => \Add10~38_combout\,
	datad => \cs~q\,
	combout => \A7~80_combout\);

-- Location: FF_X23_Y19_N19
\A7[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \A7~80_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => A7(19));

-- Location: LCCOMB_X25_Y15_N10
\A3~53\ : cycloneive_lcell_comb
-- Equation(s):
-- \A3~53_combout\ = (A3(15) & ((\cs~q\) # (!\start~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \cs~q\,
	datab => A3(15),
	datad => \start~input_o\,
	combout => \A3~53_combout\);

-- Location: FF_X25_Y15_N11
\A3[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \A3~53_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => A3(19));

-- Location: LCCOMB_X22_Y13_N2
\p~179\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~179_combout\ = (\Add0~1_combout\ & (((\Add0~4_combout\)))) # (!\Add0~1_combout\ & ((\Add0~4_combout\ & (A3(19))) # (!\Add0~4_combout\ & ((ra(18))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => A3(19),
	datab => ra(18),
	datac => \Add0~1_combout\,
	datad => \Add0~4_combout\,
	combout => \p~179_combout\);

-- Location: LCCOMB_X22_Y13_N12
\p~180\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~180_combout\ = (\Add0~1_combout\ & ((\p~179_combout\ & ((A7(19)))) # (!\p~179_combout\ & (A3(18))))) # (!\Add0~1_combout\ & (((\p~179_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => A3(18),
	datab => \Add0~1_combout\,
	datac => A7(19),
	datad => \p~179_combout\,
	combout => \p~180_combout\);

-- Location: LCCOMB_X22_Y13_N18
\p~181\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~181_combout\ = (\p~20_combout\ & (((\p~180_combout\) # (!\p~19_combout\)))) # (!\p~20_combout\ & (ra(17) & (\p~19_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110000101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => ra(17),
	datab => \p~20_combout\,
	datac => \p~19_combout\,
	datad => \p~180_combout\,
	combout => \p~181_combout\);

-- Location: LCCOMB_X22_Y13_N24
\p~182\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~182_combout\ = (\p~16_combout\ & ((\p~181_combout\ & (A5(19))) # (!\p~181_combout\ & ((ra(19)))))) # (!\p~16_combout\ & (((\p~181_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => A5(19),
	datab => ra(19),
	datac => \p~16_combout\,
	datad => \p~181_combout\,
	combout => \p~182_combout\);

-- Location: LCCOMB_X23_Y19_N6
\Add1~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~38_combout\ = (A7(19) & ((\Add1~37\) # (GND))) # (!A7(19) & (!\Add1~37\))
-- \Add1~39\ = CARRY((A7(19)) # (!\Add1~37\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => A7(19),
	datad => VCC,
	cin => \Add1~37\,
	combout => \Add1~38_combout\,
	cout => \Add1~39\);

-- Location: LCCOMB_X26_Y17_N6
\Add5~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add5~38_combout\ = (A3(19) & ((\Add5~37\) # (GND))) # (!A3(19) & (!\Add5~37\))
-- \Add5~39\ = CARRY((A3(19)) # (!\Add5~37\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => A3(19),
	datad => VCC,
	cin => \Add5~37\,
	combout => \Add5~38_combout\,
	cout => \Add5~39\);

-- Location: LCCOMB_X21_Y17_N4
\Add4~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add4~34_combout\ = (ra(17) & ((\Add4~33\) # (GND))) # (!ra(17) & (!\Add4~33\))
-- \Add4~35\ = CARRY((ra(17)) # (!\Add4~33\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => ra(17),
	datad => VCC,
	cin => \Add4~33\,
	combout => \Add4~34_combout\,
	cout => \Add4~35\);

-- Location: LCCOMB_X21_Y17_N30
\p~177\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~177_combout\ = (\Add0~1_combout\ & (((\Add4~34_combout\) # (\Add0~4_combout\)))) # (!\Add0~1_combout\ & (ra(16) & ((!\Add0~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~1_combout\,
	datab => ra(16),
	datac => \Add4~34_combout\,
	datad => \Add0~4_combout\,
	combout => \p~177_combout\);

-- Location: LCCOMB_X19_Y15_N28
\p~178\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~178_combout\ = (\Add0~4_combout\ & ((\p~177_combout\ & ((\Add5~38_combout\))) # (!\p~177_combout\ & (\Add1~38_combout\)))) # (!\Add0~4_combout\ & (((\p~177_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~38_combout\,
	datab => \Add0~4_combout\,
	datac => \Add5~38_combout\,
	datad => \p~177_combout\,
	combout => \p~178_combout\);

-- Location: LCCOMB_X19_Y15_N18
\p~183\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~183_combout\ = (\p~11_combout\ & ((\p~13_combout\) # ((\p~178_combout\)))) # (!\p~11_combout\ & (!\p~13_combout\ & (\p~182_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \p~11_combout\,
	datab => \p~13_combout\,
	datac => \p~182_combout\,
	datad => \p~178_combout\,
	combout => \p~183_combout\);

-- Location: LCCOMB_X19_Y15_N6
\p~186\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~186_combout\ = (\p~13_combout\ & ((\p~183_combout\ & (\p~185_combout\)) # (!\p~183_combout\ & ((p(19)))))) # (!\p~13_combout\ & (((\p~183_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \p~185_combout\,
	datab => \p~13_combout\,
	datac => p(19),
	datad => \p~183_combout\,
	combout => \p~186_combout\);

-- Location: LCCOMB_X23_Y15_N6
\acc[19]~72\ : cycloneive_lcell_comb
-- Equation(s):
-- \acc[19]~72_combout\ = (acc(19) & ((\p~186_combout\ & (\acc[18]~71\ & VCC)) # (!\p~186_combout\ & (!\acc[18]~71\)))) # (!acc(19) & ((\p~186_combout\ & (!\acc[18]~71\)) # (!\p~186_combout\ & ((\acc[18]~71\) # (GND)))))
-- \acc[19]~73\ = CARRY((acc(19) & (!\p~186_combout\ & !\acc[18]~71\)) # (!acc(19) & ((!\acc[18]~71\) # (!\p~186_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => acc(19),
	datab => \p~186_combout\,
	datad => VCC,
	cin => \acc[18]~71\,
	combout => \acc[19]~72_combout\,
	cout => \acc[19]~73\);

-- Location: FF_X23_Y15_N7
\acc[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \acc[19]~72_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	sclr => \ld_clr~0_combout\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => acc(19));

-- Location: LCCOMB_X21_Y17_N6
\Add4~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add4~36_combout\ = (ra(18) & (!\Add4~35\ & VCC)) # (!ra(18) & (\Add4~35\ $ (GND)))
-- \Add4~37\ = CARRY((!ra(18) & !\Add4~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => ra(18),
	datad => VCC,
	cin => \Add4~35\,
	combout => \Add4~36_combout\,
	cout => \Add4~37\);

-- Location: LCCOMB_X28_Y17_N4
\A3~54\ : cycloneive_lcell_comb
-- Equation(s):
-- \A3~54_combout\ = (A3(16) & ((\cs~q\) # (!\start~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \cs~q\,
	datac => A3(16),
	datad => \start~input_o\,
	combout => \A3~54_combout\);

-- Location: FF_X26_Y17_N5
\A3[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \A3~54_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => A3(20));

-- Location: LCCOMB_X26_Y17_N8
\Add5~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add5~40_combout\ = (A3(20) & (!\Add5~39\ & VCC)) # (!A3(20) & (\Add5~39\ $ (GND)))
-- \Add5~41\ = CARRY((!A3(20) & !\Add5~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => A3(20),
	datad => VCC,
	cin => \Add5~39\,
	combout => \Add5~40_combout\,
	cout => \Add5~41\);

-- Location: LCCOMB_X26_Y19_N0
\A7~81\ : cycloneive_lcell_comb
-- Equation(s):
-- \A7~81_combout\ = (\cs~q\ & (A7(16))) # (!\cs~q\ & ((\start~input_o\ & ((\Add10~38_combout\))) # (!\start~input_o\ & (A7(16)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \cs~q\,
	datab => A7(16),
	datac => \Add10~38_combout\,
	datad => \start~input_o\,
	combout => \A7~81_combout\);

-- Location: FF_X26_Y19_N1
\A7[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \A7~81_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => A7(20));

-- Location: LCCOMB_X23_Y19_N8
\Add1~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~40_combout\ = (A7(20) & (!\Add1~39\ & VCC)) # (!A7(20) & (\Add1~39\ $ (GND)))
-- \Add1~41\ = CARRY((!A7(20) & !\Add1~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => A7(20),
	datad => VCC,
	cin => \Add1~39\,
	combout => \Add1~40_combout\,
	cout => \Add1~41\);

-- Location: LCCOMB_X19_Y15_N16
\p~187\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~187_combout\ = (\Add0~1_combout\ & (\Add0~4_combout\)) # (!\Add0~1_combout\ & ((\Add0~4_combout\ & ((\Add1~40_combout\))) # (!\Add0~4_combout\ & (ra(17)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~1_combout\,
	datab => \Add0~4_combout\,
	datac => ra(17),
	datad => \Add1~40_combout\,
	combout => \p~187_combout\);

-- Location: LCCOMB_X19_Y15_N26
\p~188\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~188_combout\ = (\Add0~1_combout\ & ((\p~187_combout\ & ((\Add5~40_combout\))) # (!\p~187_combout\ & (\Add4~36_combout\)))) # (!\Add0~1_combout\ & (((\p~187_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add4~36_combout\,
	datab => \Add0~1_combout\,
	datac => \Add5~40_combout\,
	datad => \p~187_combout\,
	combout => \p~188_combout\);

-- Location: LCCOMB_X22_Y13_N26
\ra~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \ra~20_combout\ = (\cs~q\ & (ra(16) & ((\end_op~4_combout\) # (\rcarry~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \cs~q\,
	datab => \end_op~4_combout\,
	datac => ra(16),
	datad => \rcarry~q\,
	combout => \ra~20_combout\);

-- Location: FF_X22_Y13_N27
\ra[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \ra~20_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ra(20));

-- Location: LCCOMB_X23_Y13_N8
\Add7~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add7~40_combout\ = (ra(20) & (!\Add7~39\ & VCC)) # (!ra(20) & (\Add7~39\ $ (GND)))
-- \Add7~41\ = CARRY((!ra(20) & !\Add7~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => ra(20),
	datad => VCC,
	cin => \Add7~39\,
	combout => \Add7~40_combout\,
	cout => \Add7~41\);

-- Location: LCCOMB_X18_Y15_N14
\A5~53\ : cycloneive_lcell_comb
-- Equation(s):
-- \A5~53_combout\ = (A5(16) & ((\cs~q\) # (!\start~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => A5(16),
	datac => \cs~q\,
	datad => \start~input_o\,
	combout => \A5~53_combout\);

-- Location: FF_X18_Y15_N15
\A5[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \A5~53_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => A5(20));

-- Location: LCCOMB_X18_Y17_N8
\Add3~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~40_combout\ = (A5(20) & (!\Add3~39\ & VCC)) # (!A5(20) & (\Add3~39\ $ (GND)))
-- \Add3~41\ = CARRY((!A5(20) & !\Add3~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => A5(20),
	datad => VCC,
	cin => \Add3~39\,
	combout => \Add3~40_combout\,
	cout => \Add3~41\);

-- Location: LCCOMB_X21_Y15_N8
\Add6~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add6~38_combout\ = (ra(19) & ((\Add6~37\) # (GND))) # (!ra(19) & (!\Add6~37\))
-- \Add6~39\ = CARRY((ra(19)) # (!\Add6~37\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => ra(19),
	datad => VCC,
	cin => \Add6~37\,
	combout => \Add6~38_combout\,
	cout => \Add6~39\);

-- Location: LCCOMB_X26_Y15_N8
\Add2~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~38_combout\ = (A3(19) & ((\Add2~37\) # (GND))) # (!A3(19) & (!\Add2~37\))
-- \Add2~39\ = CARRY((A3(19)) # (!\Add2~37\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => A3(19),
	datad => VCC,
	cin => \Add2~37\,
	combout => \Add2~38_combout\,
	cout => \Add2~39\);

-- Location: LCCOMB_X19_Y15_N20
\p~194\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~194_combout\ = (\Add0~1_combout\ & ((\Add0~4_combout\) # ((\Add6~38_combout\)))) # (!\Add0~1_combout\ & (!\Add0~4_combout\ & ((\Add2~38_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~1_combout\,
	datab => \Add0~4_combout\,
	datac => \Add6~38_combout\,
	datad => \Add2~38_combout\,
	combout => \p~194_combout\);

-- Location: LCCOMB_X19_Y15_N22
\p~195\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~195_combout\ = (\Add0~4_combout\ & ((\p~194_combout\ & (\Add7~40_combout\)) # (!\p~194_combout\ & ((\Add3~40_combout\))))) # (!\Add0~4_combout\ & (((\p~194_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add7~40_combout\,
	datab => \Add0~4_combout\,
	datac => \Add3~40_combout\,
	datad => \p~194_combout\,
	combout => \p~195_combout\);

-- Location: FF_X19_Y15_N13
\p[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \p~196_combout\,
	ena => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => p(20));

-- Location: LCCOMB_X22_Y13_N28
\p~189\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~189_combout\ = (\Add0~1_combout\ & ((A3(19)) # ((\Add0~4_combout\)))) # (!\Add0~1_combout\ & (((ra(19) & !\Add0~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => A3(19),
	datab => ra(19),
	datac => \Add0~1_combout\,
	datad => \Add0~4_combout\,
	combout => \p~189_combout\);

-- Location: LCCOMB_X22_Y13_N6
\p~190\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~190_combout\ = (\Add0~4_combout\ & ((\p~189_combout\ & (A7(20))) # (!\p~189_combout\ & ((A3(20)))))) # (!\Add0~4_combout\ & (((\p~189_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => A7(20),
	datab => \Add0~4_combout\,
	datac => A3(20),
	datad => \p~189_combout\,
	combout => \p~190_combout\);

-- Location: LCCOMB_X22_Y13_N0
\p~191\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~191_combout\ = (\p~20_combout\ & (((\p~190_combout\) # (!\p~19_combout\)))) # (!\p~20_combout\ & (ra(18) & (\p~19_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \p~20_combout\,
	datab => ra(18),
	datac => \p~19_combout\,
	datad => \p~190_combout\,
	combout => \p~191_combout\);

-- Location: LCCOMB_X22_Y13_N30
\p~192\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~192_combout\ = (\p~16_combout\ & ((\p~191_combout\ & ((A5(20)))) # (!\p~191_combout\ & (ra(20))))) # (!\p~16_combout\ & (((\p~191_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => ra(20),
	datab => A5(20),
	datac => \p~16_combout\,
	datad => \p~191_combout\,
	combout => \p~192_combout\);

-- Location: LCCOMB_X19_Y15_N2
\p~193\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~193_combout\ = (\p~11_combout\ & (((\p~13_combout\)))) # (!\p~11_combout\ & ((\p~13_combout\ & (p(20))) # (!\p~13_combout\ & ((\p~192_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => p(20),
	datab => \p~11_combout\,
	datac => \p~13_combout\,
	datad => \p~192_combout\,
	combout => \p~193_combout\);

-- Location: LCCOMB_X19_Y15_N12
\p~196\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~196_combout\ = (\p~11_combout\ & ((\p~193_combout\ & ((\p~195_combout\))) # (!\p~193_combout\ & (\p~188_combout\)))) # (!\p~11_combout\ & (((\p~193_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \p~188_combout\,
	datab => \p~11_combout\,
	datac => \p~195_combout\,
	datad => \p~193_combout\,
	combout => \p~196_combout\);

-- Location: LCCOMB_X23_Y15_N8
\acc[20]~74\ : cycloneive_lcell_comb
-- Equation(s):
-- \acc[20]~74_combout\ = ((\p~196_combout\ $ (acc(20) $ (!\acc[19]~73\)))) # (GND)
-- \acc[20]~75\ = CARRY((\p~196_combout\ & ((acc(20)) # (!\acc[19]~73\))) # (!\p~196_combout\ & (acc(20) & !\acc[19]~73\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \p~196_combout\,
	datab => acc(20),
	datad => VCC,
	cin => \acc[19]~73\,
	combout => \acc[20]~74_combout\,
	cout => \acc[20]~75\);

-- Location: FF_X23_Y15_N9
\acc[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \acc[20]~74_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	sclr => \ld_clr~0_combout\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => acc(20));

-- Location: LCCOMB_X22_Y13_N4
\ra~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \ra~21_combout\ = (\cs~q\ & (ra(17) & ((\rcarry~q\) # (\end_op~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \cs~q\,
	datab => ra(17),
	datac => \rcarry~q\,
	datad => \end_op~4_combout\,
	combout => \ra~21_combout\);

-- Location: FF_X22_Y13_N5
\ra[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \ra~21_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ra(21));

-- Location: LCCOMB_X24_Y17_N2
\A5~54\ : cycloneive_lcell_comb
-- Equation(s):
-- \A5~54_combout\ = (A5(17) & ((\cs~q\) # (!\start~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => A5(17),
	datac => \cs~q\,
	datad => \start~input_o\,
	combout => \A5~54_combout\);

-- Location: FF_X18_Y17_N15
\A5[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \A5~54_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => A5(21));

-- Location: LCCOMB_X24_Y19_N4
\A7~82\ : cycloneive_lcell_comb
-- Equation(s):
-- \A7~82_combout\ = (\cs~q\ & (((A7(17))))) # (!\cs~q\ & ((\start~input_o\ & (\Add10~38_combout\)) # (!\start~input_o\ & ((A7(17))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \cs~q\,
	datab => \Add10~38_combout\,
	datac => A7(17),
	datad => \start~input_o\,
	combout => \A7~82_combout\);

-- Location: FF_X24_Y19_N5
\A7[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \A7~82_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => A7(21));

-- Location: LCCOMB_X25_Y17_N22
\A3~55\ : cycloneive_lcell_comb
-- Equation(s):
-- \A3~55_combout\ = (A3(17) & ((\cs~q\) # (!\start~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \cs~q\,
	datab => A3(17),
	datad => \start~input_o\,
	combout => \A3~55_combout\);

-- Location: FF_X25_Y17_N23
\A3[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \A3~55_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => A3(21));

-- Location: LCCOMB_X25_Y19_N12
\p~199\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~199_combout\ = (\Add0~1_combout\ & (\Add0~4_combout\)) # (!\Add0~1_combout\ & ((\Add0~4_combout\ & (A3(21))) # (!\Add0~4_combout\ & ((ra(20))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~1_combout\,
	datab => \Add0~4_combout\,
	datac => A3(21),
	datad => ra(20),
	combout => \p~199_combout\);

-- Location: LCCOMB_X25_Y19_N30
\p~200\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~200_combout\ = (\Add0~1_combout\ & ((\p~199_combout\ & (A7(21))) # (!\p~199_combout\ & ((A3(20)))))) # (!\Add0~1_combout\ & (((\p~199_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => A7(21),
	datab => A3(20),
	datac => \Add0~1_combout\,
	datad => \p~199_combout\,
	combout => \p~200_combout\);

-- Location: LCCOMB_X25_Y19_N24
\p~201\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~201_combout\ = (\p~20_combout\ & (((\p~200_combout\)) # (!\p~19_combout\))) # (!\p~20_combout\ & (\p~19_combout\ & ((ra(19)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011010100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \p~20_combout\,
	datab => \p~19_combout\,
	datac => \p~200_combout\,
	datad => ra(19),
	combout => \p~201_combout\);

-- Location: LCCOMB_X25_Y19_N10
\p~202\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~202_combout\ = (\p~16_combout\ & ((\p~201_combout\ & ((A5(21)))) # (!\p~201_combout\ & (ra(21))))) # (!\p~16_combout\ & (((\p~201_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => ra(21),
	datab => A5(21),
	datac => \p~16_combout\,
	datad => \p~201_combout\,
	combout => \p~202_combout\);

-- Location: LCCOMB_X23_Y19_N10
\Add1~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~42_combout\ = (A7(21) & ((\Add1~41\) # (GND))) # (!A7(21) & (!\Add1~41\))
-- \Add1~43\ = CARRY((A7(21)) # (!\Add1~41\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => A7(21),
	datad => VCC,
	cin => \Add1~41\,
	combout => \Add1~42_combout\,
	cout => \Add1~43\);

-- Location: LCCOMB_X21_Y17_N8
\Add4~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add4~38_combout\ = (ra(19) & ((\Add4~37\) # (GND))) # (!ra(19) & (!\Add4~37\))
-- \Add4~39\ = CARRY((ra(19)) # (!\Add4~37\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => ra(19),
	datad => VCC,
	cin => \Add4~37\,
	combout => \Add4~38_combout\,
	cout => \Add4~39\);

-- Location: LCCOMB_X22_Y19_N26
\p~197\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~197_combout\ = (\Add0~4_combout\ & (((\Add0~1_combout\)))) # (!\Add0~4_combout\ & ((\Add0~1_combout\ & ((\Add4~38_combout\))) # (!\Add0~1_combout\ & (ra(18)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~4_combout\,
	datab => ra(18),
	datac => \Add0~1_combout\,
	datad => \Add4~38_combout\,
	combout => \p~197_combout\);

-- Location: LCCOMB_X26_Y17_N10
\Add5~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add5~42_combout\ = (A3(21) & ((\Add5~41\) # (GND))) # (!A3(21) & (!\Add5~41\))
-- \Add5~43\ = CARRY((A3(21)) # (!\Add5~41\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => A3(21),
	datad => VCC,
	cin => \Add5~41\,
	combout => \Add5~42_combout\,
	cout => \Add5~43\);

-- Location: LCCOMB_X22_Y19_N12
\p~198\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~198_combout\ = (\Add0~4_combout\ & ((\p~197_combout\ & ((\Add5~42_combout\))) # (!\p~197_combout\ & (\Add1~42_combout\)))) # (!\Add0~4_combout\ & (((\p~197_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100001011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~4_combout\,
	datab => \Add1~42_combout\,
	datac => \p~197_combout\,
	datad => \Add5~42_combout\,
	combout => \p~198_combout\);

-- Location: LCCOMB_X22_Y19_N10
\p~203\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~203_combout\ = (\p~11_combout\ & (((\p~13_combout\) # (\p~198_combout\)))) # (!\p~11_combout\ & (\p~202_combout\ & (!\p~13_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \p~11_combout\,
	datab => \p~202_combout\,
	datac => \p~13_combout\,
	datad => \p~198_combout\,
	combout => \p~203_combout\);

-- Location: FF_X22_Y19_N25
\p[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \p~206_combout\,
	ena => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => p(21));

-- Location: LCCOMB_X21_Y15_N10
\Add6~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add6~40_combout\ = (ra(20) & (!\Add6~39\ & VCC)) # (!ra(20) & (\Add6~39\ $ (GND)))
-- \Add6~41\ = CARRY((!ra(20) & !\Add6~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => ra(20),
	datad => VCC,
	cin => \Add6~39\,
	combout => \Add6~40_combout\,
	cout => \Add6~41\);

-- Location: LCCOMB_X23_Y13_N10
\Add7~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add7~42_combout\ = (ra(21) & ((\Add7~41\) # (GND))) # (!ra(21) & (!\Add7~41\))
-- \Add7~43\ = CARRY((ra(21)) # (!\Add7~41\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => ra(21),
	datad => VCC,
	cin => \Add7~41\,
	combout => \Add7~42_combout\,
	cout => \Add7~43\);

-- Location: LCCOMB_X26_Y15_N10
\Add2~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~40_combout\ = (A3(20) & (!\Add2~39\ & VCC)) # (!A3(20) & (\Add2~39\ $ (GND)))
-- \Add2~41\ = CARRY((!A3(20) & !\Add2~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => A3(20),
	datad => VCC,
	cin => \Add2~39\,
	combout => \Add2~40_combout\,
	cout => \Add2~41\);

-- Location: LCCOMB_X18_Y17_N10
\Add3~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~42_combout\ = (A5(21) & ((\Add3~41\) # (GND))) # (!A5(21) & (!\Add3~41\))
-- \Add3~43\ = CARRY((A5(21)) # (!\Add3~41\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => A5(21),
	datad => VCC,
	cin => \Add3~41\,
	combout => \Add3~42_combout\,
	cout => \Add3~43\);

-- Location: LCCOMB_X22_Y19_N16
\p~204\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~204_combout\ = (\Add0~4_combout\ & ((\Add0~1_combout\) # ((\Add3~42_combout\)))) # (!\Add0~4_combout\ & (!\Add0~1_combout\ & (\Add2~40_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~4_combout\,
	datab => \Add0~1_combout\,
	datac => \Add2~40_combout\,
	datad => \Add3~42_combout\,
	combout => \p~204_combout\);

-- Location: LCCOMB_X22_Y19_N30
\p~205\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~205_combout\ = (\Add0~1_combout\ & ((\p~204_combout\ & ((\Add7~42_combout\))) # (!\p~204_combout\ & (\Add6~40_combout\)))) # (!\Add0~1_combout\ & (((\p~204_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~1_combout\,
	datab => \Add6~40_combout\,
	datac => \Add7~42_combout\,
	datad => \p~204_combout\,
	combout => \p~205_combout\);

-- Location: LCCOMB_X22_Y19_N24
\p~206\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~206_combout\ = (\p~203_combout\ & (((\p~205_combout\)) # (!\p~13_combout\))) # (!\p~203_combout\ & (\p~13_combout\ & (p(21))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \p~203_combout\,
	datab => \p~13_combout\,
	datac => p(21),
	datad => \p~205_combout\,
	combout => \p~206_combout\);

-- Location: LCCOMB_X23_Y15_N10
\acc[21]~76\ : cycloneive_lcell_comb
-- Equation(s):
-- \acc[21]~76_combout\ = (\p~206_combout\ & ((acc(21) & (\acc[20]~75\ & VCC)) # (!acc(21) & (!\acc[20]~75\)))) # (!\p~206_combout\ & ((acc(21) & (!\acc[20]~75\)) # (!acc(21) & ((\acc[20]~75\) # (GND)))))
-- \acc[21]~77\ = CARRY((\p~206_combout\ & (!acc(21) & !\acc[20]~75\)) # (!\p~206_combout\ & ((!\acc[20]~75\) # (!acc(21)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \p~206_combout\,
	datab => acc(21),
	datad => VCC,
	cin => \acc[20]~75\,
	combout => \acc[21]~76_combout\,
	cout => \acc[21]~77\);

-- Location: FF_X23_Y15_N11
\acc[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \acc[21]~76_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	sclr => \ld_clr~0_combout\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => acc(21));

-- Location: FF_X22_Y19_N15
\p[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \p~216_combout\,
	ena => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => p(22));

-- Location: LCCOMB_X24_Y17_N28
\ra~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \ra~22_combout\ = (ra(18) & (\cs~q\ & ((\end_op~4_combout\) # (\rcarry~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => ra(18),
	datab => \end_op~4_combout\,
	datac => \cs~q\,
	datad => \rcarry~q\,
	combout => \ra~22_combout\);

-- Location: FF_X24_Y17_N29
\ra[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \ra~22_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ra(22));

-- Location: LCCOMB_X19_Y17_N30
\A5~55\ : cycloneive_lcell_comb
-- Equation(s):
-- \A5~55_combout\ = (A5(18) & ((\cs~q\) # (!\start~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \cs~q\,
	datab => A5(18),
	datad => \start~input_o\,
	combout => \A5~55_combout\);

-- Location: FF_X18_Y17_N17
\A5[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \A5~55_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => A5(22));

-- Location: LCCOMB_X28_Y17_N10
\A3~56\ : cycloneive_lcell_comb
-- Equation(s):
-- \A3~56_combout\ = (A3(18) & ((\cs~q\) # (!\start~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \cs~q\,
	datac => A3(18),
	datad => \start~input_o\,
	combout => \A3~56_combout\);

-- Location: FF_X26_Y17_N17
\A3[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \A3~56_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => A3(22));

-- Location: LCCOMB_X24_Y19_N10
\A7~83\ : cycloneive_lcell_comb
-- Equation(s):
-- \A7~83_combout\ = (\cs~q\ & (((A7(18))))) # (!\cs~q\ & ((\start~input_o\ & (\Add10~38_combout\)) # (!\start~input_o\ & ((A7(18))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \cs~q\,
	datab => \Add10~38_combout\,
	datac => A7(18),
	datad => \start~input_o\,
	combout => \A7~83_combout\);

-- Location: FF_X23_Y19_N5
\A7[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \A7~83_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => A7(22));

-- Location: LCCOMB_X25_Y19_N28
\p~209\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~209_combout\ = (\Add0~1_combout\ & ((\Add0~4_combout\) # ((A3(21))))) # (!\Add0~1_combout\ & (!\Add0~4_combout\ & ((ra(21)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~1_combout\,
	datab => \Add0~4_combout\,
	datac => A3(21),
	datad => ra(21),
	combout => \p~209_combout\);

-- Location: LCCOMB_X25_Y19_N18
\p~210\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~210_combout\ = (\Add0~4_combout\ & ((\p~209_combout\ & ((A7(22)))) # (!\p~209_combout\ & (A3(22))))) # (!\Add0~4_combout\ & (((\p~209_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => A3(22),
	datab => \Add0~4_combout\,
	datac => A7(22),
	datad => \p~209_combout\,
	combout => \p~210_combout\);

-- Location: LCCOMB_X25_Y19_N0
\p~211\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~211_combout\ = (\p~20_combout\ & (((\p~210_combout\)) # (!\p~19_combout\))) # (!\p~20_combout\ & (\p~19_combout\ & (ra(20))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \p~20_combout\,
	datab => \p~19_combout\,
	datac => ra(20),
	datad => \p~210_combout\,
	combout => \p~211_combout\);

-- Location: LCCOMB_X25_Y19_N2
\p~212\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~212_combout\ = (\p~16_combout\ & ((\p~211_combout\ & ((A5(22)))) # (!\p~211_combout\ & (ra(22))))) # (!\p~16_combout\ & (((\p~211_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => ra(22),
	datab => A5(22),
	datac => \p~16_combout\,
	datad => \p~211_combout\,
	combout => \p~212_combout\);

-- Location: LCCOMB_X25_Y19_N20
\p~213\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~213_combout\ = (\p~13_combout\ & ((p(22)) # ((\p~11_combout\)))) # (!\p~13_combout\ & (((\p~212_combout\ & !\p~11_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => p(22),
	datab => \p~212_combout\,
	datac => \p~13_combout\,
	datad => \p~11_combout\,
	combout => \p~213_combout\);

-- Location: LCCOMB_X26_Y17_N12
\Add5~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add5~44_combout\ = (A3(22) & (!\Add5~43\ & VCC)) # (!A3(22) & (\Add5~43\ $ (GND)))
-- \Add5~45\ = CARRY((!A3(22) & !\Add5~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => A3(22),
	datad => VCC,
	cin => \Add5~43\,
	combout => \Add5~44_combout\,
	cout => \Add5~45\);

-- Location: LCCOMB_X23_Y19_N12
\Add1~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~44_combout\ = (A7(22) & (!\Add1~43\ & VCC)) # (!A7(22) & (\Add1~43\ $ (GND)))
-- \Add1~45\ = CARRY((!A7(22) & !\Add1~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => A7(22),
	datad => VCC,
	cin => \Add1~43\,
	combout => \Add1~44_combout\,
	cout => \Add1~45\);

-- Location: LCCOMB_X24_Y19_N26
\p~207\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~207_combout\ = (\Add0~1_combout\ & (\Add0~4_combout\)) # (!\Add0~1_combout\ & ((\Add0~4_combout\ & ((\Add1~44_combout\))) # (!\Add0~4_combout\ & (ra(19)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~1_combout\,
	datab => \Add0~4_combout\,
	datac => ra(19),
	datad => \Add1~44_combout\,
	combout => \p~207_combout\);

-- Location: LCCOMB_X21_Y17_N10
\Add4~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add4~40_combout\ = (ra(20) & (!\Add4~39\ & VCC)) # (!ra(20) & (\Add4~39\ $ (GND)))
-- \Add4~41\ = CARRY((!ra(20) & !\Add4~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => ra(20),
	datad => VCC,
	cin => \Add4~39\,
	combout => \Add4~40_combout\,
	cout => \Add4~41\);

-- Location: LCCOMB_X22_Y19_N4
\p~208\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~208_combout\ = (\Add0~1_combout\ & ((\p~207_combout\ & (\Add5~44_combout\)) # (!\p~207_combout\ & ((\Add4~40_combout\))))) # (!\Add0~1_combout\ & (((\p~207_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011110010110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add5~44_combout\,
	datab => \Add0~1_combout\,
	datac => \p~207_combout\,
	datad => \Add4~40_combout\,
	combout => \p~208_combout\);

-- Location: LCCOMB_X18_Y17_N12
\Add3~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~44_combout\ = (A5(22) & (!\Add3~43\ & VCC)) # (!A5(22) & (\Add3~43\ $ (GND)))
-- \Add3~45\ = CARRY((!A5(22) & !\Add3~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => A5(22),
	datad => VCC,
	cin => \Add3~43\,
	combout => \Add3~44_combout\,
	cout => \Add3~45\);

-- Location: LCCOMB_X23_Y13_N12
\Add7~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add7~44_combout\ = (ra(22) & (!\Add7~43\ & VCC)) # (!ra(22) & (\Add7~43\ $ (GND)))
-- \Add7~45\ = CARRY((!ra(22) & !\Add7~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => ra(22),
	datad => VCC,
	cin => \Add7~43\,
	combout => \Add7~44_combout\,
	cout => \Add7~45\);

-- Location: LCCOMB_X26_Y15_N12
\Add2~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~42_combout\ = (A3(21) & ((\Add2~41\) # (GND))) # (!A3(21) & (!\Add2~41\))
-- \Add2~43\ = CARRY((A3(21)) # (!\Add2~41\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => A3(21),
	datad => VCC,
	cin => \Add2~41\,
	combout => \Add2~42_combout\,
	cout => \Add2~43\);

-- Location: LCCOMB_X21_Y15_N12
\Add6~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add6~42_combout\ = (ra(21) & ((\Add6~41\) # (GND))) # (!ra(21) & (!\Add6~41\))
-- \Add6~43\ = CARRY((ra(21)) # (!\Add6~41\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => ra(21),
	datad => VCC,
	cin => \Add6~41\,
	combout => \Add6~42_combout\,
	cout => \Add6~43\);

-- Location: LCCOMB_X22_Y19_N0
\p~214\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~214_combout\ = (\Add0~4_combout\ & (\Add0~1_combout\)) # (!\Add0~4_combout\ & ((\Add0~1_combout\ & ((\Add6~42_combout\))) # (!\Add0~1_combout\ & (\Add2~42_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~4_combout\,
	datab => \Add0~1_combout\,
	datac => \Add2~42_combout\,
	datad => \Add6~42_combout\,
	combout => \p~214_combout\);

-- Location: LCCOMB_X22_Y19_N22
\p~215\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~215_combout\ = (\Add0~4_combout\ & ((\p~214_combout\ & ((\Add7~44_combout\))) # (!\p~214_combout\ & (\Add3~44_combout\)))) # (!\Add0~4_combout\ & (((\p~214_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add3~44_combout\,
	datab => \Add0~4_combout\,
	datac => \Add7~44_combout\,
	datad => \p~214_combout\,
	combout => \p~215_combout\);

-- Location: LCCOMB_X22_Y19_N14
\p~216\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~216_combout\ = (\p~213_combout\ & (((\p~215_combout\) # (!\p~11_combout\)))) # (!\p~213_combout\ & (\p~208_combout\ & ((\p~11_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \p~213_combout\,
	datab => \p~208_combout\,
	datac => \p~215_combout\,
	datad => \p~11_combout\,
	combout => \p~216_combout\);

-- Location: LCCOMB_X23_Y15_N12
\acc[22]~78\ : cycloneive_lcell_comb
-- Equation(s):
-- \acc[22]~78_combout\ = ((\p~216_combout\ $ (acc(22) $ (!\acc[21]~77\)))) # (GND)
-- \acc[22]~79\ = CARRY((\p~216_combout\ & ((acc(22)) # (!\acc[21]~77\))) # (!\p~216_combout\ & (acc(22) & !\acc[21]~77\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \p~216_combout\,
	datab => acc(22),
	datad => VCC,
	cin => \acc[21]~77\,
	combout => \acc[22]~78_combout\,
	cout => \acc[22]~79\);

-- Location: FF_X23_Y15_N13
\acc[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \acc[22]~78_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	sclr => \ld_clr~0_combout\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => acc(22));

-- Location: LCCOMB_X21_Y15_N14
\Add6~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add6~44_combout\ = (ra(22) & (!\Add6~43\ & VCC)) # (!ra(22) & (\Add6~43\ $ (GND)))
-- \Add6~45\ = CARRY((!ra(22) & !\Add6~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => ra(22),
	datad => VCC,
	cin => \Add6~43\,
	combout => \Add6~44_combout\,
	cout => \Add6~45\);

-- Location: LCCOMB_X24_Y17_N10
\ra~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \ra~23_combout\ = (ra(19) & (\cs~q\ & ((\rcarry~q\) # (\end_op~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rcarry~q\,
	datab => ra(19),
	datac => \end_op~4_combout\,
	datad => \cs~q\,
	combout => \ra~23_combout\);

-- Location: FF_X24_Y17_N11
\ra[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \ra~23_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ra(23));

-- Location: LCCOMB_X23_Y13_N14
\Add7~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add7~46_combout\ = (ra(23) & ((\Add7~45\) # (GND))) # (!ra(23) & (!\Add7~45\))
-- \Add7~47\ = CARRY((ra(23)) # (!\Add7~45\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => ra(23),
	datad => VCC,
	cin => \Add7~45\,
	combout => \Add7~46_combout\,
	cout => \Add7~47\);

-- Location: LCCOMB_X18_Y15_N4
\A5~56\ : cycloneive_lcell_comb
-- Equation(s):
-- \A5~56_combout\ = (A5(19) & ((\cs~q\) # (!\start~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => A5(19),
	datac => \cs~q\,
	datad => \start~input_o\,
	combout => \A5~56_combout\);

-- Location: FF_X18_Y17_N31
\A5[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \A5~56_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => A5(23));

-- Location: LCCOMB_X18_Y17_N14
\Add3~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~46_combout\ = (A5(23) & ((\Add3~45\) # (GND))) # (!A5(23) & (!\Add3~45\))
-- \Add3~47\ = CARRY((A5(23)) # (!\Add3~45\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => A5(23),
	datad => VCC,
	cin => \Add3~45\,
	combout => \Add3~46_combout\,
	cout => \Add3~47\);

-- Location: LCCOMB_X26_Y15_N14
\Add2~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~44_combout\ = (A3(22) & (!\Add2~43\ & VCC)) # (!A3(22) & (\Add2~43\ $ (GND)))
-- \Add2~45\ = CARRY((!A3(22) & !\Add2~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => A3(22),
	datad => VCC,
	cin => \Add2~43\,
	combout => \Add2~44_combout\,
	cout => \Add2~45\);

-- Location: LCCOMB_X23_Y17_N18
\p~224\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~224_combout\ = (\Add0~4_combout\ & ((\Add0~1_combout\) # ((\Add3~46_combout\)))) # (!\Add0~4_combout\ & (!\Add0~1_combout\ & ((\Add2~44_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~4_combout\,
	datab => \Add0~1_combout\,
	datac => \Add3~46_combout\,
	datad => \Add2~44_combout\,
	combout => \p~224_combout\);

-- Location: LCCOMB_X23_Y17_N16
\p~225\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~225_combout\ = (\Add0~1_combout\ & ((\p~224_combout\ & ((\Add7~46_combout\))) # (!\p~224_combout\ & (\Add6~44_combout\)))) # (!\Add0~1_combout\ & (((\p~224_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add6~44_combout\,
	datab => \Add0~1_combout\,
	datac => \Add7~46_combout\,
	datad => \p~224_combout\,
	combout => \p~225_combout\);

-- Location: FF_X23_Y17_N21
\p[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \p~226_combout\,
	ena => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => p(23));

-- Location: LCCOMB_X26_Y19_N2
\A7~84\ : cycloneive_lcell_comb
-- Equation(s):
-- \A7~84_combout\ = (\cs~q\ & (A7(19))) # (!\cs~q\ & ((\start~input_o\ & ((\Add10~38_combout\))) # (!\start~input_o\ & (A7(19)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \cs~q\,
	datab => A7(19),
	datac => \Add10~38_combout\,
	datad => \start~input_o\,
	combout => \A7~84_combout\);

-- Location: FF_X26_Y19_N3
\A7[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \A7~84_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => A7(23));

-- Location: LCCOMB_X25_Y15_N24
\A3~57\ : cycloneive_lcell_comb
-- Equation(s):
-- \A3~57_combout\ = (A3(19) & ((\cs~q\) # (!\start~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => A3(19),
	datac => \cs~q\,
	datad => \start~input_o\,
	combout => \A3~57_combout\);

-- Location: FF_X25_Y15_N25
\A3[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \A3~57_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => A3(23));

-- Location: LCCOMB_X25_Y19_N26
\p~219\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~219_combout\ = (\Add0~1_combout\ & (((\Add0~4_combout\)))) # (!\Add0~1_combout\ & ((\Add0~4_combout\ & ((A3(23)))) # (!\Add0~4_combout\ & (ra(22)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => ra(22),
	datab => A3(23),
	datac => \Add0~1_combout\,
	datad => \Add0~4_combout\,
	combout => \p~219_combout\);

-- Location: LCCOMB_X25_Y19_N4
\p~220\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~220_combout\ = (\Add0~1_combout\ & ((\p~219_combout\ & (A7(23))) # (!\p~219_combout\ & ((A3(22)))))) # (!\Add0~1_combout\ & (((\p~219_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101101011010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~1_combout\,
	datab => A7(23),
	datac => \p~219_combout\,
	datad => A3(22),
	combout => \p~220_combout\);

-- Location: LCCOMB_X25_Y19_N14
\p~221\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~221_combout\ = (\p~19_combout\ & ((\p~20_combout\ & ((\p~220_combout\))) # (!\p~20_combout\ & (ra(21))))) # (!\p~19_combout\ & (((\p~20_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => ra(21),
	datab => \p~19_combout\,
	datac => \p~220_combout\,
	datad => \p~20_combout\,
	combout => \p~221_combout\);

-- Location: LCCOMB_X23_Y17_N22
\p~222\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~222_combout\ = (\p~16_combout\ & ((\p~221_combout\ & ((A5(23)))) # (!\p~221_combout\ & (ra(23))))) # (!\p~16_combout\ & (((\p~221_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => ra(23),
	datab => A5(23),
	datac => \p~16_combout\,
	datad => \p~221_combout\,
	combout => \p~222_combout\);

-- Location: LCCOMB_X23_Y19_N14
\Add1~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~46_combout\ = (A7(23) & ((\Add1~45\) # (GND))) # (!A7(23) & (!\Add1~45\))
-- \Add1~47\ = CARRY((A7(23)) # (!\Add1~45\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => A7(23),
	datad => VCC,
	cin => \Add1~45\,
	combout => \Add1~46_combout\,
	cout => \Add1~47\);

-- Location: LCCOMB_X21_Y17_N12
\Add4~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add4~42_combout\ = (ra(21) & ((\Add4~41\) # (GND))) # (!ra(21) & (!\Add4~41\))
-- \Add4~43\ = CARRY((ra(21)) # (!\Add4~41\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => ra(21),
	datad => VCC,
	cin => \Add4~41\,
	combout => \Add4~42_combout\,
	cout => \Add4~43\);

-- Location: LCCOMB_X23_Y17_N26
\p~217\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~217_combout\ = (\Add0~4_combout\ & (\Add0~1_combout\)) # (!\Add0~4_combout\ & ((\Add0~1_combout\ & ((\Add4~42_combout\))) # (!\Add0~1_combout\ & (ra(20)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~4_combout\,
	datab => \Add0~1_combout\,
	datac => ra(20),
	datad => \Add4~42_combout\,
	combout => \p~217_combout\);

-- Location: LCCOMB_X26_Y17_N14
\Add5~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add5~46_combout\ = (A3(23) & ((\Add5~45\) # (GND))) # (!A3(23) & (!\Add5~45\))
-- \Add5~47\ = CARRY((A3(23)) # (!\Add5~45\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => A3(23),
	datad => VCC,
	cin => \Add5~45\,
	combout => \Add5~46_combout\,
	cout => \Add5~47\);

-- Location: LCCOMB_X23_Y17_N12
\p~218\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~218_combout\ = (\Add0~4_combout\ & ((\p~217_combout\ & ((\Add5~46_combout\))) # (!\p~217_combout\ & (\Add1~46_combout\)))) # (!\Add0~4_combout\ & (((\p~217_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100001011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~4_combout\,
	datab => \Add1~46_combout\,
	datac => \p~217_combout\,
	datad => \Add5~46_combout\,
	combout => \p~218_combout\);

-- Location: LCCOMB_X23_Y17_N0
\p~223\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~223_combout\ = (\p~11_combout\ & ((\p~13_combout\) # ((\p~218_combout\)))) # (!\p~11_combout\ & (!\p~13_combout\ & (\p~222_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \p~11_combout\,
	datab => \p~13_combout\,
	datac => \p~222_combout\,
	datad => \p~218_combout\,
	combout => \p~223_combout\);

-- Location: LCCOMB_X23_Y17_N20
\p~226\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~226_combout\ = (\p~13_combout\ & ((\p~223_combout\ & (\p~225_combout\)) # (!\p~223_combout\ & ((p(23)))))) # (!\p~13_combout\ & (((\p~223_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \p~13_combout\,
	datab => \p~225_combout\,
	datac => p(23),
	datad => \p~223_combout\,
	combout => \p~226_combout\);

-- Location: LCCOMB_X23_Y15_N14
\acc[23]~80\ : cycloneive_lcell_comb
-- Equation(s):
-- \acc[23]~80_combout\ = (\p~226_combout\ & ((acc(23) & (\acc[22]~79\ & VCC)) # (!acc(23) & (!\acc[22]~79\)))) # (!\p~226_combout\ & ((acc(23) & (!\acc[22]~79\)) # (!acc(23) & ((\acc[22]~79\) # (GND)))))
-- \acc[23]~81\ = CARRY((\p~226_combout\ & (!acc(23) & !\acc[22]~79\)) # (!\p~226_combout\ & ((!\acc[22]~79\) # (!acc(23)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \p~226_combout\,
	datab => acc(23),
	datad => VCC,
	cin => \acc[22]~79\,
	combout => \acc[23]~80_combout\,
	cout => \acc[23]~81\);

-- Location: FF_X23_Y15_N15
\acc[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \acc[23]~80_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	sclr => \ld_clr~0_combout\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => acc(23));

-- Location: LCCOMB_X28_Y17_N24
\A3~58\ : cycloneive_lcell_comb
-- Equation(s):
-- \A3~58_combout\ = (A3(20) & ((\cs~q\) # (!\start~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => A3(20),
	datac => \cs~q\,
	datad => \start~input_o\,
	combout => \A3~58_combout\);

-- Location: FF_X26_Y17_N23
\A3[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \A3~58_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => A3(24));

-- Location: LCCOMB_X26_Y17_N16
\Add5~48\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add5~48_combout\ = (A3(24) & (!\Add5~47\ & VCC)) # (!A3(24) & (\Add5~47\ $ (GND)))
-- \Add5~49\ = CARRY((!A3(24) & !\Add5~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => A3(24),
	datad => VCC,
	cin => \Add5~47\,
	combout => \Add5~48_combout\,
	cout => \Add5~49\);

-- Location: LCCOMB_X21_Y17_N14
\Add4~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add4~44_combout\ = (ra(22) & (!\Add4~43\ & VCC)) # (!ra(22) & (\Add4~43\ $ (GND)))
-- \Add4~45\ = CARRY((!ra(22) & !\Add4~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => ra(22),
	datad => VCC,
	cin => \Add4~43\,
	combout => \Add4~44_combout\,
	cout => \Add4~45\);

-- Location: LCCOMB_X26_Y19_N22
\A7~85\ : cycloneive_lcell_comb
-- Equation(s):
-- \A7~85_combout\ = (\cs~q\ & (A7(20))) # (!\cs~q\ & ((\start~input_o\ & ((\Add10~38_combout\))) # (!\start~input_o\ & (A7(20)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \cs~q\,
	datab => A7(20),
	datac => \Add10~38_combout\,
	datad => \start~input_o\,
	combout => \A7~85_combout\);

-- Location: FF_X23_Y19_N1
\A7[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \A7~85_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => A7(24));

-- Location: LCCOMB_X23_Y19_N16
\Add1~48\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~48_combout\ = (A7(24) & (!\Add1~47\ & VCC)) # (!A7(24) & (\Add1~47\ $ (GND)))
-- \Add1~49\ = CARRY((!A7(24) & !\Add1~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => A7(24),
	datad => VCC,
	cin => \Add1~47\,
	combout => \Add1~48_combout\,
	cout => \Add1~49\);

-- Location: LCCOMB_X23_Y17_N6
\p~227\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~227_combout\ = (\Add0~4_combout\ & ((\Add0~1_combout\) # ((\Add1~48_combout\)))) # (!\Add0~4_combout\ & (!\Add0~1_combout\ & (ra(21))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~4_combout\,
	datab => \Add0~1_combout\,
	datac => ra(21),
	datad => \Add1~48_combout\,
	combout => \p~227_combout\);

-- Location: LCCOMB_X23_Y17_N8
\p~228\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~228_combout\ = (\Add0~1_combout\ & ((\p~227_combout\ & (\Add5~48_combout\)) # (!\p~227_combout\ & ((\Add4~44_combout\))))) # (!\Add0~1_combout\ & (((\p~227_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add5~48_combout\,
	datab => \Add0~1_combout\,
	datac => \Add4~44_combout\,
	datad => \p~227_combout\,
	combout => \p~228_combout\);

-- Location: FF_X23_Y17_N15
\p[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \p~236_combout\,
	ena => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => p(24));

-- Location: LCCOMB_X22_Y13_N22
\ra~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \ra~24_combout\ = (ra(20) & (\cs~q\ & ((\rcarry~q\) # (\end_op~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rcarry~q\,
	datab => \end_op~4_combout\,
	datac => ra(20),
	datad => \cs~q\,
	combout => \ra~24_combout\);

-- Location: FF_X22_Y13_N23
\ra[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \ra~24_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ra(24));

-- Location: LCCOMB_X18_Y15_N16
\A5~57\ : cycloneive_lcell_comb
-- Equation(s):
-- \A5~57_combout\ = (A5(20) & ((\cs~q\) # (!\start~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \cs~q\,
	datac => A5(20),
	datad => \start~input_o\,
	combout => \A5~57_combout\);

-- Location: FF_X18_Y15_N17
\A5[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \A5~57_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => A5(24));

-- Location: LCCOMB_X25_Y19_N16
\p~229\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~229_combout\ = (\Add0~1_combout\ & (((A3(23)) # (\Add0~4_combout\)))) # (!\Add0~1_combout\ & (ra(23) & ((!\Add0~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => ra(23),
	datab => A3(23),
	datac => \Add0~1_combout\,
	datad => \Add0~4_combout\,
	combout => \p~229_combout\);

-- Location: LCCOMB_X25_Y19_N22
\p~230\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~230_combout\ = (\Add0~4_combout\ & ((\p~229_combout\ & (A7(24))) # (!\p~229_combout\ & ((A3(24)))))) # (!\Add0~4_combout\ & (((\p~229_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => A7(24),
	datab => \Add0~4_combout\,
	datac => A3(24),
	datad => \p~229_combout\,
	combout => \p~230_combout\);

-- Location: LCCOMB_X25_Y19_N8
\p~231\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~231_combout\ = (\p~19_combout\ & ((\p~20_combout\ & ((\p~230_combout\))) # (!\p~20_combout\ & (ra(22))))) # (!\p~19_combout\ & (((\p~20_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => ra(22),
	datab => \p~19_combout\,
	datac => \p~230_combout\,
	datad => \p~20_combout\,
	combout => \p~231_combout\);

-- Location: LCCOMB_X23_Y17_N4
\p~232\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~232_combout\ = (\p~16_combout\ & ((\p~231_combout\ & ((A5(24)))) # (!\p~231_combout\ & (ra(24))))) # (!\p~16_combout\ & (((\p~231_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => ra(24),
	datab => A5(24),
	datac => \p~16_combout\,
	datad => \p~231_combout\,
	combout => \p~232_combout\);

-- Location: LCCOMB_X23_Y17_N30
\p~233\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~233_combout\ = (\p~13_combout\ & ((p(24)) # ((\p~11_combout\)))) # (!\p~13_combout\ & (((\p~232_combout\ & !\p~11_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \p~13_combout\,
	datab => p(24),
	datac => \p~232_combout\,
	datad => \p~11_combout\,
	combout => \p~233_combout\);

-- Location: LCCOMB_X23_Y13_N16
\Add7~48\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add7~48_combout\ = (ra(24) & (!\Add7~47\ & VCC)) # (!ra(24) & (\Add7~47\ $ (GND)))
-- \Add7~49\ = CARRY((!ra(24) & !\Add7~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => ra(24),
	datad => VCC,
	cin => \Add7~47\,
	combout => \Add7~48_combout\,
	cout => \Add7~49\);

-- Location: LCCOMB_X18_Y17_N16
\Add3~48\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~48_combout\ = (A5(24) & (!\Add3~47\ & VCC)) # (!A5(24) & (\Add3~47\ $ (GND)))
-- \Add3~49\ = CARRY((!A5(24) & !\Add3~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => A5(24),
	datad => VCC,
	cin => \Add3~47\,
	combout => \Add3~48_combout\,
	cout => \Add3~49\);

-- Location: LCCOMB_X21_Y15_N16
\Add6~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add6~46_combout\ = (ra(23) & ((\Add6~45\) # (GND))) # (!ra(23) & (!\Add6~45\))
-- \Add6~47\ = CARRY((ra(23)) # (!\Add6~45\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => ra(23),
	datad => VCC,
	cin => \Add6~45\,
	combout => \Add6~46_combout\,
	cout => \Add6~47\);

-- Location: LCCOMB_X26_Y15_N16
\Add2~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~46_combout\ = (A3(23) & ((\Add2~45\) # (GND))) # (!A3(23) & (!\Add2~45\))
-- \Add2~47\ = CARRY((A3(23)) # (!\Add2~45\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => A3(23),
	datad => VCC,
	cin => \Add2~45\,
	combout => \Add2~46_combout\,
	cout => \Add2~47\);

-- Location: LCCOMB_X22_Y15_N0
\p~234\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~234_combout\ = (\Add0~4_combout\ & (\Add0~1_combout\)) # (!\Add0~4_combout\ & ((\Add0~1_combout\ & (\Add6~46_combout\)) # (!\Add0~1_combout\ & ((\Add2~46_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~4_combout\,
	datab => \Add0~1_combout\,
	datac => \Add6~46_combout\,
	datad => \Add2~46_combout\,
	combout => \p~234_combout\);

-- Location: LCCOMB_X22_Y15_N26
\p~235\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~235_combout\ = (\Add0~4_combout\ & ((\p~234_combout\ & (\Add7~48_combout\)) # (!\p~234_combout\ & ((\Add3~48_combout\))))) # (!\Add0~4_combout\ & (((\p~234_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~4_combout\,
	datab => \Add7~48_combout\,
	datac => \Add3~48_combout\,
	datad => \p~234_combout\,
	combout => \p~235_combout\);

-- Location: LCCOMB_X23_Y17_N14
\p~236\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~236_combout\ = (\p~11_combout\ & ((\p~233_combout\ & ((\p~235_combout\))) # (!\p~233_combout\ & (\p~228_combout\)))) # (!\p~11_combout\ & (((\p~233_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100001011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \p~11_combout\,
	datab => \p~228_combout\,
	datac => \p~233_combout\,
	datad => \p~235_combout\,
	combout => \p~236_combout\);

-- Location: LCCOMB_X23_Y15_N16
\acc[24]~82\ : cycloneive_lcell_comb
-- Equation(s):
-- \acc[24]~82_combout\ = ((acc(24) $ (\p~236_combout\ $ (!\acc[23]~81\)))) # (GND)
-- \acc[24]~83\ = CARRY((acc(24) & ((\p~236_combout\) # (!\acc[23]~81\))) # (!acc(24) & (\p~236_combout\ & !\acc[23]~81\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => acc(24),
	datab => \p~236_combout\,
	datad => VCC,
	cin => \acc[23]~81\,
	combout => \acc[24]~82_combout\,
	cout => \acc[24]~83\);

-- Location: FF_X23_Y15_N17
\acc[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \acc[24]~82_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	sclr => \ld_clr~0_combout\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => acc(24));

-- Location: LCCOMB_X21_Y15_N18
\Add6~48\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add6~48_combout\ = (ra(24) & (!\Add6~47\ & VCC)) # (!ra(24) & (\Add6~47\ $ (GND)))
-- \Add6~49\ = CARRY((!ra(24) & !\Add6~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => ra(24),
	datad => VCC,
	cin => \Add6~47\,
	combout => \Add6~48_combout\,
	cout => \Add6~49\);

-- Location: LCCOMB_X24_Y17_N16
\ra~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \ra~25_combout\ = (\cs~q\ & (ra(21) & ((\rcarry~q\) # (\end_op~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rcarry~q\,
	datab => \end_op~4_combout\,
	datac => \cs~q\,
	datad => ra(21),
	combout => \ra~25_combout\);

-- Location: FF_X24_Y17_N17
\ra[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \ra~25_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ra(25));

-- Location: LCCOMB_X23_Y13_N18
\Add7~50\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add7~50_combout\ = (ra(25) & ((\Add7~49\) # (GND))) # (!ra(25) & (!\Add7~49\))
-- \Add7~51\ = CARRY((ra(25)) # (!\Add7~49\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => ra(25),
	datad => VCC,
	cin => \Add7~49\,
	combout => \Add7~50_combout\,
	cout => \Add7~51\);

-- Location: LCCOMB_X19_Y20_N20
\A5~58\ : cycloneive_lcell_comb
-- Equation(s):
-- \A5~58_combout\ = (A5(21) & ((\cs~q\) # (!\start~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000110010001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \cs~q\,
	datab => A5(21),
	datac => \start~input_o\,
	combout => \A5~58_combout\);

-- Location: FF_X18_Y17_N5
\A5[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \A5~58_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => A5(25));

-- Location: LCCOMB_X18_Y17_N18
\Add3~50\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~50_combout\ = (A5(25) & ((\Add3~49\) # (GND))) # (!A5(25) & (!\Add3~49\))
-- \Add3~51\ = CARRY((A5(25)) # (!\Add3~49\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => A5(25),
	datad => VCC,
	cin => \Add3~49\,
	combout => \Add3~50_combout\,
	cout => \Add3~51\);

-- Location: LCCOMB_X26_Y15_N18
\Add2~48\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~48_combout\ = (A3(24) & (!\Add2~47\ & VCC)) # (!A3(24) & (\Add2~47\ $ (GND)))
-- \Add2~49\ = CARRY((!A3(24) & !\Add2~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => A3(24),
	datad => VCC,
	cin => \Add2~47\,
	combout => \Add2~48_combout\,
	cout => \Add2~49\);

-- Location: LCCOMB_X22_Y15_N28
\p~244\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~244_combout\ = (\Add0~4_combout\ & ((\Add0~1_combout\) # ((\Add3~50_combout\)))) # (!\Add0~4_combout\ & (!\Add0~1_combout\ & ((\Add2~48_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~4_combout\,
	datab => \Add0~1_combout\,
	datac => \Add3~50_combout\,
	datad => \Add2~48_combout\,
	combout => \p~244_combout\);

-- Location: LCCOMB_X22_Y15_N10
\p~245\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~245_combout\ = (\Add0~1_combout\ & ((\p~244_combout\ & ((\Add7~50_combout\))) # (!\p~244_combout\ & (\Add6~48_combout\)))) # (!\Add0~1_combout\ & (((\p~244_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~1_combout\,
	datab => \Add6~48_combout\,
	datac => \Add7~50_combout\,
	datad => \p~244_combout\,
	combout => \p~245_combout\);

-- Location: FF_X22_Y15_N21
\p[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \p~246_combout\,
	ena => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => p(25));

-- Location: LCCOMB_X26_Y20_N4
\A7~86\ : cycloneive_lcell_comb
-- Equation(s):
-- \A7~86_combout\ = (\cs~q\ & (A7(21))) # (!\cs~q\ & ((\start~input_o\ & ((\Add10~38_combout\))) # (!\start~input_o\ & (A7(21)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => A7(21),
	datab => \Add10~38_combout\,
	datac => \cs~q\,
	datad => \start~input_o\,
	combout => \A7~86_combout\);

-- Location: FF_X23_Y19_N27
\A7[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \A7~86_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => A7(25));

-- Location: LCCOMB_X26_Y19_N12
\A3~59\ : cycloneive_lcell_comb
-- Equation(s):
-- \A3~59_combout\ = (A3(21) & ((\cs~q\) # (!\start~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \cs~q\,
	datac => A3(21),
	datad => \start~input_o\,
	combout => \A3~59_combout\);

-- Location: FF_X26_Y19_N13
\A3[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \A3~59_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => A3(25));

-- Location: LCCOMB_X28_Y15_N20
\p~239\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~239_combout\ = (\Add0~4_combout\ & ((A3(25)) # ((\Add0~1_combout\)))) # (!\Add0~4_combout\ & (((ra(24) & !\Add0~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~4_combout\,
	datab => A3(25),
	datac => ra(24),
	datad => \Add0~1_combout\,
	combout => \p~239_combout\);

-- Location: LCCOMB_X28_Y15_N18
\p~240\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~240_combout\ = (\Add0~1_combout\ & ((\p~239_combout\ & (A7(25))) # (!\p~239_combout\ & ((A3(24)))))) # (!\Add0~1_combout\ & (((\p~239_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => A7(25),
	datab => \Add0~1_combout\,
	datac => A3(24),
	datad => \p~239_combout\,
	combout => \p~240_combout\);

-- Location: LCCOMB_X28_Y15_N0
\p~241\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~241_combout\ = (\p~19_combout\ & ((\p~20_combout\ & ((\p~240_combout\))) # (!\p~20_combout\ & (ra(23))))) # (!\p~19_combout\ & (((\p~20_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100000111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => ra(23),
	datab => \p~19_combout\,
	datac => \p~20_combout\,
	datad => \p~240_combout\,
	combout => \p~241_combout\);

-- Location: LCCOMB_X28_Y15_N14
\p~242\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~242_combout\ = (\p~16_combout\ & ((\p~241_combout\ & ((A5(25)))) # (!\p~241_combout\ & (ra(25))))) # (!\p~16_combout\ & (((\p~241_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => ra(25),
	datab => \p~16_combout\,
	datac => A5(25),
	datad => \p~241_combout\,
	combout => \p~242_combout\);

-- Location: LCCOMB_X23_Y19_N18
\Add1~50\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~50_combout\ = (A7(25) & ((\Add1~49\) # (GND))) # (!A7(25) & (!\Add1~49\))
-- \Add1~51\ = CARRY((A7(25)) # (!\Add1~49\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => A7(25),
	datad => VCC,
	cin => \Add1~49\,
	combout => \Add1~50_combout\,
	cout => \Add1~51\);

-- Location: LCCOMB_X21_Y17_N16
\Add4~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add4~46_combout\ = (ra(23) & ((\Add4~45\) # (GND))) # (!ra(23) & (!\Add4~45\))
-- \Add4~47\ = CARRY((ra(23)) # (!\Add4~45\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => ra(23),
	datad => VCC,
	cin => \Add4~45\,
	combout => \Add4~46_combout\,
	cout => \Add4~47\);

-- Location: LCCOMB_X22_Y15_N30
\p~237\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~237_combout\ = (\Add0~4_combout\ & (\Add0~1_combout\)) # (!\Add0~4_combout\ & ((\Add0~1_combout\ & (\Add4~46_combout\)) # (!\Add0~1_combout\ & ((ra(22))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~4_combout\,
	datab => \Add0~1_combout\,
	datac => \Add4~46_combout\,
	datad => ra(22),
	combout => \p~237_combout\);

-- Location: LCCOMB_X26_Y17_N18
\Add5~50\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add5~50_combout\ = (A3(25) & ((\Add5~49\) # (GND))) # (!A3(25) & (!\Add5~49\))
-- \Add5~51\ = CARRY((A3(25)) # (!\Add5~49\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => A3(25),
	datad => VCC,
	cin => \Add5~49\,
	combout => \Add5~50_combout\,
	cout => \Add5~51\);

-- Location: LCCOMB_X22_Y15_N24
\p~238\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~238_combout\ = (\Add0~4_combout\ & ((\p~237_combout\ & ((\Add5~50_combout\))) # (!\p~237_combout\ & (\Add1~50_combout\)))) # (!\Add0~4_combout\ & (((\p~237_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100000111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~50_combout\,
	datab => \Add0~4_combout\,
	datac => \p~237_combout\,
	datad => \Add5~50_combout\,
	combout => \p~238_combout\);

-- Location: LCCOMB_X22_Y15_N18
\p~243\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~243_combout\ = (\p~13_combout\ & (\p~11_combout\)) # (!\p~13_combout\ & ((\p~11_combout\ & ((\p~238_combout\))) # (!\p~11_combout\ & (\p~242_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \p~13_combout\,
	datab => \p~11_combout\,
	datac => \p~242_combout\,
	datad => \p~238_combout\,
	combout => \p~243_combout\);

-- Location: LCCOMB_X22_Y15_N20
\p~246\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~246_combout\ = (\p~13_combout\ & ((\p~243_combout\ & (\p~245_combout\)) # (!\p~243_combout\ & ((p(25)))))) # (!\p~13_combout\ & (((\p~243_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \p~245_combout\,
	datab => \p~13_combout\,
	datac => p(25),
	datad => \p~243_combout\,
	combout => \p~246_combout\);

-- Location: LCCOMB_X23_Y15_N18
\acc[25]~84\ : cycloneive_lcell_comb
-- Equation(s):
-- \acc[25]~84_combout\ = (acc(25) & ((\p~246_combout\ & (\acc[24]~83\ & VCC)) # (!\p~246_combout\ & (!\acc[24]~83\)))) # (!acc(25) & ((\p~246_combout\ & (!\acc[24]~83\)) # (!\p~246_combout\ & ((\acc[24]~83\) # (GND)))))
-- \acc[25]~85\ = CARRY((acc(25) & (!\p~246_combout\ & !\acc[24]~83\)) # (!acc(25) & ((!\acc[24]~83\) # (!\p~246_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => acc(25),
	datab => \p~246_combout\,
	datad => VCC,
	cin => \acc[24]~83\,
	combout => \acc[25]~84_combout\,
	cout => \acc[25]~85\);

-- Location: FF_X23_Y15_N19
\acc[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \acc[25]~84_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	sclr => \ld_clr~0_combout\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => acc(25));

-- Location: LCCOMB_X21_Y17_N18
\Add4~48\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add4~48_combout\ = (ra(24) & (!\Add4~47\ & VCC)) # (!ra(24) & (\Add4~47\ $ (GND)))
-- \Add4~49\ = CARRY((!ra(24) & !\Add4~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => ra(24),
	datad => VCC,
	cin => \Add4~47\,
	combout => \Add4~48_combout\,
	cout => \Add4~49\);

-- Location: LCCOMB_X28_Y17_N0
\A3~60\ : cycloneive_lcell_comb
-- Equation(s):
-- \A3~60_combout\ = (A3(22) & ((\cs~q\) # (!\start~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => A3(22),
	datac => \cs~q\,
	datad => \start~input_o\,
	combout => \A3~60_combout\);

-- Location: FF_X28_Y17_N1
\A3[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \A3~60_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => A3(26));

-- Location: LCCOMB_X26_Y17_N20
\Add5~52\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add5~52_combout\ = (A3(26) & (!\Add5~51\ & VCC)) # (!A3(26) & (\Add5~51\ $ (GND)))
-- \Add5~53\ = CARRY((!A3(26) & !\Add5~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => A3(26),
	datad => VCC,
	cin => \Add5~51\,
	combout => \Add5~52_combout\,
	cout => \Add5~53\);

-- Location: LCCOMB_X26_Y19_N14
\A7~87\ : cycloneive_lcell_comb
-- Equation(s):
-- \A7~87_combout\ = (\cs~q\ & (A7(22))) # (!\cs~q\ & ((\start~input_o\ & ((\Add10~38_combout\))) # (!\start~input_o\ & (A7(22)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \cs~q\,
	datab => A7(22),
	datac => \Add10~38_combout\,
	datad => \start~input_o\,
	combout => \A7~87_combout\);

-- Location: FF_X26_Y19_N15
\A7[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \A7~87_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => A7(26));

-- Location: LCCOMB_X23_Y19_N20
\Add1~52\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~52_combout\ = (A7(26) & (!\Add1~51\ & VCC)) # (!A7(26) & (\Add1~51\ $ (GND)))
-- \Add1~53\ = CARRY((!A7(26) & !\Add1~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => A7(26),
	datad => VCC,
	cin => \Add1~51\,
	combout => \Add1~52_combout\,
	cout => \Add1~53\);

-- Location: LCCOMB_X22_Y15_N16
\p~247\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~247_combout\ = (\Add0~1_combout\ & (((\Add0~4_combout\)))) # (!\Add0~1_combout\ & ((\Add0~4_combout\ & ((\Add1~52_combout\))) # (!\Add0~4_combout\ & (ra(23)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => ra(23),
	datab => \Add0~1_combout\,
	datac => \Add0~4_combout\,
	datad => \Add1~52_combout\,
	combout => \p~247_combout\);

-- Location: LCCOMB_X22_Y15_N22
\p~248\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~248_combout\ = (\Add0~1_combout\ & ((\p~247_combout\ & ((\Add5~52_combout\))) # (!\p~247_combout\ & (\Add4~48_combout\)))) # (!\Add0~1_combout\ & (((\p~247_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~1_combout\,
	datab => \Add4~48_combout\,
	datac => \Add5~52_combout\,
	datad => \p~247_combout\,
	combout => \p~248_combout\);

-- Location: FF_X22_Y15_N13
\p[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \p~256_combout\,
	ena => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => p(26));

-- Location: LCCOMB_X18_Y15_N6
\A5~59\ : cycloneive_lcell_comb
-- Equation(s):
-- \A5~59_combout\ = (A5(22) & ((\cs~q\) # (!\start~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => A5(22),
	datac => \cs~q\,
	datad => \start~input_o\,
	combout => \A5~59_combout\);

-- Location: FF_X18_Y15_N7
\A5[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \A5~59_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => A5(26));

-- Location: LCCOMB_X24_Y17_N26
\ra~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \ra~26_combout\ = (\cs~q\ & (ra(22) & ((\rcarry~q\) # (\end_op~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rcarry~q\,
	datab => \end_op~4_combout\,
	datac => \cs~q\,
	datad => ra(22),
	combout => \ra~26_combout\);

-- Location: FF_X24_Y17_N27
\ra[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \ra~26_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ra(26));

-- Location: LCCOMB_X28_Y15_N24
\p~249\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~249_combout\ = (\Add0~4_combout\ & (((\Add0~1_combout\)))) # (!\Add0~4_combout\ & ((\Add0~1_combout\ & (A3(25))) # (!\Add0~1_combout\ & ((ra(25))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~4_combout\,
	datab => A3(25),
	datac => ra(25),
	datad => \Add0~1_combout\,
	combout => \p~249_combout\);

-- Location: LCCOMB_X28_Y15_N6
\p~250\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~250_combout\ = (\Add0~4_combout\ & ((\p~249_combout\ & (A7(26))) # (!\p~249_combout\ & ((A3(26)))))) # (!\Add0~4_combout\ & (((\p~249_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => A7(26),
	datab => A3(26),
	datac => \Add0~4_combout\,
	datad => \p~249_combout\,
	combout => \p~250_combout\);

-- Location: LCCOMB_X28_Y15_N16
\p~251\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~251_combout\ = (\p~20_combout\ & (((\p~250_combout\) # (!\p~19_combout\)))) # (!\p~20_combout\ & (ra(24) & (\p~19_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \p~20_combout\,
	datab => ra(24),
	datac => \p~19_combout\,
	datad => \p~250_combout\,
	combout => \p~251_combout\);

-- Location: LCCOMB_X28_Y15_N22
\p~252\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~252_combout\ = (\p~16_combout\ & ((\p~251_combout\ & (A5(26))) # (!\p~251_combout\ & ((ra(26)))))) # (!\p~16_combout\ & (((\p~251_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => A5(26),
	datab => \p~16_combout\,
	datac => ra(26),
	datad => \p~251_combout\,
	combout => \p~252_combout\);

-- Location: LCCOMB_X22_Y15_N14
\p~253\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~253_combout\ = (\p~11_combout\ & (((\p~13_combout\)))) # (!\p~11_combout\ & ((\p~13_combout\ & (p(26))) # (!\p~13_combout\ & ((\p~252_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => p(26),
	datab => \p~11_combout\,
	datac => \p~13_combout\,
	datad => \p~252_combout\,
	combout => \p~253_combout\);

-- Location: LCCOMB_X18_Y17_N20
\Add3~52\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~52_combout\ = (A5(26) & (!\Add3~51\ & VCC)) # (!A5(26) & (\Add3~51\ $ (GND)))
-- \Add3~53\ = CARRY((!A5(26) & !\Add3~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => A5(26),
	datad => VCC,
	cin => \Add3~51\,
	combout => \Add3~52_combout\,
	cout => \Add3~53\);

-- Location: LCCOMB_X21_Y15_N20
\Add6~50\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add6~50_combout\ = (ra(25) & ((\Add6~49\) # (GND))) # (!ra(25) & (!\Add6~49\))
-- \Add6~51\ = CARRY((ra(25)) # (!\Add6~49\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => ra(25),
	datad => VCC,
	cin => \Add6~49\,
	combout => \Add6~50_combout\,
	cout => \Add6~51\);

-- Location: LCCOMB_X26_Y15_N20
\Add2~50\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~50_combout\ = (A3(25) & ((\Add2~49\) # (GND))) # (!A3(25) & (!\Add2~49\))
-- \Add2~51\ = CARRY((A3(25)) # (!\Add2~49\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => A3(25),
	datad => VCC,
	cin => \Add2~49\,
	combout => \Add2~50_combout\,
	cout => \Add2~51\);

-- Location: LCCOMB_X22_Y15_N8
\p~254\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~254_combout\ = (\Add0~1_combout\ & ((\Add6~50_combout\) # ((\Add0~4_combout\)))) # (!\Add0~1_combout\ & (((!\Add0~4_combout\ & \Add2~50_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add6~50_combout\,
	datab => \Add0~1_combout\,
	datac => \Add0~4_combout\,
	datad => \Add2~50_combout\,
	combout => \p~254_combout\);

-- Location: LCCOMB_X23_Y13_N20
\Add7~52\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add7~52_combout\ = (ra(26) & (!\Add7~51\ & VCC)) # (!ra(26) & (\Add7~51\ $ (GND)))
-- \Add7~53\ = CARRY((!ra(26) & !\Add7~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => ra(26),
	datad => VCC,
	cin => \Add7~51\,
	combout => \Add7~52_combout\,
	cout => \Add7~53\);

-- Location: LCCOMB_X22_Y15_N6
\p~255\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~255_combout\ = (\Add0~4_combout\ & ((\p~254_combout\ & ((\Add7~52_combout\))) # (!\p~254_combout\ & (\Add3~52_combout\)))) # (!\Add0~4_combout\ & (((\p~254_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100000111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add3~52_combout\,
	datab => \Add0~4_combout\,
	datac => \p~254_combout\,
	datad => \Add7~52_combout\,
	combout => \p~255_combout\);

-- Location: LCCOMB_X22_Y15_N12
\p~256\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~256_combout\ = (\p~11_combout\ & ((\p~253_combout\ & ((\p~255_combout\))) # (!\p~253_combout\ & (\p~248_combout\)))) # (!\p~11_combout\ & (((\p~253_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100000111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \p~248_combout\,
	datab => \p~11_combout\,
	datac => \p~253_combout\,
	datad => \p~255_combout\,
	combout => \p~256_combout\);

-- Location: LCCOMB_X23_Y15_N20
\acc[26]~86\ : cycloneive_lcell_comb
-- Equation(s):
-- \acc[26]~86_combout\ = ((\p~256_combout\ $ (acc(26) $ (!\acc[25]~85\)))) # (GND)
-- \acc[26]~87\ = CARRY((\p~256_combout\ & ((acc(26)) # (!\acc[25]~85\))) # (!\p~256_combout\ & (acc(26) & !\acc[25]~85\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \p~256_combout\,
	datab => acc(26),
	datad => VCC,
	cin => \acc[25]~85\,
	combout => \acc[26]~86_combout\,
	cout => \acc[26]~87\);

-- Location: FF_X23_Y15_N21
\acc[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \acc[26]~86_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	sclr => \ld_clr~0_combout\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => acc(26));

-- Location: LCCOMB_X18_Y15_N24
\A5~60\ : cycloneive_lcell_comb
-- Equation(s):
-- \A5~60_combout\ = (A5(23) & ((\cs~q\) # (!\start~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \cs~q\,
	datac => A5(23),
	datad => \start~input_o\,
	combout => \A5~60_combout\);

-- Location: FF_X18_Y15_N25
\A5[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \A5~60_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => A5(27));

-- Location: LCCOMB_X24_Y17_N24
\ra~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \ra~27_combout\ = (\cs~q\ & (ra(23) & ((\rcarry~q\) # (\end_op~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rcarry~q\,
	datab => \end_op~4_combout\,
	datac => \cs~q\,
	datad => ra(23),
	combout => \ra~27_combout\);

-- Location: FF_X24_Y17_N25
\ra[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \ra~27_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ra(27));

-- Location: LCCOMB_X26_Y19_N20
\A7~88\ : cycloneive_lcell_comb
-- Equation(s):
-- \A7~88_combout\ = (\cs~q\ & (A7(23))) # (!\cs~q\ & ((\start~input_o\ & ((\Add10~38_combout\))) # (!\start~input_o\ & (A7(23)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \cs~q\,
	datab => A7(23),
	datac => \Add10~38_combout\,
	datad => \start~input_o\,
	combout => \A7~88_combout\);

-- Location: FF_X26_Y19_N21
\A7[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \A7~88_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => A7(27));

-- Location: LCCOMB_X25_Y15_N30
\A3~61\ : cycloneive_lcell_comb
-- Equation(s):
-- \A3~61_combout\ = (A3(23) & ((\cs~q\) # (!\start~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \cs~q\,
	datab => A3(23),
	datad => \start~input_o\,
	combout => \A3~61_combout\);

-- Location: FF_X25_Y15_N31
\A3[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \A3~61_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => A3(27));

-- Location: LCCOMB_X28_Y15_N8
\p~259\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~259_combout\ = (\Add0~4_combout\ & ((A3(27)) # ((\Add0~1_combout\)))) # (!\Add0~4_combout\ & (((ra(26) & !\Add0~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => A3(27),
	datab => ra(26),
	datac => \Add0~4_combout\,
	datad => \Add0~1_combout\,
	combout => \p~259_combout\);

-- Location: LCCOMB_X28_Y15_N26
\p~260\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~260_combout\ = (\p~259_combout\ & ((A7(27)) # ((!\Add0~1_combout\)))) # (!\p~259_combout\ & (((A3(26) & \Add0~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => A7(27),
	datab => A3(26),
	datac => \p~259_combout\,
	datad => \Add0~1_combout\,
	combout => \p~260_combout\);

-- Location: LCCOMB_X28_Y15_N12
\p~261\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~261_combout\ = (\p~19_combout\ & ((\p~20_combout\ & ((\p~260_combout\))) # (!\p~20_combout\ & (ra(25))))) # (!\p~19_combout\ & (((\p~20_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => ra(25),
	datab => \p~19_combout\,
	datac => \p~260_combout\,
	datad => \p~20_combout\,
	combout => \p~261_combout\);

-- Location: LCCOMB_X28_Y15_N2
\p~262\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~262_combout\ = (\p~16_combout\ & ((\p~261_combout\ & (A5(27))) # (!\p~261_combout\ & ((ra(27)))))) # (!\p~16_combout\ & (((\p~261_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => A5(27),
	datab => \p~16_combout\,
	datac => ra(27),
	datad => \p~261_combout\,
	combout => \p~262_combout\);

-- Location: LCCOMB_X23_Y19_N22
\Add1~54\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~54_combout\ = (A7(27) & ((\Add1~53\) # (GND))) # (!A7(27) & (!\Add1~53\))
-- \Add1~55\ = CARRY((A7(27)) # (!\Add1~53\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => A7(27),
	datad => VCC,
	cin => \Add1~53\,
	combout => \Add1~54_combout\,
	cout => \Add1~55\);

-- Location: LCCOMB_X21_Y17_N20
\Add4~50\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add4~50_combout\ = (ra(25) & ((\Add4~49\) # (GND))) # (!ra(25) & (!\Add4~49\))
-- \Add4~51\ = CARRY((ra(25)) # (!\Add4~49\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => ra(25),
	datad => VCC,
	cin => \Add4~49\,
	combout => \Add4~50_combout\,
	cout => \Add4~51\);

-- Location: LCCOMB_X24_Y15_N22
\p~257\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~257_combout\ = (\Add0~4_combout\ & (((\Add0~1_combout\)))) # (!\Add0~4_combout\ & ((\Add0~1_combout\ & ((\Add4~50_combout\))) # (!\Add0~1_combout\ & (ra(24)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => ra(24),
	datab => \Add0~4_combout\,
	datac => \Add0~1_combout\,
	datad => \Add4~50_combout\,
	combout => \p~257_combout\);

-- Location: LCCOMB_X26_Y17_N22
\Add5~54\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add5~54_combout\ = (A3(27) & ((\Add5~53\) # (GND))) # (!A3(27) & (!\Add5~53\))
-- \Add5~55\ = CARRY((A3(27)) # (!\Add5~53\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => A3(27),
	datad => VCC,
	cin => \Add5~53\,
	combout => \Add5~54_combout\,
	cout => \Add5~55\);

-- Location: LCCOMB_X24_Y15_N16
\p~258\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~258_combout\ = (\Add0~4_combout\ & ((\p~257_combout\ & ((\Add5~54_combout\))) # (!\p~257_combout\ & (\Add1~54_combout\)))) # (!\Add0~4_combout\ & (((\p~257_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100000111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~54_combout\,
	datab => \Add0~4_combout\,
	datac => \p~257_combout\,
	datad => \Add5~54_combout\,
	combout => \p~258_combout\);

-- Location: LCCOMB_X24_Y15_N14
\p~263\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~263_combout\ = (\p~13_combout\ & (\p~11_combout\)) # (!\p~13_combout\ & ((\p~11_combout\ & ((\p~258_combout\))) # (!\p~11_combout\ & (\p~262_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \p~13_combout\,
	datab => \p~11_combout\,
	datac => \p~262_combout\,
	datad => \p~258_combout\,
	combout => \p~263_combout\);

-- Location: FF_X24_Y15_N9
\p[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \p~266_combout\,
	ena => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => p(27));

-- Location: LCCOMB_X23_Y13_N22
\Add7~54\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add7~54_combout\ = (ra(27) & ((\Add7~53\) # (GND))) # (!ra(27) & (!\Add7~53\))
-- \Add7~55\ = CARRY((ra(27)) # (!\Add7~53\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => ra(27),
	datad => VCC,
	cin => \Add7~53\,
	combout => \Add7~54_combout\,
	cout => \Add7~55\);

-- Location: LCCOMB_X21_Y15_N22
\Add6~52\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add6~52_combout\ = (ra(26) & (!\Add6~51\ & VCC)) # (!ra(26) & (\Add6~51\ $ (GND)))
-- \Add6~53\ = CARRY((!ra(26) & !\Add6~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => ra(26),
	datad => VCC,
	cin => \Add6~51\,
	combout => \Add6~52_combout\,
	cout => \Add6~53\);

-- Location: LCCOMB_X26_Y15_N22
\Add2~52\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~52_combout\ = (A3(26) & (!\Add2~51\ & VCC)) # (!A3(26) & (\Add2~51\ $ (GND)))
-- \Add2~53\ = CARRY((!A3(26) & !\Add2~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => A3(26),
	datad => VCC,
	cin => \Add2~51\,
	combout => \Add2~52_combout\,
	cout => \Add2~53\);

-- Location: LCCOMB_X18_Y17_N22
\Add3~54\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~54_combout\ = (A5(27) & ((\Add3~53\) # (GND))) # (!A5(27) & (!\Add3~53\))
-- \Add3~55\ = CARRY((A5(27)) # (!\Add3~53\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => A5(27),
	datad => VCC,
	cin => \Add3~53\,
	combout => \Add3~54_combout\,
	cout => \Add3~55\);

-- Location: LCCOMB_X24_Y15_N28
\p~264\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~264_combout\ = (\Add0~4_combout\ & (((\Add0~1_combout\) # (\Add3~54_combout\)))) # (!\Add0~4_combout\ & (\Add2~52_combout\ & (!\Add0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add2~52_combout\,
	datab => \Add0~4_combout\,
	datac => \Add0~1_combout\,
	datad => \Add3~54_combout\,
	combout => \p~264_combout\);

-- Location: LCCOMB_X24_Y15_N18
\p~265\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~265_combout\ = (\Add0~1_combout\ & ((\p~264_combout\ & (\Add7~54_combout\)) # (!\p~264_combout\ & ((\Add6~52_combout\))))) # (!\Add0~1_combout\ & (((\p~264_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~1_combout\,
	datab => \Add7~54_combout\,
	datac => \Add6~52_combout\,
	datad => \p~264_combout\,
	combout => \p~265_combout\);

-- Location: LCCOMB_X24_Y15_N8
\p~266\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~266_combout\ = (\p~13_combout\ & ((\p~263_combout\ & ((\p~265_combout\))) # (!\p~263_combout\ & (p(27))))) # (!\p~13_combout\ & (\p~263_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110001100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \p~13_combout\,
	datab => \p~263_combout\,
	datac => p(27),
	datad => \p~265_combout\,
	combout => \p~266_combout\);

-- Location: LCCOMB_X23_Y15_N22
\acc[27]~88\ : cycloneive_lcell_comb
-- Equation(s):
-- \acc[27]~88_combout\ = (acc(27) & ((\p~266_combout\ & (\acc[26]~87\ & VCC)) # (!\p~266_combout\ & (!\acc[26]~87\)))) # (!acc(27) & ((\p~266_combout\ & (!\acc[26]~87\)) # (!\p~266_combout\ & ((\acc[26]~87\) # (GND)))))
-- \acc[27]~89\ = CARRY((acc(27) & (!\p~266_combout\ & !\acc[26]~87\)) # (!acc(27) & ((!\acc[26]~87\) # (!\p~266_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => acc(27),
	datab => \p~266_combout\,
	datad => VCC,
	cin => \acc[26]~87\,
	combout => \acc[27]~88_combout\,
	cout => \acc[27]~89\);

-- Location: FF_X23_Y15_N23
\acc[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \acc[27]~88_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	sclr => \ld_clr~0_combout\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => acc(27));

-- Location: FF_X24_Y19_N19
\p[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \p~276_combout\,
	ena => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => p(28));

-- Location: LCCOMB_X18_Y15_N22
\A5~61\ : cycloneive_lcell_comb
-- Equation(s):
-- \A5~61_combout\ = (A5(24) & ((\cs~q\) # (!\start~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => A5(24),
	datac => \cs~q\,
	datad => \start~input_o\,
	combout => \A5~61_combout\);

-- Location: FF_X18_Y15_N23
\A5[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \A5~61_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => A5(28));

-- Location: LCCOMB_X24_Y17_N6
\ra~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \ra~28_combout\ = (\cs~q\ & (ra(24) & ((\rcarry~q\) # (\end_op~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rcarry~q\,
	datab => \end_op~4_combout\,
	datac => \cs~q\,
	datad => ra(24),
	combout => \ra~28_combout\);

-- Location: FF_X24_Y17_N7
\ra[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \ra~28_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ra(28));

-- Location: LCCOMB_X28_Y17_N2
\A3~62\ : cycloneive_lcell_comb
-- Equation(s):
-- \A3~62_combout\ = (A3(24) & ((\cs~q\) # (!\start~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => A3(24),
	datac => \cs~q\,
	datad => \start~input_o\,
	combout => \A3~62_combout\);

-- Location: FF_X28_Y17_N3
\A3[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \A3~62_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => A3(28));

-- Location: LCCOMB_X24_Y15_N4
\p~269\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~269_combout\ = (\Add0~4_combout\ & (((\Add0~1_combout\)))) # (!\Add0~4_combout\ & ((\Add0~1_combout\ & (A3(27))) # (!\Add0~1_combout\ & ((ra(27))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => A3(27),
	datab => \Add0~4_combout\,
	datac => \Add0~1_combout\,
	datad => ra(27),
	combout => \p~269_combout\);

-- Location: LCCOMB_X24_Y19_N24
\A7~89\ : cycloneive_lcell_comb
-- Equation(s):
-- \A7~89_combout\ = (\cs~q\ & (((A7(24))))) # (!\cs~q\ & ((\start~input_o\ & (\Add10~38_combout\)) # (!\start~input_o\ & ((A7(24))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \cs~q\,
	datab => \Add10~38_combout\,
	datac => A7(24),
	datad => \start~input_o\,
	combout => \A7~89_combout\);

-- Location: FF_X24_Y19_N25
\A7[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \A7~89_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => A7(28));

-- Location: LCCOMB_X24_Y15_N10
\p~270\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~270_combout\ = (\Add0~4_combout\ & ((\p~269_combout\ & ((A7(28)))) # (!\p~269_combout\ & (A3(28))))) # (!\Add0~4_combout\ & (((\p~269_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100000111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => A3(28),
	datab => \Add0~4_combout\,
	datac => \p~269_combout\,
	datad => A7(28),
	combout => \p~270_combout\);

-- Location: LCCOMB_X24_Y15_N12
\p~271\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~271_combout\ = (\p~19_combout\ & ((\p~20_combout\ & ((\p~270_combout\))) # (!\p~20_combout\ & (ra(26))))) # (!\p~19_combout\ & (((\p~20_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100000111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => ra(26),
	datab => \p~19_combout\,
	datac => \p~20_combout\,
	datad => \p~270_combout\,
	combout => \p~271_combout\);

-- Location: LCCOMB_X24_Y15_N26
\p~272\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~272_combout\ = (\p~16_combout\ & ((\p~271_combout\ & (A5(28))) # (!\p~271_combout\ & ((ra(28)))))) # (!\p~16_combout\ & (((\p~271_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => A5(28),
	datab => \p~16_combout\,
	datac => ra(28),
	datad => \p~271_combout\,
	combout => \p~272_combout\);

-- Location: LCCOMB_X24_Y19_N12
\p~273\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~273_combout\ = (\p~13_combout\ & ((p(28)) # ((\p~11_combout\)))) # (!\p~13_combout\ & (((!\p~11_combout\ & \p~272_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \p~13_combout\,
	datab => p(28),
	datac => \p~11_combout\,
	datad => \p~272_combout\,
	combout => \p~273_combout\);

-- Location: LCCOMB_X23_Y19_N24
\Add1~56\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~56_combout\ = (A7(28) & (!\Add1~55\ & VCC)) # (!A7(28) & (\Add1~55\ $ (GND)))
-- \Add1~57\ = CARRY((!A7(28) & !\Add1~55\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => A7(28),
	datad => VCC,
	cin => \Add1~55\,
	combout => \Add1~56_combout\,
	cout => \Add1~57\);

-- Location: LCCOMB_X26_Y17_N24
\Add5~56\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add5~56_combout\ = (A3(28) & (!\Add5~55\ & VCC)) # (!A3(28) & (\Add5~55\ $ (GND)))
-- \Add5~57\ = CARRY((!A3(28) & !\Add5~55\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => A3(28),
	datad => VCC,
	cin => \Add5~55\,
	combout => \Add5~56_combout\,
	cout => \Add5~57\);

-- Location: LCCOMB_X21_Y17_N22
\Add4~52\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add4~52_combout\ = (ra(26) & (!\Add4~51\ & VCC)) # (!ra(26) & (\Add4~51\ $ (GND)))
-- \Add4~53\ = CARRY((!ra(26) & !\Add4~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => ra(26),
	datad => VCC,
	cin => \Add4~51\,
	combout => \Add4~52_combout\,
	cout => \Add4~53\);

-- Location: LCCOMB_X24_Y19_N6
\p~267\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~267_combout\ = (\Add0~4_combout\ & (((\Add0~1_combout\)))) # (!\Add0~4_combout\ & ((\Add0~1_combout\ & ((\Add4~52_combout\))) # (!\Add0~1_combout\ & (ra(25)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~4_combout\,
	datab => ra(25),
	datac => \Add0~1_combout\,
	datad => \Add4~52_combout\,
	combout => \p~267_combout\);

-- Location: LCCOMB_X24_Y19_N8
\p~268\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~268_combout\ = (\Add0~4_combout\ & ((\p~267_combout\ & ((\Add5~56_combout\))) # (!\p~267_combout\ & (\Add1~56_combout\)))) # (!\Add0~4_combout\ & (((\p~267_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~4_combout\,
	datab => \Add1~56_combout\,
	datac => \Add5~56_combout\,
	datad => \p~267_combout\,
	combout => \p~268_combout\);

-- Location: LCCOMB_X18_Y17_N24
\Add3~56\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~56_combout\ = (A5(28) & (!\Add3~55\ & VCC)) # (!A5(28) & (\Add3~55\ $ (GND)))
-- \Add3~57\ = CARRY((!A5(28) & !\Add3~55\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => A5(28),
	datad => VCC,
	cin => \Add3~55\,
	combout => \Add3~56_combout\,
	cout => \Add3~57\);

-- Location: LCCOMB_X26_Y15_N24
\Add2~54\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~54_combout\ = (A3(27) & ((\Add2~53\) # (GND))) # (!A3(27) & (!\Add2~53\))
-- \Add2~55\ = CARRY((A3(27)) # (!\Add2~53\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => A3(27),
	datad => VCC,
	cin => \Add2~53\,
	combout => \Add2~54_combout\,
	cout => \Add2~55\);

-- Location: LCCOMB_X21_Y15_N24
\Add6~54\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add6~54_combout\ = (ra(27) & ((\Add6~53\) # (GND))) # (!ra(27) & (!\Add6~53\))
-- \Add6~55\ = CARRY((ra(27)) # (!\Add6~53\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => ra(27),
	datad => VCC,
	cin => \Add6~53\,
	combout => \Add6~54_combout\,
	cout => \Add6~55\);

-- Location: LCCOMB_X24_Y19_N30
\p~274\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~274_combout\ = (\Add0~1_combout\ & ((\Add0~4_combout\) # ((\Add6~54_combout\)))) # (!\Add0~1_combout\ & (!\Add0~4_combout\ & (\Add2~54_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~1_combout\,
	datab => \Add0~4_combout\,
	datac => \Add2~54_combout\,
	datad => \Add6~54_combout\,
	combout => \p~274_combout\);

-- Location: LCCOMB_X23_Y13_N24
\Add7~56\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add7~56_combout\ = (ra(28) & (!\Add7~55\ & VCC)) # (!ra(28) & (\Add7~55\ $ (GND)))
-- \Add7~57\ = CARRY((!ra(28) & !\Add7~55\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => ra(28),
	datad => VCC,
	cin => \Add7~55\,
	combout => \Add7~56_combout\,
	cout => \Add7~57\);

-- Location: LCCOMB_X24_Y19_N16
\p~275\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~275_combout\ = (\Add0~4_combout\ & ((\p~274_combout\ & ((\Add7~56_combout\))) # (!\p~274_combout\ & (\Add3~56_combout\)))) # (!\Add0~4_combout\ & (((\p~274_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100000111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add3~56_combout\,
	datab => \Add0~4_combout\,
	datac => \p~274_combout\,
	datad => \Add7~56_combout\,
	combout => \p~275_combout\);

-- Location: LCCOMB_X24_Y19_N18
\p~276\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~276_combout\ = (\p~273_combout\ & (((\p~275_combout\)) # (!\p~11_combout\))) # (!\p~273_combout\ & (\p~11_combout\ & (\p~268_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \p~273_combout\,
	datab => \p~11_combout\,
	datac => \p~268_combout\,
	datad => \p~275_combout\,
	combout => \p~276_combout\);

-- Location: LCCOMB_X23_Y15_N24
\acc[28]~90\ : cycloneive_lcell_comb
-- Equation(s):
-- \acc[28]~90_combout\ = ((\p~276_combout\ $ (acc(28) $ (!\acc[27]~89\)))) # (GND)
-- \acc[28]~91\ = CARRY((\p~276_combout\ & ((acc(28)) # (!\acc[27]~89\))) # (!\p~276_combout\ & (acc(28) & !\acc[27]~89\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \p~276_combout\,
	datab => acc(28),
	datad => VCC,
	cin => \acc[27]~89\,
	combout => \acc[28]~90_combout\,
	cout => \acc[28]~91\);

-- Location: FF_X23_Y15_N25
\acc[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \acc[28]~90_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	sclr => \ld_clr~0_combout\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => acc(28));

-- Location: LCCOMB_X24_Y17_N0
\ra~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \ra~29_combout\ = (\cs~q\ & (ra(25) & ((\rcarry~q\) # (\end_op~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rcarry~q\,
	datab => \end_op~4_combout\,
	datac => \cs~q\,
	datad => ra(25),
	combout => \ra~29_combout\);

-- Location: FF_X24_Y17_N1
\ra[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \ra~29_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ra(29));

-- Location: LCCOMB_X23_Y13_N26
\Add7~58\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add7~58_combout\ = (ra(29) & ((\Add7~57\) # (GND))) # (!ra(29) & (!\Add7~57\))
-- \Add7~59\ = CARRY((ra(29)) # (!\Add7~57\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => ra(29),
	datad => VCC,
	cin => \Add7~57\,
	combout => \Add7~58_combout\,
	cout => \Add7~59\);

-- Location: LCCOMB_X26_Y15_N26
\Add2~56\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~56_combout\ = (A3(28) & (!\Add2~55\ & VCC)) # (!A3(28) & (\Add2~55\ $ (GND)))
-- \Add2~57\ = CARRY((!A3(28) & !\Add2~55\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => A3(28),
	datad => VCC,
	cin => \Add2~55\,
	combout => \Add2~56_combout\,
	cout => \Add2~57\);

-- Location: LCCOMB_X21_Y15_N26
\Add6~56\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add6~56_combout\ = (ra(28) & (!\Add6~55\ & VCC)) # (!ra(28) & (\Add6~55\ $ (GND)))
-- \Add6~57\ = CARRY((!ra(28) & !\Add6~55\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => ra(28),
	datad => VCC,
	cin => \Add6~55\,
	combout => \Add6~56_combout\,
	cout => \Add6~57\);

-- Location: LCCOMB_X25_Y14_N8
\p~284\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~284_combout\ = (\Add0~4_combout\ & (((\Add0~1_combout\)))) # (!\Add0~4_combout\ & ((\Add0~1_combout\ & ((\Add6~56_combout\))) # (!\Add0~1_combout\ & (\Add2~56_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~4_combout\,
	datab => \Add2~56_combout\,
	datac => \Add0~1_combout\,
	datad => \Add6~56_combout\,
	combout => \p~284_combout\);

-- Location: LCCOMB_X19_Y20_N14
\A5~62\ : cycloneive_lcell_comb
-- Equation(s):
-- \A5~62_combout\ = (A5(25) & ((\cs~q\) # (!\start~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \cs~q\,
	datac => \start~input_o\,
	datad => A5(25),
	combout => \A5~62_combout\);

-- Location: FF_X18_Y17_N7
\A5[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \A5~62_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => A5(29));

-- Location: LCCOMB_X18_Y17_N26
\Add3~58\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~58_combout\ = (A5(29) & ((\Add3~57\) # (GND))) # (!A5(29) & (!\Add3~57\))
-- \Add3~59\ = CARRY((A5(29)) # (!\Add3~57\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => A5(29),
	datad => VCC,
	cin => \Add3~57\,
	combout => \Add3~58_combout\,
	cout => \Add3~59\);

-- Location: LCCOMB_X25_Y14_N14
\p~285\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~285_combout\ = (\Add0~4_combout\ & ((\p~284_combout\ & (\Add7~58_combout\)) # (!\p~284_combout\ & ((\Add3~58_combout\))))) # (!\Add0~4_combout\ & (((\p~284_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101101011010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~4_combout\,
	datab => \Add7~58_combout\,
	datac => \p~284_combout\,
	datad => \Add3~58_combout\,
	combout => \p~285_combout\);

-- Location: FF_X25_Y14_N1
\p[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \p~286_combout\,
	ena => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => p(29));

-- Location: LCCOMB_X25_Y14_N22
\p~279\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~279_combout\ = (\Add0~1_combout\ & (((A3(28)) # (\Add0~4_combout\)))) # (!\Add0~1_combout\ & (ra(28) & ((!\Add0~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => ra(28),
	datab => A3(28),
	datac => \Add0~1_combout\,
	datad => \Add0~4_combout\,
	combout => \p~279_combout\);

-- Location: LCCOMB_X26_Y19_N8
\A3~63\ : cycloneive_lcell_comb
-- Equation(s):
-- \A3~63_combout\ = (A3(25) & ((\cs~q\) # (!\start~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \cs~q\,
	datac => A3(25),
	datad => \start~input_o\,
	combout => \A3~63_combout\);

-- Location: FF_X26_Y19_N9
\A3[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \A3~63_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => A3(29));

-- Location: LCCOMB_X26_Y19_N30
\A7~90\ : cycloneive_lcell_comb
-- Equation(s):
-- \A7~90_combout\ = (\start~input_o\ & ((\cs~q\ & (A7(25))) # (!\cs~q\ & ((\Add10~38_combout\))))) # (!\start~input_o\ & (A7(25)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => A7(25),
	datab => \start~input_o\,
	datac => \Add10~38_combout\,
	datad => \cs~q\,
	combout => \A7~90_combout\);

-- Location: FF_X26_Y19_N31
\A7[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \A7~90_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => A7(29));

-- Location: LCCOMB_X25_Y14_N28
\p~280\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~280_combout\ = (\p~279_combout\ & (((A7(29)) # (!\Add0~4_combout\)))) # (!\p~279_combout\ & (A3(29) & ((\Add0~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \p~279_combout\,
	datab => A3(29),
	datac => A7(29),
	datad => \Add0~4_combout\,
	combout => \p~280_combout\);

-- Location: LCCOMB_X25_Y14_N26
\p~281\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~281_combout\ = (\p~20_combout\ & (((\p~280_combout\) # (!\p~19_combout\)))) # (!\p~20_combout\ & (ra(27) & (\p~19_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110000101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => ra(27),
	datab => \p~20_combout\,
	datac => \p~19_combout\,
	datad => \p~280_combout\,
	combout => \p~281_combout\);

-- Location: LCCOMB_X25_Y14_N16
\p~282\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~282_combout\ = (\p~16_combout\ & ((\p~281_combout\ & ((A5(29)))) # (!\p~281_combout\ & (ra(29))))) # (!\p~16_combout\ & (((\p~281_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100001011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \p~16_combout\,
	datab => ra(29),
	datac => \p~281_combout\,
	datad => A5(29),
	combout => \p~282_combout\);

-- Location: LCCOMB_X23_Y19_N26
\Add1~58\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~58_combout\ = (A7(29) & ((\Add1~57\) # (GND))) # (!A7(29) & (!\Add1~57\))
-- \Add1~59\ = CARRY((A7(29)) # (!\Add1~57\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => A7(29),
	datad => VCC,
	cin => \Add1~57\,
	combout => \Add1~58_combout\,
	cout => \Add1~59\);

-- Location: LCCOMB_X26_Y17_N26
\Add5~58\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add5~58_combout\ = (A3(29) & ((\Add5~57\) # (GND))) # (!A3(29) & (!\Add5~57\))
-- \Add5~59\ = CARRY((A3(29)) # (!\Add5~57\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => A3(29),
	datad => VCC,
	cin => \Add5~57\,
	combout => \Add5~58_combout\,
	cout => \Add5~59\);

-- Location: LCCOMB_X21_Y17_N24
\Add4~54\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add4~54_combout\ = (ra(27) & ((\Add4~53\) # (GND))) # (!ra(27) & (!\Add4~53\))
-- \Add4~55\ = CARRY((ra(27)) # (!\Add4~53\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => ra(27),
	datad => VCC,
	cin => \Add4~53\,
	combout => \Add4~54_combout\,
	cout => \Add4~55\);

-- Location: LCCOMB_X25_Y14_N2
\p~277\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~277_combout\ = (\Add0~1_combout\ & (((\Add4~54_combout\) # (\Add0~4_combout\)))) # (!\Add0~1_combout\ & (ra(26) & ((!\Add0~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~1_combout\,
	datab => ra(26),
	datac => \Add4~54_combout\,
	datad => \Add0~4_combout\,
	combout => \p~277_combout\);

-- Location: LCCOMB_X25_Y14_N20
\p~278\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~278_combout\ = (\Add0~4_combout\ & ((\p~277_combout\ & ((\Add5~58_combout\))) # (!\p~277_combout\ & (\Add1~58_combout\)))) # (!\Add0~4_combout\ & (((\p~277_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~4_combout\,
	datab => \Add1~58_combout\,
	datac => \Add5~58_combout\,
	datad => \p~277_combout\,
	combout => \p~278_combout\);

-- Location: LCCOMB_X25_Y14_N18
\p~283\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~283_combout\ = (\p~13_combout\ & (((\p~11_combout\)))) # (!\p~13_combout\ & ((\p~11_combout\ & ((\p~278_combout\))) # (!\p~11_combout\ & (\p~282_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \p~13_combout\,
	datab => \p~282_combout\,
	datac => \p~11_combout\,
	datad => \p~278_combout\,
	combout => \p~283_combout\);

-- Location: LCCOMB_X25_Y14_N0
\p~286\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~286_combout\ = (\p~13_combout\ & ((\p~283_combout\ & (\p~285_combout\)) # (!\p~283_combout\ & ((p(29)))))) # (!\p~13_combout\ & (((\p~283_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \p~13_combout\,
	datab => \p~285_combout\,
	datac => p(29),
	datad => \p~283_combout\,
	combout => \p~286_combout\);

-- Location: LCCOMB_X23_Y15_N26
\acc[29]~92\ : cycloneive_lcell_comb
-- Equation(s):
-- \acc[29]~92_combout\ = (\p~286_combout\ & ((acc(29) & (\acc[28]~91\ & VCC)) # (!acc(29) & (!\acc[28]~91\)))) # (!\p~286_combout\ & ((acc(29) & (!\acc[28]~91\)) # (!acc(29) & ((\acc[28]~91\) # (GND)))))
-- \acc[29]~93\ = CARRY((\p~286_combout\ & (!acc(29) & !\acc[28]~91\)) # (!\p~286_combout\ & ((!\acc[28]~91\) # (!acc(29)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \p~286_combout\,
	datab => acc(29),
	datad => VCC,
	cin => \acc[28]~91\,
	combout => \acc[29]~92_combout\,
	cout => \acc[29]~93\);

-- Location: FF_X23_Y15_N27
\acc[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \acc[29]~92_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	sclr => \ld_clr~0_combout\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => acc(29));

-- Location: FF_X25_Y14_N5
\p[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \p~296_combout\,
	ena => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => p(30));

-- Location: LCCOMB_X24_Y17_N22
\ra~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \ra~30_combout\ = (ra(26) & (\cs~q\ & ((\end_op~4_combout\) # (\rcarry~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => ra(26),
	datab => \end_op~4_combout\,
	datac => \cs~q\,
	datad => \rcarry~q\,
	combout => \ra~30_combout\);

-- Location: FF_X24_Y17_N23
\ra[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \ra~30_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ra(30));

-- Location: LCCOMB_X26_Y19_N28
\A5~63\ : cycloneive_lcell_comb
-- Equation(s):
-- \A5~63_combout\ = (A5(26) & ((\cs~q\) # (!\start~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \cs~q\,
	datab => \start~input_o\,
	datad => A5(26),
	combout => \A5~63_combout\);

-- Location: FF_X26_Y19_N29
\A5[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \A5~63_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => A5(30));

-- Location: LCCOMB_X26_Y19_N26
\A7~91\ : cycloneive_lcell_comb
-- Equation(s):
-- \A7~91_combout\ = (\cs~q\ & (A7(26))) # (!\cs~q\ & ((\start~input_o\ & ((\Add10~38_combout\))) # (!\start~input_o\ & (A7(26)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \cs~q\,
	datab => A7(26),
	datac => \Add10~38_combout\,
	datad => \start~input_o\,
	combout => \A7~91_combout\);

-- Location: FF_X26_Y19_N27
\A7[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \A7~91_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => A7(30));

-- Location: LCCOMB_X28_Y17_N26
\A3~64\ : cycloneive_lcell_comb
-- Equation(s):
-- \A3~64_combout\ = (A3(26) & ((\cs~q\) # (!\start~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => A3(26),
	datac => \cs~q\,
	datad => \start~input_o\,
	combout => \A3~64_combout\);

-- Location: FF_X26_Y17_N31
\A3[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \A3~64_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => A3(30));

-- Location: LCCOMB_X26_Y19_N10
\p~289\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~289_combout\ = (\Add0~4_combout\ & (((\Add0~1_combout\)))) # (!\Add0~4_combout\ & ((\Add0~1_combout\ & ((A3(29)))) # (!\Add0~1_combout\ & (ra(29)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => ra(29),
	datab => A3(29),
	datac => \Add0~4_combout\,
	datad => \Add0~1_combout\,
	combout => \p~289_combout\);

-- Location: LCCOMB_X26_Y19_N24
\p~290\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~290_combout\ = (\Add0~4_combout\ & ((\p~289_combout\ & (A7(30))) # (!\p~289_combout\ & ((A3(30)))))) # (!\Add0~4_combout\ & (((\p~289_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => A7(30),
	datab => A3(30),
	datac => \Add0~4_combout\,
	datad => \p~289_combout\,
	combout => \p~290_combout\);

-- Location: LCCOMB_X26_Y19_N6
\p~291\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~291_combout\ = (\p~19_combout\ & ((\p~20_combout\ & ((\p~290_combout\))) # (!\p~20_combout\ & (ra(28))))) # (!\p~19_combout\ & (\p~20_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110001100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \p~19_combout\,
	datab => \p~20_combout\,
	datac => ra(28),
	datad => \p~290_combout\,
	combout => \p~291_combout\);

-- Location: LCCOMB_X26_Y19_N16
\p~292\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~292_combout\ = (\p~16_combout\ & ((\p~291_combout\ & ((A5(30)))) # (!\p~291_combout\ & (ra(30))))) # (!\p~16_combout\ & (((\p~291_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => ra(30),
	datab => A5(30),
	datac => \p~16_combout\,
	datad => \p~291_combout\,
	combout => \p~292_combout\);

-- Location: LCCOMB_X25_Y14_N10
\p~293\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~293_combout\ = (\p~13_combout\ & ((p(30)) # ((\p~11_combout\)))) # (!\p~13_combout\ & (((!\p~11_combout\ & \p~292_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \p~13_combout\,
	datab => p(30),
	datac => \p~11_combout\,
	datad => \p~292_combout\,
	combout => \p~293_combout\);

-- Location: LCCOMB_X18_Y17_N28
\Add3~60\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~60_combout\ = (A5(30) & (!\Add3~59\ & VCC)) # (!A5(30) & (\Add3~59\ $ (GND)))
-- \Add3~61\ = CARRY((!A5(30) & !\Add3~59\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => A5(30),
	datad => VCC,
	cin => \Add3~59\,
	combout => \Add3~60_combout\,
	cout => \Add3~61\);

-- Location: LCCOMB_X23_Y13_N28
\Add7~60\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add7~60_combout\ = (ra(30) & (!\Add7~59\ & VCC)) # (!ra(30) & (\Add7~59\ $ (GND)))
-- \Add7~61\ = CARRY((!ra(30) & !\Add7~59\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => ra(30),
	datad => VCC,
	cin => \Add7~59\,
	combout => \Add7~60_combout\,
	cout => \Add7~61\);

-- Location: LCCOMB_X21_Y15_N28
\Add6~58\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add6~58_combout\ = (ra(29) & ((\Add6~57\) # (GND))) # (!ra(29) & (!\Add6~57\))
-- \Add6~59\ = CARRY((ra(29)) # (!\Add6~57\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => ra(29),
	datad => VCC,
	cin => \Add6~57\,
	combout => \Add6~58_combout\,
	cout => \Add6~59\);

-- Location: LCCOMB_X26_Y15_N28
\Add2~58\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~58_combout\ = (A3(29) & ((\Add2~57\) # (GND))) # (!A3(29) & (!\Add2~57\))
-- \Add2~59\ = CARRY((A3(29)) # (!\Add2~57\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => A3(29),
	datad => VCC,
	cin => \Add2~57\,
	combout => \Add2~58_combout\,
	cout => \Add2~59\);

-- Location: LCCOMB_X25_Y14_N24
\p~294\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~294_combout\ = (\Add0~4_combout\ & (\Add0~1_combout\)) # (!\Add0~4_combout\ & ((\Add0~1_combout\ & (\Add6~58_combout\)) # (!\Add0~1_combout\ & ((\Add2~58_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~4_combout\,
	datab => \Add0~1_combout\,
	datac => \Add6~58_combout\,
	datad => \Add2~58_combout\,
	combout => \p~294_combout\);

-- Location: LCCOMB_X25_Y14_N30
\p~295\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~295_combout\ = (\Add0~4_combout\ & ((\p~294_combout\ & ((\Add7~60_combout\))) # (!\p~294_combout\ & (\Add3~60_combout\)))) # (!\Add0~4_combout\ & (((\p~294_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~4_combout\,
	datab => \Add3~60_combout\,
	datac => \Add7~60_combout\,
	datad => \p~294_combout\,
	combout => \p~295_combout\);

-- Location: LCCOMB_X26_Y17_N28
\Add5~60\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add5~60_combout\ = (A3(30) & (!\Add5~59\ & VCC)) # (!A3(30) & (\Add5~59\ $ (GND)))
-- \Add5~61\ = CARRY((!A3(30) & !\Add5~59\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => A3(30),
	datad => VCC,
	cin => \Add5~59\,
	combout => \Add5~60_combout\,
	cout => \Add5~61\);

-- Location: LCCOMB_X23_Y19_N28
\Add1~60\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~60_combout\ = (A7(30) & (!\Add1~59\ & VCC)) # (!A7(30) & (\Add1~59\ $ (GND)))
-- \Add1~61\ = CARRY((!A7(30) & !\Add1~59\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => A7(30),
	datad => VCC,
	cin => \Add1~59\,
	combout => \Add1~60_combout\,
	cout => \Add1~61\);

-- Location: LCCOMB_X21_Y17_N26
\Add4~56\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add4~56_combout\ = (ra(28) & (!\Add4~55\ & VCC)) # (!ra(28) & (\Add4~55\ $ (GND)))
-- \Add4~57\ = CARRY((!ra(28) & !\Add4~55\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => ra(28),
	datad => VCC,
	cin => \Add4~55\,
	combout => \Add4~56_combout\,
	cout => \Add4~57\);

-- Location: LCCOMB_X25_Y14_N12
\p~287\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~287_combout\ = (\Add0~4_combout\ & (\Add0~1_combout\)) # (!\Add0~4_combout\ & ((\Add0~1_combout\ & ((\Add4~56_combout\))) # (!\Add0~1_combout\ & (ra(27)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~4_combout\,
	datab => \Add0~1_combout\,
	datac => ra(27),
	datad => \Add4~56_combout\,
	combout => \p~287_combout\);

-- Location: LCCOMB_X25_Y14_N6
\p~288\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~288_combout\ = (\Add0~4_combout\ & ((\p~287_combout\ & (\Add5~60_combout\)) # (!\p~287_combout\ & ((\Add1~60_combout\))))) # (!\Add0~4_combout\ & (((\p~287_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~4_combout\,
	datab => \Add5~60_combout\,
	datac => \Add1~60_combout\,
	datad => \p~287_combout\,
	combout => \p~288_combout\);

-- Location: LCCOMB_X25_Y14_N4
\p~296\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~296_combout\ = (\p~293_combout\ & (((\p~295_combout\)) # (!\p~11_combout\))) # (!\p~293_combout\ & (\p~11_combout\ & ((\p~288_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011010100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \p~293_combout\,
	datab => \p~11_combout\,
	datac => \p~295_combout\,
	datad => \p~288_combout\,
	combout => \p~296_combout\);

-- Location: LCCOMB_X23_Y15_N28
\acc[30]~94\ : cycloneive_lcell_comb
-- Equation(s):
-- \acc[30]~94_combout\ = ((acc(30) $ (\p~296_combout\ $ (!\acc[29]~93\)))) # (GND)
-- \acc[30]~95\ = CARRY((acc(30) & ((\p~296_combout\) # (!\acc[29]~93\))) # (!acc(30) & (\p~296_combout\ & !\acc[29]~93\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => acc(30),
	datab => \p~296_combout\,
	datad => VCC,
	cin => \acc[29]~93\,
	combout => \acc[30]~94_combout\,
	cout => \acc[30]~95\);

-- Location: FF_X23_Y15_N29
\acc[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \acc[30]~94_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	sclr => \ld_clr~0_combout\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => acc(30));

-- Location: LCCOMB_X24_Y17_N20
\ra~31\ : cycloneive_lcell_comb
-- Equation(s):
-- \ra~31_combout\ = (\cs~q\ & (ra(27) & ((\rcarry~q\) # (\end_op~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rcarry~q\,
	datab => \end_op~4_combout\,
	datac => \cs~q\,
	datad => ra(27),
	combout => \ra~31_combout\);

-- Location: FF_X24_Y17_N21
\ra[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \ra~31_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ra(31));

-- Location: LCCOMB_X23_Y13_N30
\Add7~62\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add7~62_combout\ = \Add7~61\ $ (!ra(31))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => ra(31),
	cin => \Add7~61\,
	combout => \Add7~62_combout\);

-- Location: LCCOMB_X18_Y15_N12
\A5~64\ : cycloneive_lcell_comb
-- Equation(s):
-- \A5~64_combout\ = (A5(27) & ((\cs~q\) # (!\start~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => A5(27),
	datac => \cs~q\,
	datad => \start~input_o\,
	combout => \A5~64_combout\);

-- Location: FF_X18_Y15_N13
\A5[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \A5~64_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => A5(31));

-- Location: LCCOMB_X18_Y17_N30
\Add3~62\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~62_combout\ = A5(31) $ (!\Add3~61\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => A5(31),
	cin => \Add3~61\,
	combout => \Add3~62_combout\);

-- Location: LCCOMB_X26_Y15_N30
\Add2~60\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~60_combout\ = \Add2~59\ $ (A3(30))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => A3(30),
	cin => \Add2~59\,
	combout => \Add2~60_combout\);

-- Location: LCCOMB_X21_Y15_N30
\Add6~60\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add6~60_combout\ = ra(30) $ (\Add6~59\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => ra(30),
	cin => \Add6~59\,
	combout => \Add6~60_combout\);

-- Location: LCCOMB_X22_Y15_N4
\p~304\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~304_combout\ = (\Add0~1_combout\ & (((\Add0~4_combout\) # (\Add6~60_combout\)))) # (!\Add0~1_combout\ & (\Add2~60_combout\ & (!\Add0~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add2~60_combout\,
	datab => \Add0~1_combout\,
	datac => \Add0~4_combout\,
	datad => \Add6~60_combout\,
	combout => \p~304_combout\);

-- Location: LCCOMB_X25_Y15_N26
\p~305\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~305_combout\ = (\Add0~4_combout\ & ((\p~304_combout\ & (\Add7~62_combout\)) # (!\p~304_combout\ & ((\Add3~62_combout\))))) # (!\Add0~4_combout\ & (((\p~304_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~4_combout\,
	datab => \Add7~62_combout\,
	datac => \Add3~62_combout\,
	datad => \p~304_combout\,
	combout => \p~305_combout\);

-- Location: FF_X25_Y15_N17
\p[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \p~306_combout\,
	ena => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => p(31));

-- Location: LCCOMB_X26_Y19_N18
\A7~92\ : cycloneive_lcell_comb
-- Equation(s):
-- \A7~92_combout\ = (\cs~q\ & (A7(27))) # (!\cs~q\ & ((\start~input_o\ & ((\Add10~38_combout\))) # (!\start~input_o\ & (A7(27)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \cs~q\,
	datab => A7(27),
	datac => \Add10~38_combout\,
	datad => \start~input_o\,
	combout => \A7~92_combout\);

-- Location: FF_X26_Y19_N19
\A7[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \A7~92_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => A7(31));

-- Location: LCCOMB_X25_Y15_N18
\A3~65\ : cycloneive_lcell_comb
-- Equation(s):
-- \A3~65_combout\ = (A3(27) & ((\cs~q\) # (!\start~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => A3(27),
	datac => \cs~q\,
	datad => \start~input_o\,
	combout => \A3~65_combout\);

-- Location: FF_X25_Y15_N19
\A3[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \A3~65_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => A3(31));

-- Location: LCCOMB_X25_Y15_N28
\p~299\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~299_combout\ = (\Add0~1_combout\ & ((A3(30)) # ((\Add0~4_combout\)))) # (!\Add0~1_combout\ & (((!\Add0~4_combout\ & ra(30)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => A3(30),
	datab => \Add0~1_combout\,
	datac => \Add0~4_combout\,
	datad => ra(30),
	combout => \p~299_combout\);

-- Location: LCCOMB_X25_Y15_N6
\p~300\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~300_combout\ = (\Add0~4_combout\ & ((\p~299_combout\ & (A7(31))) # (!\p~299_combout\ & ((A3(31)))))) # (!\Add0~4_combout\ & (((\p~299_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => A7(31),
	datab => A3(31),
	datac => \Add0~4_combout\,
	datad => \p~299_combout\,
	combout => \p~300_combout\);

-- Location: LCCOMB_X25_Y15_N0
\p~301\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~301_combout\ = (\p~19_combout\ & ((\p~20_combout\ & ((\p~300_combout\))) # (!\p~20_combout\ & (ra(29))))) # (!\p~19_combout\ & (((\p~20_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100001011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \p~19_combout\,
	datab => ra(29),
	datac => \p~20_combout\,
	datad => \p~300_combout\,
	combout => \p~301_combout\);

-- Location: LCCOMB_X25_Y15_N14
\p~302\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~302_combout\ = (\p~16_combout\ & ((\p~301_combout\ & (A5(31))) # (!\p~301_combout\ & ((ra(31)))))) # (!\p~16_combout\ & (((\p~301_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => A5(31),
	datab => \p~16_combout\,
	datac => ra(31),
	datad => \p~301_combout\,
	combout => \p~302_combout\);

-- Location: LCCOMB_X23_Y19_N30
\Add1~62\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~62_combout\ = \Add1~61\ $ (!A7(31))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => A7(31),
	cin => \Add1~61\,
	combout => \Add1~62_combout\);

-- Location: LCCOMB_X26_Y17_N30
\Add5~62\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add5~62_combout\ = \Add5~61\ $ (!A3(31))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => A3(31),
	cin => \Add5~61\,
	combout => \Add5~62_combout\);

-- Location: LCCOMB_X21_Y17_N28
\Add4~58\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add4~58_combout\ = ra(29) $ (!\Add4~57\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => ra(29),
	cin => \Add4~57\,
	combout => \Add4~58_combout\);

-- Location: LCCOMB_X21_Y19_N28
\p~297\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~297_combout\ = (\Add0~1_combout\ & (((\Add0~4_combout\) # (\Add4~58_combout\)))) # (!\Add0~1_combout\ & (ra(28) & (!\Add0~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => ra(28),
	datab => \Add0~1_combout\,
	datac => \Add0~4_combout\,
	datad => \Add4~58_combout\,
	combout => \p~297_combout\);

-- Location: LCCOMB_X21_Y19_N6
\p~298\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~298_combout\ = (\Add0~4_combout\ & ((\p~297_combout\ & ((\Add5~62_combout\))) # (!\p~297_combout\ & (\Add1~62_combout\)))) # (!\Add0~4_combout\ & (((\p~297_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~4_combout\,
	datab => \Add1~62_combout\,
	datac => \Add5~62_combout\,
	datad => \p~297_combout\,
	combout => \p~298_combout\);

-- Location: LCCOMB_X25_Y15_N20
\p~303\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~303_combout\ = (\p~11_combout\ & ((\p~13_combout\) # ((\p~298_combout\)))) # (!\p~11_combout\ & (!\p~13_combout\ & (\p~302_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \p~11_combout\,
	datab => \p~13_combout\,
	datac => \p~302_combout\,
	datad => \p~298_combout\,
	combout => \p~303_combout\);

-- Location: LCCOMB_X25_Y15_N16
\p~306\ : cycloneive_lcell_comb
-- Equation(s):
-- \p~306_combout\ = (\p~13_combout\ & ((\p~303_combout\ & (\p~305_combout\)) # (!\p~303_combout\ & ((p(31)))))) # (!\p~13_combout\ & (((\p~303_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \p~305_combout\,
	datab => \p~13_combout\,
	datac => p(31),
	datad => \p~303_combout\,
	combout => \p~306_combout\);

-- Location: LCCOMB_X23_Y15_N30
\acc[31]~96\ : cycloneive_lcell_comb
-- Equation(s):
-- \acc[31]~96_combout\ = acc(31) $ (\acc[30]~95\ $ (\p~306_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010101011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => acc(31),
	datad => \p~306_combout\,
	cin => \acc[30]~95\,
	combout => \acc[31]~96_combout\);

-- Location: FF_X23_Y15_N31
\acc[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \acc[31]~96_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	sclr => \ld_clr~0_combout\,
	ena => \acc[20]~98_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => acc(31));

-- Location: LCCOMB_X22_Y13_N20
\done_v~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \done_v~0_combout\ = (\cs~q\ & (!\end_op~4_combout\ & !\rcarry~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \cs~q\,
	datab => \end_op~4_combout\,
	datad => \rcarry~q\,
	combout => \done_v~0_combout\);

-- Location: FF_X22_Y13_N21
done_v : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \done_v~0_combout\,
	ena => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \done_v~q\);

ww_res(0) <= \res[0]~output_o\;

ww_res(1) <= \res[1]~output_o\;

ww_res(2) <= \res[2]~output_o\;

ww_res(3) <= \res[3]~output_o\;

ww_res(4) <= \res[4]~output_o\;

ww_res(5) <= \res[5]~output_o\;

ww_res(6) <= \res[6]~output_o\;

ww_res(7) <= \res[7]~output_o\;

ww_res(8) <= \res[8]~output_o\;

ww_res(9) <= \res[9]~output_o\;

ww_res(10) <= \res[10]~output_o\;

ww_res(11) <= \res[11]~output_o\;

ww_res(12) <= \res[12]~output_o\;

ww_res(13) <= \res[13]~output_o\;

ww_res(14) <= \res[14]~output_o\;

ww_res(15) <= \res[15]~output_o\;

ww_res(16) <= \res[16]~output_o\;

ww_res(17) <= \res[17]~output_o\;

ww_res(18) <= \res[18]~output_o\;

ww_res(19) <= \res[19]~output_o\;

ww_res(20) <= \res[20]~output_o\;

ww_res(21) <= \res[21]~output_o\;

ww_res(22) <= \res[22]~output_o\;

ww_res(23) <= \res[23]~output_o\;

ww_res(24) <= \res[24]~output_o\;

ww_res(25) <= \res[25]~output_o\;

ww_res(26) <= \res[26]~output_o\;

ww_res(27) <= \res[27]~output_o\;

ww_res(28) <= \res[28]~output_o\;

ww_res(29) <= \res[29]~output_o\;

ww_res(30) <= \res[30]~output_o\;

ww_res(31) <= \res[31]~output_o\;

ww_done <= \done~output_o\;
END structure;


