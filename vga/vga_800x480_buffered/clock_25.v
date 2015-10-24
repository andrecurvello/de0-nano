
module clock_25 (
    CLOCK_50,
    CLOCK_25
);
    input CLOCK_50;
    output CLOCK_25;
    reg CLOCK_25;

    always @(posedge CLOCK_50) begin
        CLOCK_25 <= ~CLOCK_25;
    end
 
endmodule
