/*
 * Read rotary/quadrature encoder using the clock
 *
 * http://www.fpga4fun.com/QuadratureDecoder.html
 */
 
module quadrature_clocked(
    clk, 
    reset,
    quadA, 
    quadB, 
    count
);
    input clk, reset, quadA, quadB;
    output [7:0] count;

    reg [2:0] quadA_delayed;
    reg [2:0] quadB_delayed;
    
    always @(posedge clk or posedge reset) begin 
        if (reset) begin 
            quadA_delayed <= 0;
        end else begin
            quadA_delayed <= {quadA_delayed[1:0], quadA};
        end
    end
    
    always @(posedge clk or posedge reset) begin 
        if (reset) begin 
            quadB_delayed <= 0;
        end else begin
            quadB_delayed <= {quadB_delayed[1:0], quadB};
        end
    end

    wire count_enable = quadA_delayed[1] ^ quadA_delayed[2] ^ quadB_delayed[1] ^ quadB_delayed[2];
    wire count_direction = quadA_delayed[1] ^ quadB_delayed[2];

    reg [7:0] count;
    always @(posedge clk or posedge reset) begin
        if (reset) begin 
            count <= 0;
        end else if(count_enable) begin
            if(count_direction) count <= count+1; 
            else count <= count-1;
        end
    end


endmodule
