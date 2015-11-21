/**
 * 25MHZ clock
 */
module vga_clock (
    CLOCK_50,
    CLOCK_25
);
    input CLOCK_50;
    output CLOCK_25;
    reg clk_25 = 0;

    always @(posedge CLOCK_50) begin
        clk_25 <= ~clk_25;
    end
 
    assign CLOCK_25 = clk_25;
endmodule
