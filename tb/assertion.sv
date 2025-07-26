

// ---------------------------------------------------------
// assertions.sv - Eg. runtime protocol checks
// Author- NISHANT KUMAR JHA
// DATE- 10-07-2025
// ---------------------------------------------------------
module ram_assertions #(parameter ADDR_WIDTH = 4)(
    input logic clk,
    input logic we_a,
    input logic we_b,
    input logic [ADDR_WIDTH-1:0] addr_a,
    input logic [ADDR_WIDTH-1:0] addr_b
);

    // Avoid same address write on both ports
    always @(posedge clk) begin
        if (we_a && we_b && addr_a == addr_b) begin
            $warning("Simultaneous write to same address on both ports!");
        end
    end
endmodule
