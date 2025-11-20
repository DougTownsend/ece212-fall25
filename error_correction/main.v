
module main(
    input [7:0] sw,
    input [3:0] btn,
    output [6:0] led,
    output red, green, blue
);
    wire [3:0] data;
    //detect_error u2(.cw(sw), .error(red));
    hamming_7_4 u2(.cw(sw[6:0]), .error(red), .data(data));
    seven_seg u1(.bcd(data), .segs(led));

endmodule