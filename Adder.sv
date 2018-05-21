module Inc(input[12:0] a ,output[12:0] out);
	logic[11:0] b = 13'b0000000000001;
	assign out = a + b;
endmodule
