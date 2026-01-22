`timescale 1 ns / 1 ps

module tgcnn (
    input clk,
    input [699:0] model_inp,
    output reg [18:0] model_out
);

    reg [699:0] stage0_inp;
    reg [3607:0] stage1_inp;
    reg [2559:0] stage2_inp;
    reg [1934:0] stage3_inp;
    reg [664:0] stage4_inp;
    reg [611:0] stage5_inp;
    reg [363:0] stage6_inp;
    reg [56:0] stage7_inp;
    wire [3607:0] stage0_out;
    wire [2559:0] stage1_out;
    wire [1934:0] stage2_out;
    wire [664:0] stage3_out;
    wire [611:0] stage4_out;
    wire [363:0] stage5_out;
    wire [56:0] stage6_out;
    wire [18:0] stage7_out;

    tgcnn_stage0 stage0 (.model_inp(stage0_inp), .model_out(stage0_out));
    tgcnn_stage1 stage1 (.model_inp(stage1_inp), .model_out(stage1_out));
    tgcnn_stage2 stage2 (.model_inp(stage2_inp), .model_out(stage2_out));
    tgcnn_stage3 stage3 (.model_inp(stage3_inp), .model_out(stage3_out));
    tgcnn_stage4 stage4 (.model_inp(stage4_inp), .model_out(stage4_out));
    tgcnn_stage5 stage5 (.model_inp(stage5_inp), .model_out(stage5_out));
    tgcnn_stage6 stage6 (.model_inp(stage6_inp), .model_out(stage6_out));
    tgcnn_stage7 stage7 (.model_inp(stage7_inp), .model_out(stage7_out));

    always @(posedge clk) begin
        stage0_inp <= model_inp;
        stage1_inp <= stage0_out;
        stage2_inp <= stage1_out;
        stage3_inp <= stage2_out;
        stage4_inp <= stage3_out;
        stage5_inp <= stage4_out;
        stage6_inp <= stage5_out;
        stage7_inp <= stage6_out;
        model_out <= stage7_out;
    end

endmodule
