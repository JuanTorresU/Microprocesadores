library ieee;	
use ieee.std_logic_1164.all;
use work.lfsr_pkg.all;

entity lfsr is
port (
	reset  : in  std_logic;
   clk    : in  std_logic; 
   enable : in  std_logic;                    			
   count  : out std_logic_vector (LFSR_W-1 downto 0));
end entity;

architecture rtl of lfsr is
signal count_i    	: std_logic_vector (LFSR_W-1 downto 0);
signal feedback 	: std_logic;

begin
process (reset, clk, count_i) 
begin
	feedback <= not(count_i(LFSR_W-1) xor count_i(LFSR_W-5));		-- LFSR size 9

   if (reset = '1') then
		count_i <= (others=>'0');
	elsif (rising_edge(clk)) then
		if (enable = '1') then
			count_i <= count_i(LFSR_W-2 downto 0) & feedback;
		end if;	
	end if;
   count <= count_i;
	
end process;

end architecture;
