library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity GPU is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
			  dat : in std_logic_vector ( 0 downto 0);
	        h : in  STD_LOGIC_VECTOR (10 downto 0);
           v : in  STD_LOGIC_VECTOR (9 downto 0);
           rgb : out  STD_LOGIC_VECTOR (11 downto 0));
end GPU;

architecture Behavioral of GPU is
signal x1,x2 : std_logic_vector(6 downto 0);
signal y1,y2 : std_logic_vector(5  downto 0);
signal q : std_logic_vector ( 1 downto 0);
signal cont : std_logic_vector(7 downto 0);
signal c: std_logic;

begin


-- Limites dinámicos de las celdas dependen de las señales apuntadoras
-- limites horizontales
--x1 <='0'& h(5 downto 0);
--x2 <=h(6 downto 1)&'1';
--les
x1 <='0'& h(5 downto 0);
x2 <=h(6 downto 1)&'1';
-- limites verticales
y1 <=v(5 downto 0);
y2 <=v(5 downto 0);


-- Rectangulos dinámicos
-- cada bit se enciende cuando los contadores se encuentran en los rangos definidos por los limites dinámicos
c <='1' when (h >= x1 and h <= x2) and ( v >= y1 and v <= y2) else '0';
q <= c & dat;

process (q)
begin
case q is
		when "11" =>	rgb <= "111100000000";
		when others  =>  	rgb <= "000000000000";
end case;
end process;


process (clk,reset)
begin
if reset = '1' then
cont<= (others =>'0');
elsif clk' event and clk='1' then
		if cont=1000000 then
		cont<=(others=>'0');
		else 
		cont<=cont+1;
end if;
end if;
end process;

end Behavioral;



