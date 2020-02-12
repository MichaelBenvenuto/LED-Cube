----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    04:20:31 01/31/2020 
-- Design Name: 
-- Module Name:    DigitalSignalModulator - Behavioral 
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

entity DigitalSignalModulator is
    Port ( duty : in  STD_LOGIC_VECTOR (9 downto 0);
           clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           sig_out : out  STD_LOGIC);
end DigitalSignalModulator;

architecture Behavioral of DigitalSignalModulator is

signal bit_signif : STD_LOGIC_VECTOR(9 downto 0) := "0000000001";
signal clk_cntr : STD_LOGIC_VECTOR(9 downto 0) := (others => '0');

signal duty_buffer : STD_LOGIC_VECTOR(9 downto 0) := (others => '0');

begin

process(duty, clk, reset)
begin

if rising_edge(clk) then

	if reset = '0' then
	
		bit_signif <= "0000000001";
		duty_buffer <= (others => '0');
		clk_cntr <= (others => '0');
		
	elsif duty_buffer = x"000" and clk_cntr = "1000000000" then
		
		duty_buffer <= duty;
		
	elsif clk_cntr = bit_signif then
		
		bit_signif <= bit_signif(8 downto 0) & bit_signif(9);
		duty_buffer <= '0' & duty_buffer(9 downto 1);
		clk_cntr <= (others => '0');
		
	else
	
		clk_cntr <= clk_cntr + 1;
		
	end if;

end if;

end process;

sig_out <= duty_buffer(0);

end Behavioral;

