library ieee;
use ieee.std_logic_1164.all;
entity MSS is
	port(Clock, Resetn, Start, Consulta_puntuacion, Consulta_mejor, Empezar, Pedir_numero, Siguiente, 
	     Igual, Limite_Aciertos, Jugador_Mejoro, Actualizar_mejor_puntuacion, Aumentar_f, Regresar: in std_logic;
		  En_Max_Vuelta, Ld_Max_VUelta, En_Reloj, Ld_Reloj, En_Dir, Ld_Dir, En_Secuencia, 
		  S0, D0, D1, D2, En_display, RorW_Num, En_Rondas, Ld_Rondas, En_Aciertos, Ld_Aciertos, RorW_Aciertos, 
		  En_Mejor, En_Num, En_Decena, En_Unidad, Error, Reset_Reloj: out std_logic);
end MSS;

architecture Controlador of MSS is 
type estado is (Ta,Tb,Tc,Td,Te,Tf,Tg,Th,Ti,Tj,Tk,Tl,Tm,Tn,Too,Tp,Tq,Tr,Ts,Tu,Tv,Tw,Tx,Ty,Tz,
					 Taa,Tab,Tac,Tad,Tae,Taf,Tag,Tah,Tai,Taj,Tak,Tal,Tam,Tan,Tao,Tap,Taq,Tar,Tas,Tat);
signal y: estado;
begin
	process(Clock, Resetn)
	begin
		if Resetn='0' then y<=Ta;
		elsif (Clock' event and Clock='1') then
			case y is
				when Ta=> if Start='1' then y<= Tb; else y<= Ta; end if;
				when Tb=> if Start='0' then y<= Tc; else y<= Tb; end if;
				when Tc=> if Consulta_puntuacion='1' then y<= Td; else y<= Tg; end if;
				when Td=> if Consulta_puntuacion='0' then y<= Te; else y<= Td; end if; 
				when Te=> if Regresar='1' then y<= Tf; else y<= Te; end if; 
				when Tf=> if Regresar='0' then y<= Tc; else y<= Tf; end if;  
				when Tg=> if Consulta_mejor='1' then y<= Th; else y<= Tk; end if; 
				when Th=> if Consulta_mejor='0' then y<= Ti; else y<= Th; end if;
				when Ti=> if Regresar='1' then y<= Tj; else y<= Ti; end if; 
				when Tj=> if Regresar='0' then y<= Tc; else y<= Tj; end if;   
				when Tk=> if Empezar='1' then y<= Tl; else y<= Tc; end if;   
				when Tl=> if Empezar='0' then y<= Tm; else y<= Tl; end if;
				when Tm=> y<= Tn;
				when Tn=> if Pedir_numero='1' then y<= Tr; else y<= Too; end if;   
				when Too=> y<= Tp;
				when Tp=> y<= Tq;
				when Tq=> y<= Tn;
				when Tr=> y<= Ts;
				when Ts=> if Pedir_numero='1' then y<= Tu; else y<= Ts; end if;   --
				when Tu=> y<= Tv;
				when Tv=> if Pedir_numero='1' then y<= Tah; else y<= Tw; end if;   
				when Tw=> if Siguiente='1' then y<= Tx; else y<= Tw; end if;
				when Tx=> if Siguiente='0' then y<= Ty; else y<= Tx; end if;
				when Ty=> y<= Tz;
				when Tz=> if Siguiente='1' then y<= Taa; else y<= Tz; end if;
				when Taa=> if Siguiente='0' then y<= Tab; else y<= Taa; end if;
				when Tab=> y<= Tac;
				when Tac=> y<= Tad;
				when Tad=> if Siguiente='1' then y<= Tae; else y<= Tad; end if; 
				when Tae=> if Siguiente='0' then y<= Taf; else y<= Tae; end if;
				when Taf=> if Igual='1' then y<= Tag; else y<= Taq; end if;
				when Tag=> y<= Tv; 
				when Tah=> if Limite_Aciertos='1' then y<= Taq; else y<= Tai; end if;
				when Tai=> y<= Taj;
				when Taj=> if Jugador_Mejoro='1' then y<= Tak; else y<= Tal; end if;
				when Tak=> y<= Tal;
				when Tal=> if Actualizar_mejor_puntuacion='1' then y<= Tam; else y<= Tan; end if;
				when Tam=> y<= Tan;
				when Tan=> if Aumentar_f='1' then y<= Tao; else y<= Tap; end if;
				when Tao=> y<= Tn;
				when Tap=> y<= Tn;
				when Taq=> y<= Tar;
				when Tar=> if Regresar='1' then y<= Tas; else y<= Tar; end if; 
				when Tas=> if Regresar='0' then y<= Tat; else y<= Tas; end if; 
				when Tat=> y<= Tc; 
			end case;
		end if;
	end process;
	
	process(y)
	begin
	En_Max_Vuelta<= '0'; Ld_Max_VUelta<= '0'; En_Reloj<= '0'; Ld_Reloj<= '0'; En_Dir<= '0'; Ld_Dir<= '0'; En_Secuencia<= '0'; En_Num<= '0';
	S0<= '0'; D0<= '0'; D1<= '0'; D2<= '0'; En_display<= '0'; RorW_Num<= '0'; En_Rondas<= '0'; Ld_Rondas<= '0'; En_Aciertos<= '0';  Ld_Aciertos<= '0';
	RorW_Aciertos<= '0'; En_Mejor<= '0'; En_Decena<= '0'; En_Unidad<= '0'; Error<= '0'; Reset_Reloj<= '0'; 
		case y is
			when Ta=>
			when Tb=>
			when Tc=>
			when Td=> 
			when Te=> D0<= '1'; D1<= '1'; En_display<= '1'; 
			when Tf=>  
			when Tg=> 
			when Th=> 
			when Ti=> D2<= '1'; En_display<= '1'; 
			when Tj=> 
			when Tk=> 
			when Tl=>  
			when Tm=> En_Max_Vuelta<= '1'; Ld_Max_VUelta<= '1'; En_Reloj<= '1'; Ld_Reloj<= '1'; En_Dir<= '1'; Ld_Dir<= '1'; En_Aciertos<= '1'; Ld_Aciertos<= '1';
			when Tn=> 
			when Too=> En_Num<= '1'; 
			when Tp=> RorW_Num<= '1';  
			when Tq=> En_Dir<= '1'; 
			when Tr=> En_Dir<= '1'; Ld_Dir<= '1'; Reset_Reloj<= '1';
			when Ts=> S0<= '1'; En_Dir<= '1'; En_display<= '1';
			when Tu=> En_Dir<= '1'; Ld_Dir<= '1';
			when Tv=>
			when Tw=>
			when Tx=>
			when Ty=> En_Decena<= '1'; 
			when Tz=> 
			when Taa=>
			when Tab=> En_Unidad<= '1';
			when Tac=> En_Secuencia<= '1';
			when Tad=> D0<= '1'; En_display<= '1';
			when Tae=>
			when Taf=>
			when Tag=> En_Dir<= '1';
			when Tah=> En_Rondas<= '1'; 
			when Tai=> En_Aciertos<= '1'; 
			when Taj=>
			when Tak=> RorW_Aciertos<= '1';
			when Tal=>
			when Tam=> En_Mejor<= '1';
			when Tan=>
			when Tao=> En_Reloj<= '1'; En_Dir<= '1'; Ld_Dir<= '1'; En_Rondas<= '1'; Ld_Rondas<= '1'; En_Max_Vuelta<= '1'; 
			when Tap=> En_Dir<= '1'; Ld_Dir<= '1'; En_Max_Vuelta<= '1'; 
			when Taq=> En_Reloj<= '1'; Ld_Reloj<= '1'; 
			when Tar=> D1<= '1'; En_display<= '1'; Error<= '1';
			when Tas=>
			when Tat=>
		end case;
	end process;
end Controlador;