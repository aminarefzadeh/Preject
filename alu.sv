module alu(input[1:0] fun , input[7:0] a,b ,input cin , output logic[7:0] out , output logic zero,cout,negetive);
	always @(fun,a,b,cin)begin
    case(fun)
      3'b00 : {cout,out} <= a + b + cin;
      3'b01 : {cout,out} <= a - b + cin;
		  3'b10 : begin out <= a & b; cout <= cin; end
		  3'b11 : begin out <= a | b; cout <= cin; end
		endcase
	end
  assign zero = (out == 8'b0) ? 1 : 0;
  assign negetive = out[7];
endmodule