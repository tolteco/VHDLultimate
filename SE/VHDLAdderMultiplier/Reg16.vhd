library ieee;
use ieee.std_logic_1164.all;

entity Reg16 is
	port(
		Y    : in  std_logic_vector(15 downto 0);
		clk  : in  std_logic;
		load : in  std_logic;
		S    : out std_logic_vector(15 downto 0)
	);
end Reg16;

architecture Behavioral of Reg16 is
	component Reg is
		generic(DELAY : time := 8.0 ns);
		port(
			Y    : in  std_logic;
			clk  : in  std_logic;
			load : in  std_logic;
			S    : out std_logic
		);
	end component;

begin
	u_Reg00 : Reg
		port map(Y(0), clk, load, S(0));

	u_Reg01 : Reg
		port map(Y(1), clk, load, S(1));

	u_Reg02 : Reg
		port map(Y(2), clk, load, S(2));

	u_Reg03 : Reg
		port map(Y(3), clk, load, S(3));

	u_Reg04 : Reg
		port map(Y(4), clk, load, S(4));

	u_Reg05 : Reg
		port map(Y(5), clk, load, S(5));

	u_Reg06 : Reg
		port map(Y(6), clk, load, S(6));

	u_Reg07 : Reg
		port map(Y(7), clk, load, S(7));

	u_Reg08 : Reg
		port map(Y(8), clk, load, S(8));

	u_Reg09 : Reg
		port map(Y(9), clk, load, S(9));

	u_Reg10 : Reg
		port map(Y(10), clk, load, S(10));

	u_Reg11 : Reg
		port map(Y(11), clk, load, S(11));

	u_Reg12 : Reg
		port map(Y(12), clk, load, S(12));

	u_Reg13 : Reg
		port map(Y(13), clk, load, S(13));

	u_Reg14 : Reg
		port map(Y(14), clk, load, S(14));

	u_Reg15 : Reg
		port map(Y(15), clk, load, S(15));

end architecture;


