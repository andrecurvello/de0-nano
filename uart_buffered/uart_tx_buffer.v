// needs to tell the caller when it is full...
module uart_tx_buffer(
	clk, 
	rst,
	dataReady, 
	data, 
	txBusy, 
	txStart, 
	txData,
    empty,
    full
);
	input clk, rst;
	input[7:0] data;
	input dataReady;
	input txBusy;
	output reg txStart;
	output reg[7:0] txData;
    output reg empty, full;
    
	reg wr_en, rd_en;
	
	wire[7:0] buf_out;
   wire buf_full;
	wire buf_empty;
	wire [6:0] fifo_counter;
    

	// Input
	always @(posedge clk) begin
		if (dataReady && !full) begin
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
		else if (!txBusy && !empty) begin
			rd_en <= 1;
			txStart <= 1;
			txData <= buf_out;
		end
        else begin
            txStart <= 0;
            rd_en <= 0;
        end
        
		// Have local versions of buf_empty & buf_full as they will change on the same clock edge.
		empty <= buf_empty;
		full <= buf_full;
    end
	 
  
 	fifo ff( .clk(clk), .rst(rst), .buf_in(data), .buf_out(buf_out), 
         .wr_en(wr_en), .rd_en(rd_en), .buf_empty(buf_empty), 
         .buf_full(buf_full), .fifo_counter(fifo_counter) );
  
endmodule
