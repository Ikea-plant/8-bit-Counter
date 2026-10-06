library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL; -- Recommended library for arithmetic in VHDL

entity counter_8bit is
    Port (
        clk    : in  STD_LOGIC;
        reset  : in  STD_LOGIC;
        enable : in  STD_LOGIC;
        count  : out STD_LOGIC_VECTOR(7 downto 0)
    );
end entity counter_8bit;

architecture RTL of counter_8bit is
    -- Internal register signal to hold the count state
    signal count_reg : unsigned(7 downto 0) := (others => '0');
begin

    -- State register & logic update process
    process(clk, reset)
    begin
        if reset = '1' then
            count_reg <= (others => '0');
        elsif rising_edge(clk) then
            if enable = '1' then
                count_reg <= count_reg + 1; -- Data transfer operation
            end if;
        end if;
    end process;

    -- Output assignment (Data Path to output port)
    count <= std_logic_vector(count_reg);

end architecture RTL;