--*===============*=================*--
-- Carry Look-ahead adder
-- OAC
-- Latência de Xns 
-- 16 bits
--*===============*=================*--

library ieee;
use ieee.std_logic_1164.all;

entity carry_lookahead_16 is
	generic(DELAY : time := 4.0 ns);
	port(
		X, Y : in  std_logic_vector(15 downto 0); -- X + Y
		T    : in  std_logic;           -- Transporte de entrada
		C    : out std_logic;           -- Transporte de saída
		S    : out std_logic_vector(15 downto 0) -- S = X + Y
	);
end carry_lookahead_16;

architecture comportamento of carry_lookahead_16 is
	
	component carry_lookahead_4 is
		generic(DELAY : time := 4.0 ns);
		port(
			X, Y : in  std_logic_vector(3 downto 0); -- X + Y
			T    : in  std_logic;       -- Transporte de entrada
			C    : out std_logic;       -- Transporte de saída
			S    : out std_logic_vector(3 downto 0) -- S = X + Y
		);
	end component;

	-- Sim, disperdicio de uma posicao no carry, por motivos de abstracao
	signal carry   : std_logic_vector(2 downto 0); -- Carry temp

begin

	u_ca0 : carry_lookahead_4
		port map(X(3 downto 0), Y(3 downto 0), T, carry(0), S(3 downto 0));

	u_ca1 : carry_lookahead_4
		port map(X(7 downto 4), Y(7 downto 4), carry(0), carry(1), S(7 downto 4));

	u_ca2 : carry_lookahead_4
		port map(X(11 downto 8), Y(11 downto 8), carry(1), carry(2), S(11 downto 8));

	u_ca3 : carry_lookahead_4
		port map(X(15 downto 12), Y(15 downto 12), carry(2), C, S(15 downto 12));

end architecture;
