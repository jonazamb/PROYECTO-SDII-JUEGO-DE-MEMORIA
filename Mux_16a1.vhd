library ieee;
use ieee.std_logic_1164.all;

entity Mux_16a1 is
port( Sel: in std_logic_vector(3 downto 0);
		I0,I1,I2,I3,I4,I5,I6,I7,I8,I9,I10,I11,I12,I13,I14,I15: in std_logic;
		Q: out std_logic);
end Mux_16a1;

architecture Desarrollo of Mux_16a1 is
begin
	process(Sel)
	begin
		case Sel is
			when "0000"=> Q<=I0;
			when "0001"=> Q<=I1;
			when "0010"=> Q<=I2;
			when "0011"=> Q<=I3;
			when "0100"=> Q<=I4;
			when "0101"=> Q<=I5;
			when "0110"=> Q<=I6;
			when "0111"=> Q<=I7;
			when "1000"=> Q<=I8;
			when "1001"=> Q<=I9;
			when "1010"=> Q<=I10;
			when "1011"=> Q<=I11;
			when "1100"=> Q<=I12;
			when "1101"=> Q<=I13;
			when "1110"=> Q<=I14;
			when "1111"=> Q<=I15;
		end case;
	end process;
end Desarrollo;