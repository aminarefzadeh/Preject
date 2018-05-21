`timescale 1ns/1ns 
module controller(ins,clk,rst,selA, selB,IorD,memRead,memWrite,pcWrite,IRld,TRld,MDRld,DIld,CZNld,regWrite,RA2sel,WAsel,WDsel,jmpSignal,aluOp);
 	input[7:0] ins;
 	input clk,rst;
 	output reg selA, selB, IorD, memRead, memWrite, pcWrite, IRld, TRld, MDRld, DIld, CZNld, regWrite, RA2sel, WAsel, WDsel, jmpSignal;
 	output reg[1:0] aluOp; 	
 	reg[3:0] state;
 	reg[3:0] nextState;
 	parameter IF = 4'd0, ID = 4'd1, J = 4'd2, ACU1 = 4'd3, ACU2= 4'd4, ADDR1 = 4'd5, LW1 = 4'd6, ADDR2 = 4'd7, ADDR3 = 4'd8,LW2=4'd9, SW = 4'd10, DI = 4'd11;
 	// debug CZN load
 	
 	always@(ins,state) begin
	   case(state)
	   IF:begin
	     nextState <= ID;
	   end
	   ID:begin
	     if(ins[7:5] == 3'b110)begin
	       nextState <= J;
	     end
	     else if(ins[7:6] == 2'b10)
	       nextState <= ACU1;
	     else if(ins[7:5] == 3'b000 )begin
	       nextState <= LW1;
	     end
	     else if (ins[7:5] == 3'b010 || ins[7:5] == 3'b011 )begin
	       nextState <= ADDR2;
	     end
	     else if(ins[7:5] == 3'b001)
	       nextState <= SW;
	     else if(ins[7:5] == 3'b111)
	       nextState <=DI;
	   end
	   J:begin
	     nextState <=IF;
	   end
	   ACU1:begin
	       nextState <=IF;
	   end
	   LW1:begin
	     nextState <= LW2;
    end
    LW2:begin
      nextState <= IF;
    end
	  ADDR2:begin
	    nextState <= ADDR3;
 	  end
	  ADDR3:begin
	    nextState <=IF;
	  end
 	  SW:begin
	    nextState <=IF;
	  end
	  DI:begin
	    nextState <=IF;
   	end
   	default:
   	  nextState <= IF;
	endcase 
 end
 	
 	
 	
 	
 	// ------------------------ ***** ---------------------
 	
 	
 	
 	
 	
 	always@(state) begin
	 selA<=1'b0;
	 selB<=1'b0;
	 IorD<=1'b0;
	 memRead<=1'b0;
	 memWrite<=1'b0;
	 pcWrite<=1'b0;
	 IRld<=1'b0;
	 TRld<=1'b0;
	 MDRld<=1'b0;
	 DIld<=1'b0;
	 CZNld<=1'b0;
	 regWrite<=1'b0;
	 RA2sel<=1'b0;
	 WAsel<=1'b0;
	 WDsel<=1'b0;
	 jmpSignal<=1'b0;
	 if(rst)
	   aluOp <= 1'b00;
	 else
	   case(state)
	   IF:begin
	     IorD <= 1'b0;
	     memRead <= 1'b1;
	     IRld <= 1'b1;
	     pcWrite <= 1'b1;
	   end
	   ID:begin
	     if(ins[7:5] == 3'b000 || ins[7:5] == 3'b010 || ins[7:5] == 3'b011 || ins[7:5] == 3'b001 || ins[7:5] == 3'b110)begin
	       TRld <= 1'b1;
	       pcWrite <= 1'b1;
	     end
	   end
	   J:begin
	     jmpSignal <= 1'b1;
	     pcWrite <= 1'b1;
	   end
	   ACU1:begin
	     RA2sel <= 1'b0;
	     selB <= 1'b1;
	     //move
	     if(ins[5:4] == 2'b00)begin
	       selA <= 1'b1;
	       aluOp <= 2'b00;
	     end
	     //add
	     else if(ins[5:4] == 2'b01)begin
	       selA <= 1'b0;
	       aluOp <= 2'b00;
	     end
	     //and
	     else if(ins[5:4] == 2'b10)begin
	       selA <= 1'b0;
	       aluOp <= 2'b01;
	     end
	     //or
	     else if(ins[5:4] == 2'b11)begin
	       selA <= 1'b0;
	       aluOp <= 2'b10;
	     end
	     WAsel <= 1'b0;
	     WDsel <= 1'b1;
	     regWrite <= 1'b1;
	     CZNld <= 1'b1;
	   end
	   
	   LW1:begin
	     IorD <= 1'b1;
	     memRead <= 1'b1;
	     MDRld <= 1'b1;
    end
    LW2:begin
      RA2sel <= 1'b1;
      WAsel <= 1'b1;
	     WDsel <= 1'b0;
	     regWrite <= 1'b1;
    end
	  ADDR2:begin
	    IorD <= 1'b1;
	    memRead <= 1'b1;
	    MDRld <= 1'b1;
 	  end
	  ADDR3:begin
	    RA2sel <= 1'b1;
	    selB <= 1'b0;
	    selA <= 1'b0;
	    if(ins[5] == 1'b0)
	      aluOp <= 2'b00;
	    else if(ins[5] == 1'b1)
	      aluOp <= 2'b01;
	    WAsel <= 1'b1;
	    WDsel <= 1'b1;
	    regWrite <= 1'b1;
	    CZNld <= 1'b1;
	  end
 	  SW:begin
 	    RA2sel <= 1'b1;
	    selB <= 1'b1;
	    IorD <= 1'b1;
	    memWrite <= 1'b1;
	  end
	  DI:
	    DIld <= 1'b1;
	endcase
 end
 
 always @(posedge clk)begin
  if (~rst)
    state <= nextState;
 end
endmodule