class ram_monitor extends uvm_monitor;
  virtual ram_if vif;

  `uvm_component_utils(ram_monitor)

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  task run_phase(uvm_phase phase);
    forever begin
      @(posedge vif.clk);
      `uvm_info("MON", $sformatf("Read at addr_a=%0d → data=%0h", vif.addr_a, vif.dout_a), UVM_MEDIUM)
    end
  endtask
endclass
