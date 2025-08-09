
`timescale 1ns/1ps
`include "ram_if.sv"
`include "ram_pkg.sv"
import uvm_pkg::*;
import ram_pkg::*;

module tb_top;
  logic clk = 0;
  always #5 clk = ~clk;

  ram_if ram_if_inst(clk);
  dual_port_ram dut (
    .clk(clk), .rst(ram_if_inst.rst),
    .addr_a(ram_if_inst.addr_a), .din_a(ram_if_inst.din_a), .we_a(ram_if_inst.we_a), .dout_a(ram_if_inst.dout_a),
    .addr_b(ram_if_inst.addr_b), .din_b(ram_if_inst.din_b), .we_b(ram_if_inst.we_b), .dout_b(ram_if_inst.dout_b)
  );

  initial begin
    uvm_config_db#(virtual ram_if)::set(null, "*", "vif", ram_if_inst);
    run_test("ram_test");
  end
endmodule
