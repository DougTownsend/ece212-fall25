
module mem(
    input r_en,
    input w_en,
    input [3:0] r_addr,
    input [3:0] w_addr,
    input clk,
    input [3:0] w_data,
    output reg [3:0] r_data
);

    reg [3:0] memory [0:15];

    always @(posedge clk) begin
        if(r_en)
            r_data <= memory[r_addr];
        if(w_en)
            memory[w_addr] <= w_data;

    end

endmodule