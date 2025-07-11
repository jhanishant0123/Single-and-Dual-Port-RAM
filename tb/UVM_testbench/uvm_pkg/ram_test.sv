class ram_test extends uvm_test;
  `uvm_component_utils(ram_test)
  ram_env env;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    env = ram_env::type_id::create("env", this);
  endfunction

  task run_phase(uvm_phase phase);
    ram_txn tx;
    phase.raise_objection(this);

    repeat (10) begin
      tx = ram_txn::type_id::create("tx");
      assert(tx.randomize());
      env.agent.seqr.start_item(tx);
      env.agent.seqr.finish_item(tx);
      @(posedge env.agent.vif.clk);
    end

    phase.drop_objection(this);
  endtask
endclass
