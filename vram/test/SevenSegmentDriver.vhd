----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:58:08 01/31/2020 
-- Design Name: 
-- Module Name:    SevenSegmentDriver - Behavioral 
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

entity SevenSegmentDriver is
    Port ( Digit1 : in  STD_LOGIC_VECTOR (7 downto 0);
           Digit2 : in  STD_LOGIC_VECTOR (7 downto 0);
           Digit3 : in  STD_LOGIC_VECTOR (7 downto 0);
           Digit4 : in  STD_LOGIC_VECTOR (7 downto 0);
           Digit5 : in  STD_LOGIC_VECTOR (7 downto 0);
           Digit6 : in  STD_LOGIC_VECTOR (7 downto 0);
           clk : in  STD_LOGIC;
			  reset : in STD_LOGIC;
           dig_out : out  STD_LOGIC_VECTOR (7 downto 0);
           sel_out : out  STD_LOGIC_VECTOR (5 downto 0));
end SevenSegmentDriver;

architecture Behavioral of SevenSegmentDriver is

signal clk_tick : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
signal sel_buffer : STD_LOGIC_VECTOR(5 downto 0) := "111110";

begin

process(clk, reset)
begin

	if rising_edge(clk) then
		
		if reset = '0' then
		
			sel_buffer <= "111110";
		
		elsif clk_tick = x"FFFF" then
		
			sel_buffer <= sel_buffer(4) & sel_buffer(3) & sel_buffer(2) & sel_buffer(1) & sel_buffer(0) & sel_buffer(5);
			clk_tick <= (others => '0');
			
		else
		
			clk_tick <= clk_tick + 1;
			
		end if;
		
	end if;

end process;

sel_out <= sel_buffer;

dig_out <= Digit6 when (sel_buffer = "111110") else
			  Digit5 when (sel_buffer = "111101") else
			  Digit4 when (sel_buffer = "111011") else
			  Digit3 when (sel_buffer = "110111") else
			  Digit2 when (sel_buffer = "101111") else
			  Digit1 when (sel_buffer = "011111") else
			  (others => '1');
			  

end Behavioral;