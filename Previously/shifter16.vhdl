--*===============*=================*--
-- S.A.R
-- Shift para direita (Duplica bit mais alto)
-- Latência de 4ns
--*===============*=================*--

library ieee;
use ieee.std_logic_1164.all;

entity shifter_16 is
	generic(DELAY : time := 4.0 ns);
	port(
		X    : in  std_logic_vector(15 downto 0); -- X
		S    : out std_logic_vector(15 downto 0)  -- S
	);
end shifter_16;

architecture comportamento of shifter_16 is

begin
	S(14 downto 0) <= X(15 downto 1) after DELAY;
	S(15) <= X(15) after DELAY;
end architecture;
