

//`include "vga.v"

`timescale 10ns/10ns
module clock25_tb();
   
	// Declare inputs as regs and outputs as wires
	reg clk;

	wire clk_25;

    
    clock_25 DUT(
        .CLOCK_50(clk) ,	// input  CLOCK_50_sig
        .CLOCK_25(clk_25)
    );

/*
    input CLOCK_50;
    output CLOCK_25;


*/
	// Initialize all variables
	initial begin        


        clk = 1;


        
        
        //#110
        //$stop;      // Terminate simulation

	end

    always begin
        #1 clk = !clk;
    end
	
endmodule
