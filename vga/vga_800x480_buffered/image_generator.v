

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
    reg wren;
    
    
    /* Internal registers for horizontal signal timing */
    reg [10:0] hor_reg; 
    wire hor_max = (hor_reg == 975); // to tell when a line is full

    /* Internal registers for vertical signal timing */
    reg [9:0] ver_reg; 
    wire ver_max = (ver_reg == 527); // to tell when a line is full

    /* Running through line */
    always @ (posedge clk or posedge reset) begin

        if (reset) begin 
            hor_reg <= 0;
            ver_reg <= 0;
            buffer_addr <= 0;
            pixel_bit <= 0;
            wren <= 1;
        end 
        
        else if (hor_max) begin
            hor_reg <= 0;

            if (ver_max) begin
                ver_reg <= 0;
                
                wren <= 0; // write no more
                
            end else begin
                ver_reg <= ver_reg + 1;
            end
            
        end else begin
            hor_reg <= hor_reg + 1;
            buffer_addr <= (hor_reg + ver_reg) / 16;
            pixel_bit <= (hor_reg + ver_reg) % 16;
        end

    end  
    
    
    
    always @(posedge clk or posedge reset) begin
        if (reset) begin 
            data <= 0;
        end else begin
    
            if (hor_reg > 150 && hor_reg < 250 && ver_reg > 150 && ver_reg < 250) begin
                data[pixel_bit] <= 0;
            end else begin
                data[pixel_bit] <= 1;
            end
/*

        if (ver_reg <= 250) begin
            data <= 16'h00_00;
        end else begin
            data <= 16'hFF_FF;
        end
*/
        end
    end
    
    
    assign load = wren;
    assign address = buffer_addr;
    assign out = data;
    
endmodule

