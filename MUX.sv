module mux_13(input[12:0] a , b ,input sel , output[12:0] out);
	assign out = (sel) ? b : a ;
endmodule

module mux_8(input[7:0] a , b , input sel , output[7:0] out);
	assign out = (sel) ? b : a ;
endmodule

module mux_2(input[1:0] a , b , input sel , output[1:0] out);
	assign out = (sel) ? b : a ;
endmodule

module mux4_1(input a , b , c , d , sel , output out);
	assign out = (sel==2'b00)? a : 
	             (sel==2'b01)? b:
	             (sel==2'b10)? c:d;
endmodule


