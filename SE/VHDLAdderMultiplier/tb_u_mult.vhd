library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_u_mult is
end tb_u_mult;


architecture Behavioral of tb_u_mult is
	component U_MultiplicadorSomador8 is
		generic(DELAY : time := 4.0 ns);
		port(
			X, Y : in  std_logic_vector(7 downto 0); -- X * Y
			Clock: in  std_logic;           -- Clock
			init : in  std_logic;
			Sout : out std_logic_vector(15 downto 0) -- Saida
		);
	end component;
	
	signal clk, init : std_logic := '0';
	
	signal X, Y : std_logic_vector(7 downto 0);
	signal Res  : std_logic_vector(15 downto 0);
begin
	clk <= not clk after 20 ns; --Clk de 40 ns
	
	u_top : U_MultiplicadorSomador8
		port map (X, Y, clk, init, Res);
	
	process
	begin
		init <= '1';
		X <= "00000010";
		Y <= "00000110";
		wait until falling_edge(clk);
		
		init <= '0';
		wait on Res;
		wait for 100 ns;
		
		assert false
			   report "Stuff's done."
			   severity failure;
	end process;

end Behavioral;
