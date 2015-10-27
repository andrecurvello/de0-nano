
`timescale 1ns/1ns
module quadrature_decode_tb();
   
	// Declare inputs as regs and outputs as wires
	reg reset, quadA, quadB;

	wire [7:0] count;

    
    quadrature_decode DUT(	
        .reset(reset),
        .quadA(quadA),
        .quadB(quadB),
        .count(count)
    );

/*
module quadrature_decode(
    reset,
    quadA, 
    quadB, 
    count
);
    input reset, quadA, quadB;
    output [15:0] count;
*/

	// Initialize all variables
	initial begin
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

	# 2 // bouncy
        quadA = 1;
        quadB = 1;

	# 2 // bouncy
        quadA = 0;
        quadB = 0;

        # 10
        quadA = 0;
        quadB = 1;

        
	end

	
endmodule
