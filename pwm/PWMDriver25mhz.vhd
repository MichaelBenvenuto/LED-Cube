library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.std_logic_unsigned.ALL;

entity PWMDriver25mhz is
port(
	
	clk : in std_logic;
	duty : in std_logic_vector(9 downto 0);
	
	output : out std_logic
	

);
end PWMDriver25mhz;

architecture Behavioral of PWMDriver25mhz is

signal counter : std_logic_vector(9 downto 0) := (others => '0');
signal clk_tick : std_logic := '0';

begin
process(clk, duty)
begin

	if rising_edge(clk) then
	
		clk_tick <= not clk_tick;
		
		if clk_tick = '1' then
		
			if counter = 1023 then
				counter <= (others => '0');
			else
				counter <= counter + 1;
			end if;
			
		end if;
		
	end if;

end process;

output <= '1' when (counter < duty) else '0';

end Behavioral;