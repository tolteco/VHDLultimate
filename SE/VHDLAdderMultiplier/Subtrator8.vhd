library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Subtrator8 is
	generic(DELAY : time := 4.0 ns);
	port(
		X, Y : in  std_logic_vector(7 downto 0); -- X + Y
		C    : out std_logic;           -- Transporte de saí­da
		S    : out std_logic_vector(7 downto 0) -- S = X + Y
	);
end Subtrator8;

architecture Behavioral of Subtrator8 is
	component CSA8 is
		generic(DELAY : time := 4.0 ns);
		port(
			X, Y : in  std_logic_vector(7 downto 0); -- X + Y
			T    : in  std_logic;           -- Transporte de entrada
			C    : out std_logic;           -- Transporte de saí­da
			S    : out std_logic_vector(7 downto 0) -- S = X + Y
		);
	end component;
	
	signal NY : std_logic_vector(7 downto 0); -- New Y.
begin
	NY <= not(Y);
	
	u_ca0 : CSA8
		port map (X, NY, '1', C, S);
	
	-- Soma de X com not(Y) e CarryIn em '1' é o mesmo
	-- que "X-Y"
	
end Behavioral;

