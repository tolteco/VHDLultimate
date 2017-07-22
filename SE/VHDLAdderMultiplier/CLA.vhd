library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CLA is
	generic(DELAY : time := 4.0 ns);
	port(
		X, Y : in  std_logic_vector(3 downto 0); -- X + Y
		T    : in  std_logic;           -- Transporte de entrada
		C    : out std_logic;           -- Transporte de saída
		S    : out std_logic_vector(3 downto 0) -- S = X + Y
	);
end CLA;

architecture Behavioral of CLA is
	component Adder is
		Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           c_in : in  STD_LOGIC;
           c_out : out  STD_LOGIC;
           sum : out  STD_LOGIC);
	end component;

	signal carry   : std_logic_vector(3 downto 0); -- Carry temp
	signal gener8  : std_logic_vector(3 downto 0); -- Generate temp
	signal propag8 : std_logic_vector(3 downto 0); -- Propagate temp
	
	signal trash   : std_logic_vector(2 downto 0);
	
begin
	carry(0)   <= T;
	gener8(0)  <= X(0) AND Y(0) after DELAY;
	propag8(0) <= X(0) OR Y(0)  after DELAY;

	u_ca0 : Adder
		port map(X(0), Y(0), carry(0), trash(0), S(0));

	carry(1)   <= gener8(0) OR (propag8(0) AND carry(0)) after 2*DELAY;
	gener8(1)  <= X(1) AND Y(1) after DELAY;
	propag8(1) <= X(1) OR Y(1) after DELAY;

	u_ca1 : Adder
		port map(X(1), Y(1), carry(1), trash(1), S(1));

	carry(2)   <= gener8(1) OR
	              (propag8(1) AND gener8(0)) OR 
	              (propag8(1) AND propag8(0) AND carry(0)) 
		      after 2*DELAY;
	gener8(2)  <= X(2) AND Y(2) after DELAY;
	propag8(2) <= X(2) OR Y(2) after DELAY;

	u_ca2 : Adder
		port map(X(2), Y(2), carry(2), trash(2), S(2));

	carry(3)   <= gener8(2) OR
                  (propag8(2) AND gener8(1)) OR 
                  (propag8(2) AND propag8(1) AND gener8(0)) OR
                  (propag8(2) AND propag8(1) AND propag8(0) AND carry(0)) 
 	 	  AFTER 2*DELAY;
	
	u_ca3 : Adder
		port map(X(3), Y(3), carry(3), C, S(3));


end Behavioral;

