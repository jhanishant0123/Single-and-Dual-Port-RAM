
// -------------------------------------------------------------------
// File: dual_port_ram.v
// Description: Synchronous dual-port RAM with separate address/data/WE
// Author: NISHANT KUMAR JHA
// Date: 09-07-2025
// -------------------------------------------------------------------
module dual_port_ram #(
    parameter DATA_WIDTH = 8,
    parameter ADDR_WIDTH = 4
)(
    input wire                     clk,
    input wire                     rst,

    // Port A
    input wire [ADDR_WIDTH-1:0]   addr_a,
    input wire [DATA_WIDTH-1:0]   din_a,
    input wire                     we_a,
    output reg [DATA_WIDTH-1:0]   dout_a,

    // Port B
    input wire [ADDR_WIDTH-1:0]   addr_b,
    input wire [DATA_WIDTH-1:0]   din_b,
    input wire                     we_b,
    output reg [DATA_WIDTH-1:0]   dout_b
);

    localparam DEPTH = 1 << ADDR_WIDTH;

    // Shared memory block
    reg [DATA_WIDTH-1:0] mem [0:DEPTH-1];

    always @(posedge clk) begin
        if (rst) begin
            dout_a <= 0;
            dout_b <= 0;
        end else begin
            // Write logic
            if (we_a) mem[addr_a] <= din_a;
            if (we_b) mem[addr_b] <= din_b;

            // Read logic
            dout_a <= mem[addr_a];
            dout_b <= mem[addr_b];
        end
    end

endmodule
