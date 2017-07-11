--*===============*=================*--
-- Carry Selector adder
-- OAC
-- Latência de Xns 
-- 16 bits (Usa como base o de 8 bits)
--*===============*=================*--

library ieee;
use ieee.std_logic_1164.all;

entity carry_select_16 is
	generic(DELAY : time := 4.0 ns);
	port(
		X, Y : in  std_logic_vector(15 downto 0); -- X + Y
		T    : in  std_logic;           -- Transporte de entrada
		C    : out std_logic;           -- Transporte de saída
		S    : out std_logic_vector(15 downto 0) -- S = X + Yc
	);
end carry_select_16;

architecture comportamento of carry_select_16 is
	component carry_select_8 is
		generic(DELAY : time := 4.0 ns);
		port(
			X, Y : in  std_logic_vector(7 downto 0); -- X + Y
			T    : in  std_logic;       -- Transporte de entrada
			C    : out std_logic;       -- Transporte de saída
			S    : out std_logic_vector(7 downto 0) -- S = X + Y
		);
	end component;

	component multiplexer_8 is
		generic(DELAY : time := 4.0 ns);
		port(
			X, Y : in  std_logic_vector(7 downto 0); -- X + Y
			Sel  : in  std_logic;       			 -- Selector
			Sout : out std_logic_vector(7 downto 0)  -- Saida
		);
	end component;

	component multiplexer is
		generic(DELAY : time := 4.0 ns);
		port(
			X, Y : in  std_logic;       -- X + Y
			Sel  : in  std_logic;       -- Selector
			Sout : out std_logic        -- Saida
		);
	end component;

	-- vetor de carry
	signal cv  : std_logic_vector(1 downto 0); -- Carry temp
	signal sv  : std_logic_vector(15 downto 0); -- Signal temp
	signal sel : std_logic;             -- Sel temp

begin
	u_ca0 : carry_select_8
		port map(X(7 downto 0), Y(7 downto 0), T, sel, S(7 downto 0));

	u_ca1 : carry_select_8
		port map(X(15 downto 8), Y(15 downto 8), '0', cv(0), sv(7 downto 0));

	u_ca2 : carry_select_8
		port map(X(15 downto 8), Y(15 downto 8), '1', cv(1), sv(15 downto 8));

	u_ca3 : multiplexer_8               --Multiplex Result
		port map(sv(7 downto 0), sv(15 downto 8), sel, S(15 downto 8));

	u_ca4 : multiplexer                 --Multiplex Carry
		port map(cv(0), cv(1), sel, C);

end architecture;
