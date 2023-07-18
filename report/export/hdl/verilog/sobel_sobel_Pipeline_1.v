// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Version: 2022.2
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module sobel_sobel_Pipeline_1 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        WindowBuffer_5_out,
        WindowBuffer_5_out_ap_vld,
        WindowBuffer_4_out,
        WindowBuffer_4_out_ap_vld,
        WindowBuffer_3_out,
        WindowBuffer_3_out_ap_vld,
        WindowBuffer_2_out,
        WindowBuffer_2_out_ap_vld,
        WindowBuffer_1_out,
        WindowBuffer_1_out_ap_vld,
        WindowBuffer_out,
        WindowBuffer_out_ap_vld
);

parameter    ap_ST_fsm_state1 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output  [7:0] WindowBuffer_5_out;
output   WindowBuffer_5_out_ap_vld;
output  [7:0] WindowBuffer_4_out;
output   WindowBuffer_4_out_ap_vld;
output  [7:0] WindowBuffer_3_out;
output   WindowBuffer_3_out_ap_vld;
output  [7:0] WindowBuffer_2_out;
output   WindowBuffer_2_out_ap_vld;
output  [7:0] WindowBuffer_1_out;
output   WindowBuffer_1_out_ap_vld;
output  [7:0] WindowBuffer_out;
output   WindowBuffer_out_ap_vld;

reg ap_idle;
reg WindowBuffer_5_out_ap_vld;
reg WindowBuffer_4_out_ap_vld;
reg WindowBuffer_3_out_ap_vld;
reg WindowBuffer_2_out_ap_vld;
reg WindowBuffer_1_out_ap_vld;
reg WindowBuffer_out_ap_vld;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    ap_block_state1_pp0_stage0_iter0;
wire   [0:0] exitcond12_fu_119_p2;
reg    ap_condition_exit_pp0_iter0_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
wire    ap_loop_init;
wire   [1:0] p_cast_fu_140_p4;
wire   [1:0] empty_21_fu_150_p1;
reg   [3:0] phi_urem_fu_50;
wire   [3:0] select_ln77_fu_202_p3;
reg   [3:0] ap_sig_allocacmp_phi_urem_load;
reg   [7:0] phi_mul_fu_54;
wire   [7:0] next_mul_fu_134_p2;
reg   [7:0] ap_sig_allocacmp_phi_mul_load;
reg   [3:0] empty_fu_58;
wire   [3:0] empty_20_fu_125_p2;
reg   [3:0] ap_sig_allocacmp_p_load;
wire   [3:0] add_ln77_fu_190_p2;
wire   [0:0] icmp_ln77_fu_196_p2;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg   [0:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
wire    ap_start_int;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_done_reg = 1'b0;
end

sobel_flow_control_loop_pipe_sequential_init flow_control_loop_pipe_sequential_init_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(ap_start),
    .ap_ready(ap_ready),
    .ap_done(ap_done),
    .ap_start_int(ap_start_int),
    .ap_loop_init(ap_loop_init),
    .ap_ready_int(ap_ready_int),
    .ap_loop_exit_ready(ap_condition_exit_pp0_iter0_stage0),
    .ap_loop_exit_done(ap_done_int),
    .ap_continue_int(ap_continue_int),
    .ap_done_int(ap_done_int)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue_int == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if (((ap_loop_exit_ready == 1'b1) & (1'b1 == ap_CS_fsm_state1) & (ap_start_int == 1'b1))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start_int == 1'b1))) begin
        if ((exitcond12_fu_119_p2 == 1'd0)) begin
            empty_fu_58 <= empty_20_fu_125_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            empty_fu_58 <= 4'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start_int == 1'b1))) begin
        if ((exitcond12_fu_119_p2 == 1'd0)) begin
            phi_mul_fu_54 <= next_mul_fu_134_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            phi_mul_fu_54 <= 8'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start_int == 1'b1))) begin
        if ((exitcond12_fu_119_p2 == 1'd0)) begin
            phi_urem_fu_50 <= select_ln77_fu_202_p3;
        end else if ((ap_loop_init == 1'b1)) begin
            phi_urem_fu_50 <= 4'd0;
        end
    end
end

always @ (*) begin
    if ((((empty_21_fu_150_p1 == 2'd1) & (p_cast_fu_140_p4 == 2'd0) & (exitcond12_fu_119_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1) & (ap_start_int == 1'b1)) | ((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_state1) & (ap_start_int == 1'b1)))) begin
        WindowBuffer_1_out_ap_vld = 1'b1;
    end else begin
        WindowBuffer_1_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if ((((empty_21_fu_150_p1 == 2'd0) & (p_cast_fu_140_p4 == 2'd1) & (exitcond12_fu_119_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1) & (ap_start_int == 1'b1)) | ((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_state1) & (ap_start_int == 1'b1)))) begin
        WindowBuffer_2_out_ap_vld = 1'b1;
    end else begin
        WindowBuffer_2_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if ((((empty_21_fu_150_p1 == 2'd1) & (p_cast_fu_140_p4 == 2'd1) & (exitcond12_fu_119_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1) & (ap_start_int == 1'b1)) | ((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_state1) & (ap_start_int == 1'b1)))) begin
        WindowBuffer_3_out_ap_vld = 1'b1;
    end else begin
        WindowBuffer_3_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((~(p_cast_fu_140_p4 == 2'd1) & ~(p_cast_fu_140_p4 == 2'd0) & (empty_21_fu_150_p1 == 2'd0) & (exitcond12_fu_119_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1) & (ap_start_int == 1'b1)) | ((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_state1) & (ap_start_int == 1'b1)))) begin
        WindowBuffer_4_out_ap_vld = 1'b1;
    end else begin
        WindowBuffer_4_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((~(p_cast_fu_140_p4 == 2'd1) & ~(p_cast_fu_140_p4 == 2'd0) & (empty_21_fu_150_p1 == 2'd1) & (exitcond12_fu_119_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1) & (ap_start_int == 1'b1)) | ((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_state1) & (ap_start_int == 1'b1)))) begin
        WindowBuffer_5_out_ap_vld = 1'b1;
    end else begin
        WindowBuffer_5_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if ((((empty_21_fu_150_p1 == 2'd0) & (p_cast_fu_140_p4 == 2'd0) & (exitcond12_fu_119_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1) & (ap_start_int == 1'b1)) | ((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_state1) & (ap_start_int == 1'b1)))) begin
        WindowBuffer_out_ap_vld = 1'b1;
    end else begin
        WindowBuffer_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if ((ap_start_int == 1'b0)) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

always @ (*) begin
    if (((exitcond12_fu_119_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1) & (ap_start_int == 1'b1))) begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_exit_ready == 1'b1) & (1'b1 == ap_CS_fsm_state1) & (ap_start_int == 1'b1))) begin
        ap_done_int = 1'b1;
    end else begin
        ap_done_int = ap_done_reg;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start_int == 1'b0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start_int == 1'b1))) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_sig_allocacmp_p_load = 4'd0;
    end else begin
        ap_sig_allocacmp_p_load = empty_fu_58;
    end
end

always @ (*) begin
    if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_sig_allocacmp_phi_mul_load = 8'd0;
    end else begin
        ap_sig_allocacmp_phi_mul_load = phi_mul_fu_54;
    end
end

always @ (*) begin
    if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_sig_allocacmp_phi_urem_load = 4'd0;
    end else begin
        ap_sig_allocacmp_phi_urem_load = phi_urem_fu_50;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign WindowBuffer_1_out = 8'd0;

assign WindowBuffer_2_out = 8'd0;

assign WindowBuffer_3_out = 8'd0;

assign WindowBuffer_4_out = 8'd0;

assign WindowBuffer_5_out = 8'd0;

assign WindowBuffer_out = 8'd0;

assign add_ln77_fu_190_p2 = (ap_sig_allocacmp_phi_urem_load + 4'd1);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

always @ (*) begin
    ap_block_state1_pp0_stage0_iter0 = (ap_start_int == 1'b0);
end

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;

assign empty_20_fu_125_p2 = (ap_sig_allocacmp_p_load + 4'd1);

assign empty_21_fu_150_p1 = ap_sig_allocacmp_phi_urem_load[1:0];

assign exitcond12_fu_119_p2 = ((ap_sig_allocacmp_p_load == 4'd9) ? 1'b1 : 1'b0);

assign icmp_ln77_fu_196_p2 = ((add_ln77_fu_190_p2 < 4'd3) ? 1'b1 : 1'b0);

assign next_mul_fu_134_p2 = (ap_sig_allocacmp_phi_mul_load + 8'd22);

assign p_cast_fu_140_p4 = {{ap_sig_allocacmp_phi_mul_load[7:6]}};

assign select_ln77_fu_202_p3 = ((icmp_ln77_fu_196_p2[0:0] == 1'b1) ? add_ln77_fu_190_p2 : 4'd0);

endmodule //sobel_sobel_Pipeline_1