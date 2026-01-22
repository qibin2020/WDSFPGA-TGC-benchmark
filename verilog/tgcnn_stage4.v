`timescale 1 ns / 1 ps

module tgcnn_stage4 (
    input [80:0] model_inp,
    output [17:0] model_out
);

    // verilator lint_off UNUSEDSIGNAL
    // Explicit quantization operation will drop bits if exists

    wire [10:0] v0; assign v0[10:0] = model_inp[10:0]; // 48.0
    wire [10:0] v1; assign v1[10:0] = model_inp[21:11]; // 48.0
    wire [11:0] v2; shift_adder #(11, 11, 1, 1, 12, 1, 0) op_2 (v0[10:0], v1[10:0], v2[11:0]); // 50.0
    wire [11:0] v3; shift_adder #(12, 1, 1, 0, 12, 0, 0) op_3 (v2[11:0], 1'b1, v3[11:0]); // 50.0
    wire [10:0] v4; assign v4[10:0] = v3[11:1]; // 50.0
    wire [10:0] v5; assign v5[10:0] = model_inp[32:22]; // 48.0
    wire [9:0] v6; assign v6[9:0] = model_inp[42:33]; // 48.0
    wire [10:0] v7; shift_adder #(11, 10, 1, 1, 11, 0, 1) op_7 (v5[10:0], v6[9:0], v7[10:0]); // 50.0
    wire [9:0] v8; assign v8[9:0] = model_inp[52:43]; // 48.0
    wire [10:0] v9; shift_adder #(10, 10, 1, 1, 11, 0, 0) op_9 (v6[9:0], v8[9:0], v9[10:0]); // 50.0
    wire [9:0] v10; assign v10[9:0] = model_inp[62:53]; // 48.0
    wire [11:0] v11; shift_adder #(10, 11, 1, 1, 12, 0, 1) op_11 (v10[9:0], v4[10:0], v11[11:0]); // 52.0
    wire [9:0] v12; assign v12[9:0] = model_inp[72:63]; // 48.0
    wire [11:0] v13; shift_adder #(10, 11, 1, 1, 12, 0, 0) op_13 (v12[9:0], v9[10:0], v13[11:0]); // 52.0
    wire [7:0] v14; assign v14[7:0] = model_inp[80:73]; // 48.0
    wire [11:0] v15; shift_adder #(8, 12, 1, 1, 12, 0, 1) op_15 (v14[7:0], v11[11:0], v15[11:0]); // 54.0
    wire [13:0] v16; shift_adder #(11, 12, 1, 1, 14, -2, 0) op_16 (v7[10:0], v13[11:0], v16[13:0]); // 54.0
    wire [15:0] v17; shift_adder #(14, 12, 1, 1, 16, 4, 1) op_17 (v16[13:0], v13[11:0], v17[15:0]); // 56.0
    wire [15:0] v18; shift_adder #(12, 16, 1, 1, 16, -1, 0) op_18 (v15[11:0], v17[15:0], v18[15:0]); // 58.0
    wire [16:0] v19; shift_adder #(16, 12, 1, 1, 17, 4, 1) op_19 (v18[15:0], v15[11:0], v19[16:0]); // 60.0
    wire [17:0] v20; shift_adder #(17, 17, 1, 0, 18, 0, 0) op_20 (v19[16:0], 17'b11100000000000000, v20[17:0]); // 60.0

    // verilator lint_on UNUSEDSIGNAL

    assign model_out[17:0] = v20[17:0];

    endmodule
