module rv_top( 	input logic clk, reset,
	        output logic [31:0] WriteDataM, DataAdrM,
	        output logic MemWriteM,PCstall,
		output logic [31:0] PCF, InstrF, ReadDataM, dec);
    // instantiate processor and memories
    riscv riscv(clk, reset, PCF, InstrF, MemWriteM, PCstall, DataAdrM, WriteDataM, ReadDataM, dec);
    imem imem(PCF, InstrF);
    dmem dmem(clk, MemWriteM, DataAdrM, WriteDataM, ReadDataM);
endmodule
