// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Version: 2022.2
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module sobel_sobel_Pipeline_VITIS_LOOP_84_1 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        src_TVALID,
        cols,
        LineBuffer_1_address0,
        LineBuffer_1_ce0,
        LineBuffer_1_we0,
        LineBuffer_1_d0,
        LineBuffer_address0,
        LineBuffer_ce0,
        LineBuffer_we0,
        LineBuffer_d0,
        src_TDATA,
        src_TREADY,
        src_TKEEP,
        src_TSTRB,
        src_TLAST,
        data_p_keep_V_1_out,
        data_p_keep_V_1_out_ap_vld,
        data_p_strb_V_1_out,
        data_p_strb_V_1_out_ap_vld
);

parameter    ap_ST_fsm_state1 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input   src_TVALID;
input  [31:0] cols;
output  [10:0] LineBuffer_1_address0;
output   LineBuffer_1_ce0;
output   LineBuffer_1_we0;
output  [7:0] LineBuffer_1_d0;
output  [10:0] LineBuffer_address0;
output   LineBuffer_ce0;
output   LineBuffer_we0;
output  [7:0] LineBuffer_d0;
input  [7:0] src_TDATA;
output   src_TREADY;
input  [0:0] src_TKEEP;
input  [0:0] src_TSTRB;
input  [0:0] src_TLAST;
output  [0:0] data_p_keep_V_1_out;
output   data_p_keep_V_1_out_ap_vld;
output  [0:0] data_p_strb_V_1_out;
output   data_p_strb_V_1_out_ap_vld;

reg ap_idle;
reg LineBuffer_1_ce0;
reg LineBuffer_1_we0;
reg LineBuffer_ce0;
reg LineBuffer_we0;
reg src_TREADY;
reg data_p_keep_V_1_out_ap_vld;
reg data_p_strb_V_1_out_ap_vld;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire   [0:0] icmp_ln1027_fu_149_p2;
reg    ap_block_state1_pp0_stage0_iter0;
reg    ap_condition_exit_pp0_iter0_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
reg    src_TDATA_blk_n;
wire   [63:0] zext_ln541_fu_161_p1;
reg   [0:0] data_p_strb_V_fu_66;
reg   [0:0] data_p_keep_V_fu_70;
reg   [12:0] col_V_fu_74;
wire   [12:0] col_V_2_fu_155_p2;
wire    ap_loop_init;
reg   [12:0] ap_sig_allocacmp_col_V_1;
wire   [31:0] zext_ln1027_fu_145_p1;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg   [0:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
wire    ap_start_int;
reg    ap_condition_147;
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
        end else if ((~((ap_start_int == 1'b0) | ((icmp_ln1027_fu_149_p2 == 1'd1) & (src_TVALID == 1'b0))) & (ap_loop_exit_ready == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_condition_147)) begin
        if ((icmp_ln1027_fu_149_p2 == 1'd1)) begin
            col_V_fu_74 <= col_V_2_fu_155_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            col_V_fu_74 <= 13'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((~((ap_start_int == 1'b0) | ((icmp_ln1027_fu_149_p2 == 1'd1) & (src_TVALID == 1'b0))) & (icmp_ln1027_fu_149_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        data_p_keep_V_fu_70 <= src_TKEEP;
        data_p_strb_V_fu_66 <= src_TSTRB;
    end
end

always @ (*) begin
    if ((~((ap_start_int == 1'b0) | ((icmp_ln1027_fu_149_p2 == 1'd1) & (src_TVALID == 1'b0))) & (1'b1 == ap_CS_fsm_state1))) begin
        LineBuffer_1_ce0 = 1'b1;
    end else begin
        LineBuffer_1_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start_int == 1'b0) | ((icmp_ln1027_fu_149_p2 == 1'd1) & (src_TVALID == 1'b0))) & (icmp_ln1027_fu_149_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        LineBuffer_1_we0 = 1'b1;
    end else begin
        LineBuffer_1_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start_int == 1'b0) | ((icmp_ln1027_fu_149_p2 == 1'd1) & (src_TVALID == 1'b0))) & (1'b1 == ap_CS_fsm_state1))) begin
        LineBuffer_ce0 = 1'b1;
    end else begin
        LineBuffer_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start_int == 1'b0) | ((icmp_ln1027_fu_149_p2 == 1'd1) & (src_TVALID == 1'b0))) & (icmp_ln1027_fu_149_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        LineBuffer_we0 = 1'b1;
    end else begin
        LineBuffer_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b0) | ((icmp_ln1027_fu_149_p2 == 1'd1) & (src_TVALID == 1'b0)))) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start_int == 1'b0) | ((icmp_ln1027_fu_149_p2 == 1'd1) & (src_TVALID == 1'b0))) & (icmp_ln1027_fu_149_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start_int == 1'b0) | ((icmp_ln1027_fu_149_p2 == 1'd1) & (src_TVALID == 1'b0))) & (ap_loop_exit_ready == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
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
    if ((~((ap_start_int == 1'b0) | ((icmp_ln1027_fu_149_p2 == 1'd1) & (src_TVALID == 1'b0))) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_sig_allocacmp_col_V_1 = 13'd0;
    end else begin
        ap_sig_allocacmp_col_V_1 = col_V_fu_74;
    end
end

always @ (*) begin
    if ((~((ap_start_int == 1'b0) | ((icmp_ln1027_fu_149_p2 == 1'd1) & (src_TVALID == 1'b0))) & (icmp_ln1027_fu_149_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
        data_p_keep_V_1_out_ap_vld = 1'b1;
    end else begin
        data_p_keep_V_1_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start_int == 1'b0) | ((icmp_ln1027_fu_149_p2 == 1'd1) & (src_TVALID == 1'b0))) & (icmp_ln1027_fu_149_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
        data_p_strb_V_1_out_ap_vld = 1'b1;
    end else begin
        data_p_strb_V_1_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln1027_fu_149_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1) & (ap_start_int == 1'b1))) begin
        src_TDATA_blk_n = src_TVALID;
    end else begin
        src_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((ap_start_int == 1'b0) | ((icmp_ln1027_fu_149_p2 == 1'd1) & (src_TVALID == 1'b0))) & (icmp_ln1027_fu_149_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        src_TREADY = 1'b1;
    end else begin
        src_TREADY = 1'b0;
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

assign LineBuffer_1_address0 = zext_ln541_fu_161_p1;

assign LineBuffer_1_d0 = src_TDATA;

assign LineBuffer_address0 = zext_ln541_fu_161_p1;

assign LineBuffer_d0 = 8'd0;

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

always @ (*) begin
    ap_block_state1_pp0_stage0_iter0 = ((ap_start_int == 1'b0) | ((icmp_ln1027_fu_149_p2 == 1'd1) & (src_TVALID == 1'b0)));
end

always @ (*) begin
    ap_condition_147 = (~((ap_start_int == 1'b0) | ((icmp_ln1027_fu_149_p2 == 1'd1) & (src_TVALID == 1'b0))) & (1'b1 == ap_CS_fsm_state1));
end

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;

assign col_V_2_fu_155_p2 = (ap_sig_allocacmp_col_V_1 + 13'd1);

assign data_p_keep_V_1_out = data_p_keep_V_fu_70;

assign data_p_strb_V_1_out = data_p_strb_V_fu_66;

assign icmp_ln1027_fu_149_p2 = (($signed(zext_ln1027_fu_145_p1) < $signed(cols)) ? 1'b1 : 1'b0);

assign zext_ln1027_fu_145_p1 = ap_sig_allocacmp_col_V_1;

assign zext_ln541_fu_161_p1 = ap_sig_allocacmp_col_V_1;

endmodule //sobel_sobel_Pipeline_VITIS_LOOP_84_1
