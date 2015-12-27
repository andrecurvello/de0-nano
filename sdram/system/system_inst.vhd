	component system is
		port (
			clk_clk                            : in    std_logic                     := 'X';             -- clk
			reset_reset_n                      : in    std_logic                     := 'X';             -- reset_n
			sdram_read_control_fixed_location  : in    std_logic                     := 'X';             -- fixed_location
			sdram_read_control_read_base       : in    std_logic_vector(24 downto 0) := (others => 'X'); -- read_base
			sdram_read_control_read_length     : in    std_logic_vector(24 downto 0) := (others => 'X'); -- read_length
			sdram_read_control_go              : in    std_logic                     := 'X';             -- go
			sdram_read_control_done            : out   std_logic;                                        -- done
			sdram_read_control_early_done      : out   std_logic;                                        -- early_done
			sdram_read_user_read_buffer        : in    std_logic                     := 'X';             -- read_buffer
			sdram_read_user_buffer_output_data : out   std_logic_vector(15 downto 0);                    -- buffer_output_data
			sdram_read_user_data_available     : out   std_logic;                                        -- data_available
			sdram_wire_addr                    : out   std_logic_vector(12 downto 0);                    -- addr
			sdram_wire_ba                      : out   std_logic_vector(1 downto 0);                     -- ba
			sdram_wire_cas_n                   : out   std_logic;                                        -- cas_n
			sdram_wire_cke                     : out   std_logic;                                        -- cke
			sdram_wire_cs_n                    : out   std_logic;                                        -- cs_n
			sdram_wire_dq                      : inout std_logic_vector(15 downto 0) := (others => 'X'); -- dq
			sdram_wire_dqm                     : out   std_logic_vector(1 downto 0);                     -- dqm
			sdram_wire_ras_n                   : out   std_logic;                                        -- ras_n
			sdram_wire_we_n                    : out   std_logic                                         -- we_n
		);
	end component system;

	u0 : component system
		port map (
			clk_clk                            => CONNECTED_TO_clk_clk,                            --                clk.clk
			reset_reset_n                      => CONNECTED_TO_reset_reset_n,                      --              reset.reset_n
			sdram_read_control_fixed_location  => CONNECTED_TO_sdram_read_control_fixed_location,  -- sdram_read_control.fixed_location
			sdram_read_control_read_base       => CONNECTED_TO_sdram_read_control_read_base,       --                   .read_base
			sdram_read_control_read_length     => CONNECTED_TO_sdram_read_control_read_length,     --                   .read_length
			sdram_read_control_go              => CONNECTED_TO_sdram_read_control_go,              --                   .go
			sdram_read_control_done            => CONNECTED_TO_sdram_read_control_done,            --                   .done
			sdram_read_control_early_done      => CONNECTED_TO_sdram_read_control_early_done,      --                   .early_done
			sdram_read_user_read_buffer        => CONNECTED_TO_sdram_read_user_read_buffer,        --    sdram_read_user.read_buffer
			sdram_read_user_buffer_output_data => CONNECTED_TO_sdram_read_user_buffer_output_data, --                   .buffer_output_data
			sdram_read_user_data_available     => CONNECTED_TO_sdram_read_user_data_available,     --                   .data_available
			sdram_wire_addr                    => CONNECTED_TO_sdram_wire_addr,                    --         sdram_wire.addr
			sdram_wire_ba                      => CONNECTED_TO_sdram_wire_ba,                      --                   .ba
			sdram_wire_cas_n                   => CONNECTED_TO_sdram_wire_cas_n,                   --                   .cas_n
			sdram_wire_cke                     => CONNECTED_TO_sdram_wire_cke,                     --                   .cke
			sdram_wire_cs_n                    => CONNECTED_TO_sdram_wire_cs_n,                    --                   .cs_n
			sdram_wire_dq                      => CONNECTED_TO_sdram_wire_dq,                      --                   .dq
			sdram_wire_dqm                     => CONNECTED_TO_sdram_wire_dqm,                     --                   .dqm
			sdram_wire_ras_n                   => CONNECTED_TO_sdram_wire_ras_n,                   --                   .ras_n
			sdram_wire_we_n                    => CONNECTED_TO_sdram_wire_we_n                     --                   .we_n
		);

