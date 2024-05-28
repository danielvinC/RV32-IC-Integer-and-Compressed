module testbench();
    logic clk;
    logic reset;
    logic [31:0] WriteData, DataAdr;
    logic MemWrite, PCstall;
	 logic [31:0] PCF, InstrF, ReadDataM
	 ,dec
	 ;
// instantiate device to be tested
    rv_top dut(clk, reset, WriteData, DataAdr, MemWrite,PCstall, PCF, InstrF, ReadDataM
	 ,dec
	 );
// initialize test
    initial
        begin
            reset <= 1; # 22; reset <= 0;
        end
    // generate clock to sequence tests
    always
        begin
            clk <= 1; # 5; clk <= 0; # 5;
        end
//   check results
    always @(negedge clk)
    begin
        if(MemWrite) begin
        if(DataAdr === 96 & WriteData === 3) begin
            $display("Simulation succeeded");
				#5
            $stop;
        end else if (DataAdr !== 96) begin
            $display("Simulation failed");
				#5
            $stop;
        end
        end
    end
endmodule
