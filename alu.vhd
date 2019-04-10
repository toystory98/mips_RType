library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;

entity alu is
	port(	a1,a2 : in std_logic_vector(31 downto 0);
			alu_op : in std_logic_vector(3 downto 0);
			alu_result : out std_logic_vector(31 downto 0);
			zero :out std_logic);
end alu;
architecture Behavioral of alu is 
	signal result : std_logic_vector(31 downto 0);
	begin 
		process(a1,a2,alu_op) 
			begin
			
				if (alu_op="0010")then-- add
					result <= a1 + a2;
					
				elsif (alu_op="0110")then-- sub
					result <=  a1 - a2;
			
				elsif (alu_op="0001")then-- or
					result <= a1 or a2;
					 
				else
					result <= null;
				end if;

		alu_result <= result;
		
		if (result = x"00000000") then
			zero <= '1';
		else
			zero <= '0';
		end if;
		end process;
end Behavioral;