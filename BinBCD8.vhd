library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity BinBCD8 is
port(Bin: in std_logic_vector(7 downto 0);
	  Centena, Decena, Unidad: out std_logic_vector(3 downto 0));
end BinBCD8;

architecture solucion of BinBCD8 is
begin
process(Bin)
variable z: std_logic_vector(17 downto 0);
begin
	for i in 0 to 17 loop
		z(i):= '0';
	end loop;
	
	z(10 downto 3):= Bin;
	
	for i in 0 to 4 loop
		if z(11 downto 8) > 4 then
			z(11 downto 8):= z(11 downto 8)+3;
		end if;
		
		if z(15 downto 12) > 4 then
			z(15 downto 12):= z(15 downto 12)+3;
		end if;
		
		z(17 downto 1):= z(16 downto 0);
	end loop;
	
	Centena<= "00" & z(17 downto 16);
	Decena<= z(15 downto 12);
	Unidad<= z(11 downto 8);
end process;
end solucion;