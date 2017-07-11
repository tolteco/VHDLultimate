--*===============*=================*--
-- Multiplexador para 2 bits, 1 bit (Selector)
-- OAC 
-- Latência de 4ns 
--*===============*=================*--

library ieee;
use ieee.std_logic_1164.all;

entity multiplexer_2 is
	generic(DELAY : time := 4.0 ns);
	port(
		X, Y : in  std_logic_vector(1 downto 0); -- X + Y
		Sel  : in  std_logic;                    -- Selector
		Sout : out std_logic_vector(1 downto 0)  -- Saida
	);
end multiplexer_2;

architecture comportamento of multiplexer_2 is
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
end architecture;
