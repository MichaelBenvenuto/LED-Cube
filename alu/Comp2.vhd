----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:21:57 02/01/2020 
-- Design Name: 
-- Module Name:    Comp2 - Behavioral 
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

entity Comp2 is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           A_out : out  STD_LOGIC_VECTOR (31 downto 0);
           cout : out  STD_LOGIC);
end Comp2;

architecture Behavioral of Comp2 is

signal c_internal : STD_LOGIC_VECTOR(31 downto 0);

begin

A_out(0) <= A(0);
c_internal(0) <= not A(0);

COMP2_GEN : for I in 1 to 31 generate

	A_out(I) <= (A(I) xnor c_internal(I - 1));
	c_internal(I) <= (not A(I) and c_internal(I - 1));

end generate COMP2_GEN;

cout <= c_internal(31);

end Behavioral;

