----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:19:41 02/01/2020 
-- Design Name: 
-- Module Name:    Selector - Behavioral 
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

entity Selector is
    Port ( op_AND : in  STD_LOGIC_VECTOR (31 downto 0);
           op_OR : in  STD_LOGIC_VECTOR (31 downto 0);
           op_XOR : in  STD_LOGIC_VECTOR (31 downto 0);
           op_NOT : in  STD_LOGIC_VECTOR (31 downto 0);
           op_ADD : in  STD_LOGIC_VECTOR (31 downto 0);
           op_SUB : in  STD_LOGIC_VECTOR (31 downto 0);
           sel : in  STD_LOGIC_VECTOR (2 downto 0);
           op_OUT : out  STD_LOGIC_VECTOR (31 downto 0));
end Selector;

architecture Behavioral of Selector is

begin

op_OUT <= op_AND when sel = "000" else
			 op_OR when sel = "001" else
			 op_XOR when sel = "010" else
			 op_NOT when sel = "011" else
			 op_ADD when sel = "100" else
			 op_SUB when sel = "101" else (others => '0');

end Behavioral;

