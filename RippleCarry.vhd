library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RippleCarry4 is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Cin : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           Cout : out STD_LOGIC);
end RippleCarry4;

architecture Struct of RippleCarry4 is
component FullAdder is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           cin : in STD_LOGIC;
           s : out STD_LOGIC;
           cout : out STD_LOGIC);
end component;
signal carry: STD_LOGIC_VECTOR (4 downto 0);
begin
MyFor: for i in 0 to 3 generate
    MyFA: FullAdder port map( A(i), B(i), carry(i), S(i), carry(i+1));
end generate MyFor;
carry(0)<=cin;
cout<=carry(4);
end Struct;
