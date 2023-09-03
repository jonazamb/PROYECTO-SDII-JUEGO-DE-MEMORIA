library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity FrequencyDivider is
    Port ( Resetn, Clk: in  STD_LOGIC;
           Clk_0_5Hz: out  STD_LOGIC;
           Clk_1Hz: out  STD_LOGIC;
           Clk_2Hz: out  STD_LOGIC;
           Clk_4Hz: out  STD_LOGIC;
           Clk_8Hz: out  STD_LOGIC;
           Clk_16Hz: out  STD_LOGIC;
           Clk_32Hz: out  STD_LOGIC;
			  Clk_64Hz: out STD_LOGIC;
			  Clk_128Hz: out STD_LOGIC;
			  Clk_256Hz: out STD_LOGIC;
			  Clk_512Hz: out STD_LOGIC;
			  Clk_100Hz: out STD_LOGIC);
end FrequencyDivider;

architecture Behavioral of FrequencyDivider is
    signal counter_0_5Hz: STD_LOGIC_VECTOR(26 downto 0) := (others => '0'); -- 27-bit counter for 100 MHz
    signal counter_1Hz: STD_LOGIC_VECTOR(25 downto 0) := (others => '0'); -- 26-bit counter for 50 MHz
	 signal counter_2Hz: STD_LOGIC_VECTOR(24 downto 0) := (others => '0'); -- 25-bit counter for 25 MHz
	 signal counter_4Hz: STD_LOGIC_VECTOR(23 downto 0) := (others => '0'); -- 24-bit counter for 12.5 MHz
	 signal counter_8Hz: STD_LOGIC_VECTOR(22 downto 0) := (others => '0'); -- 23-bit counter for 6.25 MHz
	 signal counter_16Hz: STD_LOGIC_VECTOR(21 downto 0) := (others => '0'); -- 22-bit counter for 3125 kHz
	 signal counter_32Hz: STD_LOGIC_VECTOR(20 downto 0) := (others => '0'); -- 21-bit counter for 1562.5 kHz
	 signal counter_64Hz: STD_LOGIC_VECTOR(19 downto 0) := (others => '0'); -- 20-bit counter for 781.250 kHz
	 signal counter_128Hz: STD_LOGIC_VECTOR(18 downto 0) := (others => '0'); -- 19-bit counter for 390625 Hz
	 signal counter_256Hz: STD_LOGIC_VECTOR(17 downto 0) := (others => '0'); -- 18-bit counter for 195312 Hz
	 signal counter_512Hz: STD_LOGIC_VECTOR(16 downto 0) := (others => '0'); -- 17-bit counter for 97656 Hz
	 signal counter_100Hz: STD_LOGIC_VECTOR(18 downto 0) := (others => '0'); -- 19-bit counter for 500000 Hz 
	 
    constant COUNT1_0_5Hz: integer := 100000000; -- 50e6 / 0.5
    constant COUNT1_1Hz: integer := 50000000;   -- 50e6 / 1
    constant COUNT1_2Hz: integer := 25000000;   -- 50e6 / 2
    constant COUNT1_4Hz: integer := 12500000;   -- 50e6 / 4
    constant COUNT1_8Hz: integer := 6250000;    -- 50e6 / 8
    constant COUNT1_16Hz: integer := 3125000;   -- 50e6 / 16
    constant COUNT1_32Hz: integer := 1562500;   -- 50e6 / 32
	 constant COUNT1_64Hz: integer := 781250;   -- 50e6 / 64
	 constant COUNT1_128Hz: integer := 390625;   -- 50e6 / 128
	 constant COUNT1_256Hz: integer := 195312;   -- 50e6 / 256
	 constant COUNT1_512Hz: integer := 97656;   -- 50e6 / 512
	 constant COUNT1_100Hz: integer := 500000;   -- 50e6 / 100
	 
	 constant COUNT2_0_5Hz : integer := 50000000; -- 100e6 / 2
    constant COUNT2_1Hz : integer := 25000000;   -- 50e6 / 2
    constant COUNT2_2Hz : integer := 12500000;   -- 25e6 / 2
    constant COUNT2_4Hz : integer := 6250000;   -- 125e5 / 2
    constant COUNT2_8Hz : integer := 3125000;    -- 625e4 / 2
    constant COUNT2_16Hz : integer := 1562500;   -- 315e3 / 2
    constant COUNT2_32Hz : integer := 781250;   -- 15625e2 / 2
    constant COUNT2_64Hz : integer := 390625;   -- 78125e1 / 2
    constant COUNT2_128Hz : integer := 195312;   -- 390625 / 2
    constant COUNT2_256Hz : integer := 97656;   -- 195312 / 2
    constant COUNT2_512Hz : integer := 48828;   -- 97656 / 2
	 constant COUNT2_100Hz : integer := 250000;   -- 500000 / 2
begin
	process(Resetn, Clk)
	begin
		if Resetn='0' then counter_0_5Hz <= (others=>'0');
		elsif (Clk'event and Clk = '0') then  -- 0.5 Hz
			if counter_0_5Hz < COUNT1_0_5Hz -1 then
			 counter_0_5Hz <= counter_0_5Hz + 1;
			else
			 counter_0_5Hz <= (others=>'0');
			end if;
		end if;
	end process;
	
	process(Clk)
	begin
		 if counter_0_5Hz < COUNT2_0_5Hz then
			 Clk_0_5Hz <= '1';
		 else
			 Clk_0_5Hz <= '0';
		 end if;
	end process;

	process(Resetn, Clk)
	begin
		if Resetn='0' then counter_1Hz <= (others=>'0');
		elsif (Clk'event and Clk = '0') then  -- 1 Hz
			if counter_1Hz < COUNT1_1Hz -1 then
			 counter_1Hz <= counter_1Hz + 1;
			else
			 counter_1Hz <= (others=>'0');
			end if;
		end if;
	end process;
	
	process(Clk)
	begin
		 if counter_1Hz < COUNT2_1Hz then
			 Clk_1Hz <= '1';
		 else
			 Clk_1Hz <= '0';
		 end if;
	end process;
	
	process(Resetn, Clk)
	begin
		if Resetn='0' then counter_2Hz <= (others=>'0');
		elsif (Clk'event and Clk = '0') then  -- 2 Hz
			if counter_2Hz < COUNT1_2Hz -1 then
			 counter_2Hz <= counter_2Hz + 1;
			else
			 counter_2Hz <= (others=>'0');
			end if;
		end if;
	end process;
	
	process(Clk)
	begin
		 if counter_2Hz < COUNT2_2Hz then
			 Clk_2Hz <= '1';
		 else
			 Clk_2Hz <= '0';
		 end if;
	end process;

	process(Resetn, Clk)
	begin
		if Resetn='0' then counter_4Hz <= (others=>'0');
		elsif (Clk'event and Clk = '0') then  -- 4 Hz
			if counter_4Hz < COUNT1_4Hz -1 then
			 counter_4Hz <= counter_4Hz + 1;
			else
			 counter_4Hz <= (others=>'0');
			end if;
		end if;
	end process;
	
	process(Clk)
	begin
		 if counter_4Hz < COUNT2_4Hz then
			 Clk_4Hz <= '1';
		 else
			 Clk_4Hz <= '0';
		 end if;
	end process;

	process(Resetn, Clk)
	begin
		if Resetn='0' then counter_8Hz <= (others=>'0');
		elsif (Clk'event and Clk = '0') then  -- 8 Hz
			if counter_8Hz < COUNT1_8Hz -1 then
			 counter_8Hz <= counter_8Hz + 1;
			else
			 counter_8Hz <= (others=>'0');
			end if;
		end if;
	end process;
	
	process(Clk)
	begin
		 if counter_8Hz < COUNT2_8Hz then
			 Clk_8Hz <= '1';
		 else
			 Clk_8Hz <= '0';
		 end if;
	end process;

	process(Resetn, Clk)
	begin
		if Resetn='0' then counter_16Hz <= (others=>'0');
		elsif (Clk'event and Clk = '0') then  -- 16 Hz
			if counter_16Hz < COUNT1_16Hz -1 then
			 counter_16Hz <= counter_16Hz + 1;
			else
			 counter_16Hz <= (others=>'0');
			end if;
		end if;
	end process;
	
	process(Clk)
	begin
		 if counter_16Hz < COUNT2_16Hz then
			 Clk_16Hz <= '1';
		 else
			 Clk_16Hz <= '0';
		 end if;
	end process;	

	process(Resetn, Clk)
	begin
		if Resetn='0' then counter_32Hz <= (others=>'0');
		elsif (Clk'event and Clk = '0') then  -- 32 Hz
			if counter_32Hz < COUNT1_32Hz -1 then
			 counter_32Hz <= counter_32Hz + 1;
			else
			 counter_32Hz <= (others=>'0');
			end if;
		end if;
	end process;
	
	process(Clk)
	begin
		 if counter_32Hz < COUNT2_32Hz then
			 Clk_32Hz <= '1';
		 else
			 Clk_32Hz <= '0';
		 end if;
	end process;	

	process(Resetn, Clk)
	begin
		if Resetn='0' then counter_64Hz <= (others=>'0');
		elsif (Clk'event and Clk = '0') then  -- 64 Hz
			if counter_64Hz < COUNT1_64Hz -1 then
			 counter_64Hz <= counter_64Hz + 1;
			else
			 counter_64Hz <= (others=>'0');
			end if;
		end if;
	end process;
	
	process(Clk)
	begin
		 if counter_64Hz < COUNT2_64Hz then
			 Clk_64Hz <= '1';
		 else
			 Clk_64Hz <= '0';
		 end if;
	end process;

	process(Resetn, Clk)
	begin
		if Resetn='0' then counter_128Hz <= (others=>'0');
		elsif (Clk'event and Clk = '0') then  -- 128 Hz
			if counter_128Hz < COUNT1_128Hz -1 then
			 counter_128Hz <= counter_128Hz + 1;
			else
			 counter_128Hz <= (others=>'0');
			end if;
		end if;
	end process;
	
	process(Clk)
	begin
		 if counter_128Hz < COUNT2_128Hz then
			 Clk_128Hz <= '1';
		 else
			 Clk_128Hz <= '0';
		 end if;
	end process;
	
	process(Resetn, Clk)
	begin
		if Resetn='0' then counter_256Hz <= (others=>'0');
		elsif (Clk'event and Clk = '0') then  -- 256 Hz
			if counter_256Hz < COUNT1_256Hz -1 then
			 counter_256Hz <= counter_256Hz + 1;
			else
			 counter_256Hz <= (others=>'0');
			end if;
		end if;
	end process;
	
	process(Clk)
	begin
		 if counter_256Hz < COUNT2_256Hz then
			 Clk_256Hz <= '1';
		 else
			 Clk_256Hz <= '0';
		 end if;
	end process;
	
	process(Resetn, Clk)
	begin
		if Resetn='0' then counter_512Hz <= (others=>'0');
		elsif (Clk'event and Clk = '0') then  -- 512 Hz
			if counter_512Hz < COUNT1_512Hz -1 then
			 counter_512Hz <= counter_512Hz + 1;
			else
			 counter_512Hz <= (others=>'0');
			end if;
		end if;
	end process;
	
	process(Clk)
	begin
		 if counter_512Hz < COUNT2_512Hz then
			 Clk_512Hz <= '1';
		 else
			 Clk_512Hz <= '0';
		 end if;
	end process;

	process(Resetn, Clk)
	begin
		if Resetn='0' then counter_100Hz <= (others=>'0');
		elsif (Clk'event and Clk = '0') then  -- 100 Hz
			if counter_100Hz < COUNT1_100Hz -1 then
			 counter_100Hz <= counter_100Hz + 1;
			else
			 counter_100Hz <= (others=>'0');
			end if;
		end if;
	end process;
	
	process(Clk)
	begin
		 if counter_100Hz < COUNT2_100Hz then
			 Clk_100Hz <= '0';
		 else
			 Clk_100Hz <= '1';
		 end if;
	end process;
	
end Behavioral;