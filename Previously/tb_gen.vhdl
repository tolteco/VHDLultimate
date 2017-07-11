--*===============*=================*--
-- Test Bench para Multiplicador de Booth
-- 16 bits, result 32 bits
--
-- Que nome estranho, nao?
-- tb_gen -> test bench generico.
-- Why? Preguica de trocar o nome.
--*===============*=================*--

library ieee;
use ieee.std_logic_1164.all;

entity tb_gen is
end tb_gen;

architecture comportamento of tb_gen is
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

begin
	clk <= not clk after 28 ns;         --Clk de 56 ns

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
		
		assert false
			   report "Simulação finalizada."
			   severity failure;
	end process;

end architecture;
