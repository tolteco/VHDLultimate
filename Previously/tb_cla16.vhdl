--*===============*=================*--
-- Test bench Carry Select Adder
-- OAC
-- Latência de 4ns 
-- 16 bits (Usa como base o de 8 bits)
--*===============*=================*--

library ieee;
use ieee.std_logic_1164.all;

entity tb_cla_16 is
end tb_cla_16;

architecture comportamento of tb_cla_16 is
	component carry_lookahead_16 is
		generic(DELAY : time := 4.0 ns);
		port(
			X, Y : in  std_logic_vector(15 downto 0); -- X + Y
			T    : in  std_logic;       -- Transporte de entrada
			C    : out std_logic;       -- Transporte de saída
			S    : out std_logic_vector(15 downto 0) -- S = X + Y
		);
	end component;

	-- vetor de carry
	signal X, Y : std_logic_vector(15 downto 0); -- X + Y
	signal T, C : std_logic;            -- T=in e C=out (Carry)
	signal S    : std_logic_vector(15 downto 0); -- S = Result

begin
	u_ca : carry_lookahead_16
		port map(X, Y, T, C, S);

	process
	begin

		-- melhor caso
		X <= x"0001";                   -- 8 bits zeros
		Y <= x"0000";
		T <= '0';                       -- sem transporte de entrada

		-- estabiliza em 16 ns
		wait for 150 ns;

		-- pior caso
		X <= x"FFFF";                   -- 8 bits 1's
		Y <= x"0001";
		-- causa carry-out em todos os bits

		-- estabiliza em 128 ns
		wait for 150 ns;

		wait;
	end process;

end architecture;
