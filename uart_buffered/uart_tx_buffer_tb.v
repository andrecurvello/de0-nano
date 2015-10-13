//`include "uart_tx_buffer.v"

`timescale 1ns/1ns
module uart_tx_buffer_tb();
   
	// Declare inputs as regs and outputs as wires
	reg clk;
	reg[7:0] data;
	reg dataReady;
	reg txBusy;

	wire txStart;
	wire[7:0] txData;

	uart_tx_buffer U0(
        .clk(clk),
        .data(data),
        .dataReady(dataReady),
        .txBusy(txBusy),
        .txStart(txStart),
        .txData(txData)
	);

	// Initialize all variables
	initial begin        
        $monitor ("clk=%b data=%b dataReady=%b txBusy=%b txStart=%b txData=%b", 
			clk, data, dataReady, txBusy, txStart, txData);	

        clk = 1;
        data = 0;
        dataReady = 0;
        txBusy = 0;
// 01234567890123456789
        #10
        data = 8'b01000001;
        dataReady = 1;
        txBusy = 0;

        #10
        data = 8'b01000010;
        dataReady = 1;
        txBusy = 0;


        #10
        data = 8'b01000011;
        dataReady = 1;
        txBusy = 0;

        #10
        data = 8'b01000100;
        dataReady = 1;
        txBusy = 1;

        #10
        data = 8'b01000101;
        dataReady = 1;
        txBusy = 0;

        #10
        data = 8'b01000110;
        dataReady = 1;
        txBusy = 0;

        #10
        data = 8'b01000111;
        dataReady = 1;
        txBusy = 0;

        #10
        data = 8'b01001000;
        dataReady = 1;
        txBusy = 0;

        #10
        data = 8'b01001001;
        dataReady = 1;
        txBusy = 0;

        #10
        data = 8'b01001010;
        dataReady = 1;
        txBusy = 0;

        #10
        dataReady = 0;
        txBusy = 0;

        #10
        dataReady = 0;
        txBusy = 0;

        #10
        dataReady = 0;
        txBusy = 0;

        #10
        dataReady = 0;
        txBusy = 0;


        #10
        dataReady = 0;
        txBusy = 0;

        #10
        dataReady = 0;
        txBusy = 0;

        #10
        $stop;      // Terminate simulation

	end

    always begin
        #5 clk <= !clk;
    end
	
endmodule
