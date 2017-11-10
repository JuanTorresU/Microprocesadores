library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
-------------------------------------------
entity ASM1 is
   port(
   clk,reset : 						in std_logic;
	SetUp : 								in std_logic;
	Go : 									in std_logic;
	Random: 								in std_logic_vector(6 downto 0);
	inicio : 							in std_logic;
   vSimB : 								in std_logic; --
	Data_Input : 						inout std_logic_vector(23 downto 0);
	Vel_I1,Vel_I2 :					in std_logic;
	Ac_I1,Ac_I2 : 						in std_logic;
	XYdir : 								inout Std_logic_vector(13 downto 0);
	Data_Out : 							inout std_logic_vector(23 downto 0);
	Wr : 									inout std_logic
	);

end ASM1;

architecture Behavioral of ASM1 is
signal X1,Y1,K,Y2,X2: std_logic_vector(6 downto 0);
signal Vel,Dir,Ac: std_logic_vector(2 downto 0);
signal VelAdd,AcAdd : std_logic_vector(1 downto 0);
signal Vx,Ax : std_logic_vector(1 downto 0);
signal Vxi,Axi : std_logic_vector(2 downto 0);
signal counter: std_logic_vector(4 downto 0);
signal Counter2: std_logic_vector( 3 downto 0);
signal Sum_Vel,Mux_Vel : std_logic_vector( 2 downto 0);
signal Mux_Ac : std_logic_vector( 2 downto 0);
signal Sum_X1,Mux_X1 : std_logic_vector( 6 downto 0);
signal Sum_Y1,Mux_Y1 : std_logic_vector( 6 downto 0);
signal Sel_Vel,Sel_Ac,Sel_X1,Sel_Y1: std_logic_vector(1 downto 0);
signal Sel_Vsim,Ldiff : std_logic;
signal Mux_Sim : std_logic_vector(2 downto 0);
signal Sim_Def : std_logic_vector(23 downto 0):= "000010000000000000000000";
signal Sel_Dir : std_logic;
signal Sel_K : std_logic;
signal Diff1: std_logic_Vector(6 downto 0);
signal Mux_Dir : std_logic_Vector(2 downto 0);
signal Hx,Hy,Hdir,Hac,Hvel,Hx2,Hy2:std_logic;
type Stados is (st0,st1,st2,st3,st4,st5,st6,st7,st8,st9,st10,st11,st12,st13,st14,st15,st16,st17,st18,st19,st20);
signal stF : Stados;
signal Wrr : std_logic;
signal Ex :  std_logic;

begin




--ASM----


--VELOCIDAD DE SIMULACION--
process(clk,reset, vSimB ) 
begin 
	if reset = '1' then 
		Sim_Def<="000010000000000000000000";
	elsif Clk'event and clk = '1' then 
	if vSimB = '1' then  
		Sim_Def<=Sim_Def+"000010000000000000000000";
	else null;
	end if;
	end if;
end process;

Data_Out<=Ex&Dir&Vel&Ac&Y1&X1;
VelAdd<=Vel_I1&Vel_I2;
AcAdd<=Ac_I1&Ac_I2;
XYdir<=Y1&X1;
Wr<=Wrr;

------------------------------------------------CAMINO DE DATOS-------------------------------------------------------------------------

-----------MULTIPLEXOR REGISTRO-------------

--MUX DIRECCION--
process(Sel_Dir)
	begin 
		if Sel_Dir ='1' then 
		Mux_Dir<=Random(2 downto 0);
	else
		Mux_Dir<="000";
	end if;
end process;
  
--MUX VELOCIDAD--
process(Sel_Vel,Mux_Vel,Vxi,Data_Input,Sum_Vel)  
begin 
	case Sel_Vel is
		when "00" => Mux_Vel<= Random(4 downto 2);
		when "01" => Mux_Vel<= Vxi;
		when "10" => Mux_Vel<=Data_Input(19 downto 17);
		when "11" => Mux_Vel<=Sum_Vel;
		when others =>
	end case;
end process;

--MUX ACELERACION--
process(Sel_Ac, Axi, Data_Input)  
 begin 
  case Sel_Ac is
   when "00" => Mux_Ac<= Random(5 downto 3);
   when "01" => Mux_Ac<= Axi;
	when "10" => Mux_Ac<=Data_Input(16 DOWNTO 14);
	when others =>
  end case;
end process;

---MUX_X1--
process(Sel_X1, Random, X2, Data_Input, Sum_X1)  
 begin 
  case Sel_X1 is
   when "00" => Mux_X1<=Random;
	when "01" => Mux_X1<=X2;
	when "10" => Mux_X1<=Data_Input(6 DOWNTO 0);
	when "11" => Mux_X1<=Sum_X1;
	when others =>
  end case;
end process;

--MUX_Y1--
process(Sel_Y1, Random, Y2, Data_Input, Sum_Y1)  
 begin 
  case Sel_Y1 is
   when "00" => Mux_Y1<=Random;
	when "01" => Mux_Y1<=Y2;
	when "10" => Mux_Y1<=Data_Input(13 DOWNTO 7);
	when "11" => Mux_Y1<=Sum_Y1;
	when others =>
  end case;
end process;
--------------------------------------------------------------------------------------------------------------------------------




-------------SUMADORES-------------

--VELOCIDAD--
Sum_Vel<=Data_Input(19 downto 17)+Ac;

--CAMBIO DE MEMORIA--
process(Ldiff,Data_Input, K)
	begin
		if Ldiff = '1' then
			Diff1<=Data_Input(13 downto 7)-K;
		else
			Diff1<=Data_Input(13 downto 7)+K;
		end if;
end process;
			
--CONSTANTE K--
process(Sel_K)
begin 
	if Sel_K = '1' then 
		K<="1000000";
	else 
		K<="0000000";
	end if;
end process;	

--POSICION Y VELOCIDAD--
process(Data_Input, Vel, Diff1)
	begin
		if Data_Input(23)='1' then																			------
		
			case Data_Input(22 downto 20) is
			
						when "000" =>
							Sum_X1<=Data_Input(6 downto 0)+Vel;
							Sum_Y1<=Diff1;
                                                        
                  when "001" => 
							Sum_X1<=Data_Input(6 downto 0)+Vel;
                     Sum_Y1<=Diff1-Vel;											
										
                  when "010" =>	
							Sum_X1<=Data_Input(6 downto 0);
							Sum_Y1<=Diff1-Vel;											  
							 
                  when "011" =>
							Sum_X1<=Data_Input(6 downto 0)-Vel;
							sum_Y1<=Diff1-Vel;												
							 
                  when "100" =>
							Sum_X1<=Data_Input(6 downto 0)-Vel;
							Sum_Y1<=Diff1;												

                  when "101" =>
							Sum_X1<=Data_Input(6 downto 0)-Vel;
							Sum_Y1<=Diff1+Vel;												

                  when "110" =>
							Sum_X1<=Data_Input(6 downto 0)+Vel;
							Sum_Y1<=Diff1+Vel;												

                  when "111" =>
							Sum_X1<=Data_Input(6 downto 0)+Vel;
							Sum_Y1<=Diff1+Vel;
							
						when others => null;
			end case;
		else null; 
		end if;
END PROCESS;

	
------------- BANCO_DE_REGISTROS-------------

process(Clk,reset,Hx,Hy,Hvel,Hdir,Hac)
begin
	if reset = '1' then 
		X1<=(others =>'0');
		Y1<=(others =>'0');
		X2<=(others =>'0');
		Y2<=(others =>'0');  
      Vel<=(others =>'0');
		Ac<=(others =>'0');
		Dir<=(others =>'0');
	 
	elsif clk'event and clk='1' then 
		if Hx = '1' then 
			X1<=Mux_X1;
      else null;
      end if;
      if Hy = '1' then 
			Y1<=Mux_Y1;
  		else null;
	   end if;  
		if Hvel = '1' then 
			Vel<=Mux_vel;
  		else null;
	   end if;  
		if Hac = '1' then 
			Ac<=Mux_Ac;
  		else null;
	   end if;  
		if Hdir = '1' then 
			Dir<=Mux_Dir;
  		else null;
	   end if;  
		if Hx2 = '1' then 
			X2<=Data_Input(6 downto 0);
		else null;
		end if;
		if Hy2 = '1' then 
			Y2<=Data_Input(13 downto 7);
		else null;
		end if;
	end if;
end process;  





 ----------------------------------------CONTROL_DE_SELECCION ESTADOS------------------------------------------------
  
                       
-------------UNIDAD DE CONTROL-------------
process(clk,reset,Inicio,Data_Input,SetUp,Go)
 begin 
   if reset = '1' then
	
	     stf<=st0;
	 
	elsif clk 'event and clk = '1' then 
	   case stF is 
		  when st0 => --CARGO EL REGISTRO--------------
		           Sel_X1<="00";
					  Sel_Y1<="00";
					  Sel_Dir<='0';
					  Sel_Vel<="00";
					  Sel_Ac<="00";
					  SeL_vSim<='0';
					  Hx<='1';
					  Hy<='1';
					  Hvel<='1';
					  Hac<='1';
					  Hdir<='1';
					  Wrr<='X';
					  Ex<='0';
					  stF<=st13; 
					  
	     when st13 => stF<=st1;				 
        when st1 =>
		           if Inicio = '1' then 
					   --Wrr<='X';
					  Hx<='0';
					  Hy<='0';
					  Hvel<='0';
					  Hac<='0';
					  Hdir<='0';
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
						  --     Wrr<='1';
						  
							 if Vxi /= 0 then 
								  
								  Hvel<='1';
								  Sel_Vel<="01";
								 else 
								  Hvel<=Hvel;
                          Sel_Vel<="XX";								  
								 end if;
								 if Axi /=0 then 
								  Hac<='1';
								  Sel_ac<="01";
								  else
								  Sel_ac<="XX";
								  Hvel<=Hvel;
								  end if;	
								  
								Ex<='1';
                       end if;
                   Wrr<='0';						 
                   stf<=st9;
		  
		  
		   when st9 => --CARGO REGISTRO-------------------
		             Hac<='0';
						 Hvel<='0';
						 Wrr<='1';
						 stf<=st14;
						 
			when st14 =>--ESCRIBO MEMORIA--LA--INICIALIZACION
			          Wrr<='0';
						 stf<=st3;
					------------------------	 
			 when st3 =>
		        ---------EVALUO EL GO-----------
				  ---leoo la memoria----------
				   
					 if Go = '1' then 
			  --Ex<='1';
			  -----------EN ESTE ESTADO HE GUARDADO EL REGISTRO DE LA POSICION ANTERIOR--------
					  Hx2<='1';
					  Hy2<='1';
                 Sel_Ac<="01";
					  Hac<='1';
					  stf<=st15;
				     else
					  stf<=st1; 
                 end if;
				------------
		     when st15=> --CARGO EN EL REGISTRO LA ACELERACION Y HABILITO LA CARGA DE LA VELOCIDAD----
					  Hac<='0';
                 Hvel<='1';
					  Hx2<='0';
					  Hy2<='0';
					  Sel_Vel<="11";
                 stf<=st16;
					  
			  when st16 =>
			       --CARGO EN EL REGISTRO LO QUE ESTA EN LA SUMA DEL MULTIPLEXOR---
                 Hvel<='0';
                 Sel_K<='1';
					  Ldiff<='0';
                 Sel_X1<="11";
                 Sel_Y1<="11";					  
					  Hx<='1';
                 Hy<='1';
                 stf<=	st4;				  

		     when st4 =>
			    -------EN ESTE ESTADO A ESCRITO EN EL REGISTRO DE X Y Y--------
				     Sel_X1<="11";
                 Sel_Y1<="11";	
		           Sel_K<='1';
					  Wrr<='1';
					  Hx<='0';
					  Hy<='0';
					  stf<=st10;

      when st10 =>
		         --------EN ESTE ESTADO A CARGADO EN MEMORIA FUTURA --------------           
		            Wrr<='0';
						stf<=st5;
						
      when st5 =>
                ---VOLVER A CARGAR EL REGISTRO PARA LA MEMORIA PRESENTE----------
				     Sel_X1<="11";
					  Sel_Y1<="11";
					  Sel_K<='1';
					  Ldiff<='1';
					  Hx<='1';
                 Hy<='1';	
                 stf<=st11;					  
					  
    ---escribe en el proximo estado
	   when st11 => 
		             Wrr<='1';
						 Hx<='0';
						 Hy<='0';
						 stf<=st6;

------------escribo en la siguiente posicion de memoria

       when st6 => Wrr<='0';
                   stf<=st12;
						 
						 
	    when st12 =>
		             Sel_K<='1';
                   Ldiff<='0';
						 Hx<='1';
						 Hy<='1';
						 Sel_X1<="11";
						 Sel_Y1<="11";
						 Ex<='0';
						 
						 stf<=st7;
			
		 
        when st7 =>Hx<='0';
		             Hy<='0';
						 Wrr<='1';
						 stf<=st8;
						 Ex<='0';
		  when st8 =>
                   Wrr<='0';
                   stf<=st17;

        when st17 =>		
                   Sel_K<='0';
                   Ldiff<='0';
						 Hx<='1';
						 Hy<='1';
						 Sel_X1<="01";
						 Sel_Y1<="01";
						 Ex<='0';
						 stf<=st18;
						 
         when st18 =>
                   Hx<='0';
                   Hy<='0';						 
						 Wrr<='1';
						 stf<=st19;
		    when st19=>
                    Wrr<='0';
                    stf<=st20;

          when st20 =>
                     if Counter2<Sim_Def then
								Counter2<=Counter2+1;
								stf<=st20;
							 
							else
							  Counter2<=(others =>'0');
							  stf<=st2;
							end if;
         when others =>stf<= st0;          		  
                        		
	    end case;
	end if;

end process;

-------------------------------------------------------------------------------
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
         Ax<=AcAdd;
         Counter<=(others =>'0');			
      end if;
	 end if;
end process;
  
process(clk,reset,Vx,Ax)
 begin 
  if reset='1' then 
     Vxi<=(others =>'0');
     Axi<=(others =>'0');
  elsif clk'event and clk='1' then 
     if Vx="01" then 
	     Vxi<=Vxi+1;
	  elsif Vx="10" then 
        Vxi<=Vxi-1;
	  else null;	  
	  end if;
     if Ax= "01" then 
	     Axi<=Axi+1;
	  elsif Ax="10" then 
        Axi<=Axi-1;
	  else null;	  
	  end if;	  
  end if;  
end process;

end Behavioral;
