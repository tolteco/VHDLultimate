--*===============*=================*--
-- Carry select adder
-- OAC
-- Latência de Xns 
-- 4 bits
--*===============*=================*--

library ieee;
use ieee.std_logic_1164.all;

entity carry_select_4 is
	generic(DELAY : time := 4.0 ns);
	port(
		X, Y : in  std_logic_vector(3 downto 0); -- X + Y
		T    : in  std_logic;           -- Transporte de entrada
		C    : out std_logic;           -- Transporte de saída
		S    : out std_logic_vector(3 downto 0) -- S = X + Y
	);
end carry_select_4;

architecture comportamento of carry_select_4 is
	component ripple_carry is
		generic(DELAY : time := 4.0 ns);
		port(
			X, Y : in  std_logic;       -- X + Y
			T    : in  std_logic;       -- Transporte de entrada
			C    : out std_logic;       -- Transporte de saída
			S    : out std_logic        -- S = X + Y
		);
	end component;

	component multiplexer_2 is
		generic(DELAY : time := 4.0 ns);
		port(
			X, Y : in  std_logic_vector(1 downto 0); -- X + Y
			Sel  : in  std_logic;       -- Selector
			Sout : out std_logic_vector(1 downto 0) -- Saida
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
	signal sv  : std_logic_vector(3 downto 0); -- Signal temp
	signal sel : std_logic;             -- Sel temp
	signal trash: std_logic_vector(3 downto 0);

begin
	u_ca0 : ripple_carry
		port map(X(0), Y(0), T, trash(0), S(0));

	u_ca1 : ripple_carry
		port map(X(1), Y(1), trash(0), sel, S(1));

	--PATH 1 -----------------------------------------------
	u_ca2 : ripple_carry
		port map(X(2), Y(2), '0', trash(1), sv(0));

	u_ca3 : ripple_carry
		port map(X(3), Y(3), trash(1), cv(0), sv(1));
	
	--PATH 2 -----------------------------------------------
	u_ca4 : ripple_carry
		port map(X(2), Y(2), '1', trash(2), sv(2));

	u_ca5 : ripple_carry
		port map(X(3), Y(3), trash(2), cv(1), sv(3));

	--SELECT -----------------------------------------------
	u_ca6 : multiplexer_2               --Multiplex Result
		port map(sv(1 downto 0), sv(3 downto 2), sel, S(3 downto 2));

	u_ca7 : multiplexer --Multiplex Carry
		port map(cv(0), cv(1), sel, C);

end architecture;
