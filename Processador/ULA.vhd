library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ULA is
    port(
        A, B  :  in     signed(7 downto 0); --Entradas de 8 bits
        UlaOpc:  in     std_logic_vector(1 downto 0); --Codigo de operacao da ula
        Result:  out    signed(7 downto 0); --Resultado
        Zero  :  out    std_logic                     --Se e zero
    );
end ULA;
architecture Behavior of ULA is
begin
    process(A,B,UlaOpc)
		variable tmp_Result : signed(7 downto 0);
		begin
		case( UlaOpc ) is
            when "00"  => tmp_Result := A + B;   -- ADD e ADDi
            when "01" => tmp_Result := A - B;   -- SUB e BEQ
            when "10" => tmp_Result := B;       -- LW, SW, JUMP
            when others => tmp_result := (others => '0');
        end case;
		  
        Result <= tmp_result;

        if tmp_result = to_signed(0, 8) then
            Zero <= '1';
        else
            Zero <= '0';
        end if ;

    end process;
end Behavior ; -- 

