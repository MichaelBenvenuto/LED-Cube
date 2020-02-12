library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
library work;

entity SMachineTest is
port(
	
	clk : in STD_LOGIC;
	inc : in STD_LOGIC;
	dec : in STD_LOGIC;
	
	leds1 : out STD_LOGIC_VECTOR(1 downto 0);
	leds2 : out STD_LOGIC_VECTOR(1 downto 0);
	leds3 : out STD_LOGIC_VECTOR(1 downto 0);
	leds4 : out STD_LOGIC_VECTOR(1 downto 0)

);
end SMachineTest;

architecture Behavioral of SMachineTest is

signal duty : std_logic_vector(9 downto 0) := (others => '0');

signal led1 : STD_LOGIC;
signal led2 : STD_LOGIC;
signal led3 : STD_LOGIC;
signal led4 : STD_LOGIC;

begin

SMACHINE : entity work.ButtonStateMachine port map(clk, inc, dec, duty);
PWM50MHZ : entity work.PWMDriver50mhz     port map(clk, duty, led1);
PWM25MHZ : entity work.PWMDriver25mhz     port map(clk, duty, led2);
PWM12MHZ : entity work.PWMDriver12mhz     port map(clk, duty, led3);
PWM6MHZ : entity work.PWMDriver6mhz     port map(clk, duty, led4);

leds1 <= led1 & led1;
leds2 <= led2 & led2;
leds3 <= led3 & led3;
leds4 <= led4 & led4;

end Behavioral;