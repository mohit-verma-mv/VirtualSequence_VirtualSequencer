class test extends uvm_test;
  
  `uvm_component_utils(test)
  
  environment env;
  
  virtual_sequence v_seqs;
  
  function new(string name = "test", uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env = environment::type_id::create("env",this);
  endfunction
  
  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    v_seqs = virtual_sequence::type_id::create("v_seqs");
    v_seqs.start(env.v_seqr);
    phase.drop_objection(this);
  endtask
  
endclass