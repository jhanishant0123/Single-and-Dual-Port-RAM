class ram_agent extends uvm_agent;
  ram_driver     drv;
  ram_monitor    mon;
  ram_sequencer  seqr;

  virtual ram_if vif;

  `uvm_component_utils(ram_agent)

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    drv  = ram_driver::type_id::create("drv", this);
    mon  = ram_monitor::type_id::create("mon", this);
    seqr = ram_sequencer::type_id::create("seqr", this);
    drv.vif = vif;
    mon.vif = vif;
  endfunction
endclass
