library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CSA16 is
	generic(DELAY : time := 4.0 ns);
	port(
		X, Y : in  std_logic_vector(15 downto 0); -- X + Y
		T    : in  std_logic;           -- Transporte de entrada
		C    : out std_logic;           -- Transporte de saí­da
		S    : out std_logic_vector(15 downto 0) -- S = X + Y
	);
end CSA16;

architecture Behavioral of CSA16 is
	component CSA8 is
		generic(DELAY : time := 4.0 ns);
		port(
			X, Y : in  std_logic_vector(7 downto 0); -- X + Y
			T    : in  std_logic;           -- Transporte de entrada
			C    : out std_logic;           -- Transporte de saí­da
			S    : out std_logic_vector(7 downto 0) -- S = X + Y
		);
	end component;

	component Multiplexer8 is
		generic(DELAY : time := 4.0 ns);
		port(
			X, Y : in  std_logic_vector(7 downto 0); -- X + Y
			Sel  : in  std_logic;           -- Selector
			Sout : out std_logic_vector(7 downto 0) -- Saida
		);
	end component;

	component Multiplexer is
		generic(DELAY : time := 4.0 ns);
		port(
			X, Y : in  std_logic;       -- X + Y
			Sel  : in  std_logic;       -- Selector
			Sout : out std_logic        -- Saida
		);
	end component;

	-- vetor de carry
	signal cv  : std_logic_vector(1  downto 0); -- Carry temp
	signal sv  : std_logic_vector(15 downto 0); -- Signal temp
	signal sel : std_logic;             -- Sel temp

begin
	u_ca0 : CSA8
		port map(X(7 downto 0), Y(7 downto 0), T, sel, S(7 downto 0));

	u_ca1 : CSA8
		port map(X(15 downto 8), Y(15 downto 8), '0', cv(0), sv(7 downto 0));

	u_ca2 : CSA8
		port map(X(15 downto 8), Y(15 downto 8), '1', cv(1), sv(15 downto 8));

	u_ca3 : Multiplexer8               --Multiplex Result
		port map(sv(7 downto 0), sv(15 downto 8), sel, S(15 downto 8));

	u_ca4 : Multiplexer --Multiplex Carry
		port map(cv(0), cv(1), sel, C);
end Behavioral;

