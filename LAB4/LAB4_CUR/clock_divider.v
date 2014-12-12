module clock_divider (clk, rst_n, clk_o, SW);

parameter DIV_CONST      = 10000000;

input clk;
input rst_n;
// New Input
input SW;

output reg clk_o;

reg [31:0] div;
reg en;

always @ (posedge clk or negedge rst_n)
begin
	if (!rst_n)
	begin
		div <= 0;
		en <= 0;
	end	
	else
	begin
		if (div == DIV_CONST)
		begin
			div <= 0;
			en <= 1;
		end
		else
		begin
			// New Additions
			if (SW)
			begin
			div <= div + 5;
			end
			else
			begin
			div <= div + 1;
			end
			en <= 0;
		end
	end
end

always @ (posedge clk or negedge rst_n)
begin
if (!rst_n)
begin
	clk_o <= 1'b0;
end
else if (en)
	clk_o <= ~clk_o;
end

endmodule
