
module ram_8(
    output reg [15:0] q,
    input [15:0] d,
    input [12:0] write_address, read_address,
    input we, clk
);
    // 512 x 256 black-and-white ( / 16 = 8192)
    //(* ramstyle = "M9K" *)
    reg [15:0] mem [8191:0]; // 8K 16-bit RAM
    
    always @ (posedge clk) begin
        if (we)
            mem[write_address] <= d;
        q <= mem[read_address]; // q doesn't get d in this clock cycle
    end
    
endmodule
