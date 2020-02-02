----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:47:10 02/01/2020 
-- Design Name: 
-- Module Name:    FullAdderL2 - Behavioral 
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

entity FullAdderL2 is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           sum : out  STD_LOGIC_VECTOR (31 downto 0);
           carry : out  STD_LOGIC);
end FullAdderL2;

architecture Behavioral of FullAdderL2 is

signal c_internal : STD_LOGIC_VECTOR(31 downto 0);

begin

sum(0) <= A(0) xor B(0);
c_internal(0) <= A(0) and B(0);

GEN_ADD: for I in 1 to 31 generate
	ADDER : entity work.FullAdderL1 port map(A(I), B(I), c_internal(I - 1), sum(I), c_internal(I));
end generate GEN_ADD;

carry <= c_internal(31);

end Behavioral;

