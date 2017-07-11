--*===============*=================*--
-- S.A.R - With Spare 
-- Retorna "bit jogado fora" -> q-1
-- Shift para direita (Duplica bit mais alto)
-- Latência de 4ns
--*===============*=================*--

library ieee;
use ieee.std_logic_1164.all;

entity shifter_16_ws is
	generic(DELAY : time := 4.0 ns);
	port(
		X    : in  std_logic_vector(15 downto 0); -- X
		S    : out std_logic_vector(15 downto 0); -- S
		Qm1  : out std_logic                      --Q-1
	);
end shifter_16_ws;

architecture comportamento of shifter_16_ws is

begin
	S(14 downto 0) <= X(15 downto 1) after DELAY;
	S(15) <= X(15) after DELAY;
	Qm1 <= X(0) after DELAY;
end architecture;
