--Library
library ieee;
use ieee.std_logic_1164.all;

--Entity
entity Rand is
   port (Clk : in std_logic;
	      Resetn: in std_logic; 
			Random: out std_logic_vector (7 downto 0));
end Rand;

--Architecture
architecture funcional of Rand is
	-- Signals,Constants,Variables,Components
    signal lfsr_reg: std_logic_vector(7 downto 0);

	begin
	 --Process #1
     process(Clk, Resetn)
	 --Sequential programming
	  begin 
	   if (Resetn = '0') then
	      lfsr_reg <= (others => '0');	
		
		elsif (clk'event and clk = '1') then
			lfsr_reg(0) <= lfsr_reg(7);
			lfsr_reg(1) <= lfsr_reg(0);
			lfsr_reg(2) <= lfsr_reg(1) xnor lfsr_reg(7);
			lfsr_reg(3) <= lfsr_reg(2) xnor lfsr_reg(7);
			lfsr_reg(4) <= lfsr_reg(3) xnor lfsr_reg(7);
			lfsr_reg(5) <= lfsr_reg(4);
			lfsr_reg(6) <= lfsr_reg(5);
			lfsr_reg(7) <= lfsr_reg(6);
			end if; 
	end process; 
    random <= lfsr_reg;
end funcional;		