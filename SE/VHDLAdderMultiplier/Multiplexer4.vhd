
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Multiplexer4 is
	generic(DELAY : time := 4.0 ns);
	port(
		X, Y : in  std_logic_vector(3 downto 0); -- X + Y
		Sel  : in  std_logic;           -- Selector
		Sout : out std_logic_vector(3 downto 0) -- Saida
	);
end Multiplexer4;

architecture Behavioral of Multiplexer4 is
	component Multiplexer is
		generic(DELAY : time := 4.0 ns);
		port(
			X, Y : in  std_logic;       -- X + Y
			Sel  : in  std_logic;       -- Selector
			Sout : out std_logic        -- Saida
		);
	end component;

begin
	u_ca0 : Multiplexer
		port map(X(0), Y(0), Sel, Sout(0));

	u_ca1 : Multiplexer
		port map(X(1), Y(1), Sel, Sout(1));

	u_ca2 : Multiplexer
		port map(X(2), Y(2), Sel, Sout(2));

	u_ca3 : Multiplexer
		port map(X(3), Y(3), Sel, Sout(3));
end Behavioral;

