`timescale 10ns/10ns


module neopixels_tb();
   
	// Declare inputs as regs and outputs as wires
	reg clk;
    reg [1:0] key;
    wire data;
    
    neopixels np (
        .CLOCK_50(clk),
        .KEY(key),
        .data(data)
    );

	// Initialize all variables
	initial begin    
        clk = 1;
        key = 2'b00;

        #2 key = 2'b01;
        #2 key = 2'b10;
        #2 key = 2'b00;

        #4000 key = 2'b01;
        #2 key = 2'b10;
        #2 key = 2'b00;
	end

    always begin
        #1 clk = !clk;
    end
	
    
endmodule
