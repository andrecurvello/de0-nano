/*
 * Read rotary/quadrature encoder using the clock
 *
 */
 
module quadrature_decoder(
    CLOCK, 
    RESET,
    A, 
    B, 
    COUNT
);
    input CLOCK, RESET, A, B;
    output [7:0] COUNT;

    reg [2:0] A_delayed;
    reg [2:0] B_delayed;
    
    always @(posedge CLOCK or posedge RESET) begin 
        if (RESET) begin 
            A_delayed <= 0;
        end else begin
            A_delayed <= {A_delayed[1:0], A};
        end
    end
    
    always @(posedge CLOCK or posedge RESET) begin 
        if (RESET) begin 
            B_delayed <= 0;
        end else begin
            B_delayed <= {B_delayed[1:0], B};
        end
    end

    wire count_enable = A_delayed[1] ^ A_delayed[2] ^ B_delayed[1] ^ B_delayed[2];
    wire count_direction = A_delayed[1] ^ B_delayed[2];

    reg [31:0] total;
    always @(posedge CLOCK or posedge RESET) begin
        if (RESET) begin 
            total <= 0;
        end 
        else if (count_enable) begin
            // only want a final count between 0 & 27 (x4 for the clicks)
            if (count_direction && total < 109) begin 
                total <= total+1; 
            end
            else if (total > 0) begin 
                total <= total-1;
            end
        end
    end
    
    
    wire [31:0] clicks;
    assign clicks = total >> 2; // divide by 4 as the encoder has 4 edges per "click"
    assign COUNT = clicks[7:0];

endmodule
