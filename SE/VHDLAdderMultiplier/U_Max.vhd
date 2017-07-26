library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity U_Max is
	generic(DELAY : time := 4.0 ns);
	port(
		X, Y : in  std_logic_vector(15 downto 0);
		S    : out std_logic_vector(15 downto 0)
	);
end U_Max;

architecture Behavioral of U_Max is
	component Subtrator16 is
		generic(DELAY : time := 4.0 ns);
		port(
			X, Y : in  std_logic_vector(15 downto 0); -- X + Y
			C    : out std_logic;           -- Transporte de saí­da
			S    : out std_logic_vector(15 downto 0) -- S = X + Y
		);
	end component;
	
	component Multiplexer16 is
		generic(DELAY : time := 4.0 ns);
		port(
			X, Y : in  std_logic_vector(15 downto 0); -- X + Y
			Sel  : in  std_logic;           -- Selector
			Sout : out std_logic_vector(15 downto 0) -- Saida
		);
	end component;
	
	signal X_Minus_Y : std_logic_vector(15 downto 0);
	signal C_Out : std_logic;
begin
	u_ca0 : Subtrator16
		port map (X, Y, C_Out, X_Minus_Y);

	u_ca1 : Multiplexer16
		port map (X, Y, X_Minus_Y(15), S); 
	
end Behavioral;

