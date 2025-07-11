class ram_driver extends uvm_driver #(ram_txn);
  virtual ram_if vif;

  `uvm_component_utils(ram_driver)

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  task run_phase(uvm_phase phase);
    ram_txn txn;
    forever begin
      seq_item_port.get_next_item(txn);
      vif.we_a   <= txn.we;
      vif.addr_a <= txn.addr;
      vif.din_a  <= txn.data;
      @(posedge vif.clk);
      seq_item_port.item_done();
    end
  endtask
endclass
