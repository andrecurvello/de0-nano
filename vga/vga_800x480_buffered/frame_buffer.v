/**
 * Frame buffer
 * 800x480 ( / 16 = 24000)
 *
 */
 
 module frame_buffer(
    clk,
    PIXEL_H,
    PIXEL_V,
    load,
    in,
    out
 );
 
    input clk;             // the system clock
    input [10:0] PIXEL_H;
    input [10:0] PIXEL_V;
    input  in;       // what to write (black or white)
    input load;            // write-enable bit
    output out;            // pixel value at the given address
    
    reg [0:800] ram[0:480]; // 800*480
    reg value; 
 
    
    always @(posedge clk ) begin
        //value <= ~value;
        /*
        if (PIXEL_H >= 400) begin
            value <= 0;
        end else begin
            value <= 1;
        end
        */

        if (load) begin
            ram[PIXEL_H][PIXEL_V] <= in;
            value <= in;
        end else begin
            value <= ram[PIXEL_H][PIXEL_V];
        end
        
    end
    
    assign out = value;
    
endmodule
