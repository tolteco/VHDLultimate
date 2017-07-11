--*===============*=================*--
-- Registrador de bit
-- OAC 
-- 16/09/2016
-- Utiliza
--    load em '1' para carregar na descida do clock
-- Portas lógicas com latência de 4ns
-- Max 4 input
--*===============*=================*--

library ieee;
use ieee.std_logic_1164.all;

entity reg_01 is
	generic(DELAY : time := 8.0 ns);
	port(
		Y    : in  std_logic;
		clk  : in  std_logic;
		load : in  std_logic;
		S    : out std_logic
	);
end reg_01;

architecture comportamento of reg_01 is
	signal p : std_logic := '0';

begin
	S <= p;

	process(clk) is
	begin
		if (load = '1' and falling_edge(clk)) then
			p <= Y after DELAY;
		end if;
	end process;

end architecture;
