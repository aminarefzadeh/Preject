
module cpu(input clk,rst);
  wire DIld,CZNld,WASel,WDSel,jmpsignal,ALU1Sel,ALU2Sel,RA2Sel,RegWrite,pcWrite,IRld,MDRld,TRld,IorD,memorywrite,memoryread;
  wire[1:0] fun;
  wire[7:0] IRout;
  controller cnt(IRout,clk,rst,ALU1Sel,ALU2Sel,IorD,memoryread,memorywrite,pcWrite,IRld,TRld,MDRld,DIld,CZNld,RegWrite,RA2Sel,WASel,WDSel,jmpsignal,fun);
  DataPath dp(clk,rst,DIld,CZNld,WASel,WDSel,jmpsignal,ALU1Sel,ALU2Sel,RA2Sel,RegWrite,pcWrite,IRld,MDRld,TRld,IorD,memorywrite,memoryread,fun,IRout);
endmodule

module testBench();
  reg clk=0,rst=1;
  initial repeat(1000)#5 clk=~clk;
  initial begin
    #25
    rst <= 0;
  end
  cpu cp (clk,rst);
endmodule