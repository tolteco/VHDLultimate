----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:51:10 06/14/2017 
-- Design Name: 
-- Module Name:    Adder - Behavioral 
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

entity Adder is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           c_in : in  STD_LOGIC;
           c_out : out  STD_LOGIC;
           sum : out  STD_LOGIC);
end Adder;

architecture Behavioral of Adder is
component HalfAdder is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           sum   : out  STD_LOGIC;
			  c_out : out  STD_LOGIC
			  );
end component;

signal tempS, tempC, tempCOUT : STD_LOGIC;

begin
		Half1: HalfAdder port map (a => a,     b => b,    sum => tempS, c_out => tempC);
		Half2: HalfAdder port map (a => tempS, b => c_in, sum => sum,   c_out => tempCOUT);
		c_out <= tempC or tempCOUT;
end Behavioral;

