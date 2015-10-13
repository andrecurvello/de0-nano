// needs to tell the caller when it is full...
module uart_tx_buffer(
	clk, 
	rst,
	dataReady, 
	data, 
	txBusy, 
	txStart, 
	txData
);
	input clk, rst;
	input[7:0] data;
	input dataReady;
	input txBusy;
	output reg txStart;
	output reg[7:0] txData;
    
	reg wr_en, rd_en;
	wire[7:0] buf_out;
    wire buf_full;
	wire buf_empty;
	wire [6:0] fifo_counter;
    

	// Input
    always @(posedge clk) begin
		if (dataReady && !buf_full) begin
			wr_en <= 1;
		end 
		else begin
			wr_en <= 0;
		end
    end
    
    // Output
    always @(posedge clk) begin
        if (txStart) begin
            txStart <= 0;
            rd_en <= 0;
        end 
        else if (!txBusy && !buf_empty) begin
			rd_en <= 1;
            txStart <= 1;
            txData <= buf_out;
		end /*
		else begin
			rd_en <= 0;
            txStart <= 0;
		end */
    end
  
 	fifo ff( .clk(clk), .rst(rst), .buf_in(data), .buf_out(buf_out), 
         .wr_en(wr_en), .rd_en(rd_en), .buf_empty(buf_empty), 
         .buf_full(buf_full), .fifo_counter(fifo_counter) );
  
endmodule
