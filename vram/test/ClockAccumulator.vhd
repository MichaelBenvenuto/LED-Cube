----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:04:13 02/07/2020 
-- Design Name: 
-- Module Name:    ClockAccumulator - Behavioral 
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

entity ClockAccumulator is
    Port ( clk_in : in  STD_LOGIC;
           clk_out : out  STD_LOGIC);
end ClockAccumulator;

architecture Behavioral of ClockAccumulator is

signal clk_tick : STD_LOGIC_VECTOR(25 downto 0) := (others => '0');

begin

process(clk_in)
begin

	if rising_edge(clk_in) then
		if clk_tick = x"7FFFFF" then
			clk_out <= '1';
			clk_tick <= (others => '0');
		else
			clk_out <= '0';
			clk_tick <= clk_tick + 1;
		end if;
	end if;

end process;

end Behavioral;

