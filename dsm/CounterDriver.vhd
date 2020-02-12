----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    03:31:58 01/31/2020 
-- Design Name: 
-- Module Name:    CounterDriver - Behavioral 
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

entity CounterDriver is
    Port ( dec16 : in  STD_LOGIC;
           dec : in  STD_LOGIC;
           inc : in  STD_LOGIC;
           inc16 : in  STD_LOGIC;
           clk : in  STD_LOGIC;
			  reset : in STD_LOGIC;
           counter : out  STD_LOGIC_VECTOR (9 downto 0));
end CounterDriver;

architecture Behavioral of CounterDriver is

signal press : STD_LOGIC;

signal counter_internal : STD_LOGIC_VECTOR(9 downto 0);

begin

process(clk, reset, dec16, dec, inc, inc16)
begin

	if rising_edge(clk) then
		
		if reset = '0' then
			counter_internal <= (others => '0');
			press <= '0';
		elsif dec16 = '0' and press = '0' then
			counter_internal <= counter_internal - x"10";
			press <= '1';
		elsif dec = '0' and press = '0' then
			counter_internal <= counter_internal - x"1";
			press <= '1';
		elsif inc = '0' and press = '0' then
			counter_internal <= counter_internal + x"1";
			press <= '1';
		elsif inc16 = '0' and press = '0' then
			counter_internal <= counter_internal + x"10";
			press <= '1';
		elsif dec16 = '1' and dec = '1' and inc = '1' and inc16 = '1' then
			press <= '0';
		end if;
			
			
	end if;

end process;

counter <= counter_internal;

end Behavioral;

