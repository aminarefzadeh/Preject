module registerFile(input[1:0] RR1,RR2,WR,input[7:0] WD,input W,clk,rst,output logic [7:0] RD1,RD2);
  logic[3:0][7:0] registers;
  always@ (RR1,RR2,clk) begin
    RD1 <= registers[RR1];
    RD2 <= registers[RR2];
  end
  always @(posedge clk,posedge rst)begin
    if (rst)
      registers[0] <= 8'b0;
    else if (W)
      registers[WR] <= WD;
  end
endmodule
