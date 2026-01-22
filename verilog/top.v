/*
 * WDSFPGA Benchmark TGCNN
 *
 */

module top(
    input clk,
    input reset,
    input [699:0] iport,
    output [17:0] oport
);

tgcnn inst (
    .clk(clk),
    .reset(reset),
    .model_inp(iport),
    .model_out(oport)
);

endmodule