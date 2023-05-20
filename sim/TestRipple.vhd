library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;

entity SimAdd_nbit is
--generic (n:integer:=4); --igora il valore di default
--  Port ( );
end SimAdd_nbit;

architecture Behavioral of SimAdd_nbit is
component RippleCarry_4 is
    --generic (n: integer:=8); -- 8 è il valore di default 
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Cin : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (4 downto 0));
end component;
signal IA : STD_LOGIC_VECTOR (3 downto 0);
signal IB : STD_LOGIC_VECTOR (3 downto 0);
signal ICin : STD_LOGIC;
signal OS : STD_LOGIC_VECTOR (4 downto 0);
begin
    circ: RippleCarry_4 port map(IA,IB,ICin,OS);  -- n assume il valore nella entity del test bench (4)
    -- dopo la sintesi si toglie generic map(n)
    ICin<='0';
    process
    begin
        --IA<=(others=>'0'); IB<=(others=>'0');
        --ICin<='1';
        --wait for 20ns;
        --IA<=(others=>'1'); IB<=(others=>'1');
        --wait for 10ns;
        for va in -(2**(3)) to (2**(3)-1) loop 
            IA<=conv_std_logic_vector(va,4);  --riceve il valore e il n° di elementi del vettore come parametri 
            for vb in -(2**(3)) to (2**(3)-1) loop 
                IB<=conv_std_logic_vector(vb,4);  
                wait for 10ns;
            end loop;    
        end loop; 
    end process;
    
end Behavioral;
