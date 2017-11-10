library IEEE;
use IEEE.STD_LOGIC_1164.all;
use work.lfsr_pkg.all;

package proj1pack is

component GPU is
    Port ( 
	 dat : in std_logic_vector ( 23 downto 0);
	 clk : in  STD_LOGIC;
    reset : in  STD_LOGIC;
	 h : in  STD_LOGIC_VECTOR (10 downto 0);
    v : in  STD_LOGIC_VECTOR (9 downto 0);
    rgb : out  STD_LOGIC_VECTOR (11 downto 0));
end component;

component VGA is
    Port (
	 clk : in  STD_LOGIC;
    reset : in  STD_LOGIC;
    vsync : out  STD_LOGIC;
    hsync : out  STD_LOGIC;
    h : out  STD_LOGIC_VECTOR (10 downto 0);
    v : out  STD_LOGIC_VECTOR (9 downto 0);
	 dir : out STD_LOGIC_VECTOR ( 13 downto 0)
			  );
end component;


component ASM1 is 
	port(
   clk,reset : in std_logic;
	vSimB : 		in std_logic;
	SetUp : in std_logic;
	Go : in std_logic;
	inicio : in std_logic;
	Vel_I1,Vel_I2 : in std_logic;
	Ac_I1,Ac_I2 : in std_logic;
	XYdir : inout Std_logic_vector(13 downto 0);
	Data_Out : inout std_logic_vector(23 downto 0);
	Data_Input : inout std_logic_vector(23 downto 0);
	Wr : inout std_logic;
	Random:					 			inout	std_logic_vector(6 downto 0));

end component;
						 
component Memoria is 
	port(
	clk: in std_logic;
	we: in std_logic;
	d: in std_logic_vector(23 downto 0);
	dpra: in std_logic_vector(13 downto 0);
	a: in std_logic_vector(13 downto 0);
	spo: out std_logic_vector(23 downto 0);
	dpo: out std_logic_vector(23 downto 0));
end component;	
						
component lfsr is
	port (
   reset  : in  std_logic;
   clk    : in  std_logic; 
   enable : in  std_logic;                    		 	
   count  : out std_logic_vector (LFSR_W-1 downto 0));
end component;


end proj1pack;
