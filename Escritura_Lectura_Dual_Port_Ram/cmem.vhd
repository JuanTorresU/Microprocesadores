----------------------------------------------------------------------------------
-- Company: UD
-- Engineer: 
-- 
-- Create Date:    09:20:57 11/12/2013 
-- Design Name: 
-- Module Name:  - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: escritura y lectura de una memoria sincrónica (escritura y lectura)
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

library work;
use work.proj1pack.all;

entity cmem is
   port (
	clk: in std_logic;
	rstmem: in std_logic;
	inimem: in std_logic;
	z: out std_logic_vector (20 downto 0));
end cmem;

architecture Behavioral of cmem is



--Señales para lectura y escritura de la RAM
--La memoria es simple dual port con tamaño 21 a 8192
type mq is (s0,s1,s2,s3,s4,s5);
signal asm: mq;
signal a: std_logic_VECTOR(12 downto 0);
signal ab: std_logic_VECTOR(12 downto 0);
signal d:  std_logic_VECTOR(20 downto 0);
signal we: std_logic_vector( 0 downto 0);
signal spo: std_logic_VECTOR(20 downto 0);
--------------------------------------------
begin

--ASM : escribe una posicion de memoria y luego la lee almacenando los datos en el registros x
ab<=(others=>'0');
process (clk,rstmem)  

	begin
		 if rstmem ='1' then
		       asm<= s0;
				 a<="0000000000000";
				 d<=(others=>'0');
				 z <= (others =>'0');
				 we <="0";
		 elsif clk'event and clk ='1' then 
		 case asm is
					
					     when s0 =>
									if inimem ='1' then 
										 asm <= s1;
								   else
										 asm <= s0;
									end if;
									
							when s1 =>        --se alista la memoria para escribir
							a <="0000000001010"; --dirección
							d<="000000000011111111111";  --dato
							we <="1";
							asm <= s2;
							
							when s2 =>
							we<="0";     -- se escribe la memoria
							asm <= s3;
							
							when s3 =>
							a<="0000000001010";
							asm <= s4;
							
							when s4 =>
							asm <= s5;
							
							when s5 =>
							z<=spo;  -- se lee la memoria
							asm <= s0;
							
							when others =>null;
						end case;
		 end if;
end process;
--------------------------------------------------------------------------------------------------------------





--Componentes
c1: ASM port map --Maquina e estados algoritmica
(clk,rst,ini,go,w,vel,dir,x,y);
c2: memc port map --memoria generada desde el IP-core generator
(clk,we,a,d,spo,a,clk);
-------------


end Behavioral;

