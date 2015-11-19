
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
    wire text_on;
   

    // instantiate font ROM
    font_rom font_unit
    (.clk(clk), .addr(rom_addr), .data(font_word));
      
    // Location on the screen of this tile.
    reg [10:0] tile_v_start = 11'd10;
    reg [10:0] tile_h_start = 11'd280;
    wire [10:0] tile_v_end;
    wire [10:0] tile_h_end;
    assign tile_v_end = tile_v_start + (8'd15 << 2);
    assign tile_h_end = tile_h_start + (8'd7 << 2);
    // Check we are within the part of the screen that holds the character tile.
    assign text_on = (PIXEL_H >= tile_h_start && PIXEL_H <= tile_h_end && PIXEL_V >= tile_v_start && PIXEL_V <= tile_v_end);
 

    // Mux for font ROM addresses and rgb
    always @* begin
        PIXEL = 3'b000;
        if (text_on) begin
        // @todo Scores larger than 9!!!
            char_addr = 7'h30 + PLAYER_TWO;
            row_addr = (PIXEL_V - tile_v_start) >> 2;
            bit_addr = (PIXEL_H - tile_h_start) >> 2;
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
