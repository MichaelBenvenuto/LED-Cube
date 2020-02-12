----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:30:46 02/01/2020 
-- Design Name: 
-- Module Name:    BusNOT32 - Behavioral 
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

entity BusNOT32 is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           F : out  STD_LOGIC_VECTOR (31 downto 0));
end BusNOT32;

architecture Behavioral of BusNOT32 is

begin

NOTGEN : for I in 0 to 31 generate

	F(I) <= not A(I);

end generate NOTGEN;

end Behavioral;

