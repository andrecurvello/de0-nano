/**
 * Frame buffer
 * 800x480 ( / 16 = 24000)
 *
 */
 
 module screen(
    clk,
    in,
    load,
    address,
    out
 );
 
    input clk;             // the system clock
    input [15:0] in;       // what to write
    input load;            // write-enable bit
    input [15:0] address;  // where to read/write
    output [15:0] out;            // pixel value at the given address
    
    reg [15:0] ram[0:24000]; // 24K 16-bit RAM
    reg [15:0]value; 
    
    always @(posedge clk ) begin
        if (load) begin
            ram[address] <= in;
        end else begin
            value <= ram[address];
        end
    end
    
    assign out = value;
    
endmodule
