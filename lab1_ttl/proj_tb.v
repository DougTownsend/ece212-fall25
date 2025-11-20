`timescale 1ns/100ps

module proj1tb();

    initial begin
        $dumpfile("proj_tb.vcd");
        $dumpvars(0, proj1tb);
    end

    reg [2:0] a;
    wire [2:0] f;

    lab1 uut(.dio(a), .f(f));



    initial begin
        a = 3'd0;
        #5
        a = 3'd1;
        #5
        a = 3'd2;
        #5
        a = 3'd3;
        #5

        $finish;
    end

endmodule