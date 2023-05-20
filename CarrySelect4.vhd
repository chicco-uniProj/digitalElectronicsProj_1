library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CarrySelect4 is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Cin: in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           Cout: out STD_LOGIC);
end CarrySelect4;

architecture Behavioral of CarrySelect4 is
component RippleCarry4 is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Cin : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           Cout : out STD_LOGIC);
end component;
component Multiplexer is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           sel : in STD_LOGIC;
           u : out STD_LOGIC);
end component;
signal r0, r1: STD_LOGIC;   --riporti in uscita dai due ripple carry (r0 è riferito al bit in ingresso 0)
signal c0,c1: STD_LOGIC;
signal s0, s1:  STD_LOGIC_VECTOR (3 downto 0); --uscite dei ripple carry (s0 è riferito al bit in ingresso 0)
begin
c0<='0'; c1<='1';
RC0: RippleCarry4 port map(A,B,c0,s0,r0);
RC1: RippleCarry4 port map(A,B,c1,s1,r1);

MyFor: for i in 0 to 3 generate
    MyMux: Multiplexer port map(s0(i),s1(i),Cin,S(i));
end generate MyFor;     
MuxFin: Multiplexer port map(r0,r1,Cin,Cout);    

end Behavioral;
