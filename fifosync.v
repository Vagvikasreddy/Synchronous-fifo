module fifosync(clk,rst,wren,rden,din,dout,full,empty);
parameter width=8;
parameter depth=16;
	input clk,rst,wren,rden;
	input [width-1:0] din;
	output reg [width-1:0] dout;
	output full,empty;
	reg [width-1:0] fifo[depth-1:0];
	reg [$clog2(depth)-1:0] wptr,rptr;
	reg w_toggle,r_toggle;
	reg w_error,r_error;
	integer i;
	always@(posedge clk)begin
		if(rst==1)begin
			wptr <= 0;
            rptr <= 0;
            w_toggle <= 0;
            r_toggle <= 0;
            w_error <= 0;
            r_error <= 0;
            dout <= 0;	
			for(i=0;i<depth;i=i+1)begin
				fifo[i]<=0;
			end
		end
		else begin
			w_error<=0;
			r_error<=0;
			if(wren==1)begin
				if(full==1)begin
					w_error<=1;
				end
				else begin
					fifo[wptr]<=din;
					wptr<=wptr+1;
					if(wptr==depth-1)w_toggle<=~w_toggle;
				end
			end
				if(rden==1)begin
				if(empty==1)begin
					r_error<=1;
				end
				else begin
					dout=fifo[rptr];
					rptr<=rptr+1;
					if(rptr==depth-1)r_toggle=~r_toggle;
				end
			end
		end
	end
assign full=(rptr==wptr)&&(w_toggle!=r_toggle);
assign empty=(rptr==wptr)&&(w_toggle==r_toggle);
endmodule
