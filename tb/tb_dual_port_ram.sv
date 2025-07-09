`timescale 1ns/1ps
`include "memory_checker.sv"
`include "assertions.sv"

module tb_dual_port_ram;
    parameter DATA_WIDTH = 8;
    parameter ADDR_WIDTH = 4;

    logic clk = 0, rst;
    logic [ADDR_WIDTH-1:0] addr_a, addr_b;
    logic [DATA_WIDTH-1:0] din_a, din_b;
    logic we_a, we_b;
    logic [DATA_WIDTH-1:0] dout_a, dout_b;

    dual_port_ram #(.DATA_WIDTH(DATA_WIDTH), .ADDR_WIDTH(ADDR_WIDTH)) dut (
        .clk(clk), .rst(rst),
        .addr_a(addr_a), .din_a(din_a), .we_a(we_a), .dout_a(dout_a),
        .addr_b(addr_b), .din_b(din_b), .we_b(we_b), .dout_b(dout_b)
    );

    ram_assertions #(.ADDR_WIDTH(ADDR_WIDTH)) protocol_check (
        .clk(clk), .we_a(we_a), .we_b(we_b), .addr_a(addr_a), .addr_b(addr_b)
    );

    always #5 clk = ~clk;

    initial begin
        $display("Starting Dual Port RAM Test");
        rst = 1; addr_a = 0; addr_b = 0; we_a = 0; we_b = 0; din_a = 0; din_b = 0;
        #10 rst = 0;

        // Write from both ports
        we_a = 1; addr_a = 4'h2; din_a = 8'h1A;
        we_b = 1; addr_b = 4'h3; din_b = 8'h2B; #10;

        // Read from both ports
        we_a = 0; addr_a = 4'h2;
        we_b = 0; addr_b = 4'h3; #10;

        // Conflict case
        we_a = 1; we_b = 1; addr_a = 4'h5; addr_b = 4'h5; din_a = 8'hAA; din_b = 8'hBB; #10;

        $finish;
    end
endmodule
