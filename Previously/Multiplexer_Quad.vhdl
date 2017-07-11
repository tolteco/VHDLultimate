--*===============*=================*--
-- Multiplexador para 2 bits, 1 bit (Selector)
-- OAC 
-- Latência de 4ns 
--*===============*=================*--

library ieee;
use ieee.std_logic_1164.all;

entity multiplexer_4 is
	generic(DELAY : time := 4.0 ns);
	port(
		X, Y : in  std_logic_vector(3 downto 0); -- X + Y
		Sel  : in  std_logic;           -- Selector
		Sout : out std_logic_vector(3 downto 0) -- Saida
	);
end multiplexer_4;

architecture comportamento of multiplexer_4 is
	component multiplexer is
		generic(DELAY : time := 4.0 ns);
		port(
			X, Y : in  std_logic;       -- X + Y
			Sel  : in  std_logic;       -- Selector
			Sout : out std_logic        -- Saida
		);
	end component;

begin
	u_ca0 : multiplexer
		port map(X(0), Y(0), Sel, Sout(0));

	u_ca1 : multiplexer
		port map(X(1), Y(1), Sel, Sout(1));

	u_ca2 : multiplexer
		port map(X(2), Y(2), Sel, Sout(2));

	u_ca3 : multiplexer
		port map(X(3), Y(3), Sel, Sout(3));
end architecture;
