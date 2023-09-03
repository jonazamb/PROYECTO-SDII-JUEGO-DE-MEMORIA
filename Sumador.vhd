library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Sumador is
port(A, B: in std_logic_vector(2 downto 0);
		C: out std_logic_vector(2 downto 0));
end Sumador;

architecture arq of Sumador is
begin
	C<=A+B;
end arq;