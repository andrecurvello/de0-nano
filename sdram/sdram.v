//=======================================================

module sdram(
CLOCK_50, LED,
DRAM_ADDR, DRAM_BA, DRAM_CAS_N, DRAM_CKE, DRAM_CLK, DRAM_CS_N, DRAM_DQ, DRAM_DQM, DRAM_RAS_N, DRAM_WE_N //Memory pin
);

//////////// CLOCK //////////
input                           CLOCK_50;

//////////// LED //////////
output             [7:0]        LED;
//reg                 [7:0]        LED;

//////////// SDRAM //////////
output            [12:0]        DRAM_ADDR;
output             [1:0]        DRAM_BA;
output                          DRAM_CAS_N;
output                          DRAM_CKE;
output                          DRAM_CLK;
output                          DRAM_CS_N;
inout             [15:0]        DRAM_DQ;
output             [1:0]        DRAM_DQM;
output                          DRAM_RAS_N;
output                          DRAM_WE_N;

//////////// AVALON MASTER TEMPLATE //////////
wire        qsys_sdram_read_control_fixed_location;
wire        [31:0] qsys_sdram_read_control_read_base;
wire        [31:0] qsys_sdram_read_control_read_length;
wire        qsys_sdram_read_control_go;
reg        reg_qsys_sdram_read_control_fixed_location;
reg        [31:0] reg_qsys_sdram_read_control_read_base;
reg        [31:0] reg_qsys_sdram_read_control_read_length;
reg        reg_qsys_sdram_read_control_go;
wire        qsys_sdram_read_control_done;
wire        qsys_sdram_read_control_early_done;
wire        qsys_sdram_read_user_read_buffer;
reg        reg_qsys_sdram_read_user_read_buffer;
wire        [15:0] qsys_sdram_read_user_buffer_output_data;
wire        qsys_sdram_read_user_data_available;

reg gooff=0;
reg rboff=0;
reg init=1;

system u0(
        .clk_clk(CLOCK_50),                                //clk.clk
        .reset_reset_n(1'b1),                            //reset.reset_n
        
        //.sdram_clock_c0_clk(DRAM_CLK),                //sdram_clock_c0.clk
        //.sdram_clock_areset_conduit_export(1'b0),    //sdram_clock_areset_conduit.export
        
        .sdram_wire_addr(DRAM_ADDR),                    //sdram_wire.addr
        .sdram_wire_ba(DRAM_BA),                        //           .ba
        .sdram_wire_cas_n(DRAM_CAS_N),                //           .cas_n
        .sdram_wire_cke(DRAM_CKE),                        //           .cke
        .sdram_wire_cs_n(DRAM_CS_N),                    //           .cs_n
        .sdram_wire_dq(DRAM_DQ),                        //           .dq
        .sdram_wire_dqm(DRAM_DQM),                        //           .dqm
        .sdram_wire_ras_n(DRAM_RAS_N),                //           .ras_n
        .sdram_wire_we_n(DRAM_WE_N),                    //           .we_n
        
        .sdram_read_control_fixed_location(qsys_sdram_read_control_fixed_location),
        .sdram_read_control_read_base(qsys_sdram_read_control_read_base),
        .sdram_read_control_read_length(qsys_sdram_read_control_read_length),
        .sdram_read_control_go(qsys_sdram_read_control_go),
        .sdram_read_control_done(qsys_sdram_read_control_done),
        .sdram_read_control_early_done(qsys_sdram_read_control_early_done),
        .sdram_read_user_read_buffer(qsys_sdram_read_user_read_buffer),
        .sdram_read_user_buffer_output_data(qsys_sdram_read_user_buffer_output_data),
        .sdram_read_user_data_available(qsys_sdram_read_user_data_available)
);

assign qsys_sdram_read_control_fixed_location = reg_qsys_sdram_read_control_fixed_location;
assign qsys_sdram_read_control_read_base [31:0] = reg_qsys_sdram_read_control_read_base [31:0];
assign qsys_sdram_read_control_read_length [31:0] = reg_qsys_sdram_read_control_read_length [31:0];
assign qsys_sdram_read_control_go = reg_qsys_sdram_read_control_go;
assign qsys_sdram_read_user_read_buffer = reg_qsys_sdram_read_user_read_buffer;

always @(posedge CLOCK_50)
begin
    if (gooff)
    begin
        gooff <= 0;
        reg_qsys_sdram_read_control_go <= 0;
    end
    
    if (init)
    begin
        reg_qsys_sdram_read_control_fixed_location <= 0;
        reg_qsys_sdram_read_control_read_base <= 0;
        reg_qsys_sdram_read_control_read_length <= 8;
        reg_qsys_sdram_read_control_go <= 1;
        gooff <= 1;
        init <= 0;
    end
    
end

assign LED [7:0] = qsys_sdram_read_user_buffer_output_data [7:0];

endmodule
