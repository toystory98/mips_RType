library ieee;
use ieee.std_logic_1164.all;

entity mux is 
	port ( mux_in0 : in std_logic_vector (4 downto 0);
			 mux_in1 : in std_logic_vector (4 downto 0);
			 mux_ctl : in std_logic;
			 mux_out : out std_logic_vector (4 downto 0 )
			);
end mux;

architecture Behavioral of mux is 
begin
	mux_out <= mux_in0 when mux_ctl = '0' else mux_in1;

end Behavioral;