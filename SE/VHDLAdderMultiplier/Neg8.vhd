library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Neg8 is  ---Se X=1; S=-1
	generic(DELAY : time := 4.0 ns);
	port(
		X : in  std_logic_vector(7 downto 0);
		S : out std_logic_vector(7 downto 0)
	);
end Neg8;

architecture Behavioral of Neg8 is
	component CSA8 is
		generic(DELAY : time := 4.0 ns);
		port(
			X, Y : in  std_logic_vector(7 downto 0); -- X + Y
			T    : in  std_logic;           -- Transporte de entrada
			C    : out std_logic;           -- Transporte de saí­da
			S    : out std_logic_vector(7 downto 0) -- S = X + Y
		);
	end component;
	
	signal NX : std_logic_vector(7 downto 0);
	signal CT : std_logic;
	constant zeros : std_logic_vector(X'range) := (others => '0');
begin
	--if X = zeros then
	--	S <= X;
	--else
		NX <= not(X);
	
		u_ca0 : CSA8
			port map (NX, x"00", '1', CT, S);
	--end if;	
end Behavioral;

