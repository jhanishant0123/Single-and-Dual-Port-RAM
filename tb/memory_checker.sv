// ---------------------------------------------------------
// memory_checker.sv - Used to verify expected RAM behavior
// Author- NISHANT KUMAR JHA
// Date- 10-07-2025
// ---------------------------------------------------------
module memory_checker #(parameter DATA_WIDTH = 8, ADDR_WIDTH = 4)(
    input  logic                  clk,
    input  logic                  we,
    input  logic [ADDR_WIDTH-1:0] addr,
    input  logic [DATA_WIDTH-1:0] din,
    input  logic [DATA_WIDTH-1:0] dout
);

    logic [DATA_WIDTH-1:0] model_mem [0:(1 << ADDR_WIDTH) - 1];

    always_ff @(posedge clk) begin
        if (we)
            model_mem[addr] <= din;

        // Check if DUT output matches model
        if (!we && dout !== model_mem[addr]) begin
            $error("Data mismatch at address %0d: Expected %h, Got %h", addr, model_mem[addr], dout);
        end
    end
endmodule
