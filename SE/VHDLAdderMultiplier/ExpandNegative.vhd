library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ExpandNegative is
	generic(DELAY : time := 4.0 ns);
	port(
		X : in  std_logic_vector(7 downto 0);
		Y : out std_logic_vector(15 downto 0)
	);
end ExpandNegative;

architecture Behavioral of ExpandNegative is
	component Neg8 is
		generic(DELAY : time := 4.0 ns);
		port(
			X : in  std_logic_vector(7 downto 0);
			S : out std_logic_vector(7 downto 0)
		);
	end component;
	
	component Neg is
		generic(DELAY : time := 4.0 ns);
		port(
			X : in  std_logic_vector(15 downto 0);
			S : out std_logic_vector(15 downto 0)
		);
	end component;
	
	signal NX, NegX : std_logic_vector(7 downto 0);
	signal ExtNX, ExtNeg : std_logic_vector(15 downto 0) := x"0000";
	signal ExtNegX : std_logic_vector(15 downto 0);
begin
	u_ca_t0 : Neg8
		port map (X, NegX);

	NX <= X when X(7) = '0' else
			NegX;

	ExtNX(7 downto 0) <= NX;
	ExtNeg(7 downto 0) <= NX;
	
	u_ca0 : Neg
		port map (ExtNeg, ExtNegX);
		
	Y <= ExtNX when X(7) = '0' else
		  ExtNegX;
end Behavioral;

