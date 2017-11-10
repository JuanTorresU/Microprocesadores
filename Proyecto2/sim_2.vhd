--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:43:12 11/09/2017
-- Design Name:   
-- Module Name:   C:/Proyectos ISE/Proyecto2/sim_2.vhd
-- Project Name:  Proyecto2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ASM1
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
 
ENTITY sim_2 IS
END sim_2;
 
ARCHITECTURE behavior OF sim_2 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ASM1
    PORT(
         Data_Input : IN  std_logic_vector(23 downto 0);
         Random : IN  std_logic_vector(6 downto 0);
         clk : IN  std_logic;
         reset : IN  std_logic;
         SetUp : IN  std_logic;
         Go : IN  std_logic;
         inicio : IN  std_logic;
         Vel_I1 : IN  std_logic;
         Vel_I2 : IN  std_logic;
         Ac_I1 : IN  std_logic;
         Ac_I2 : IN  std_logic;
         Data_Out : OUT  std_logic_vector(23 downto 0);
         XYdir : OUT  std_logic_vector(13 downto 0);
         Wr : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Data_Input : std_logic_vector(23 downto 0) := (others => '0');
   signal Random : std_logic_vector(6 downto 0) := (others => '0');
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal SetUp : std_logic := '0';
   signal Go : std_logic := '0';
   signal inicio : std_logic := '0';
   signal Vel_I1 : std_logic := '0';
   signal Vel_I2 : std_logic := '0';
   signal Ac_I1 : std_logic := '0';
   signal Ac_I2 : std_logic := '0';

 	--Outputs
   signal Data_Out : std_logic_vector(23 downto 0);
   signal XYdir : std_logic_vector(13 downto 0);
   signal Wr : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ASM1 PORT MAP (
          Data_Input => Data_Input,
          Random => Random,
          clk => clk,
          reset => reset,
          SetUp => SetUp,
          Go => Go,
          inicio => inicio,
          Vel_I1 => Vel_I1,
          Vel_I2 => Vel_I2,
          Ac_I1 => Ac_I1,
          Ac_I2 => Ac_I2,
          Data_Out => Data_Out,
          XYdir => XYdir,
          Wr => Wr
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

      -- insert stimulus here 

      wait;
   end process;

END;
