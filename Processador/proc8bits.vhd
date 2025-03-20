	library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;


entity proc8bits is
	port(
		Clock : in std_logic;
		RegWrite : in std_logic;
		Address01 : in std_logic_vector(1 downto 0);
		Address02 : in std_logic_vector(1 downto 0); 
		Data : in std_logic_vector(7 downto 0);
		Output01 : out std_logic_vector(7 downto 0);
		Output02 : out std_logic_vector(7 downto 0)
	);
end proc8bits;


architecture Behavior of proc8bits is



	begin
		-- Comp_ram: entity work.Ram
		-- 	port map (
		-- 		Clock       => Clock,
		-- 		EnableWrite => EnableWrite,
		-- 		EnableRead  => EnableRead,
		-- 		AddressIn   => AddressIn,
		-- 		DataIn      => DataIn,
		-- 		DataOut     => DataOut
		-- 	);

		-- Comp_ULA: entity work.ULA
		-- port map(
		-- 	A		=>	A,
		-- 	B		=>	B,
		-- 	UlaOpc	=>	UlaOpc,
		-- 	Result	=>	Result,
		-- 	Zero	=>	Zero
		-- );
		Comp_banco_de_registradores: entity work.BancoRegis
		port map(
			Clock 	  =>	Clock,
			RegWrite  => 	RegWrite,
			Address01  =>	Address01, 
			Address02  => 	Address02, 
			Data	  =>	Data,
			Output01  => 	Output01,
			Output02  => 	Output02 
		);
		
		
	


end Behavior ; -- Behavior
