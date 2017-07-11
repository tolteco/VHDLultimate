--*===============*=================*--
-- S.A.R - DUAL - With Spare 
-- Usado no multiplicador BOOTH
-- Shifter "composto", bit jogado fora de X vai para Y.
-- Bit jogado fora de Y, e Qm1
-- Shift para direita (Duplica bit mais alto)
-- Latência de 4ns
--*===============*=================*--

library ieee;
use ieee.std_logic_1164.all;

entity shifter_16_dual_ws is
	generic(DELAY : time := 4.0 ns);
	port(
		A, Q   : in  std_logic_vector(15 downto 0); -- X
		Sa, Sq : out std_logic_vector(15 downto 0); -- S
		Qm1    : out std_logic          --Q-1
	);
end shifter_16_dual_ws;

architecture comportamento of shifter_16_dual_ws is
	component shifter_16_ws is
		generic(DELAY : time := 4.0 ns);
		port(
			X   : in  std_logic_vector(15 downto 0); -- X
			S   : out std_logic_vector(15 downto 0); -- S
			Qm1 : out std_logic         --Q-1
		);
	end component;

--signal Cout : std_logic;

--signal S : std_logic_vector(31 downto 0);

begin
	Sa(15)          <= A(15) after DELAY;
	Sa(14 downto 0) <= A(15 downto 1) after DELAY;

	Sq(15)          <= A(0) after DELAY;
	Sq(14 downto 0) <= Q(15 downto 1) after DELAY;

	Qm1 <= Q(0) after DELAY;

--S(30 downto 15) <= A;
--S(14 downto 0)  <= Q(15 downto 1);
--Qm1             <= Q(0);
--S(31)           <= A(15);

--Sa <= S(31 downto 16);
--Sq <= S(15 downto 0);
end architecture;
