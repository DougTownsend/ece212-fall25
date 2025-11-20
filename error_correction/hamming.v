module hamming_7_4(
    input [7:1] cw,
    output reg [3:0] data,
    output reg error
);

    reg [7:1] corrected;
    reg [2:0] syndrome;

    always @ (*) begin
        syndrome[0] = cw[1] ^ cw[3] ^ cw[5] ^ cw[7];
        syndrome[1] = cw[2] ^ cw[3] ^ cw[6] ^ cw[7];
        syndrome[2] = cw[4] ^ cw[5] ^ cw[6] ^ cw[7];

        if(syndrome != 0) error = 1;
        else error = 0;

        corrected = cw;
        case (syndrome)
            3'd1: corrected[1] = ~cw[1];
            3'd2: corrected[2] = ~cw[2];
            3'd3: corrected[3] = ~cw[3];
            3'd4: corrected[4] = ~cw[4];
            3'd5: corrected[5] = ~cw[5];
            3'd6: corrected[6] = ~cw[6];
            3'd7: corrected[7] = ~cw[7];
        endcase
        data = {corrected[3], corrected[5], corrected[6], corrected[7]};
    end

endmodule