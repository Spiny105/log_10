/////////////////////
/*Timescale setting*/
/////////////////////

`timescale 1ns / 1ns


module Memory_tb;


//Inner regs and wires

wire [31 : 0] result;
reg [31 : 0] argument;
integer i;

//Modules under test
fx_log log_instance(
	.argument(argument),
	.result(result)
);


//Operations

initial begin
	argument = 0;
	#100 argument = 32'h10000;

	for(i=0;i < 10 ; i = i + 1) begin
	#100 argument = argument + 32'h3FF0000;
	end 

	#500 $finish("Simulation finished");
end

endmodule