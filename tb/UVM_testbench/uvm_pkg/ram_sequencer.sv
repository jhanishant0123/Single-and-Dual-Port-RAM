class ram_sequencer extends uvm_sequencer #(ram_txn);
  `uvm_component_utils(ram_sequencer)
  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction
endclass
