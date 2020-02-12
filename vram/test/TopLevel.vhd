----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:03:32 02/08/2020 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TopLevel is
    Port ( clk : in  STD_LOGIC;
			  rst : in  STD_LOGIC;
           sel : out  STD_LOGIC_VECTOR (5 downto 0);
           dig : out  STD_LOGIC_VECTOR (7 downto 0));
end TopLevel;

architecture Behavioral of TopLevel is

signal clk_1meg : STD_LOGIC;

signal address : STD_LOGIC_VECTOR(8 downto 0);
signal data : STD_LOGIC_VECTOR(23 downto 0);

signal digit_1 : STD_LOGIC_VECTOR(7 downto 0);
signal digit_2 : STD_LOGIC_VECTOR(7 downto 0);
signal digit_3 : STD_LOGIC_VECTOR(7 downto 0);
signal digit_4 : STD_LOGIC_VECTOR(7 downto 0);
signal digit_5 : STD_LOGIC_VECTOR(7 downto 0);
signal digit_6 : STD_LOGIC_VECTOR(7 downto 0);

begin

CLOCKACCUM : entity work.ClockAccumulator port map(clk, clk_1meg);
ADDRSWEEP  : entity work.AddressSweeper 	port map(clk_1meg, address);
RAMTEST    : entity work.RAMTEST 			port map(clk, '0', address, (others => '0'), data);
SEVSEGLUT1  : entity work.SevSegLookup     port map(data(23 downto 20), digit_1);
SEVSEGLUT2  : entity work.SevSegLookup     port map(data(19 downto 16), digit_2);
SEVSEGLUT3  : entity work.SevSegLookup     port map(data(15 downto 12), digit_3);
SEVSEGLUT4  : entity work.SevSegLookup     port map(data(11 downto 8), digit_4);
SEVSEGLUT5  : entity work.SevSegLookup     port map(data(7 downto 4), digit_5);
SEVSEGLUT6  : entity work.SevSegLookup     port map(data(3 downto 0), digit_6);

SEVSEGDRVR : entity work.SevenSegmentDriver port map(digit_1, digit_2, digit_3, digit_4, digit_5, digit_6, clk, rst, dig, sel);

end Behavioral;

