library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.std_logic_unsigned.ALL;

entity ClockAccumulator is
port(
	
	clk : in std_logic;
	
	output : out std_logic

);
end ClockAccumulator;

architecture Behavioral of ClockAccumulator is

signal counter : std_logic_vector(25 downto 0) := (others => '0');

signal clock : std_logic := '0';

begin
process(clk)
begin

	if rising_edge(clk) then
		
		if counter = 25000000 then
			counter <= (others => '0');
			clock <= not clock;
		else
			counter <= counter + 1;
		end if;
		
		
	end if;

end process;

output <= clock;

end Behavioral;