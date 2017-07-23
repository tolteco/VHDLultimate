library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MultiplicadorSomador8 is
	generic(DELAY : time := 4.0 ns);
	port(
		X, Y : in  std_logic_vector(7 downto 0); -- X * Y
		Clock: in  std_logic;           -- Clock
		Sout : out std_logic_vector(15 downto 0) -- Saida
	);
end MultiplicadorSomador8;

architecture Behavioral of MultiplicadorSomador8 is
	component MinAbs8 is
		generic(DELAY : time := 4.0 ns);
		port(
			X, Y : in  std_logic_vector(7 downto 0);
			S    : out std_logic_vector(7 downto 0)
		);
	end component;

	component CSA16 is
		generic(DELAY : time := 4.0 ns);
		port(
			X, Y : in  std_logic_vector(15 downto 0); -- X + Y
			T    : in  std_logic;           -- Transporte de entrada
			C    : out std_logic;           -- Transporte de saí­da
			S    : out std_logic_vector(15 downto 0) -- S = X + Y
		);
	end component;

	signal Multiplier   : std_logic_vector(15 downto 0) := x"0000";
	signal Sum_Carry    : std_logic_vector(15 downto 0);
	signal Multiplicand : std_logic_vector(15 downto 0) := x"0000";
	constant zeros : std_logic_vector(Multiplier'range) := (others => '0');
begin
	u_ca0 : ExpandNegative
		port map
		
	u_ca0 : MinAbs8
		port map (X, Y, Multiplier(7 downto 0)); --Nao tera problema de sinal, ja que "minabs" retorna um positivo
	
	u_ca1 : CSA16
		port map (Multiplier, Multiplicand
	process (Clock) is
	begin
		
		if rising_edge(Clock) and Multiplier /= then
		--if Multiplier /= then
			
			
			
		end if;
	
	end process;


end Behavioral;

