--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:37:12 11/15/2017
-- Design Name:   
-- Module Name:   C:/Proyectos ISE/prueba_3/Sim_Main.vhd
-- Project Name:  prueba_3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Main
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
 
ENTITY Sim_Main IS
END Sim_Main;
 
ARCHITECTURE behavior OF Sim_Main IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Main
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         Go : IN  std_logic;
         Setup : IN  std_logic;
         DownVel : IN  std_logic;
         UpVel : IN  std_logic;
         DownVelSim : IN  std_logic;
         UpVelSim : IN  std_logic;
         hsync : OUT  std_logic;
         vsync : OUT  std_logic;
         rgb : OUT  std_logic_vector(11 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal Go : std_logic := '0';
   signal Setup : std_logic := '0';
   signal DownVel : std_logic := '0';
   signal UpVel : std_logic := '0';
   signal DownVelSim : std_logic := '0';
   signal UpVelSim : std_logic := '0';

 	--Outputs
   signal hsync : std_logic;
   signal vsync : std_logic;
   signal rgb : std_logic_vector(11 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Main PORT MAP (
          clk => clk,
          reset => reset,
          Go => Go,
          Setup => Setup,
          DownVel => DownVel,
          UpVel => UpVel,
          DownVelSim => DownVelSim,
          UpVelSim => UpVelSim,
          hsync => hsync,
          vsync => vsync,
          rgb => rgb
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
reset<= '0';
Go <= '1';
Setup <= '0';
UpVel<= '0';
DownVel<='0';


      wait;
   end process;

END;
