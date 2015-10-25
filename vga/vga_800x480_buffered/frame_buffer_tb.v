


`timescale 10ns/10ns
module frame_buffer_tb();
   
	// Declare inputs as regs and outputs as wires
	reg clk;
    reg [15:0] write_address;
    reg [15:0] data_in;
    reg load;
    reg [10:0] vga_h;
    reg [10:0] vga_v;
    wire pixel_out;


    frame_buffer U0(
        .clk(clk),
        .write_address(write_address),
        .data_in(data_in),
        .load(load),
        .vga_h(vga_h),
        .vga_v(vga_v),
        .pixel_out(pixel_out)
    );


	// Initialize all variables
	initial begin        


        clk = 1;

        #2
        write_address = 16'h00_00;
        data_in = 16'b1101_1110_1110_1101;
        load = 1;
        
        #2
        write_address = 16'h00_01;
        data_in = 16'b0000_0000_0000_0111;
        load = 1;
        
        #4
        load = 0;
        vga_h = 10'd0;
        vga_v = 10'd0;

	#4
        vga_h = 10'd1;
        vga_v = 10'd0;

	#4
        vga_h = 10'd2;
        vga_v = 10'd0;

	#4
        vga_h = 10'd3;
        vga_v = 10'd0;

	#4
        vga_h = 10'd4;
        vga_v = 10'd0;
        
	#4
        vga_h = 10'd5;
        vga_v = 10'd0;

	#4
        vga_h = 10'd6;
        vga_v = 10'd0;

	#4
        vga_h = 10'd7;
        vga_v = 10'd0;

	#4
        vga_h = 10'd8;
        vga_v = 10'd0;

	#4
        vga_h = 10'd9;
        vga_v = 10'd0;

	#4
        vga_h = 10'd10;
        vga_v = 10'd0;

	#4
        vga_h = 10'd11;
        vga_v = 10'd0;

	#4
        vga_h = 10'd12;
        vga_v = 10'd0;

	#4
        vga_h = 10'd13;
        vga_v = 10'd0;

	#4
        vga_h = 10'd14;
        vga_v = 10'd0;

	#4
        vga_h = 10'd15;
        vga_v = 10'd0;

	#4
        vga_h = 10'd16;
        vga_v = 10'd0;

	#4
        vga_h = 10'd17;
        vga_v = 10'd0;

	#4
        vga_h = 10'd18;
        vga_v = 10'd0;

	#4
        vga_h = 10'd19;
        vga_v = 10'd0;




        //#110
        //$stop;      // Terminate simulation

	end

    always begin
        #1 clk = !clk;
    end
	
endmodule
