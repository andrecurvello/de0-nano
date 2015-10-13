// needs to tell the caller when it is full...
module uart_tx_buffer(
	clk, 
	dataReady, 
	data, 
	txBusy, 
	txStart, 
	txData
);
	input clk;
	input[7:0] data;
	input dataReady;
	input txBusy;
	output reg txStart;
	output reg[7:0] txData;
    
	parameter BUFFER_LEN = 2; // max 255
	localparam WRITE1=0, WRITE2=1;

	reg[2:0] state = WRITE1;
	reg[7:0] buffer[0:BUFFER_LEN];
	reg[7:0] head = 0;
	reg[7:0] tail = 0;
    reg[7:0] count = 0;
    reg full = 0;

    always @(posedge clk) begin
    
        full <= (BUFFER_LEN - count == 1) ? 1:0;

        // If data is ready on the input, buffer it for sending.
        if (!full && dataReady) begin
            // Add to the send buffer.
            buffer[head] <= data;
            count <= count + 1;
            // Increment the head index
            if (head == BUFFER_LEN) begin
                head <= 0;
            end else begin
                head <= head + 1;
            end
        end
        
        if (txStart) begin
            txStart <= 0;
        end else if (!txBusy && (head != tail)) begin
            txData <= buffer[tail];
            if (count > 0) begin
                count <= count - 1;
            end
            txStart <= 1;
            state <= WRITE2;
            // Increase the processed index
            if (tail == BUFFER_LEN) begin
                tail <= 0;
            end else begin
                tail <= tail + 1;
            end
        end
        
        
        
/*       
        if (!txBusy && (head != tail)) begin
            txData <= buffer[tail];
            txStart <= 1;
            state <= WRITE2;
            // Increase the processed index
            if (tail == BUFFER_LEN) begin
                tail <= 0;
            end else begin
                tail <= tail + 1;
            end
        end else begin
            txStart <= 0;
        end
 */
 /*
        case (state)
            WRITE1: begin
                if (!txBusy && (head != tail)) begin
                    txData <= buffer[tail];
                    txStart <= 1;
                    state <= WRITE2;
                    // Increase the processed index
                    if (tail == BUFFER_LEN) begin
                        tail <= 0;
                    end else begin
                        tail <= tail + 1;
                    end
                end else begin
                    txStart <= 0;
                end
            end
      
            WRITE2: begin
                txStart <= 0;
                state <= WRITE1;
            end
        endcase
*/	
    end
  
endmodule
