library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity proc8bits is
	port(a, b: in	std_logic_vector(7 downto 0);
		op: in	std_logic_vector(2 downto 0);
		res: out	std_logic_vector(7 downto 0)
	);
end proc8bits;



architecture Behavior of proc8bits is
	signal z : std_logic;
	component ULA is
	port(A, B  :  in     std_logic_vector(7 downto 0);
	Opcode:  in     std_logic_vector(2 downto 0);
	Result:  out    std_logic_vector(7 downto 0);
	Zero  :  out    std_logic
);
end component;
	
	begin
	ula_teste: ULA port map(a, b, op, res, z);


end Behavior ; -- Behavior
