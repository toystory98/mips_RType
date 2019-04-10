library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity adder is
	port ( in1,in2 : in std_logic_vector(4 downto 0);
			  result : out std_logic_vector(4 downto 0 ));
				
end entity;

architecture behavior of adder is
	begin
		result <= in1+in2;
end behavior;