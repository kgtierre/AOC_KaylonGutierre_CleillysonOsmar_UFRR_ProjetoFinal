library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity BancoRegis is
    port(
        Clock : in std_logic;
        RegWrite : in std_logic;
        Address01 : in std_logic_vector(1 downto 0):= "00";
        Address02 : in std_logic_vector(1 downto 0) := "00"; 
        Data : in std_logic_vector(7 downto 0);
        Output01 : out std_logic_vector(7 downto 0);
        Output02 : out std_logic_vector(7 downto 0)
    );
end BancoRegis;

architecture Behavior of BancoRegis is
    type RegArray is array (0 to 7) of std_logic_vector(7 downto 0); 
    signal registers: RegArray := (others => (others => '0'));
    signal Address02Intern: std_logic_vector(1 downto 0) := "00"; 
begin

    process (Clock)
    begin
        if rising_edge(Clock) then
            if RegWrite = '1' then
                registers(to_integer(unsigned(Address01))) <= Data;
            end if;
        end if;
    end process;

    -- Se Endereco02 não estiver conectado, usa o valor padrão "00"
    Address02Intern <= Address02 when Address02 /= "ZZ" else "00";


    Output01 <= registers(to_integer(unsigned(Address01)));
    Output02 <= registers(to_integer(unsigned(Address02Intern)));

end Behavior;