
`timescale 1ns/1ns
module quadrature_tb();
   
	// Declare inputs as regs and outputs as wires
	reg clk, reset, quadA, quadB;

	wire [7:0] count;

    
    quadrature_clocked DUT(
        .clk(clk),	
	.reset(reset),
        .quadA(quadA),
        .quadB(quadB),
        .count(count)
    );

/*
module quadrature_clocked(
    clk, 
    quadA, 
    quadB, 
    count
);
    input clk, quadA, quadB;
    output [7:0] count;
*/

	// Initialize all variables
	initial begin        
        clk = 1;
        reset = 1;
	quadA = 1;
        quadB = 0;

	#2
	reset = 0;


        # 10
        quadA = 1;
        quadB = 1;
        
        # 10
        quadA = 0;
        quadB = 1;
        
        # 10
        quadA = 0;
        quadB = 0;
        
        # 10
        quadA = 1;
        quadB = 0;
        
        # 10
        quadA = 1;
        quadB = 1;

        # 10
        quadA = 1;
        quadB = 0;

        # 10
        quadA = 0;
        quadB = 0;

	# 12 // bouncy
        quadA = 0;
        quadB = 0;

	# 12 // bouncy
        quadA = 0;
        quadB = 0;

        # 10
        quadA = 0;
        quadB = 1;

        
	end

    always begin
        #1 clk = !clk;
    end
	
endmodule
