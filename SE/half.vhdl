----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:50:25 06/14/2017 
-- Design Name: 
-- Module Name:    HalfAdder - Behavioral 
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

entity HalfAdder is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           sum   : out  STD_LOGIC;
			  c_out : out  STD_LOGIC);
end HalfAdder;

architecture Behavioral of HalfAdder is

Begin
	process(a, b) 
	begin
		sum <= a xor b;
		c_out <= a and b;
   end process;
end Behavioral;

