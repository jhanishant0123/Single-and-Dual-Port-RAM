// -------------------------------------------------------------------
// File: single_port_ram.v
// Description: Synchronous single-port RAM with parameterized size
// Author: NISHANT KUMAR JHA
// -------------------------------------------------------------------


module single_port_ram #(
    parameter DATA_WIDTH = 8,
    parameter ADDR_WIDTH = 4
)(
    input wire                     clk,
    input wire                     rst,
    input wire [ADDR_WIDTH-1:0]   addr,
    input wire [DATA_WIDTH-1:0]   din,
    input wire                     we,
    output reg [DATA_WIDTH-1:0]   dout
);

    localparam DEPTH = 1 << ADDR_WIDTH;

    // RAM memory declaration
    reg [DATA_WIDTH-1:0] mem [0:DEPTH-1];

    // Sequential logic: write or read
    always @(posedge clk) begin
        if (rst)
            dout <= 0;
        else begin
            if (we)
                mem[addr] <= din;   // Write data
            dout <= mem[addr];      // Read data (registered output)
        end
    end

endmodule
