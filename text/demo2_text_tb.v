`timescale 10ns/10ns

module demo2_text_tb();

    // Declare inputs as regs and outputs as wires
    reg clk; 
    reg [10:0] PIXEL_H, PIXEL_V;
    wire [2:0] PIXEL;
 
    demo2_text DUT (
        clk,
        PIXEL_H,
        PIXEL_V,
        PIXEL
     );
    
    integer i, j;
    initial begin
        clk = 0;
        PIXEL_V = 0;
        PIXEL_H = 0;
         
        #2
        for (j = 10; j < 80; j = j + 1) begin
            PIXEL_V = j;
            for (i = 10; i < 56; i = i + 1) begin
                #2
                PIXEL_H = i;
            end
        end

    end
    

    always begin
        #1 clk = !clk;
    end
 
endmodule
