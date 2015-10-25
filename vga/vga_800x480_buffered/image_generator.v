

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
    reg [4:0] pixel_bit;
    
    
    
    /* Internal registers for horizontal signal timing */
    reg [10:0] hor_reg; // to count up to 975
    wire hor_max = (hor_reg == 975); // to tell when a line is full

    /* Internal registers for vertical signal timing */
    reg [9:0] ver_reg; // to count up to 527
    wire ver_max = (ver_reg == 527); // to tell when a line is full

    /* Running through line */
    always @ (posedge clk or posedge reset) begin

        if (reset) begin 
            hor_reg <= 0;
            ver_reg <= 0;
            buffer_addr <= 0;
            pixel_bit <= 0;
        end
        else if (hor_max) begin
            hor_reg <= 0;

            /* Running through frame */
            if (ver_max) begin
                ver_reg <= 0;
            end else begin
                ver_reg <= ver_reg + 1;
            end
        end else begin
            hor_reg <= hor_reg + 1;
        end

    end  
    /*
    wire [4:0] foo;
    
    assign foo = (hor_reg + ver_reg) % 16;
    
    always @(posedge clk or posedge reset) begin
    
        if (reset) begin 
            hor_reg <= 0;
            ver_reg <= 0;
            buffer_addr <= 0;
            pixel_bit <= 0;
        end else begin
    
            if (hor_reg == 800) begin
                hor_reg <= 0;
            end else begin
                hor_reg <= hor_reg +1;
            end
            if (ver_reg == 480) begin
                ver_reg <= 0;
            end else begin
                ver_reg <= ver_reg +1;
            end
        end
        
        buffer_addr <= (hor_reg + ver_reg) / 16;
        pixel_bit <= (hor_reg + ver_reg) % 16;
    end
    */
    
    
    always @(posedge clk or posedge reset) begin
        if (reset) begin 
            data <= 0;
        end else begin
    
            if (hor_reg >= 150 && hor_reg <= 250 && ver_reg >= 150 && ver_reg <= 250) begin
                data[pixel_bit] <= 0;
            end else begin
                data[pixel_bit] <= 1;
            end

/*
        if (hor_reg == 100 && ver_reg <= 250) begin
            data <= 16'h00_00;
        end else begin
            data <= 16'hFF_FF;
        end
*/
        end
    end
    
    
    assign load = 1;
    assign address = buffer_addr;
    assign out = data;
    
endmodule

