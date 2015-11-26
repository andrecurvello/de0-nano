

 module dummy_generator(
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
    
    assign load = 0;
    assign address = 0;
    assign out = 0;
    
endmodule

