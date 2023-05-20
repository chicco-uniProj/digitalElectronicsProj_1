library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library work;
use work.myDef.all;

entity CarrySelect16 is
    
    Port ( A : in STD_LOGIC_VECTOR (n-1 downto 0);
           B : in STD_LOGIC_VECTOR (n-1 downto 0);
           Cin : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (n downto 0));
end CarrySelect16;

architecture Behavioral of CarrySelect16 is
component CarrySelect4 is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Cin: in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           Cout: out STD_LOGIC);
end component;
component RippleCarry4 is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Cin : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           Cout : out STD_LOGIC);
end component;
component FullAdder is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           cin : in STD_LOGIC;
           s : out STD_LOGIC;
           cout : out STD_LOGIC);
end component;
signal carry: STD_LOGIC_VECTOR (n/4 downto 0);
begin
RC4: RippleCarry4 port map(A(3 downto 0),B(3 downto 0),Cin,S(3 downto 0),carry(0));

MyFor: for i in 1 to (n/4)-1 generate
    CSi:CarrySelect4 port map(A(i*4+3 downto i*4),B(i*4+3 downto i*4),carry(i-1),S(i*4+3 downto i*4),carry(i));
end generate MYFor;

FA: FullAdder port map(A(n-1),B(n-1),carry(n/4-1),S(n),carry(n/4));
end Behavioral;
