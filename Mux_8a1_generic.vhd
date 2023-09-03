library ieee;
use ieee.std_logic_1164.all;

entity Mux_8a1_generic is
generic (n: integer := 5);
port( Sel: in std_logic_vector(2 downto 0);
		I0,I1,I2,I3,I4,I5,I6,I7: in std_logic_vector (n-1 downto 0);
		Q: out std_logic_vector (n-1 downto 0));
end Mux_8a1_generic;

architecture Desarrollo of Mux_8a1_generic is
begin
	process(Sel)
	begin
		case Sel is
			when "000"=> Q<=I0;
			when "001"=> Q<=I1;
			when "010"=> Q<=I2;
			when "011"=> Q<=I3;
			when "100"=> Q<=I4;
			when "101"=> Q<=I5;
			when "110"=> Q<=I6;
			when "111"=> Q<=I7;
		end case;
	end process;
end Desarrollo;