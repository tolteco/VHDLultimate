library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MultiplicadorSomador8 is
	generic(DELAY : time := 4.0 ns);
	port(
		X, Y : in  std_logic_vector(7 downto 0); -- X * Y
		Clock: in  std_logic;           -- Clock
		Sout : out std_logic_vector(15 downto 0) -- Saida
	);
end MultiplicadorSomador8;

architecture Behavioral of MultiplicadorSomador8 is
	component MinAbs is
		generic(DELAY : time := 4.0 ns);
		port(
			X, Y : in  std_logic_vector(15 downto 0);
			S    : out std_logic_vector(15 downto 0)
		);
	end component;
	
	signal BigX, BigY : std_logic_vector(15 downto 0) := x"0000";
	signal Multiplier : std_logic_vector(15 downto 0);
begin
	BigX(7 downto 0) <= X;
	BigY(7 downto 0) <= Y;
	
	process (Clock) is
	begin
	
	end process;


end Behavioral;

