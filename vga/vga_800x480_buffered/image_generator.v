

 module image_generator(
    clk,
    PIXEL_H,
    PIXEL_V,
    en,
    out
 );
 
    input clk;             // the system clock
    
    input [10:0] PIXEL_H;
    input [10:0] PIXEL_V;
    output en;             // do the write
    output out;            // pixel value at the given address
    
    reg [10:0] next_h;
    reg [10:0] next_v;
    reg value; 

    always @(PIXEL_H or PIXEL_V) begin
        next_h = PIXEL_H + 1;
        next_v = PIXEL_V + 1;
    end
    
    always @(posedge clk ) begin
        if (next_h >= 150 && next_h <= 250 && next_v >= 150 && next_v <= 250) begin
        //if (PIXEL_H >= 150 && PIXEL_H <= 250 && PIXEL_V >= 150 && PIXEL_V <= 250) begin
        //if (PIXEL_H >= 400) begin
            value <= 0;
        end else begin
            value <= 1;
        end

    end
    
    assign en = 1;
    assign out = value;
    
endmodule

