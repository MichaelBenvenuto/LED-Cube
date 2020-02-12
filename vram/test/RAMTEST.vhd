----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:34:24 02/07/2020 
-- Design Name: 
-- Module Name:    RAMTEST - Behavioral 
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
use STD.TEXTIO.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RAMTEST is
    Port ( clk : in  STD_LOGIC;
           we : in  STD_LOGIC;
           addr : in  STD_LOGIC_VECTOR (8 downto 0);
           din : in  STD_LOGIC_VECTOR (23 downto 0);
           dout : out  STD_LOGIC_VECTOR (23 downto 0));
end RAMTEST;

architecture Behavioral of RAMTEST is

type RamType is array(511 downto 0) of BIT_VECTOR(23 downto 0);

impure function InitRam (FileName : in string) return RamType is
	FILE RamFile : text is in FileName;
	variable RamFileLine : LINE;
	variable RAM : RamType;
begin

	for I in RamType'range loop
		readline(RamFile, RamFileLine);
		read(RamFileLine, RAM(I));
	end loop;
	return RAM;
end function;

signal RAM : RamType := InitRam("ram_data.data");

begin

process(clk, din)
begin
	if rising_edge(clk) then
		if we = '1' then
			RAM(conv_integer(addr)) <= to_bitvector(din);
		end if;
		dout <= to_stdlogicvector(RAM(conv_integer(addr)));
	end if;
end process;

end Behavioral;

