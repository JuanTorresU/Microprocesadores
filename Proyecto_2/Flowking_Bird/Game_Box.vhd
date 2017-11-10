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
	enable : 						in std_logic;
	rgb : 							out std_logic_vector (11 downto 0);
	Data :			 				out std_logic_vector(23 downto 0);
	vsync :                    out std_logic;
   hsync :                    out std_logic);  
end Game_Box;

architecture Behavioral of Game_Box is
signal Data_In :			 	std_logic_vector(23 downto 0);

signal Data_Input :			 	std_logic_vector(23 downto 0);
signal Data_Out : 				std_logic_vector(23 downto 0);
signal spo : 						std_logic_vector(23 DOWNTO 0);
signal dpra :						std_logic_vector(13 DOWNTO 0);
signal XYdir :  					std_logic_vector(13 downto 0);
signal dir : 						std_logic_vector(13 downto 0);
signal h : 							std_logic_vector(10 downto 0);
signal v : 							std_logic_vector(9 downto 0);
signal Random_X,Random_Y : 	std_logic_vector(6 downto 0);
signal RdirX,RvelX,RacX : 		std_logic_vector(6 downto 0);
signal Wr : 						std_logic;
begin
Data <= Data_Out;

P1: ASM1 port map(
	clk			=>clk,
	SetUp			=>SetUp,
	Go 			=>Go,
	inicio		=>inicio,
	XYdir 		=>XYdir,
	Wr				=>Wr,
	Data_Out		=>Data_Out,
	Data_In		=>Data_In,
	Vel_I1		=>Vel_I1,
	Vel_I2		=>Vel_I2, 
	Ac_I1			=>Ac_I1,
	Ac_I2			=>Ac_I2,
	Random_X		=>Random_X,
	Random_Y		=>Random_Y,
	RdirX			=>RdirX,
	RvelX			=>RvelX,
	RacX			=>RacX,
	reset			=>reset);
						 
P2: Memoria port map(
	dpo			=>Data_Input,
	d				=>Data_Out,
	a				=>XYdir,
	we				=>Wr,
	dpra			=>dir,
	spo			=>spo,
	clk			=>clk);			

 
PX: lfsr port map(
	reset			=>reset,
	clk			=>clk,
	enable		=>enable,
	count			=>random_X(5 downto 0));
	
PY: lfsr port map(
	reset			=>reset,
	clk			=>clk,
	enable		=>enable,
	count			=>Random_Y(5 downto 0));
	
PDir: lfsr port map(
	reset			=>reset,
	clk			=>clk,
	enable		=>enable,
	count			=>RdirX(5 downto 0));
 	  
Pvel: lfsr port map(
	reset			=>reset,
	clk			=>clk,
	enable		=>enable,
	count			=>RvelX(5 downto 0));
		  
Pac: lfsr port map(
	reset			=>reset,
	clk			=>clk,
	enable		=>enable,
	count			=>RacX(5 downto 0));
	
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
	dat 			=>spo);
 
end Behavioral;

