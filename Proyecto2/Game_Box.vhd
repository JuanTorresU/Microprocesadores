library IEEE;
use	  IEEE.STD_LOGIC_1164.ALL;
use 	  IEEE.STD_LOGIC_UNSIGNED.ALL;
use 	  IEEE.STD_LOGIC_ARITH.ALL;
use 	  work.proj1pack.all; 

entity Game_Box is
port(
   clk,reset :						in std_logic;
	SetUp :							in std_logic;
	Go : 								in std_logic;
	inicio : 						in std_logic;
	Vel_I1,Vel_I2 : 				in std_logic;
	Ac_I1,Ac_I2 : 					in std_logic;
	Enab :		 					in	std_logic;
   vSimB : 							in std_logic;
	rgb : 							out std_logic_vector (11 downto 0);
	Data :			 				out std_logic_vector(23 downto 0);
	Rand : 						   out std_logic_vector(6 downto 0);
	vsync :                    out std_logic;
   hsync :                    out std_logic);
end Game_Box;

architecture Behavioral of Game_Box is

signal Data_Input :			 	std_logic_vector(23 downto 0);
signal Data_Out : 				std_logic_vector(23 downto 0);
signal dat : 						std_logic_vector(23 DOWNTO 0);
signal XYdir :  					std_logic_vector(13 downto 0);
signal dir : 						std_logic_vector(13 downto 0);
signal h : 							std_logic_vector(10 downto 0);
signal v : 							std_logic_vector(9 downto 0);
signal Random : 					std_logic_vector(6 downto 0);
signal Wr : 						std_logic;

begin
Data <= Data_Out;
Rand <= Random;

P1: ASM1 port map( 
	clk			=>clk,
	SetUp			=>SetUp,
	Go 			=>Go,
	inicio		=>inicio,
	XYdir 		=>XYdir,
	Wr				=>Wr,
	Data_Out		=>Data_Out,
	Data_Input	=>Data_Input,
	Vel_I1		=>Vel_I1,
	Vel_I2		=>Vel_I2, 
	Ac_I1			=>Ac_I1,
	Ac_I2			=>Ac_I2,
	reset			=>reset,
	Random		=>Random,
	vSimB			=>vSimB);
						 
P2: Memoria port map(
	dpo			=>dat,
	d				=>Data_Out,
	a				=>XYdir,
	we				=>Wr,
	dpra			=>dir,
	spo			=>Data_Input,
	clk			=>clk);			

VGA_U: VGA port map(
	clk			=>clk,
	reset			=>reset,
	vsync 		=>vsync,
	hsync 		=>hsync,
	h 				=>h,
	v 				=>v,
	dir 			=>dir);
	  
GPU_U: GPU port map(
	clk			=>clk,
   reset			=>reset,
	h 				=>h,
	v 				=>v,
	rgb			=>rgb,
	dat 			=>dat);
	
PX: lfsr port map(
	reset			=>reset,
	clk			=>clk,
	enable		=>Enab,
	count			=>Random);
 
end Behavioral;

