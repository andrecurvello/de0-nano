
// BUF_WIDTH 6 = buffer size of 64 (same as Arduino)
`define BUF_WIDTH 6    // BUF_SIZE = 16 -> BUF_WIDTH = 4, no. of bits to be used in pointer
`define BUF_SIZE ( 1<<`BUF_WIDTH )

module fifo( 
    clk, 
    rst, 
    buf_in, 
    buf_out, 
    wr_en, 
    rd_en, 
    buf_empty, 
    buf_full, 
    fifo_counter 
);

    // reset, clock, write enable and read enable
    input rst, clk, wr_en, rd_en;   
    
    // data input to be pushed to buffer (1 byte)
    input [7:0] buf_in;                   
    
    // port to output the buffered data (1 byte)
    output[7:0] buf_out;                  
    
    // buffer empty and full indication 
    output buf_empty, buf_full;      
    
    // how many data items (bytes) are in the buffer  
    output[`BUF_WIDTH :0] fifo_counter;             
     

    reg[7:0] buf_out; // (1 byte)
    reg buf_empty, buf_full;
    reg[`BUF_WIDTH :0] fifo_counter;
    reg[`BUF_WIDTH -1:0] rd_ptr, wr_ptr; // pointers to read and write addresses  
    reg[7:0] buf_mem[`BUF_SIZE -1 : 0]; // BUF_SIZE (64) registers of 1 byte each

    always @(fifo_counter)
    begin
        buf_empty = (fifo_counter==0);
        buf_full = (fifo_counter== `BUF_SIZE);
    end

    // Handle the counter
    always @(posedge clk or posedge rst)
    begin
        if ( rst ) begin
            fifo_counter <= 0;
        end
        else if ((!buf_full && wr_en) && ( !buf_empty && rd_en )) begin
            fifo_counter <= fifo_counter;
        end
        else if (!buf_full && wr_en) begin
            fifo_counter <= fifo_counter + 1;
        end
        else if (!buf_empty && rd_en) begin
            fifo_counter <= fifo_counter - 1;
        end
        else v
            fifo_counter <= fifo_counter;
        end
    end

    // Output
    always @( posedge clk or posedge rst)
    begin
        if (rst) begin
            buf_out <= 0;
        end
        else begin
            if (rd_en && !buf_empty) begin
                buf_out <= buf_mem[rd_ptr];
            end
            else begin
                buf_out <= buf_out;
            end
       end
    end

    // Input
    always @(posedge clk)
    begin
        if (wr_en && !buf_full) begin
            buf_mem[ wr_ptr ] <= buf_in;
        end
        else begin
            buf_mem[ wr_ptr ] <= buf_mem[ wr_ptr ];
        end
    end

    // Pointers
    always@(posedge clk or posedge rst)
    begin
        if (rst) begin
            wr_ptr <= 0;
            rd_ptr <= 0;
        end
        else begin
            if (!buf_full && wr_en) begin
                wr_ptr <= wr_ptr + 1;
            end 
            else begin
                wr_ptr <= wr_ptr;
            end
            if (!buf_empty && rd_en) begin
                rd_ptr <= rd_ptr + 1;
            end
            else begin
                rd_ptr <= rd_ptr;
            end
       end

    end
endmodule

