library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.lfsr_pkg.all;

package main_pkg is

component lfsr is
Port (
    reset  : in  std_logic;
    clk    : in  std_logic; 
    count  : out std_logic_vector (LFSR_W-1 downto 0));
end component;


component ASM is
port(
	clk,reset,Go,Setup :					in std_logic;
	DownVel:									in std_logic;
	UpVel:									in std_logic;
	DownVelSim:								in std_logic;
	UpVelSim:								in std_logic;
	we :										out std_logic_vector( 0 downto 0);
	Din :										in std_logic_vector(0 downto 0);
	Dout :									out std_logic_vector(0 downto 0);
	Dir :										out std_logic_vector(11 downto 0));

end component;




component MemR is
 PORT (
    clka : IN STD_LOGIC;
    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addra : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
    dina : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    clkb : IN STD_LOGIC;
    web : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addrb : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
    dinb : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    doutb : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
  );
end component;
--component Mem IS
--  PORT (
--    a : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
--    d : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
--    dpra : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
--    clk : IN STD_LOGIC;
--    we : IN STD_LOGIC;
--    spo : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
--    dpo : OUT STD_LOGIC_VECTOR(0 DOWNTO 0));
--	 
--end component;

component VGA is

    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           vsync : out  STD_LOGIC;
           hsync : out  STD_LOGIC;
           h : out  STD_LOGIC_VECTOR (10 downto 0);
           v : out  STD_LOGIC_VECTOR (9 downto 0);
			  Dir : out STD_LOGIC_VECTOR ( 11 downto 0));
end component;

component GPU is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
			  dat : in std_logic_vector ( 0 downto 0);
	        h : in  STD_LOGIC_VECTOR (10 downto 0);
           v : in  STD_LOGIC_VECTOR (9 downto 0);
           rgb : out  STD_LOGIC_VECTOR (11 downto 0));

end component;


end main_pkg;

