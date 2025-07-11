class ram_env extends uvm_env;
  ram_agent agent;

  `uvm_component_utils(ram_env)

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    agent = ram_agent::type_id::create("agent", this);
  endfunction
endclass
