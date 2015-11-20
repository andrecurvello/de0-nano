
module score (
    input wire clk, 
    input wire [10:0] PIXEL_H, PIXEL_V,
    input wire [7:0] PLAYER_ONE, PLAYER_TWO,
    output reg [2:0] PIXEL
);

    // signal declaration
    wire [10:0] rom_addr;
    reg [6:0] char_addr;
    reg [3:0] row_addr;
    reg [2:0] bit_addr;
    wire [7:0] font_word;
    wire font_bit;
    wire p1, p2;
   

    // instantiate font ROM
    font_rom font_unit
    (.clk(clk), .addr(rom_addr), .data(font_word));
      
    // Location on the screen of the player one score.
    reg [10:0] p1_v_start = 11'd10;
    reg [10:0] p1_h_start = 11'd280;
    
    // Location on the screen of the player two score.
    reg [10:0] p2_v_start = 11'd10;
    reg [10:0] p2_h_start = 11'd380;

    // Check we are within the part of the screen that holds the player one score.
    assign p1 = (
        PIXEL_H >= p1_h_start && PIXEL_H <= p1_h_start + (8'd7 << 2) 
        && PIXEL_V >= p1_v_start && PIXEL_V <= p1_v_start + (8'd15 << 2)
    );
    
    // Check we are within the part of the screen that holds the player two score.
    assign p2 = (
        PIXEL_H >= p2_h_start && PIXEL_H <= p2_h_start + (8'd7 << 2) 
        && PIXEL_V >= p2_v_start && PIXEL_V <= p2_v_start + (8'd15 << 2)
    );
 

    // Mux for font ROM addresses and rgb
    always @* begin
        PIXEL = 3'b000;
        if (p1) begin
        // @todo Scores larger than 9!!!
            char_addr = 7'h30 + PLAYER_ONE;
            row_addr = (PIXEL_V - p1_v_start) >> 2;
            bit_addr = (PIXEL_H - p1_h_start) >> 2;
            if (font_bit)
               PIXEL = 3'b111;
        end else if (p2) begin
        // @todo Scores larger than 9!!!
            char_addr = 7'h30 + PLAYER_TWO;
            row_addr = (PIXEL_V - p2_v_start) >> 2;
            bit_addr = (PIXEL_H - p2_h_start) >> 2;
            if (font_bit)
               PIXEL = 3'b111;
        end else begin
            char_addr = 0;
            row_addr = 0;
            bit_addr = 0;
        end
    end

   
    // Build the rom address of the current pixel.
    assign rom_addr = {char_addr, row_addr};

    // Get the on/off value of the bit at the current pixel from the rom.
    assign font_bit = font_word[~bit_addr];

endmodule
