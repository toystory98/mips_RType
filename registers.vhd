library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity registers is 
	port ( clk :in std_logic;
			 readreg_1 :in std_logic_vector (4 downto 0);
			 readreg_2 :in std_logic_vector (4 downto 0);
			 writereg : in std_logic_vector (4 downto 0);
			 
			 writedata :in std_logic_vector (31 downto 0);
			 regwrite : in std_logic;
			 
			 readdata_1 :out std_logic_vector (31 downto 0);
			 readdata_2 :out std_logic_vector (31 downto 0)
			);
end registers;
architecture Behavioral of registers is
		 type mem_array is array(0 to 31) of STD_LOGIC_VECTOR (31 downto 0);
    signal reg_mem: mem_array := (
        "00000000000000000000000000000000", -- $zero
		  
        "00000000000000000000000000000001", -- mem 1
        "00000000000000000000000000000010",
        "00000000000000000000000000000011",
        "00000000000000000000000000000100",
        "00000000000000000000000000000101",
        "00000000000000000000000000000110",
        "00000000000000000000000000000111",
        "00000000000000000000000000001000", -- test add
        "00000000000000000000000000001001", -- test add
        "00000000000000000000000000001010", -- mem 10 
        
		  "00000000000000000000000000000000",  
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000010",--test add sub
        "00000000000000000000000000000001",--test add sub 
        "00000000000000000000000000000000", -- mem 20
        "00000000000000000000000000000001",
        "00000000000000000000000000000001",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000", 
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000", 
        "00000000000000000000000000000000", -- mem 30
        "00000000000000000000000000000000"
    );			

begin
	---- read port 
	readdata_1 <= reg_mem(to_integer(unsigned(readreg_1)));
	readdata_2 <= reg_mem(to_integer(unsigned(readreg_2)));
	
	process (clk)
		begin
			if (falling_edge(clk) and regwrite = '1') then
				reg_mem (to_integer (unsigned(writereg))) <= writedata;
			end if;
	end process;
						
end Behavioral;
											
											
											 
		