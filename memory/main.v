
module main(
    input [7:0] sw,
    input [3:0] btn,
    input clk_12m,
    output [6:0] led,
    output red, green, blue
);
    reg [3:0] data;
    mem u2(.w_en(btn[0]), .r_en(btn[1]), .clk(clk_12m), .w_data(sw[3:0]),
        .r_addr(sw[7:4]), .w_addr(sw[7:4]), .r_data(data));
    seven_seg u1(.bcd(data), .segs(led));
endmodule