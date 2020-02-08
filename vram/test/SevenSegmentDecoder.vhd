----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    03:44:29 01/31/2020 
-- Design Name: 
-- Module Name:    SevSegLookup - Behavioral 
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

entity SevSegLookup is
    Port ( number : in  STD_LOGIC_VECTOR (3 downto 0);
           out_dig : out  STD_LOGIC_VECTOR (7 downto 0));
end SevSegLookup;

architecture Behavioral of SevSegLookup is

begin

--x"C0", x"F9", x"A4", x"B0", x"99", x"92"

out_dig <= x"C0" when (number = x"0") else
			  x"F9" when (number = x"1") else
			  x"A4" when (number = x"2") else
			  x"B0" when (number = x"3") else
			  x"99" when (number = x"4") else
			  x"92" when (number = x"5") else
			  x"82" when (number = x"6") else
			  x"F8" when (number = x"7") else
			  x"80" when (number = x"8") else
			  x"90" when (number = x"9") else
			  x"88" when (number = x"A") else
			  x"83" when (number = x"B") else
			  x"C6" when (number = x"C") else
			  x"A1" when (number = x"D") else
			  x"86" when (number = x"E") else
			  x"8E" when (number = x"F") else x"FF";

end Behavioral;