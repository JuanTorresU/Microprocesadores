--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   01:34:41 11/07/2017
-- Design Name:   
-- Module Name:   C:/Users/juano/Desktop/mem_core/sim.vhd
-- Project Name:  mem_core
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: cmem
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
 
    COMPONENT cmem
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         ini : IN  std_logic;
         x : OUT  std_logic_vector(20 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal ini : std_logic := '0';

 	--Outputs
   signal x : std_logic_vector(20 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: cmem PORT MAP (
          clk => clk,
          rst => rst,
          ini => ini,
          x => x
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
      rst <='1';
		ini <='0';
      wait for 10ns;	
		rst <='0';
		ini <='1';
      wait for 20ns;
		ini <='0';
      wait;
   end process;

END;
