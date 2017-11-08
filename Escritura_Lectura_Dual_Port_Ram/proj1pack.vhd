--	Package File Template
--
--	Purpose: This package defines supplemental types, subtypes, 
--		 constants, and functions 


library IEEE;
use IEEE.STD_LOGIC_1164.all;

package proj1pack is


component memc IS
	port (
	clka: in std_logic;
	wea: in std_logic_vector(0 downto 0);
	addra: in std_logic_vector(12 downto 0);
	dina: in std_logic_vector(20 downto 0);
	doutb: out std_logic_vector(20 downto 0);
	addrb: in std_logic_vector(12 downto 0);
	clkb: in std_logic);
END component;



end proj1pack;
