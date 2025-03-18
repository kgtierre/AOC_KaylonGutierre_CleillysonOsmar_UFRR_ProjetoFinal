library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ULA is
    port(
        A, B  :  in     std_logic_vector(7 downto 0); --Entradas de 8 bits
        Opcode:  in     std_logic_vector(2 downto 0); --Codigo de operacao
        Result:  out    std_logic_vector(7 downto 0); --Resultado
        Zero  :  out    std_logic                     --Se e zero
    );
end ULA;
architecture Behavior of ULA is
begin
    process(A,B,Opcode)
		variable tmp_Result : std_logic_vector(7 downto 0);
		begin
		case( Opcode ) is
            when "000" => tmp_Result := A + B;   -- ADD
            when "001" => tmp_Result := A - B;   -- SUB
            when "010" => tmp_Result := B;       -- LW
            when "011" => tmp_Result := B;       -- SW
            when "100" => tmp_Result := A -B;    -- BEQ
            when "101" => tmp_Result := B;       -- JUMP
            when others => tmp_result := (others => '0');
        end case;
		  
        Result <= tmp_result;

        if tmp_result = "00000000" then
            Zero <= '1';
        else
            Zero <= '0';
        end if ;

    end process;
end Behavior ; -- 

