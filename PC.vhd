library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity PC is
    port ( clk                 	: in  STD_LOGIC;
	        current_instruction 	: in  STD_LOGIC_VECTOR(4 downto 0);
	        instruction_address   : out STD_LOGIC_VECTOR(4 downto 0));
end entity PC;

architecture behavior of PC is
signal address : STD_LOGIC_VECTOR(4 downto 0) := "00000";

begin
    process(clk)
	 begin
	    if (FALLING_EDGE(clk)) then
		      address <= STD_LOGIC_VECTOR(UNSIGNED(current_instruction));
			end if;
	 end process;
	 instruction_address <= address;
end behavior;