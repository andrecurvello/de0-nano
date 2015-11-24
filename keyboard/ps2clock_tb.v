
`timescale 10ns/10ns

module ps2clock_tb();

    // Declare inputs as regs and outputs as wires
    reg clk, i_clock;
    wire o_clock;
 
ps2clock ps2clock_inst
(
	.clk(clk) ,
	.i_clock(i_clock),
    .o_clock(o_clock)
);

    
    initial begin
        clk = 0;
        i_clock = 0;
    end
    

    always begin
        #1 clk = !clk;
    end
    
    always begin
    // 80us tick on the ps2 clock
        #4000 i_clock = !i_clock;
    end
 
endmodule
