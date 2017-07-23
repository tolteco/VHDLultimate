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
	component Max is
		generic(DELAY : time := 4.0 ns);
		port(
			X, Y : in  std_logic_vector(15 downto 0);
			S    : out std_logic_vector(15 downto 0)
		);
	end component;
	
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
	
	component Reg16 is
		port(
			Y    : in  std_logic_vector(15 downto 0);
			clk  : in  std_logic;
			load : in  std_logic;
			S    : out std_logic_vector(15 downto 0)
		);
	end component;

	signal ExtX         : std_logic_vector(15 downto 0);
	signal ExtY         : std_logic_vector(15 downto 0);

	signal Multiplier   : std_logic_vector(15 downto 0) := x"0000";
	signal Multiplicand : std_logic_vector(15 downto 0);
	
	signal Acc_MultCand : std_logic_vector(15 downto 0) := x"0000"; --Sum this value n times for result
	signal Temp_MulCand : std_logic_vector(15 downto 0) := x"0000";
	signal Temp_MulPler : std_logic_vector(15 downto 0);
	
	constant zeros      : std_logic_vector(Multiplier'range) := (others => '0');
	constant MinusOne   : std_logic_vector(15 downto 0) := x"FFFF";
	
	signal Cin, Cout    : std_logic;
begin

	----------------------------------------------------------------------------------------------------------------
	-- FIXED
	----------------------------------------------------------------------------------------------------------------
	u_ex0 : Expand
		port map (Y, ExtY);
		
	u_ex1 : Expand
		port map (X, ExtX);
	
	u_const1 : MinAbs8
		port map (X, Y, Multiplier(7 downto 0)); --Nao tera problema de sinal, ja que "minabs" retorna um positivo
	
	u_const2 : Max
		port map (ExtX, ExtY, Multiplicand);
	----------------------------------------------------------------------------------------------------------------
		
	u_ca1 : CSA16
		port map (Multiplicand, Temp_MulCand, Cin, Cout, Acc_MultCand);
		
	u_dec : CSA16
		port map (Multiplier, MinusOne, Cin, Cout, Temp_MulPler);
	
	----------------------------------------------------------------------------------------------------------------
	-- Load for next round
	----------------------------------------------------------------------------------------------------------------
	u_reg0 : Reg16
		port map(Acc_MultCand, Clock, '1', Temp_MulCand);
		
	u_reg1 : Reg16
		port map(Temp_MulPler, Clock, '1', Multiplier);

	process (Clock) is
	begin
		--for i in X'low to X'high+1 loop --16bits mais 1 de init
		--	wait until falling_edge(clk);
		--end loop;

		Sout <= Multiplicand;
	end process;


end Behavioral;

