-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:18:51 06/14/2017 
-- Design Name: 
-- Module Name:    RippleCarry8bits - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RippleCarry8bits is
	 Port ( a : in  STD_LOGIC_VECTOR (7 downto 0);
           b : in  STD_LOGIC_VECTOR (7 downto 0);
           c_out : out  STD_LOGIC;
           sum : out  STD_LOGIC_VECTOR (7 downto 0));
end RippleCarry8bits;

architecture Behavioral of RippleCarry8bits is
component Adder is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           c_in : in  STD_LOGIC;
           c_out : out  STD_LOGIC;
           sum : out  STD_LOGIC);
end component;

signal tempV : STD_LOGIC_VECTOR(6 downto 0);

begin
		Full1: Adder port map (a => a(0), b => b(0), c_in => '0',      sum => sum(0), c_out => tempV(0));
		Full2: Adder port map (a => a(1), b => b(1), c_in => tempV(0), sum => sum(1), c_out => tempV(1));
		Full3: Adder port map (a => a(2), b => b(2), c_in => tempV(1), sum => sum(2), c_out => tempV(2));
		Full4: Adder port map (a => a(3), b => b(3), c_in => tempV(2), sum => sum(3), c_out => tempV(3));
		Full5: Adder port map (a => a(4), b => b(4), c_in => tempV(3), sum => sum(4), c_out => tempV(4));
		Full6: Adder port map (a => a(5), b => b(5), c_in => tempV(4), sum => sum(5), c_out => tempV(5));
		Full7: Adder port map (a => a(6), b => b(6), c_in => tempV(5), sum => sum(6), c_out => tempV(6));
		Full8: Adder port map (a => a(7), b => b(7), c_in => tempV(6), sum => sum(7), c_out => c_out);
end Behavioral;
