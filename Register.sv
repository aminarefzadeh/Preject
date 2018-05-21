module register8(input[7:0] in,input clk,rst,ld,output logic[7:0] out);
  always@(posedge clk,posedge rst)begin
    if (rst)
      out <= 8'b0;
    else if (ld)
      out <= in;
  end
endmodule

module register13(input[12:0] in,input clk,rst,ld,output logic[12:0] out);
  always@(posedge clk,posedge rst)begin
    if (rst)
      out <= 13'b0;
    else if (ld)
      out <= in;
  end
endmodule

module register5(input[4:0] in,input clk,rst,ld,output logic[4:0] out);
  always@(posedge clk,posedge rst)begin
    if (rst)
      out <= 5'b0;
    else if (ld)
      out <= in;
  end
endmodule

module register3(input[2:0] in,input clk,rst,ld,output logic[2:0] out);
  always@(posedge clk,posedge rst)begin
    if (rst)
      out <= 3'b0;
    else if (ld)
      out <= in;
  end
endmodule

module register1(input in,clk,rst,ld,output logic out);
  always@(posedge clk,posedge rst)begin
    if (rst)
      out <= 0;
    else if (ld)
      out <= in;
  end
endmodule
