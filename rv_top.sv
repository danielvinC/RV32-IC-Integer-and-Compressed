module rv_top( input logic clk, reset,
            output logic [31:0] WriteDataM, DataAdrM,
            output logic MemWriteM,PCstall,

    output logic [31:0] PCF, InstrF, ReadDataM
	 ,output logic [31:0] dec
     ,output logic mispredict, sourceF, PCSrcE
     ,output logic [31:0] PCTargetE
     ,output logic [17:0] t
     ,output logic ins_vld
	 );

    // instantiate processor and memories
    riscv riscv(clk, reset, PCF, InstrF, MemWriteM
	 , PCstall
	 , DataAdrM, WriteDataM, ReadDataM
	 , dec
     , mispredict
     , sourceF
     , PCSrcE
     , PCTargetE
     , t
     , ins_vld
	 );
    imem imem(PCF, InstrF);
    dmem dmem(clk, MemWriteM, DataAdrM, WriteDataM, ReadDataM);
endmodule
