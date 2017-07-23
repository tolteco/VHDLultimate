library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Reg is
	generic(DELAY : time := 8.0 ns);
	port(
		Y    : in  std_logic;
		clk  : in  std_logic;
		load : in  std_logic;
		S    : out std_logic
	);
end Reg;

architecture Behavioral of Reg is
signal p : std_logic := '0';

begin
	S <= p;

	process(clk) is
	begin
		if (load = '1' and falling_edge(clk)) then
			p <= Y after DELAY;
		end if;
	end process;

end Behavioral;

