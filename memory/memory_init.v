/**
 * Fill the memory with initial values.
 */

 module memory_init(
    input clk,
    input reset,
    output [7:0] out
 );
 

    reg [12:0] address;
    reg m1_we, m2_we, m3_we;
    wire [15:0] q1, q2, q3;
    reg [15:0] d;
    reg [7:0] out_buf;
    
    always @(posedge clk or posedge reset) begin
        if (reset) begin 
            address <= 0;
            d <= 16'b1111_1111_1111_1111;
        end else begin
            address <= address + 13'd1;
            d <= 16'b1111_1111_1111_1111;
            
        end
    end
    
    
    // Mux for which memory to use.
    always @* begin
        m1_we = 0; // 32
        m2_we = 0; // 16
        m3_we = 0; // 8
        out_buf = 0;
    
        if (address < 13'd2048) begin
            m1_we = 1;
            out_buf = q1[7:0];
        end else if (address < (13'd2048 + 13'd1024)) begin
            m2_we = 1;
            out_buf = q2[7:0];
        end else if (address < (13'd2048 + 13'd1024 + 13'd512)) begin
            m3_we = 1;
            out_buf <= q3[7:0];
        end
    end
    
    
    
    ram_32 mem32 (.q(q1), .d(d), .write_address(address), .read_address(address - 1), .we(m1_we), .clk(clk));
    ram_16 mem16 (.q(q2), .d(d), .write_address(address), .read_address(address - 1), .we(m2_we), .clk(clk));
    ram_8  mem8  (.q(q3), .d(d), .write_address(address), .read_address(address - 1), .we(m3_we), .clk(clk));
    
    assign out = out_buf;

endmodule
