library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Counter_Generic is
generic (n: integer:=5);
port (Enable,Load: in std_logic;
		Data: in std_logic_vector(n-1 downto 0);
		Clock,Resetn: in std_logic;
		Q: buffer std_logic_vector(n-1 downto 0));
end Counter_Generic;

architecture Desarrollo of Counter_Generic is
begin
	process(Enable)
		begin
		if Resetn='0' then Q<=(others=>'0');
		elsif (Clock'event and Clock='1') then
			if (Load='1' and Enable='1') then Q<=Data;
			elsif Enable='1' then Q<=Q+1;
			end if;
		end  if;
	end process;
end Desarrollo;