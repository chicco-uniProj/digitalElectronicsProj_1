library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;
library work;
use work.myDef.all;

entity TestBench is
--  Port ( );
end TestBench;

architecture Behavioral of TestBench is
component CarrySelect16 is
    Port ( A : in STD_LOGIC_VECTOR (n-1 downto 0);
           B : in STD_LOGIC_VECTOR (n-1 downto 0);
           Cin : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (n downto 0));
end component;
signal IA,IB:STD_LOGIC_VECTOR (n-1 downto 0);
signal OS:STD_LOGIC_VECTOR (n downto 0);
signal ICarry:STD_LOGIC;
begin
    CS16: CarrySelect16 port map(IA,IB,ICarry,OS);
    ICarry<='0';
    process
    begin
    
    for va in -(2**(n-1)) to (2**(n-1)-1) loop
        IA<=conv_std_logic_vector(va,n);
        for vb in -(2**(n-1)) to (2**(n-1)-1) loop
            IB<=conv_std_logic_vector(vb,n);
            wait for 10ns;
        end loop;
    end loop;
    end process;
end Behavioral;
