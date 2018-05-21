
module memory(input [12:0]addr ,input[7:0] WR,input clk,memorywrite,memoryread,output logic[7:0] RD);
  logic [8191:0] [7:0] Memory;
  always@(addr,memoryread)begin
    Memory[0] <= 8'b11110000;
    Memory[1] <= 8'b00000011;
    Memory[2] <= 8'b11100111;
    Memory[3] <= 8'b11101000;
    Memory[4] <= 8'b00000011;
    Memory[5] <= 8'b11100111;
    Memory[6] <= 8'b11100000;
    Memory[7] <= 8'b00000011;
    Memory[8] <= 8'b11101000;
    Memory[9] <= 8'b01000011;
    Memory[10] <= 8'b11101001;
    Memory[11] <= 8'b10010110;
    Memory[12] <= 8'b01000011;
    Memory[13] <= 8'b11101010;
    Memory[14] <= 8'b10010110;
    Memory[15] <= 8'b01000011;
    Memory[16] <= 8'b11101011;
    Memory[17] <= 8'b10010110;
    Memory[18] <= 8'b01000011;
    Memory[19] <= 8'b11101100;
    Memory[20] <= 8'b10010110;
    Memory[21] <= 8'b01000011;
    Memory[22] <= 8'b11101101;
    Memory[23] <= 8'b10010110;
    Memory[24] <= 8'b01000011;
    Memory[25] <= 8'b11101110;
    Memory[26] <= 8'b10010110;
    Memory[27] <= 8'b01000011;
    Memory[28] <= 8'b11101111;
    Memory[29] <= 8'b10010110;
    Memory[30] <= 8'b01000011;
    Memory[31] <= 8'b11110000;
    Memory[32] <= 8'b10010110;
    Memory[33] <= 8'b01000011;
    Memory[34] <= 8'b11110001;
    Memory[35] <= 8'b10010110;
    Memory[36] <= 8'b11101000;
    Memory[37] <= 8'b00100111;
    Memory[38] <= 8'b11010000;
    Memory[39] <= 8'b11100000;
    Memory[40] <= 8'b00100111;
    Memory[41] <= 8'b11010001;
    Memory[999] <= 8'b00000110;
    Memory[1000] <= 8'b11101001;
    Memory[1001] <= 8'b11101001;
    Memory[1002] <= 8'b11101001;
    Memory[1003] <= 8'b11101001;
    Memory[1004] <= 8'b11101001;
    Memory[1005] <= 8'b11101001;
    Memory[1006] <= 8'b11101001;
    Memory[1007] <= 8'b11101001;
    Memory[1008] <= 8'b11101001;
    Memory[1009] <= 8'b11101001;
    RD <= Memory[addr];
  end
  always@(posedge clk) begin
    if (memorywrite)
      Memory[addr] <= WR;
  end
endmodule