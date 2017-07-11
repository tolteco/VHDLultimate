--*===============*=================*--
-- Algoritmo de Booth para multiplicacao
-- Utiliza: SomadorSubtrator_16
-- 16 bits in - 32 bits out
--*===============*=================*--

library ieee;
use ieee.std_logic_1164.all;

entity booth_multiplicator_16 is
	generic(DELAY : time := 4.0 ns);
	port(
		clk    : in  std_logic;
		init   : in  std_logic;
		X, Y   : in  std_logic_vector(15 downto 0); -- X + Y
		Result : out std_logic_vector(31 downto 0) -- S = X + Yc
	);
end booth_multiplicator_16;

architecture comportamento of booth_multiplicator_16 is
	component somador_subtrator_16 is
		generic(DELAY : time := 4.0 ns);
		port(
			X, Y : in  std_logic_vector(15 downto 0); -- X + Y
			T    : in  std_logic;       -- Transporte de entrada
			C    : out std_logic;       -- Transporte de saída
			S    : out std_logic_vector(15 downto 0) -- S = X + Yc
		);
	end component;

	component shifter_16_dual_ws is
		generic(DELAY : time := 4.0 ns);
		port(
			A, Q   : in  std_logic_vector(15 downto 0); -- X
			Sa, Sq : out std_logic_vector(15 downto 0); -- S
			Qm1    : out std_logic      --Q-1
		);
	end component;

	component multiplexer_16 is         -- 0 get X, 1 get Y
		generic(DELAY : time := 4.0 ns);
		port(
			X, Y : in  std_logic_vector(15 downto 0); -- X + Y
			Sel  : in  std_logic;       -- Selector
			Sout : out std_logic_vector(15 downto 0) -- Saida
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

	component reg_01 is
		generic(DELAY : time := 8.0 ns);
		port(
			Y    : in  std_logic;
			clk  : in  std_logic;
			load : in  std_logic;
			S    : out std_logic
		);
	end component;

	component reg_16 is
		port(
			Y    : in  std_logic_vector(15 downto 0);
			clk  : in  std_logic;
			load : in  std_logic;
			S    : out std_logic_vector(15 downto 0)
		);
	end component;

	--Sinais REGs
	signal A   : std_logic_vector(15 downto 0);
	signal Q   : std_logic_vector(15 downto 0);
	signal Qm1 : std_logic                    ; --Q-1
	signal M   : std_logic_vector(15 downto 0);

	--Sinais somador
	signal OutSomador : std_logic_vector(15 downto 0) := x"0000";
	signal Cout : std_logic := '0';

	-- Multiplexer
	signal OutMul : std_logic_vector(15 downto 0);
	signal load   : std_logic                    := '1';
	
	-- Controle de Passo
	signal Qant   : std_logic_vector(15 downto 0);
	signal InRegQ : std_logic_vector(15 downto 0);

	signal Aant   : std_logic_vector(15 downto 0);
	signal InRegA : std_logic_vector(15 downto 0);

	signal Qm1Ant   : std_logic;
	signal InRegQm1 : std_logic;
	
	--XORed
	signal xorGate : std_logic;

begin
	M <= Y; -- Constante
-------------------------------------------------------------------------------
-- ETAPA DE "CARREGAMENTO" DOS DADOS E INIT
-------------------------------------------------------------------------------
	passo_ca0 : multiplexer_16 -- Padrao de nomenclatura foi pro espaco
		port map(Aant, x"0000", init, InRegA);
	regA_ca0 : reg_16
		port map(InRegA, clk, load, A);

	passo_ca1 : multiplexer_16
		port map(Qant, X, init, InRegQ);
	regQ_ca1 : reg_16
		port map(InRegQ, clk, load, Q);

	passo_ca2 : multiplexer -- 4ns
		port map(Qm1Ant, '0', init, InRegQm1);
	regQm1_ca2 : reg_01 -- 4 ns after falling_edge
		port map(InRegQm1, clk, load, Qm1);

-------------------------------------------------------------------------------
-- ETAPA DE SOMA OU SUBTRACAO, DEPENDENDO DE Q(0)
-------------------------------------------------------------------------------
	somador_ca1 : somador_subtrator_16  --Q(0)=0 -> soma, else, sub 
		port map(A, M, Q(0), Cout, OutSomador); --Pior caso = 28ns + 4ns (MUX)

-------------------------------------------------------------------------------
-- ETAPA DE SELECAO ENTRE SOMA/SUB OU A NORMAL, DEPENDENDO DE Q(0) xor Qm1
-------------------------------------------------------------------------------
	xorGate <= Q(0) xor Qm1 after DELAY; -- 4 ns
	multiplexer_ca3 : multiplexer_16 -- 4 ns
		port map(A, OutSomador, xorGate, OutMul);

-------------------------------------------------------------------------------
-- ETAPA DE SHIFTING
-------------------------------------------------------------------------------
	shifter_ca2 : shifter_16_dual_ws --4 ns
		port map(OutMul, Q, Aant, Qant, Qm1Ant);

	process
	begin
		for i in X'low to X'high+1 loop --16bits mais 1 de init
			wait until falling_edge(clk);
		end loop;
		
		------------------------------------------
		--Alternativa 1
		Result(31 downto 16) <= Aant(15 downto 0);
		Result(15 downto 0)  <= Qant(15 downto 0);
		
		------------------------------------------
		--Alternativa 2
		--wait for 2*DELAY + 1 ns;
		--Result(31 downto 16) <= A(15 downto 0);
		--Result(15 downto 0)  <= Q(15 downto 0);
		
		--Duas alternativas:
		-- 1 - Resultado sai dos "anteriores", isto e, dos que
		--     sao usados para carregar os valores dos proximos passos.
		--     Se usados esses, o resultado sai em n(bits A ou Q) + 1 ciclo de 
		--     init.
		-- 2 - Resultado sai de A e Q propriamente ditos.
		--     Se usado este, ha de se esperar a estabilização dos
		--     registradores. Entao levara 8ns (REGs) + quantia de tempo
		--     pequena para os dados refletirem corretamente no resultado.
		
		--O que estava errado anteriormente (A vez que pedi ajuda por causa de
		--saltos estranhos):
		-- O sinal A foi inicializado com X, e Q com x"0000"; quando deveria 
		-- ser o oposto. Estranhamente, o resultado sai correto, mas leva o
		-- dobro do tempo. Normalmente levaria 16 ciclos + 1 de init, no
		-- anomalo leva 32+2 ciclos.
	end process;

end architecture;
