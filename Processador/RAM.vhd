library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Ram is
    Port (
        Clock:       in  std_logic; --Recebe o clock
        MemWrite:    in  std_logic; --Flag de escrita
        MemrRead:    in  std_logic; --Flag de leitura
        AddressIn:   in  unsigned(7 downto 0); --Endereco 
        DataIn:      in  std_logic_vector(7 downto 0); --Dado anterior
        DataOut:     out std_logic_vector(7 downto 0)  --Dado posterior
    );
end entity;

architecture Behavior of Ram is
    type RamVector is array (0 to 255) of std_logic_vector(7 downto 0);
    signal Data: RamVector;
    signal Address: integer;
begin
    Address <= to_integer(AddressIn);

    process(Clock)
    begin
        if rising_edge(Clock) then
            if MemWrite = '1' then
                Data(Address) <= DataIn;
            end if;
        
            if MemrRead = '1' then
                DataOut <= Data(Address);
            else
                DataOut <= "ZZZZZZZZ";
            end if;
        end if;
    end process;
end Behavior;