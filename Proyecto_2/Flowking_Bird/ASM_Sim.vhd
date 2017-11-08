--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:33:52 11/05/2017
-- Design Name:   
-- Module Name:   /home/Lotharius16/Microprocesadores/Flowking_Bird/ASM_Sim.vhd
-- Project Name:  Flowking_Bird
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
 
ENTITY ASM_Sim IS
END ASM_Sim;
 
ARCHITECTURE behavior OF ASM_Sim IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ASM1
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         SetUp : IN  std_logic;
         Go : IN  std_logic;
         Random_X : IN  std_logic_vector(6 downto 0);
         Random_Y : IN  std_logic_vector(6 downto 0);
         inicio : IN  std_logic;
         RdirX : IN  std_logic_vector(6 downto 0);
         RvelX : IN  std_logic_vector(6 downto 0);
         RacX : IN  std_logic_vector(6 downto 0);
         Data_Input : IN  std_logic_vector(23 downto 0);
         Vel_I1 : IN  std_logic;
         Vel_I2 : IN  std_logic;
         Ac_I1 : IN  std_logic;
         Ac_I2 : IN  std_logic;
         XYdir : OUT  std_logic_vector(13 downto 0);
         Data_Out : OUT  std_logic_vector(23 downto 0);
         Wr : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal SetUp : std_logic := '0';
   signal Go : std_logic := '0';
   signal Random_X : std_logic_vector(6 downto 0) := (others => '0');
   signal Random_Y : std_logic_vector(6 downto 0) := (others => '0');
   signal inicio : std_logic := '0';
   signal RdirX : std_logic_vector(6 downto 0) := (others => '0');
   signal RvelX : std_logic_vector(6 downto 0) := (others => '0');
   signal RacX : std_logic_vector(6 downto 0) := (others => '0');
   signal Data_Input : std_logic_vector(23 downto 0) := (others => '0');
   signal Vel_I1 : std_logic := '0';
   signal Vel_I2 : std_logic := '0';
   signal Ac_I1 : std_logic := '0';
   signal Ac_I2 : std_logic := '0';

 	--Outputs
   signal XYdir : std_logic_vector(13 downto 0);
   signal Data_Out : std_logic_vector(23 downto 0);
   signal Wr : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ASM1 PORT MAP (
          clk => clk,
          reset => reset,
          SetUp => SetUp,
          Go => Go,
          Random_X => Random_X,
          Random_Y => Random_Y,
          inicio => inicio,
          RdirX => RdirX,
          RvelX => RvelX,
          RacX => RacX,
          Data_Input => Data_Input,
          Vel_I1 => Vel_I1,
          Vel_I2 => Vel_I2,
          Ac_I1 => Ac_I1,
          Ac_I2 => Ac_I2,
          XYdir => XYdir,
          Data_Out => Data_Out,
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
     SetUp<='1';
	  Go<='1';
	  Random_X<="0001000";
	  Random_Y<="0001000";
	  inicio<='1';
	  Data_Input<="1010001001000";
   end process;

END;
