--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:46:50 11/09/2017
-- Design Name:   
-- Module Name:   C:/Proyectos ISE/Proyecto2/sim.vhd
-- Project Name:  Proyecto2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Game_Box
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY sim IS
END sim;
 
ARCHITECTURE behavior OF sim IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Game_Box
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         SetUp : IN  std_logic;
         Go : IN  std_logic;
         inicio : IN  std_logic;
         Vel_I1 : IN  std_logic;
         Vel_I2 : IN  std_logic;
         Ac_I1 : IN  std_logic;
         Ac_I2 : IN  std_logic;
         Enab : IN  std_logic;
			vSimB : 							in std_logic;
         rgb : OUT  std_logic_vector(11 downto 0);
         Data : OUT  std_logic_vector(23 downto 0);
         Rand : OUT  std_logic_vector(6 downto 0);
         vsync : OUT  std_logic;
         hsync : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal SetUp : std_logic := '0';
   signal Go : std_logic := '0';
   signal inicio : std_logic := '0';
   signal Vel_I1 : std_logic := '0';
   signal Vel_I2 : std_logic := '0';
   signal Ac_I1 : std_logic := '0';
   signal Ac_I2 : std_logic := '0';
   signal Enab : std_logic := '0';
	signal vSimB : std_logic:='0';

 	--Outputs
   signal rgb : std_logic_vector(11 downto 0);
   signal Data : std_logic_vector(23 downto 0);
   signal Rand : std_logic_vector(6 downto 0);
   signal vsync : std_logic;
   signal hsync : std_logic;

   -- Clock period definitions
   constant clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Game_Box PORT MAP (
          clk => clk,
          reset => reset,
          SetUp => SetUp,
          Go => Go,
          inicio => inicio,
          Vel_I1 => Vel_I1,
          Vel_I2 => Vel_I2,
          Ac_I1 => Ac_I1,
          Ac_I2 => Ac_I2,
          Enab => Enab,
          rgb => rgb,
          Data => Data,
          Rand => Rand,
			 vSimB=>vSimB,
          vsync => vsync,
          hsync => hsync
			 
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;
reset   <= '0' after  clk_period*10;

	inicio<='1';
	Go <= '1';
	vel_I1 <= '1';
	enab <= '1';
	
	

      wait;
   end process;

END;
