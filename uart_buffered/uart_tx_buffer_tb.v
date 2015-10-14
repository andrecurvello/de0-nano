//`include "uart_tx_buffer.v"

`timescale 1ns/1ns
module uart_tx_buffer_tb();
   
	// Declare inputs as regs and outputs as wires
	reg clk, rst;
	reg[7:0] data;
	reg dataReady;
	reg txBusy;

	wire txStart;
	wire[7:0] txData;

	uart_tx_buffer U0(
        .clk(clk),
	.rst(rst),
        .data(data),
        .dataReady(dataReady),
        .txBusy(txBusy),
        .txStart(txStart),
        .txData(txData),
	.empty(empty),
	.full(full)
	);

	// Initialize all variables
	initial begin        
        $monitor ("clk=%b data=%b dataReady=%b txBusy=%b txStart=%b txData=%b", 
			clk, data, dataReady, txBusy, txStart, txData);	

        clk = 1;
	rst = 1;
        data = 0;
        dataReady = 0;
        txBusy = 0;
        
        
        #2
        rst = 0;
        
        

        #2
        data = 8'b01000001; // A
        dataReady = 1;
        txBusy = 0;

	#2
	dataReady = 0;

        #2
        data = 8'b01000010; // B
        dataReady = 1;
        txBusy = 0;

	#2
	dataReady = 0;

        #2
        data = 8'b01000011; // C
        dataReady = 1;
        txBusy = 0;

	#2
	dataReady = 0;

        #2
        data = 8'b01000100; // D
        dataReady = 1;
        txBusy = 1;

	#2
	dataReady = 0;

        #2
        data = 8'b01000101; // E
        dataReady = 1;
        txBusy = 0;

	#2
	dataReady = 0;

        #2
        data = 8'b01000110; // F
        dataReady = 1;
        txBusy = 0;

	#2
	dataReady = 0;

        #2
        data = 8'b01000111; // G
        dataReady = 1;
        txBusy = 0;

	#2
	dataReady = 0;

        #2
        data = 8'b01001000; // H
        dataReady = 1;
        txBusy = 0;

	#2
	dataReady = 0;

        #2
        data = 8'b01001001; // I
        dataReady = 1;
        txBusy = 0;

	#2
	dataReady = 0;

        #2
        data = 8'b01001010; // J
        dataReady = 1;
        txBusy = 0;

        #2
        dataReady = 0;
        txBusy = 0;

        #2
        dataReady = 0;
        txBusy = 0;

        #2
        dataReady = 0;
        txBusy = 0;

        #2
        dataReady = 0;
        txBusy = 0;

        #2
        dataReady = 0;
        txBusy = 0;

        #2
        dataReady = 0;
        txBusy = 0;

        #2
        dataReady = 0;
        txBusy = 0;

        #2
        dataReady = 0;
        txBusy = 0;


        #10
        $stop;      // Terminate simulation

	end

    always begin
        #1 clk = !clk;
    end
	
endmodule
