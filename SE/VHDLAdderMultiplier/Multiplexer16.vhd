library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Multiplexer16 is
	generic(DELAY : time := 4.0 ns);
	port(
		X, Y : in  std_logic_vector(15 downto 0); -- X + Y
		Sel  : in  std_logic;           -- Selector
		Sout : out std_logic_vector(15 downto 0) -- Saida
	);
end Multiplexer16;

architecture Behavioral of Multiplexer16 is
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
		
	u_ca4 : Multiplexer
		port map(X(4), Y(4), Sel, Sout(4));

	u_ca5 : Multiplexer
		port map(X(5), Y(5), Sel, Sout(5));

	u_ca6 : Multiplexer
		port map(X(6), Y(6), Sel, Sout(6));

	u_ca7 : Multiplexer
		port map(X(7), Y(7), Sel, Sout(7));

	u_ca8 : Multiplexer
		port map(X(8), Y(8), Sel, Sout(8));

	u_ca9 : Multiplexer
		port map(X(9), Y(9), Sel, Sout(9));

	u_ca10 : Multiplexer
		port map(X(10), Y(10), Sel, Sout(10));

	u_ca11 : Multiplexer
		port map(X(11), Y(11), Sel, Sout(11));

	u_ca12 : Multiplexer
		port map(X(12), Y(12), Sel, Sout(12));

	u_ca13 : Multiplexer
		port map(X(13), Y(13), Sel, Sout(13));

	u_ca14 : Multiplexer
		port map(X(14), Y(14), Sel, Sout(14));

	u_ca15 : Multiplexer
		port map(X(15), Y(15), Sel, Sout(15));

end Behavioral;

