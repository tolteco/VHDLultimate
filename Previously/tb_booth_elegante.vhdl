--*===============*=================*--
-- Test Bench para Multiplicador de Booth
-- 16 bits, result 32 bits
-- Tentativa de fazer um mais elegante
-- (Na finalizacao).
-- Note que e uma "tentativa", ou seja,
-- nao funciona (Loop infinito)
--*===============*=================*--

library ieee;
use ieee.std_logic_1164.all;

entity tb_booth_elegante is
end tb_booth_elegante;

architecture comportamento of tb_booth_elegante is
	component booth_multiplicator_16 is
		generic(DELAY : time := 4.0 ns);
		port(
			clk    : in  std_logic;
			init   : in  std_logic;
			X, Y   : in  std_logic_vector(15 downto 0); -- X + Y
			Result : out std_logic_vector(31 downto 0) -- S = X + Yc
		);
	end component;

	--controle
	signal clk  : std_logic := '0';
	signal init : std_logic := '0';

	-- vetor de carry
	signal X      : std_logic_vector(15 downto 0);
	signal Y      : std_logic_vector(15 downto 0);
	signal Result : std_logic_vector(31 downto 0) := x"00000000";
	
	-- Sinal exit
	signal finalize : std_logic := '0';

begin
	CLK_GEN : process
	begin
		if (finalize = '0') then
			clk <= not clk after 28 ns; --clk de 56 ns
		else
			wait;
		end if;
	end process;

	u_ca : booth_multiplicator_16
		port map(clk, init, X, Y, Result);

	process
	begin
		init <= '1';
		X    <= x"0003";
		Y    <= x"0005";
		wait until falling_edge(clk);

		init <= '0';
		wait on Result;
		
		wait for 69 ns; -- Tempo exato para poder visualizar
		                -- O vetor completo na onda do GHW.
		                -- Sim. "Toque" intensifies.
		
		finalize <= '1';
		wait;
	end process;

end architecture;
