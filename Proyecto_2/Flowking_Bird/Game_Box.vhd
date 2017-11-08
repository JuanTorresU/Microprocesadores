----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:38:00 11/05/2017 
-- Design Name: 
-- Module Name:    Game_Box - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use work.proj1pack.all;
-------------------
entity Game_Box is
port(
   clk,reset : in std_logic;
	SetUp : in std_logic;
	Go : in std_logic;
	Dir_Graphic : in std_logic_vector(13 downto 0);
	inicio : in std_logic;
	Vel_I1,Vel_I2 : in std_logic;
	Ac_I1,Ac_I2 : in std_logic;
	enable : in std_logic;
	Data_OutG : out std_logic_vector(23 downto 0);
   Data_OutF : out std_logic_vector(23 downto 0)	
	);
end Game_Box;
architecture Behavioral of Game_Box is
signal Random_X,Random_Y : std_logic_vector(6 downto 0);
signal Data_Input : std_logic_vector(23 downto 0);
signal XYdir :  Std_logic_vector(13 downto 0);
signal Data_Out : std_logic_vector(23 downto 0);
signal Wr : std_logic;
signal RdirX,RvelX,RacX : std_logic_vector(6 downto 0);
--signal Data_Input : std_logic_vector(23 downto 0);
--signal XYdir : Std_logic_vector(13 downto 0);
--signal Data_Out : std_logic_vector(23 downto 0);
signal dpra : STD_LOGIC_VECTOR(13 DOWNTO 0);
--
signal spo : STD_LOGIC_VECTOR(23 DOWNTO 0);

begin

Data_OutF<=Data_Out;
Data_OutG<=spo;
dpra<= Dir_Graphic;
 P1: ASM1 port map(clk => clk,SetUp => SetUp,Go => Go,
                   inicio=>inicio,XYdir => XYdir,Wr=>Wr,Data_Out=>Data_Out,
						 Data_Input=>Data_Input,Vel_I1=>Vel_I1,Vel_I2=>Vel_I2, 
						 Ac_I1=>Ac_I1,Ac_I2=>Ac_I2,Random_X=>Random_X,Random_Y=>Random_Y,
                   RdirX=>RdirX,RvelX=>RvelX,RacX=>RacX,reset=>reset);
						 
 P2: Memoria port map(dpo=>Data_Input,d=>Data_Input,a=>XYdir,we=>Wr,dpra=>dpra,spo=>spo,clk=>clk);						 
 --for i in 0 to 4 generate
 PX :  lfsr port map(
	     reset=>reset,
		  clk=>clk,
		  enable=>enable,
		  count=>random_X(5 downto 0)
	     );
 PY :  lfsr port map(
	     reset=>reset,
		  clk=>clk,
		  enable=>enable,
		  count=>Random_Y(5 downto 0)
		  
	     );
PDir :  lfsr port map(
	     reset=>reset,
		  clk=>clk,
		  enable=>enable,
		  count=>RdirX(5 downto 0)
	     );
 	  
 Pvel :  lfsr port map(
	     reset=>reset,
		  clk=>clk,
		  enable=>enable,
		  count=>RvelX(5 downto 0)
	     );
		  
 Pac :  lfsr port map(
	     reset=>reset,
		  clk=>clk,
		  enable=>enable,
		  count=>RacX(5 downto 0)
	     );
 
 
 --end generate;
-- or I in 0 to 3 generate
--      REGX : REG port map
--        (DIN(I), CLK, RESET, DOUT(I));
--   end generate GEN_RE
	
-- port (
--    reset  : in  std_logic;
--    clk    : in  std_logic; 
--    enable : in  std_logic;                    		 -- Enable counting	
--    count  : out std_logic_vector (LFSR_W-1 downto 0) -- lfsr output
--  );		

end Behavioral;

