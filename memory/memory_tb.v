

`timescale 10ns/10ns

module memory_tb();

    // Declare inputs as regs and outputs as wires
    reg reset, clk;
    wire [7:0] out;
 
memory_init memory_inst
(
	.clk(clk) ,	// input  CLOCK_50_sig
	.reset(reset) ,	// input  RESET_sig
	.out(out)
);

    
    initial begin
        reset = 1;
        clk = 0;
        
        #2
        reset = 0;
        

    
    end
    

    always begin
        #1 clk = !clk;
    end
 
endmodule
