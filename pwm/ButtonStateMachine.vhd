library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.std_logic_unsigned.ALL;

entity ButtonStateMachine is
port(
	
	clk : in std_logic;
	inc : in std_logic;
	dec : in std_logic;
	
	output : out std_logic_vector(9 downto 0)

);
end ButtonStateMachine;

architecture Behavioral of ButtonStateMachine is

signal state : std_logic_vector(1 downto 0) := (others => '0');

signal inc_flip : std_logic := '0';
signal dec_flip : std_logic := '0';

signal out_val : std_logic_vector(9 downto 0) := (others => '0');

begin
process(clk)
begin

	if rising_edge(clk) then
		
		state(0) <= (dec_flip and not state(1)) or (dec_flip and state(0)) or (inc_flip and state(1));
		state(1) <= (inc_flip and not state(0)) or (inc_flip and state(1)) or (dec_flip and state(0));
		
		if state = "01" then
			out_val <= out_val + 50;
		elsif state = "10" then
			out_val <= out_val - 50;
		end if;
		
	end if;

end process;

inc_flip <= not inc;
dec_flip <= not dec;

output <= out_val;

end Behavioral;