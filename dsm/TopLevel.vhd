----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:05:52 01/31/2020 
-- Design Name: 
-- Module Name:    TopLevel - Behavioral 
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

library work;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TopLevel is
    Port ( clk : in  STD_LOGIC;
			  reset : in STD_LOGIC;
			  
			  dec16 : in STD_LOGIC;
			  dec : in STD_LOGIC;
			  inc : in STD_LOGIC;
			  inc16 : in STD_LOGIC;
			  
			  led_out : out STD_LOGIC;
			  
           dig_out : out  STD_LOGIC_VECTOR (7 downto 0);
           sel_out : out  STD_LOGIC_VECTOR (5 downto 0));
end TopLevel;

architecture Behavioral of TopLevel is

signal counter : STD_LOGIC_VECTOR(9 downto 0);

signal dig1 : STD_LOGIC_VECTOR(7 downto 0);
signal dig2 : STD_LOGIC_VECTOR(7 downto 0);
signal dig3 : STD_LOGIC_VECTOR(7 downto 0);

signal duty_1 : STD_LOGIC_VECTOR(3 downto 0);

begin

duty_1 <= "00" & counter(9 downto 8);

DSMDRVR : entity work.DigitalSignalModulator port map(counter, clk, reset, led_out);
SEVSEGLU1 : entity work.SevSegLookup port map(counter(3 downto 0), dig1);
SEVSEGLU2 : entity work.SevSegLookup port map(counter(7 downto 4), dig2);
SEVSEGLU3 : entity work.SevSegLookup port map(duty_1, dig3);
SEVSEG : entity work.SevenSegmentDriver port map(x"FF", x"FF", x"FF", dig3, dig2, dig1, clk, reset, dig_out, sel_out);
CNTRDRVR : entity work.CounterDriver port map(dec16, dec, inc, inc16, clk, reset, counter);

end Behavioral;

