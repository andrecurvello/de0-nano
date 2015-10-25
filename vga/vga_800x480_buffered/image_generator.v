

 module image_generator(
    clk,
    reset,
    address,
    out,
    load
 );
 
    input clk;             // the system clock
    input reset;
    output load;             // do the write
    output [15:0] address;
    output [15:0] out;            // pixel values for ram address in the buffer


    reg [15:0] data;   
    reg [15:0] buffer_addr; 
    reg [32:0] counter;
    reg wren;
    
 
    
    always @(posedge clk or posedge reset) begin
        if (reset) begin 
            data <= 0;
            counter <= 0;
            wren <= 1;
        end else begin
            if (counter == 384000) begin // 800 x 480
                counter <= 0;
                wren <= 0; // write no more
            end
            else begin
                counter <= counter + 1;
                buffer_addr <= counter / 16;
                
                // 50 address registers per line (800 / 16 = 50)
                if (buffer_addr % 50) begin
                //if (buffer_addr == 0 || buffer_addr == 50 || buffer_addr == 100 || buffer_addr == 150 || buffer_addr == 200 || buffer_addr == 250 || buffer_addr == 300 || buffer_addr == 350) begin
                //if (buffer_addr == 0 || buffer_addr == 1 || buffer_addr == 2) begin
                    //data <= 16'hFF_FF;
                    data <= 16'h00_00;
                end
                else begin
                    //data <= 16'h00_00;
                    data <= 16'hFF_FF;
                end
                
            end

        end
    end
    
    
    assign load = wren;
    assign address = buffer_addr;
    assign out = data;
    
endmodule

