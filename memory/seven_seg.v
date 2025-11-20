
//Segment A is segs[0], G is segs[6]
module seven_seg(
    input [3:0] bcd,
    output reg [6:0] segs
);
    always @ (*) begin
        /*
        if(bcd == 4'h0) begin
            segs = ~7'b0111111;
        end else if(bcd == 4'h1)
            segs = ~7'b0000110;
        else segs = ~7'b0;
        */
        case(bcd)
            4'h0: segs = ~7'b0111111;
            4'h1: segs = ~7'b0000110;
            4'h2: segs = ~7'b1011011;
            4'h3: segs = ~7'b1001111;
            4'h4: segs = ~7'b1100110;
            4'h5: segs = ~7'b1101101;
            4'h6: segs = ~7'b1111101;
            4'h7: segs = ~7'b0000111;
            4'h8: segs = ~7'b1111111;
            4'h9: segs = ~7'b1101111;
            4'ha: segs = ~7'b1110111;
            4'hb: segs = ~7'b1111100;
            4'hc: segs = ~7'b0111001;
            4'hd: segs = ~7'b1011110;
            4'he: segs = ~7'b1111001;
            4'hf: segs = ~7'b1110001;
            default: segs = ~7'b0;
        endcase
       
    end
endmodule