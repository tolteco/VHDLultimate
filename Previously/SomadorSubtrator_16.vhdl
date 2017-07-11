--*===============*=================*--
-- Somador-Subtrator (Com complemento de 2)
-- Utiliza: Carry Selector adder
-- 16 bits
--*===============*=================*--

library ieee;
use ieee.std_logic_1164.all;

entity somador_subtrator_16 is
	generic(DELAY : time := 4.0 ns);
	port(
		X, Y : in  std_logic_vector(15 downto 0); -- X + Y
		T    : in  std_logic;           -- Transporte de entrada
		C    : out std_logic;           -- Transporte de saída
		S    : out std_logic_vector(15 downto 0) -- S = X + Yc
	);
end somador_subtrator_16;

architecture comportamento of somador_subtrator_16 is
	component carry_select_16 is
		generic(DELAY : time := 4.0 ns);
		port(
			X, Y : in  std_logic_vector(15 downto 0); -- X + Y
			T    : in  std_logic;       -- Transporte de entrada
			C    : out std_logic;       -- Transporte de saída
			S    : out std_logic_vector(15 downto 0) -- S = X + Yc
		);
	end component;

	component multiplexer_16_wNot is
		generic(DELAY : time := 4.0 ns);
		port(
			X    : in  std_logic_vector(15 downto 0); -- X
			Sel  : in  std_logic;       -- Selector
			Sout : out std_logic_vector(15 downto 0) -- Saida
		);
	end component;

	signal NY  : std_logic_vector(15 downto 0); -- New Y.
	signal sel : std_logic;             -- Sel temp

begin
	-- Soma X e Y. Y entra como Y ou not(Y), dependendo do carryIn.
	-- Selecao para Y ou not(Y) e feita pelo multiplexer_16_wNot.
	-- NY e a selecao do Y pelo Multiplexer.

	u_ca0 : multiplexer_16_wNot
		port map(Y, T, NY);

	u_ca1 : carry_select_16
		port map(X, NY, T, sel, S);

end architecture;
