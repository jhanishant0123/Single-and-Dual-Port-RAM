class ram_txn extends uvm_sequence_item;
  rand bit [3:0] addr;
  rand bit [7:0] data;
  rand bit       we;

  `uvm_object_utils(ram_txn)

  function new(string name = "ram_txn");
    super.new(name);
  endfunction
endclass
