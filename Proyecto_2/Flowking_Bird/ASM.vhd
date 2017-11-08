----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:55:00 10/24/2017 
-- Design Name: 
-- Module Name:    ASM - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ASM is
    Port ( Stop : in  STD_LOGIC;
           Velocidad_1 : in  STD_LOGIC;
           Aceleracion_1 : in  STD_LOGIC;
           X_direccion : in  STD_LOGIC;
           Y_direccion : in  STD_LOGIC);
end ASM;

architecture Behavioral of ASM is

begin


end Behavioral;

