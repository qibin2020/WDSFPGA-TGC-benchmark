`timescale 1 ns / 1 ps

module tgcnn_stage7 (
    input [56:0] model_inp,
    output [18:0] model_out
);

    // verilator lint_off UNUSEDSIGNAL
    // Explicit quantization operation will drop bits if exists

    wire [8:0] v0; assign v0[8:0] = model_inp[8:0]; // 84.0
    wire [14:0] v1; assign v1[14:0] = model_inp[23:9]; // 84.0
    wire [14:0] v2; shift_adder #(9, 15, 0, 1, 15, -3, 1) op_2 (v0[8:0], v1[14:0], v2[14:0]); // 85.0
    wire [14:0] v3; assign v3[14:0] = model_inp[38:24]; // 84.0
    wire [17:0] v4; assign v4[17:0] = model_inp[56:39]; // 84.0
    wire [17:0] v5; shift_adder #(15, 18, 0, 1, 18, -1, 0) op_5 (v3[14:0], v4[17:0], v5[17:0]); // 86.0
    wire [18:0] v6; shift_adder #(18, 15, 1, 1, 19, 3, 0) op_6 (v5[17:0], v2[14:0], v6[18:0]); // 88.0
    wire [18:0] v7; shift_adder #(19, 15, 1, 1, 19, 1, 1) op_7 (v6[18:0], v2[14:0], v7[18:0]); // 91.0
    wire [18:0] v8; shift_adder #(19, 18, 1, 0, 19, 0, 0) op_8 (v7[18:0], 'b111010000000000000, v8[18:0]); // 91.0

    // verilator lint_on UNUSEDSIGNAL

    assign model_out[18:0] = v8[18:0];

    endmodule
