
module detect_error(
    input [7:0] cw,
    output error
);

    assign error = ^cw;

endmodule