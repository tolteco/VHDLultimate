--*===============*=================*--
-- Multiplexador para 16 bits que 
-- seleciona X ou not(X).
-- Latência de 8ns 
--*===============*=================*--

library ieee;
use ieee.std_logic_1164.all;

entity multiplexer_16_wNot is
	generic(DELAY : time := 4.0 ns);
	port(
		X    : in  std_logic_vector(15 downto 0); -- X
		Sel  : in  std_logic;           -- Selector
		Sout : out std_logic_vector(15 downto 0) -- Saida
	);
end multiplexer_16_wNot;

architecture comportamento of multiplexer_16_wNot is
	component multiplexer_16 is
		generic(DELAY : time := 4.0 ns);
		port(
			X, Y : in  std_logic_vector(15 downto 0); -- X + Y
			Sel  : in  std_logic;           -- Selector
			Sout : out std_logic_vector(15 downto 0) -- Saida
		);
	end component;
			
	signal Y   : std_logic_vector(15 downto 0); -- Not (X)	

begin 
	Y <= not (X);	
		
	u_ca0 : multiplexer_16
		port map(X, Y, Sel, Sout);
end architecture;
