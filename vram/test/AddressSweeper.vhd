----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:01:15 02/08/2020 
-- Design Name: 
-- Module Name:    AddressSweeper - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity AddressSweeper is
    Port ( clk : in  STD_LOGIC;
           addr_out : out  STD_LOGIC_VECTOR (8 downto 0));
end AddressSweeper;

architecture Behavioral of AddressSweeper is

signal addr_internal : STD_LOGIC_VECTOR(8 downto 0) := (others => '0');

begin

process(clk)
begin

	if rising_edge(clk) then
	
		addr_internal <= addr_internal + 1;
	
	end if;

end process;

addr_out <= addr_internal;

end Behavioral;

