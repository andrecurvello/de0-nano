//`include "uart_tx_buffer.v"

`timescale 1ns/1ns
module uart_num2ascii_tb();
   
	// Declare inputs as regs and outputs as wires
	reg[7:0] num;
	wire[7:0] ascii;

	uart_num2ascii U0(
        .num(num),
        .ascii(ascii)
	);

	// Initialize all variables
	initial begin        
        $monitor ("num=%b ascii=%b", 
			num, ascii);	

        num = 0;

        #2
        num = 1;
        
        #2
        num = 2;
        
        #2
        num = 3;
        
        #2
        num = 4;
        
        #2
        num = 5;
        
        #2
        num = 6;
        
        #2
        num = 7;
        
        #2
        num = 8;
        
        #2
        num = 9;


        #10
        $stop;      // Terminate simulation

	end

	
endmodule
