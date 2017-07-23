library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Neg is  ---Se X=1; S=-1
	generic(DELAY : time := 4.0 ns);
	port(
		X : in  std_logic_vector(15 downto 0);
		S : out std_logic_vector(15 downto 0)
	);
end Neg;

architecture Behavioral of Neg is
	component CSA16 is
		generic(DELAY : time := 4.0 ns);
		port(
			X, Y : in  std_logic_vector(15 downto 0); -- X + Y
			T    : in  std_logic;           -- Transporte de entrada
			C    : out std_logic;           -- Transporte de saí­da
			S    : out std_logic_vector(15 downto 0) -- S = X + Y
		);
	end component;
	
	signal NX : std_logic_vector(15 downto 0);
	signal CT : std_logic;
	constant zeros : std_logic_vector(X'range) := (others => '0');
begin
	--if X = zeros then
	--	S <= X;
	--else
		NX <= not(X);
	
		u_ca0 : CSA16
			port map (NX, x"0000", '1', CT, S);
	--end if;	
end Behavioral;

