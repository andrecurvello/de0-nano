
module system (
	clk_clk,
	reset_reset_n,
	sdram_read_control_fixed_location,
	sdram_read_control_read_base,
	sdram_read_control_read_length,
	sdram_read_control_go,
	sdram_read_control_done,
	sdram_read_control_early_done,
	sdram_read_user_read_buffer,
	sdram_read_user_buffer_output_data,
	sdram_read_user_data_available,
	sdram_wire_addr,
	sdram_wire_ba,
	sdram_wire_cas_n,
	sdram_wire_cke,
	sdram_wire_cs_n,
	sdram_wire_dq,
	sdram_wire_dqm,
	sdram_wire_ras_n,
	sdram_wire_we_n);	

	input		clk_clk;
	input		reset_reset_n;
	input		sdram_read_control_fixed_location;
	input	[24:0]	sdram_read_control_read_base;
	input	[24:0]	sdram_read_control_read_length;
	input		sdram_read_control_go;
	output		sdram_read_control_done;
	output		sdram_read_control_early_done;
	input		sdram_read_user_read_buffer;
	output	[15:0]	sdram_read_user_buffer_output_data;
	output		sdram_read_user_data_available;
	output	[12:0]	sdram_wire_addr;
	output	[1:0]	sdram_wire_ba;
	output		sdram_wire_cas_n;
	output		sdram_wire_cke;
	output		sdram_wire_cs_n;
	inout	[15:0]	sdram_wire_dq;
	output	[1:0]	sdram_wire_dqm;
	output		sdram_wire_ras_n;
	output		sdram_wire_we_n;
endmodule
