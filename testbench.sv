module testbench();
    logic clk;
    logic reset;
    logic [31:0] WriteData, DataAdr;
    logic MemWrite, PCstall;
	 logic [31:0] PCF, InstrF, ReadDataM
	 ,dec
	 ; logic mispredict, PCSrcE, sourceF
     ; logic [31:0] PCTargetE
	 ; logic [17:0] t
     ; logic ins_vld
     ;
// instantiate device to be tested
    rv_top dut(clk, reset, WriteData, DataAdr, MemWrite,PCstall, PCF, InstrF, ReadDataM
	 ,dec
     ,mispredict, sourceF, PCSrcE
     , PCTargetE
     , t
     , ins_vld
	 );
// initialize test
    initial
        begin
            reset <= 0; # 22; reset <= 1;
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
                #10
                $stop;
            end 
        end
    end
endmodule
