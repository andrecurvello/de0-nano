
module uart_num2ascii(
	num,
    ascii
);
	
	input[7:0] num;
	output reg[7:0] ascii;
    

	// Translate
	always @(num) begin
		case(num)
            8'd0 : ascii <= 48; 
            8'd1 : ascii <= 49; 
            8'd2 : ascii <= 50; 
            8'd3 : ascii <= 51; 
            8'd4 : ascii <= 52; 
            8'd5 : ascii <= 53; 
            8'd6 : ascii <= 54; 
            8'd7 : ascii <= 55; 
            8'd8 : ascii <= 56; 
            8'd9 : ascii <= 57; 
            default: ascii <= 63; // ?
        endcase
	end
    
  
endmodule
