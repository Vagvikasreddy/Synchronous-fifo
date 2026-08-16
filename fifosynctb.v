module top;
parameter width=8;
parameter depth=16;
	reg clk,rst,wren,rden;
	reg [width-1:0] din;
	wire [width-1:0] dout;
	wire full,empty;
	integer i;
	fifosync dut(clk,rst,wren,rden,din,dout,full,empty);
	initial begin
		clk=1;
	forever #5 clk=~clk;
	end
	initial begin
	rst=1;
	wren=0;
	rden=0;
	din=0;
	@(posedge clk);
	@(posedge clk);
	for(i=0;i<depth;i=i+1)begin
		@(posedge clk);
		rst=0;
		wren=1;
		din=$urandom_range(10,50);
	end
	#1;
	$display("%0p",dut.fifo);
	for(i=0;i<depth;i=i+1)begin
		@(posedge clk);
		rst=0;
		rden=1;
		#1;
		$display("%d",dout);
	end
	#300;
	$finish;
	end
endmodule
