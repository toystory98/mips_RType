library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity controller is
	port ( opcode	  : in std_logic_vector(5 downto 0);
			 reg_write : out std_logic;
			 alu_op	  : out std_logic_vector(1 downto 0));
end controller;

architecture behaviral of controller is 
	begin
	process(opcode)
	begin
	if (opcode = "000000") then --R-type
		reg_write <= '1';
		alu_op <= "10";
	end if;
	end process;
end behaviral;