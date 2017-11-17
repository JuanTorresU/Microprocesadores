library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
use work.main_pkg.all;
	use work.lfsr_pkg.all;

entity ASM is
port(
	clk,reset,Go,Setup :			in std_logic;
	Din :										in std_logic_vector(0 downto 0);
	DownVel:									in std_logic;
	UpVel:									in std_logic;
	DownVelSim:								in std_logic;
	UpVelSim:								in std_logic;
	we :										out std_logic_vector(0 downto 0);
	Dout :									out std_logic_vector(0 downto 0);
	Dir :										out std_logic_vector(11 downto 0));
	
end ASM;

architecture Behavioral of ASM is
--constant CNT_SIZE : integer := 22;


signal Random: std_logic_vector (LFSR_W-1 downto 0);
--Señales datos del ave
signal x:									std_logic_vector(5 downto 0);
signal y:									std_logic_vector(5 downto 0);
signal Vel:									std_logic_vector(2 downto 0);
signal Veltemp:							std_logic_vector(2 downto 0);
signal Sen:									std_logic_vector(2 downto 0);
signal E:									std_logic_vector(0 downto 0);
--Estados
type Stados is (s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s14,s15);
signal sF : Stados;
signal VelSim:								std_logic_vector(24 downto 0);
signal cont:								std_logic_vector(24 downto 0);
signal counter_s,counter_F:                     std_logic_vector(0 downto 0);
--Contador, temporales de entrada
signal UpVelSimX:							std_logic;
--signal UpVelSimPrev:							std_logic;
signal selsim:                       std_logic;
signal Velsim_X,Velsim_Xt:                    std_logic_vector(24 downto 0); 
signal DownVelSimX:						std_logic;
signal Clkdiv :                         std_logic;
signal counterclk:                      std_logic_vector(24 downto 0);  
signal counter:								std_logic_vector(22 downto 0);

begin

Velsim<="1111111111111111111111111" when(selsim = '0') else Velsim_Xt when (selsim = '1');
Velsim_Xt<=Velsim_X+"1111111111111111111111111";

Dir<=y&x;
Dout<=E;
process(clkdiv,reset,random,y,x,vel,sen,E)
begin 

	if reset = '1' then
		x<=(others=>'0');
		y<=(others=>'0');
		Vel<=(others=>'0');
		Sen<=(others=>'0');
		cont <= (others=>'0');
	--	VelSim <=(others=>'0');
		--Veltemp<=(others=>'0');
		x<=(others =>'0');
		y<=(others =>'0');
		E<="0";
		we<="1";
		sf<=s0;
		
	elsif clkdiv 'event and clkdiv = '1' then 
		case sF is
		
			when s0 =>
					Sen <="111";
					Vel<= "001";
					selsim<='0';
					x <=Random;
					y <=Random;
					counter_S<="0";
					Counter_F<="0";
					sf<=s3;
					
			when s3 =>
					if Go = '1' then
						E <= "0";
						Counter_S<="1";
						we <=	"1";
						--sf <= s7;
					else
					   we<="0";
					   Counter_S<="0";
					end if;
					  
					sf<=s4;
					---cargo en memoria---
			when s14=>	
                   if Counter_s = "1" and Counter_f="1" then 
                     We<="0";
							sf<=s7;
                   else 
                     sf<=s3;
                   end if;							
								
			when s4 =>
                  we<="0";					
						sf<=s6;
					
			when s6 =>
				if setup = '1' then
					--E<="1";
					Vel <= Veltemp;
               counter_F<="1";					
              -- We<="1";
					x<=random;
               y<=random;
              -- sf<=s14;					
				else 
				   E<="0";
					vel<=vel;
               x<=x;
               y<=y;
					Counter_F<=Counter_F;
				--	sf<=s3;
               --counter_S<=counter_S;					
				end if;
				  We<="1";
				  sf<=s14;
				
			when s7 =>
			    --cargo en memoria la velocidad---, la posicion X y Y------------------
					we <="0";
					sf<=s8;
					
			when s8 =>
				if Sen = "000" then
					  x<=x+vel;
	              y<=y;				
					  
					elsif Sen  ="001" then
				     x<=x+vel;
                 y<=y-vel;					 
					  
					elsif Sen ="010"  then 
					  x<=X;
					  Y<=y-vel;
					elsif Sen ="011" then 
					   x<=x-vel;
						y<=y-vel;
					elsif Sen = "100" then
					   x<=x-vel;
						y<=y;
					elsif Sen = "101" then 
					   x<=x-vel;
						y<=y+vel;
					elsif Sen = "110" then 
					   x<=x;
						y<=y+vel;
					elsif Sen = "111" then 
					   x<=x+vel;
						y<=y+vel;
					end if;
				sf <= s9;				
				
			when s9 =>
				E <= "1";
				we<="1";
				sf <= s10;
			when s10 =>
				we<="0";
				sf <= s5;
		----------escribi la memoria futura---------------------------	
          when s5 =>
			       E<="0";
                we<="1";
					 sf<=s15;
         when  s15 =>
			       we<="0";
					 selsim<='1';
					 sf<=s11;
------------------------espera de la velocidad--------		
			when s11 =>
			
				if cont = Velsim then
				--	cont<=cont+1;
				   cont <= (others=>'0' );
					sf<=s3;
					
				else
					--cont <= (others=>'0' );
					cont<=cont+1;
					sf<=s3;
				end if;
--			when s12 =>
--				if UpVelSimx='1' then
--					
--					Velsim <= VelSim - "0010010000000000000000000";
--					sf<=s3;
--				else
--				   Velsim<=Velsim;
--					sf<=s13;
--				end if;
--			when s13 =>
--				if DownVelSimx='1' then
--					
--					Velsim <= VelSim + "0010010000000000000000000";
--					
--				else
--				   Velsim<=VelSim;
--					--sf<=s4;
--				end if;
--				 sf<=s3;
			when others =>sf<= s0; 
		end case;
	end if;
end process;					

C1: lfsr port map(
	clk			=>clk,
	reset			=>reset,
	count			=>Random);


process(clk,reset,UpVelSim,DownVelSim)
   begin 
	 if reset='1' then
           UpVelSimX<='0';
			  DownVelSimX<='0';
			  
    elsif clk'event and clk ='1' then
      if Counter<5000000 then
         Counter<=Counter+1;
         UpVelSimX<=UpVelSimX;
         DownVelSimX<=DownVelSimX;
      else
         UpVelSimX<=UpVelSim;
         DownVelSimX<=DownVelSim;
         Counter<=(others =>'0');			
      end if;
	 end if;
end process; 
process(clk,reset)
 begin 
 if reset = '1' then 
 
   Velsim_X<="1111111111111111111111111";
 
 elsif clk 'event and clk='1' then
      if UpVelsimX = '1' then 
		 Velsim_X<=Velsim_X-"1000000000000000000000000";
		elsif DownVelsimX = '1' then
       Velsim_X<=Velsim_X+"1000000000000000000000000";
		end if; 
 end if;

end process;
--process(clk)
--    begin
--	if (clk'event and clk='1') then
--		if (UpVelSimPrev xor UpVelSim) = '1' then
--			counter <= (others => '0');
--			UpVelSimPrev <= UpVelSim;
--		elsif (counter(22) = '0') then
--			counter <= counter + 1;
--        	else
--			UpVelSimX <= UpVelSim;
--		end if;
--	end if;
--end process;


process(clk)
 begin 
  if clk 'event and clk ='1' then
    if counterclk<50000000 then 
	  clkdiv<='0';
	  counterclk<=counterclk+1;
	 else
	  clkdiv<='1';
	  counterclk<=(others =>'0');
    end if;
  end if;
end process;


process(clk,reset) 
begin
if reset = '1' then 
  Veltemp<=(others =>'0');
elsif clk 'event and clk ='1' then  
              if UpVel ='1' then
						Veltemp <= Veltemp + '1';
						--sf<=s6;
					elsif DownVel ='1' then		
						Veltemp <= Veltemp - '1';
					end if;
end if;					
end process;
end Behavioral;