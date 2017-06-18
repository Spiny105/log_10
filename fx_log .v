module fx_log(
	input [31 : 0] argument,
	output reg [31 : 0] result
);

integer y;
integer x;
integer t;

always @(*) begin

x = argument;
y = 32'ha65af;
 
if(x < 32'h00008000) begin
	x = x << 16;
	y = y - 32'hb1721;
end

if(x < 32'h00800000) begin
	x = x << 8;
	y = y - 32'h58b91;
end

if(x < 32'h08000000) begin
	x = x << 4;
	y = y - 32'h2c5c8;
end

if(x < 32'h20000000) begin
	x = x << 2;
	y = y - 32'h162e4;
end

if(x < 32'h40000000) begin
	x = x << 1;
	y = y - 32'h0b172;
end
	
t=x+(x>>1); if((t&32'h80000000)==0) begin x=t; y = y - 32'h067cd; end
t=x+(x>>2); if((t&32'h80000000)==0) begin x=t; y = y - 32'h03920; end
t=x+(x>>3); if((t&32'h80000000)==0) begin x=t; y = y - 32'h01e27; end
t=x+(x>>4); if((t&32'h80000000)==0) begin x=t; y = y - 32'h00f85; end
t=x+(x>>5); if((t&32'h80000000)==0) begin x=t; y = y - 32'h007e1; end
t=x+(x>>6); if((t&32'h80000000)==0) begin x=t; y = y - 32'h003f8; end
t=x+(x>>7); if((t&32'h80000000)==0) begin x=t; y = y - 32'h001fe; end

x = 32'h80000000-x;
y = y - (x >> 15);
result = y;
	
end

endmodule

