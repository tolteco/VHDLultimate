library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Multiplexer is
	generic(DELAY : time := 4.0 ns);
	port(
		X, Y : in  std_logic;           -- X + Y
		Sel  : in  std_logic;           -- Selector
		Sout : out std_logic            -- Saida
	);
end Multiplexer;

architecture Behavioral of Multiplexer is

begin
	Sout <= X when Sel = '0' else Y after DELAY;
end Behavioral;

