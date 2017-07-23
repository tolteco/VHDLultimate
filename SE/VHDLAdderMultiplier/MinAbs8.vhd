library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MinAbs8 is
	generic(DELAY : time := 4.0 ns);
	port(
		X, Y : in  std_logic_vector(7 downto 0);
		S    : out std_logic_vector(7 downto 0)
	);
end MinAbs8;

architecture Behavioral of MinAbs8 is
	component Min8 is
		generic(DELAY : time := 4.0 ns);
		port(
			X, Y : in  std_logic_vector(7 downto 0);
			S    : out std_logic_vector(7 downto 0)
		);
	end component;
	
	component Neg8 is
		generic(DELAY : time := 4.0 ns);
		port(
			X : in  std_logic_vector(7 downto 0);
			S : out std_logic_vector(7 downto 0)
		);
	end component;
	
	signal NX, NY, NegX, NegY : std_logic_vector(7 downto 0);
begin
	u_ca_t0 : Neg8
		port map (X, NegX);
	u_ca_t1 : Neg8
		port map (Y, NegY);

	NX <= X when X(7) = '0' else
			NegX;
			
	NY <= Y when Y(7) = '0' else
			NegY;

	u_ca0 : Min8
		port map (NX, NY, S);

end Behavioral;