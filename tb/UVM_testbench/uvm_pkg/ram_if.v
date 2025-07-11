interface ram_if #(parameter DATA_WIDTH = 8, ADDR_WIDTH = 4)(input logic clk);

  logic rst;
  // Port A
  logic [ADDR_WIDTH-1:0] addr_a;
  logic [DATA_WIDTH-1:0]  din_a;
  logic we_a;
  logic [DATA_WIDTH-1:0] dout_a;

  // Port B
  logic [ADDR_WIDTH-1:0] addr_b;
  logic [DATA_WIDTH-1:0]  din_b;
  logic we_b;
  logic [DATA_WIDTH-1:0] dout_b;

endinterface
