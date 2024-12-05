```vhdl
ENTITY solution_example IS
  PORT (
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    data_in : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    data_out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
  );
END ENTITY;

ARCHITECTURE behavioral OF solution_example IS
  SIGNAL internal_data : STD_LOGIC_VECTOR(7 DOWNTO 0) := "00000000";
BEGIN
  PROCESS (clk, rst)
  BEGIN
    IF rst = '1' THEN
      internal_data <= "00000000";
    ELSIF rising_edge(clk) THEN
      IF rst = '0' THEN --Check for reset to avoid race condition
          internal_data <= data_in;
      END IF;
    END IF;
  END PROCESS;

  data_out <= internal_data; 
END ARCHITECTURE; 
```