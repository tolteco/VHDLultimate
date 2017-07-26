library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity U_Expand is
	generic(DELAY : time := 4.0 ns);
	port(
		X : in  std_logic_vector(7 downto 0);
		Y : out std_logic_vector(15 downto 0)
	);
end U_Expand;

architecture Behavioral of U_Expand is
	signal ZeroFill : std_logic_vector(15 downto 0) := x"0000";
begin
	ZeroFill(7 downto 0) <= X;
		
	Y <= ZeroFill;
end Behavioral;