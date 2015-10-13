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
	//reg empty, full;
	 
    always @(posedge clk) begin
		//empty <= buf_empty;
		//full <= buf_full;
		if (dataReady) begin
			wr_en <= 1;
		end 
		else begin
			wr_en <= 0;
		end


    end
  
 	fifo ff( .clk(clk), .rst(rst), .buf_in(data), .buf_out(buf_out), 
         .wr_en(wr_en), .rd_en(rd_en), .buf_empty(buf_empty), 
         .buf_full(buf_full), .fifo_counter(fifo_counter) );
  
endmodule
