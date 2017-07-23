library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Max is
	generic(DELAY : time := 4.0 ns);
	port(
		X, Y : in  std_logic_vector(15 downto 0);
		S    : out std_logic_vector(15 downto 0)
	);
end Max;

architecture Behavioral of Max is
	component Subtrator16 is
		generic(DELAY : time := 4.0 ns);
		port(
			X, Y : in  std_logic_vector(15 downto 0); -- X + Y
			C    : out std_logic;           -- Transporte de saí­da
			S    : out std_logic_vector(15 downto 0) -- S = X + Y
		);
	end component;
begin


end Behavioral;

