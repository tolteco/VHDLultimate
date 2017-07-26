library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity U_MultiplicadorSomador8 is
	generic(DELAY : time := 4.0 ns);
	port(
		X, Y : in  std_logic_vector(7 downto 0); -- X * Y
		Clock: in  std_logic;           -- Clock
		init : in  std_logic;
		Sout : out std_logic_vector(15 downto 0) -- Saida
	);
end U_MultiplicadorSomador8;

architecture Behavioral of U_MultiplicadorSomador8 is
	component U_Max is
		generic(DELAY : time := 4.0 ns);
		port(
			X, Y : in  std_logic_vector(15 downto 0);
			S    : out std_logic_vector(15 downto 0)
		);
	end component;
	
	component MinAbs is
		generic(DELAY : time := 4.0 ns);
		port(
			X, Y : in  std_logic_vector(15 downto 0);
			NegF : out std_logic;
			S    : out std_logic_vector(15 downto 0)
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

	component U_Expand is
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

	component Multiplexer16 is
		generic(DELAY : time := 4.0 ns);
		port(
			X, Y : in  std_logic_vector(15 downto 0); -- X + Y
			Sel  : in  std_logic;           -- Selector
			Sout : out std_logic_vector(15 downto 0) -- Saida
		);
	end component;

	signal ExtX         : std_logic_vector(15 downto 0);
	signal ExtY         : std_logic_vector(15 downto 0);

	signal Multiplier   : std_logic_vector(15 downto 0);
	signal Multiplicand : std_logic_vector(15 downto 0);

	signal Acc_MultCand, AntCand : std_logic_vector(15 downto 0);
	signal Acc_MultPler, AntPler : std_logic_vector(15 downto 0);
	signal Temp_MulCand : std_logic_vector(15 downto 0);
	signal Temp_MulPler : std_logic_vector(15 downto 0);
	
	constant zeros      : std_logic_vector(Multiplier'range) := (others => '0');
	constant MinusOne   : std_logic_vector(15 downto 0) := x"FFFF";
	
	signal Cin, Cout    : std_logic_vector(1 downto 0);
	signal Flag : std_logic;
begin
	Cin <= "00";
	
	----------------------------------------------------------------------------------------------------------------
	-- FIXED
	----------------------------------------------------------------------------------------------------------------
	u_ex0 : U_Expand
		port map (Y, ExtY);
		
	u_ex1 : U_Expand
		port map (X, ExtX);
	
	u_const1 : MinAbs
		port map (ExtX, ExtY, Flag, Multiplier);
	
	u_const2 : U_Max
		port map (ExtX, ExtY, Multiplicand);
		
	----------------------------------------------------------------------------------------------------------------
	-- Load
	----------------------------------------------------------------------------------------------------------------
	u_mux0 : Multiplexer16
		port map(AntCand, x"0000", init, Acc_MultCand);
	u_mux1 : Multiplexer16
		port map(AntPler, Multiplier, init, Acc_MultPler);
		
	u_reg0 : Reg16
		port map(Acc_MultCand, Clock, '1', Temp_MulCand);
	u_reg1 : Reg16
		port map(Acc_MultPler, Clock, '1', Temp_MulPler);
		
	----------------------------------------------------------------------------------------------------------------
	-- Sum and Decrement
	----------------------------------------------------------------------------------------------------------------
	u_ca1 : CSA16
		port map (Temp_MulCand, Multiplicand, Cin(0), Cout(0), AntCand);
		
	u_dec : CSA16
		port map (Temp_MulPler, MinusOne,     Cin(1), Cout(1), AntPler);
		
	process (Clock) is
	begin
		if falling_edge(Clock) then
			if Multiplier = zeros then
				Sout <= zeros;
			elsif AntPler = zeros then
				Sout <= AntCand;
			end if;
		end if;
	end process;
end Behavioral;