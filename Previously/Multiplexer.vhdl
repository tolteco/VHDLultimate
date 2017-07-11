--*===============*=================*--
-- Multiplexador para 2 bits, 1 bit (Selector)
-- OAC 
-- Latência de 4ns 
--*===============*=================*--

library ieee;
use ieee.std_logic_1164.all;

entity multiplexer is
	generic(DELAY : time := 4.0 ns);
	port(
		X, Y : in  std_logic;           -- X + Y
		Sel  : in  std_logic;           -- Selector
		Sout : out std_logic            -- Saida
	);
end multiplexer;

architecture comportamento of multiplexer is
begin
	Sout <= X when Sel = '0' else Y after DELAY;
end architecture;
