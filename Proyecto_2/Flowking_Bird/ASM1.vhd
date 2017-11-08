library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
-------------------------------------------
entity ASM1 is
   port(
   clk,reset : in std_logic;
	SetUp : in std_logic;
	Go : in std_logic;
	Random_X,Random_Y : in std_logic_vector(6 downto 0);
	inicio : in std_logic;
   RdirX,RvelX,RacX : std_logic_vector(6 downto 0);
	Data_Input : in std_logic_vector(23 downto 0);
	Vel_I1,Vel_I2 : in std_logic;
	Ac_I1,Ac_I2 : in std_logic;
	--Vel_I,Ac_I : in std_logic;
	XYdir : out Std_logic_vector(13 downto 0);
	Data_Out : out std_logic_vector(23 downto 0);
	Wr : out std_logic			
--	RamdonX,RandomY : in std_logic_vector(6 downto 0)
	
	);

end ASM1;

architecture Behavioral of ASM1 is
--signal Data : std_logic_vector(23 downto 0);
signal X1,Y1,X2,Y2,X3,Y3 : std_logic_vector(6 downto 0);
signal Vel,Dir,Ac: std_logic_vector(2 downto 0);
signal VelAdd,AcAdd : std_logic_vector(1 downto 0);
signal Vx,Ax,Vxi,Axi : std_logic_vector(2 downto 0);
signal counter : std_logic_vector(4 downto 0);
--signal Random_X,Random_Y : std_logic_vector(6 downto 0);
--signal state : std_logic;
signal Rdir,Rvel,Rac : std_logic_vector(2 downto 0);
type Stados is (st0,st1,st2,st3,st4,st5,st6,st7,st8);
signal stF : Stados;
signal Wrr : std_logic;
signal Ex :  std_logic;
begin
--ASM----
Rdir<=RdirX(2 downto 0);
Rvel<=RvelX(2 downto 0);
Rac<=RacX(2 downto 0);
Data_Out<=Ex&Dir&Vel&Ac&Y1&X1;
VelAdd<=Vel_I1&Vel_I2;
AcAdd<=Ac_I1&Ac_I2;
XYdir<=Y1&X1;
Wr<=Wrr;
process(clk,Inicio,Data_Input,SetUp,Go,Axi,Vxi)
 begin 
   if reset = '1' then
	
	     stf<=st0;
	 
	elsif clk 'event and clk = '1' then 
	   case stF is 
		  when st0 =>
		           X1<=Random_X;
					  Y1<=Random_Y;
					  Dir<=Rdir;
					  Vel<=Rvel;
					  Ac<=rac;
					  Wrr<='X';
					  Ex<='0';
					  stF<=st1;  
					  --EN EL ESTADO STF0 SE CARGA PREVIAMENTE DE FORMA ALEATORIA LA POSICION DE MEMORIA Y ETC	
        when st1 =>
		           if Inicio = '1' then 
					 -- Wrr<='X';
					  Stf<=st2;
					  elsif Inicio = '0' then
					  Stf<=st1;
					 -- Wrr<='X';
			
		         	end if;
					Wrr<='X';
			
---en este estado se difiere de la accion go y accion setup
---Particiones 
        when st2 =>if SetUp = '1' then
                     ---CONTROL DEL RANGO DE VISION--pendiente
                     --CONTROL DISTANCIA DE VISION							
						       Wrr<='1';
								 Ex<='1';
                         if Vxi /= 0 then 
								  Vel<=Vxi;
								 else 
								   Vel<=Vel;
								 end if;
								 if Axi /=0 then 
								   Ac<=Axi;
								  else
								    Ac<=Ac;
								  
								  end if:
			
                   end if;						 
                   stf<=st3;
		  
		  
		  
		  
		  when st3 =>
		              --LEO LA MEMORIA DE LA PARTE SUPERIOR Y AJUSTOS LOS VALORES
						 -- SERAN CARGADOS EN EL SISTEMA
                  if Go = '1' then 
						  
						  Ac<=Data_Input(16 DOWNTO 14);
						  Vel<=Data_Input(19 downto 17);
						  X3<=Data_Input(6 downto 0);
						  Y3<=Data_Input(13 downto 7);
						  Wr<='X';
						  ------AJUSTO TANTO VELOCIDAD COMO ACELERACION--
						  if Data_Input(23)='1' then
						    case Data_Input(22 downto 20) is
						     when "000" => 
												X2<=Data_Input(6 downto 0)+Vel+64;
												Y2<=Data_Input(13 downto 7)+64;
												
											
                                                        
                       when "001" => X2<=Data_Input(6 downto 0)+Vel+64;
												Y2<=Data_Input(13 downto 7)+64-Vel;
												

                       when "010" =>X2<=Data_Input(6 downto 0)+64;
											  Y2<=Data_Input(13 downto 7)+64-Vel;
												
							 
                       when "011" => X2<=Data_Input(6 downto 0)-Vel+64;
												Y2<=Data_Input(13 downto 7)+64-Vel;
												
							 
                       when "100" => X2<=Data_Input(6 downto 0)-Vel+64;
												Y2<=Data_Input(13 downto 7)+64;
												

                       when "101" => X2<=Data_Input(6 downto 0)-Vel+64;
												Y2<=Data_Input(13 downto 7)+Vel+64;
												

                       when "110" =>X2<=Data_Input(6 downto 0)+Vel+64;
												Y2<=Data_Input(13 downto 7)+64+Vel;
												

                       when "111" => X2<=Data_Input(6 downto 0)+Vel+64;
												Y2<=Data_Input(13 downto 7)+64+Vel;
												
						    
							  when others => null;
							 
						     end case;
						  else null; 
						  end if;
						  
                    stf<=st4;
						  
						  
							--	Stf<=st5;
                  else 
						      Stf<=st1;

                  end if;						
--		
		when st4 =>
		           Wrr<='1';
		           Y1<=Y2;
					  X1<=X2;
					  stf<=st5;
--		
--		
--		--if (x2=(others =>'0') and X3= 
--		            --corregir ese movimiento
--					   --escribir en la matriz esta futuruo
--						
--						 
      when st5 =>
                   Wrr<='1';
                   Y1<=Y1-64;
                   X1<=X1-64;
                   stf<=st6;
--
       when st6 => Ex<='0';
                   Wrr<='1';
                   X1<=X3+64;
                   Y1<=X3+64;
                   stf<=st7;
        when st7 =>
		             Ex<='0';
                   Wrr<='1';
                   X1<=X1-64;
                   Y1<=X1-64;
                   stf<=st8;
		  when st8 =>
                   X1<=X2-64;
                   Y2<=Y2-2;
                   stf<=st1;						 
						 
         when others => null;          		  
                        		
	    end case;
	end if;

end process;
------------------RECEPCION_DE_DATOS---------
process(clk,reset,VelAdd,AcAdd)
   begin 
	 if reset='1' then
           Vx<=(others =>'0');
			  Ax<=(others =>'0');
			  
    elsif clk'event and clk ='1' then
      if Counter<63 then
         Counter<=Counter+1;
         Vx<=Vx;
         Ax<=Ax;
      else
         Vx<=VelAdd;
         Ax=AcAdd;
         Counter<=(others =>'0');			
      end if;
	 end if;
end process;  
-------------  
process(clk,reset,Vx,Ax)
 begin 
  if reset='1' then 
     Vxi<=(others =>'0');
     Axi<=(others =>'0');
  elsif clk'event and clk='1' then 
     if Vx="01" then 
	     Vxi<=Vxi+1;
	  elsif Vx="01" then 
        Vxi<=Vxi-1;
	  else null;	  
	  end if;
     if Ax="01" then 
	     Axi<=Axi+1;
	  elsif Ax="01" then 
        Axi<=Axi-1;
	  else null;	  
	  end if;	  
  end if;  
end process;
end Behavioral;

