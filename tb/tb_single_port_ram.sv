`timescale 1ns/1ps
`include "memory_checker.sv"

module tb_single_port_ram;
    parameter DATA_WIDTH = 8;
    parameter ADDR_WIDTH = 4;

    logic clk = 0;
    logic rst;
    logic [ADDR_WIDTH-1:0] addr;
    logic [DATA_WIDTH-1:0] din;
    logic we;
    logic [DATA_WIDTH-1:0] dout;

    single_port_ram #(.DATA_WIDTH(DATA_WIDTH), .ADDR_WIDTH(ADDR_WIDTH)) dut (
        .clk(clk), .rst(rst), .addr(addr), .din(din), .we(we), .dout(dout)
    );

    memory_checker #(.DATA_WIDTH(DATA_WIDTH), .ADDR_WIDTH(ADDR_WIDTH)) checker (
        .clk(clk), .we(we), .addr(addr), .din(din), .dout(dout)
    );

    always #5 clk = ~clk;

    initial begin
        $display("Starting Single Port RAM Test");
        rst = 1; addr = 0; din = 0; we = 0;
        #10 rst = 0;

        // Directed writes
        we = 1; addr = 4'd3; din = 8'hA5; #10;
        addr = 4'd4; din = 8'h5C; #10;
        we = 0;

        // Directed reads
        addr = 4'd3; #10;
        addr = 4'd4; #10;

        $finish;
    end
endmodule
