library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MinAbs is
	generic(DELAY : time := 4.0 ns);
	port(
		X, Y : in  std_logic_vector(15 downto 0);
		NegF : out std_logic;
		S    : out std_logic_vector(15 downto 0)
	);
end MinAbs;

architecture Behavioral of MinAbs is
	component Min is
		generic(DELAY : time := 4.0 ns);
		port(
			X, Y : in  std_logic_vector(15 downto 0);
			S    : out std_logic_vector(15 downto 0)
		);
	end component;
	
	component Neg is
		generic(DELAY : time := 4.0 ns);
		port(
			X : in  std_logic_vector(15 downto 0);
			S : out std_logic_vector(15 downto 0)
		);
	end component;

	signal TempS, NX, NY, NegX, NegY : std_logic_vector(15 downto 0);
begin
	u_ca_t0 : Neg
		port map (X, NegX);
	u_ca_t1 : Neg
		port map (Y, NegY);

	NX <= X when X(15) = '0' else
			NegX;
			
	NY <= Y when Y(15) = '0' else
			NegY;

	u_ca0 : Min
		port map (NX, NY, TempS);

	S <= TempS;
	NegF <= '1' when ((X(15)='1' and NX=TempS) or (Y(15)='1' and NY=TempS)) else
			'0';
end Behavioral;

