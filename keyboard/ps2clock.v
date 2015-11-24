/**
 * The ps2 protocol is here http://www.computer-engineering.org/ps2protocol/
 *
 * "...you should modify/sample the Data line in the middle of each cell.  
 * I.e.  15 - 25 microseconds after the appropriate clock transition..."
 */
 

module ps2clock (
    input clk,
    input i_clock,
    output o_clock
);


    reg [10:0] delay_timer = 0;
    reg run_delay_timer = 0;
    reg r_clk = 0;

    assign o_clock = r_clk;
    
    always @(i_clock) begin
        if (!i_clock) begin
            run_delay_timer <= 1;
        end else begin
            run_delay_timer <= 0;
        end
    end
    
    always @(posedge clk) begin
        if (run_delay_timer) begin
            delay_timer <= delay_timer + 11'b1;
        end else begin
            delay_timer <= 0;
        end
    end
    
    always @(posedge clk) begin
        // Set the negedge at 20us (20000/20ns = 1000 ticks) after the falling ps2 clock.
        if (delay_timer == 11'd1000) begin
            r_clk <= 0; // set the negedge now
        end else if (delay_timer == 11'd0) begin
            r_clk <= 1;
        end
    end
  

endmodule
