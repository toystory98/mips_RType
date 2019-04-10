library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity mips is 
	port( clk 			: in std_logic;
			insout 		: out std_logic_vector (31 downto 0);
			read1,read2 : out std_logic_vector (31 downto 0);
			ALUresult	: out std_logic_vector (31 downto 0));

end mips;

architecture behaviral of mips is

	component PC is
		port ( clk                 : in  STD_LOGIC;
				current_instruction 	: in  STD_LOGIC_VECTOR(4 downto 0);
				instruction_address  : out STD_LOGIC_VECTOR(4 downto 0));
	end component;
	
	component registers is 
		port ( clk :in std_logic;
				readreg_1  :in std_logic_vector (4 downto 0);
				readreg_2  :in std_logic_vector (4 downto 0);
				writereg   : in std_logic_vector (4 downto 0);
			 
				writedata  :in std_logic_vector (31 downto 0);
				regwrite   : in std_logic;
			 
				readdata_1 :out std_logic_vector (31 downto 0);
				readdata_2 :out std_logic_vector (31 downto 0));
	end component;
	
	component controller is
		port ( opcode	  : in std_logic_vector(5 downto 0);
				reg_write  : out std_logic;
				alu_op	  : out std_logic_vector(1 downto 0));
	end component;
	
	component alu_con is
		port( func 		  : in std_logic_vector(5 downto 0);
				op  		  : in std_logic_vector(1 downto 0);
				alucon_out : out std_logic_vector(3 downto 0));

	end component;
	
	component alu is
		port(	a1,a2 	  : in std_logic_vector(31 downto 0);
				alu_op 	  : in std_logic_vector(3 downto 0);
				alu_result : out std_logic_vector(31 downto 0);
				zero 	  	  :out std_logic);
	end component;
	
	component adder is
		port ( in1,in2   : in std_logic_vector(4 downto 0);
				 result 	  : out std_logic_vector(4 downto 0 ));
	end component;
	
	component IM is
		port ( add  		: in  STD_LOGIC_VECTOR(4 downto 0);
				 instruction: out STD_LOGIC_VECTOR(31 downto 0));
	end component;

signal pc_in 	: STD_LOGIC_VECTOR(4 downto 0);
signal pc_out	: STD_LOGIC_VECTOR(4 downto 0);
signal add_in	: std_logic_vector(4 downto 0):="00001";
signal add_out	: std_logic_vector(4 downto 0 );
signal IM_out	: STD_LOGIC_VECTOR(31 downto 0);
signal rs,rt,rd: STD_LOGIC_VECTOR(4 downto 0);
signal op_in,funct: STD_LOGIC_VECTOR(5 downto 0);
signal alu_out	: std_logic_vector (31 downto 0);
signal reg_w 	: STD_LOGIC;
signal read_1,read_2 : std_logic_vector (31 downto 0);
signal con_op	: STD_LOGIC_VECTOR(1 downto 0);
signal operator: std_logic_vector(3 downto 0);
signal z			: std_LOGIC;

begin
	process (clk,add_out)
		begin
		if clk = '1' then
			pc_in <= add_out;
		end if;
	end process;
	
	c1 : PC 
	port map(clk,pc_in,pc_out);
	
	c2 : adder
	port map(add_in,pc_out,add_out);
	
	c3 : IM
	port map(pc_out,IM_out);
	
	op_in <= IM_out(31 downto 26);
	rs <= IM_out(25 downto 21);
	rt <= IM_out(20 downto 16);
	rd <= IM_out(15 downto 11);
	funct <= IM_out(5 downto 0);
	
	c4 : controller
	port map(op_in,reg_w,con_op);
	
	c5 : registers
	port map(clk,rt,rd,rs,alu_out,reg_w,read_1,read_2);
	
	c6	: alu_con
	port map(funct,con_op,operator);
	
	c7	: alu
	port map(read_1,read_2,operator,alu_out,z);

	insout <= IM_out;
	read1 <= read_1;
	read2 <= read_2;
	ALUresult <= alu_out;
	
end behaviral;

