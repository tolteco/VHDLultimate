library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Expand is
	generic(DELAY : time := 4.0 ns);
	port(
		X : in  std_logic_vector(7 downto 0);
		Y : out std_logic_vector(15 downto 0)
	);
end Expand;

architecture Behavioral of Expand is
	signal ZeroFill : std_logic_vector(15 downto 0) := x"0000";
	signal OneFill  : std_logic_vector(15 downto 0) := x"FFFF";
begin
	ZeroFill(7 downto 0) <= X when X(7) = '0';
	OneFill (7 downto 0) <= X when X(7) = '1';
		
	Y <= ZeroFill when X(7) = '0' else
		  OneFill;
end Behavioral;