library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
use work.main_pkg.all;
use work.lfsr_pkg.all;

entity Main is
Port(
	clk,reset,Go,Setup :								in std_logic;
	DownVel:												in std_logic;
	UpVel:												in std_logic;
	DownVelSim:											in std_logic;
	UpVelSim:											in std_logic;
	hsync,vsync : 										out STD_LOGIC;
	testigo :                                 out std_logic_vector(0 downto 0);
	rgb : 												out  STD_LOGIC_VECTOR(11 downto 0);
	setUp_Out :                               out std_logic);
end Main;
 
architecture Behavioral of Main is
--Señales de la memoria
signal we :									std_logic_vector(0 downto 0);
signal Dout:								std_logic_vector(0 downto 0);
signal Dat:									std_logic_vector(0 downto 0);
signal Din:									std_logic_vector(0 downto 0);
signal Dir:									std_logic_vector(11 downto 0);
signal DirVga:								std_logic_vector(11 downto 0);
signal Wb :                         std_logic_vector(0 downto 0);
signal Dinb:                        std_logic_vector(0 downto 0);
----------------------
--Señales de la pantalla
signal h : std_logic_vector ( 10 downto 0);
signal v : std_logic_vector ( 9 downto 0);


begin

testigo<=Dat;
setup_out<=setup;
P1: ASM port map(
	DownVelSim	=>DownVelSim,
	UpVelSim		=>UpVelSim,
	DownVel		=>DownVel,
	UpVel			=>UpVel,
	clk			=>clk,
	reset			=>reset,
	Go				=>Go,
	Setup			=>Setup,
	Dout			=>Dout,
	Dir			=>Dir,
	we				=>we,
	Din			=>Din);
	
	
	
p2 : MemR port map(
 
    clka => clk,
    wea =>we,
    addra =>Dir,
    dina => Dout,
    douta =>din,
    clkb =>clk,
    web => Wb,
    addrb => DirVga,
    dinb =>dinb,
    doutb =>Dat

);	
	
P3: VGA port map(
	clk => clk, 
	reset => reset, 
	h => h, 
	v => v, 
	vsync => vsync, 
	hsync => hsync, 
	dir => dirVga);

P4: GPU port map(
	clk=> clk,
	reset=>reset,
	h => h, 
	v => v, 
	rgb => rgb,
	dat => Dat);
	
end Behavioral;

