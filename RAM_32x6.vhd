library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity RAM_32x6 is
port (Data: in std_logic_vector(5 downto 0);
		Address: in std_logic_vector (4 downto 0);
		R_W,Clock: in std_logic;
		Q: out std_logic_vector(5 downto 0));
end RAM_32x6;

architecture solucion of RAM_32x6 is
type Ram_table is array (0 to 31) of std_logic_vector(5 downto 0);
signal Rammemory: Ram_table;
begin
	process(R_W,Clock,Address)
	begin
		if (Clock'event and Clock='1') then
			if R_W='1' then 
				Rammemory(conv_integer(Address))<=Data;
			end if;
		end if;
	end process;
	Q<= Rammemory(conv_integer(Address));
end solucion;