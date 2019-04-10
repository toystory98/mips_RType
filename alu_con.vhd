library IEEE;
use iEEE.std_logic_1164.all;
use iEEE.numeric_std.all;

entity alu_con is
	port( func : in std_logic_vector(5 downto 0);
			op  : in std_logic_vector(1 downto 0);
			alucon_out: out std_logic_vector(3 downto 0));
end alu_con;

architecture behavior of alu_con is
signal op_or  : std_logic_vector(3 downto 0):= "0001";
signal op_add    : std_logic_vector(3 downto 0):= "0010";
signal op_sub : std_logic_vector(3 downto 0):= "0110";

begin
process(op,func)
	begin
		if  ((op = "10") and (func = "100000")) then
			alucon_out <= op_add;
			
		elsif ((op = "10") and (func = "100010")) then
			alucon_out <= op_sub;
			
		elsif ((op = "10") and (func = "100101")) then
			alucon_out <= op_or;
			
		else
			alucon_out <= "0000";
		end if;
		end process;
end behavior;