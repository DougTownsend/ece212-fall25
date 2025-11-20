
module lab1(
    input [2:0] dio,
    output [2:0] f
);
    wire [2:0] a;
    wire [2:0] a_n;

    //Ports are declared in pin order, skipping power and ground.
    sn7404_NOT u1(
        .p01_1_a(dio[0]), 
        .p02_1_y(a_n[0]), 
        .p03_2_a(dio[1]),
        .p04_2_y(a_n[1]),
        .p05_3_a(dio[2]),
        .p06_3_y(a_n[2]),
        .p08_4_y(a[2]),
        .p09_4_a(a_n[2]),
        .p10_5_y(a[1]),
        .p11_5_a(a_n[1]),
        .p12_6_y(a[0]),
        .p13_6_a(a_n[0])
    );

    wire u2_1_out, u2_2_out, u2_3_out;

    sn7410_NAND u2(
        .p01_1_a(a_n[2]),
        .p02_1_b(a[1]),
        .p13_1_c(a[0]),
        .p12_1_y(u2_1_out),

        .p03_2_a(a[2]),
        .p04_2_b(a_n[1]),
        .p05_2_c(a[0]),
        .p06_2_y(u2_2_out),

        .p11_3_c(a[2]),
        .p10_3_b(a[1]),
        .p09_3_a(a_n[0]),
        .p08_3_y(u2_3_out)
    );

    sn7410_NAND u3(
        .p01_1_a(u2_1_out),
        .p02_1_b(u2_2_out),
        .p13_1_c(u2_3_out),
        .p12_1_y(f[2])
    );

    wire u4_1_out, u4_2_out, u4_3_out;

    sn7408_AND u4(
        //F1
        .p01_1_a(a_n[1]),
        .p02_1_b(a_n[0]),
        .p03_1_y(u4_1_out),

        //F0
        .p04_2_a(a[2]),
        .p05_2_b(a[1]),
        .p06_2_y(u4_2_out),

        .p09_3_a(a_n[1]),
        .p10_3_b(a_n[2]),
        .p08_3_y(u4_3_out)
    );

    sn7432_OR u5(
        //F1
        .p01_1_a(u4_1_out),
        .p02_1_b(a[2]),
        .p03_1_y(f[1]),

        //F0
        .p04_2_a(u4_3_out),
        .p05_2_b(u4_2_out),
        .p06_2_y(f[0])
    );

endmodule