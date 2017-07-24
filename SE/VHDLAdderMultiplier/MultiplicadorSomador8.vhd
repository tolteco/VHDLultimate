library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MultiplicadorSomador8 is
	generic(DELAY : time := 4.0 ns);
	port(
		X, Y : in  std_logic_vector(7 downto 0); -- X * Y
		Clock: in  std_logic;           -- Clock
		init : in  std_logic;
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
	
	component MinAbs is
		generic(DELAY : time := 4.0 ns);
		port(
			X, Y : in  std_logic_vector(15 downto 0);
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
	
	component Neg is
		generic(DELAY : time := 4.0 ns);
		port(
			X : in  std_logic_vector(15 downto 0);
			S : out std_logic_vector(15 downto 0)
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
	
	signal NotAntCand  : std_logic_vector(15 downto 0);
	signal Acc_MultCand, AntCand : std_logic_vector(15 downto 0); --Sum this value n times for result
	signal Acc_MultPler, AntPler : std_logic_vector(15 downto 0);
	signal Temp_MulCand : std_logic_vector(15 downto 0);
	signal Temp_MulPler : std_logic_vector(15 downto 0);
	
	constant zeros      : std_logic_vector(Multiplier'range) := (others => '0');
	constant MinusOne   : std_logic_vector(15 downto 0) := x"FFFF";
	
	signal Cin, Cout    : std_logic_vector(1 downto 0);
begin
	Cin <= "00";
	
	----------------------------------------------------------------------------------------------------------------
	-- FIXED
	----------------------------------------------------------------------------------------------------------------
	u_ex0 : Expand
		port map (Y, ExtY);
		
	u_ex1 : Expand
		port map (X, ExtX);
	
	u_const1 : MinAbs
		port map (ExtX, ExtY, Multiplier);
	
	u_const2 : Max
		port map (ExtX, ExtY, Multiplicand);
	----------------------------------------------------------------------------------------------------------------
		
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
	u_ca1 : CSA16
		port map (Temp_MulCand, Multiplicand, Cin(0), Cout(0), AntCand);
		
	u_dec : CSA16
		port map (Temp_MulPler, MinusOne,     Cin(1), Cout(1), AntPler);
		
	----------------------------------------------------------------------------------------------------------------
	u_negTem : Neg
		port map(AntCand, NotAntCand);
	
	process (Clock) is
	begin
		-- if falling edge
			-- if Multiplicand = 0
			-- sout <= 0
			-- else
			--    if Ant_Pler = zeros
			--
		--
	
		if falling_edge(Clock) and AntPler = zeros then
			if ExtY(15) = '1' then
				Sout <= NotAntCand;
			else
				Sout <= AntCand;
			end if;
		end if;
		
		--for i in X'low to X'high+1 loop --16bits mais 1 de init
		--	wait until falling_edge(clk);
		--end loop;

		
	end process;


end Behavioral;