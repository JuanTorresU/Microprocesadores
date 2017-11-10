--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   01:11:08 11/09/2017
-- Design Name:   
-- Module Name:   C:/Users/juano/Documents/GitHub/Microprocesadores/Proyecto_2/Flowking_Bird/sim_Game_Box.vhd
-- Project Name:  Flowking_Bird
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
 
ENTITY sim_Game_Box IS
END sim_Game_Box;
 
ARCHITECTURE behavior OF sim_Game_Box IS 
 
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
         enable : IN  std_logic;
         rgb : OUT  std_logic_vector(11 downto 0);
         Data : OUT  std_logic_vector(23 downto 0);
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
   signal enable : std_logic := '0';

 	--Outputs
   signal rgb : std_logic_vector(11 downto 0);
   signal Data : std_logic_vector(23 downto 0);
   signal vsync : std_logic;
   signal hsync : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
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
          enable => enable,
          rgb => rgb,
          Data => Data,
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
    
         SetUp<='1';
         Vel_I1 <='1';
         Vel_I2 <='0';
         Ac_I1 <='1';
         Ac_I2 <='0';
			wait for 10 ns;
         enable<='1';
			Go<='1';
			Setup<='0';
			Inicio<='1';
   end process;

END;
