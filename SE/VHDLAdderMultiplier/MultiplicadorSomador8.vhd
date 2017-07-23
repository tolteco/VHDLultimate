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

	component Expand is
		generic(DELAY : time := 4.0 ns);
		port(
			X : in  std_logic_vector(7 downto 0);
			Y : out std_logic_vector(15 downto 0)
		);
	end component;

	signal Multiplier   : std_logic_vector(15 downto 0) := x"0000";
	signal Multiplicand : std_logic_vector(15 downto 0) := x"0000";
	signal Sum_Carry    : std_logic_vector(15 downto 0); --Sum this value n times for result
	
	signal Temp_MulCand : std_logic_vector(15 downto 0);
	signal Temp_MulPler : std_logic_vector(15 downto 0);
	
	constant zeros      : std_logic_vector(Multiplier'range) := (others => '0');
	constant MinusOne   : std_logic_vector(15 downto 0) := x"FFFF";
	
	signal Cin, Cout    : std_logic;
begin
	u_ex0 : Expand
		port map (Y,Sum_Carry);
		
	u_ca0 : MinAbs8
		port map (X, Y, Multiplier(7 downto 0)); --Nao tera problema de sinal, ja que "minabs" retorna um positivo
	
	u_ca1 : CSA16
		port map (Sum_Carry, Multiplicand, Cin, Cout, Temp_MulCand);
		
	u_dec : CSA16
		port map (Multiplier, MinusOne, Cin, Cout, Temp_MulPler);

	process (Clock) is
	begin
		
		if rising_edge(Clock) and Multiplier /= zeros then
		--if Multiplier /= then
			Multiplicand <= Temp_MulCand;
			Multiplier   <= Temp_MulPler;
			
		end if;
	
	end process;


end Behavioral;

