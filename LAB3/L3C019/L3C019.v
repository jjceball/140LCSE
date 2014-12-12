module L3C019( // where yyy=your CID. e.g., L3C079 if your CID=079 
 input [9:0] sw, // ten up-down switches, SW9 - SW0 
 input [3:0] key, // four pushbutton switches, KEY3 - KEY0 
 input clock, // 24MHz clock source on Altera DE1 board 
 output [9:0] ledr, // ten Red LEDs, LEDR9 - LEDR0 
 output [7:0] ledg, // eight Green LEDs, LEDG8 - LEDG0 
 output reg [6:0] hex3, hex2, hex1, hex0 // four 7-segment, HEX3 - HEX0 
);

integer flag = 0;

// Begin task
task begTask;
	input integer a;
	output reg [6:0] hex;
begin
	case(a)
	0: hex = 7'b100_0000;
	1: hex = 7'b111_1001;
	2: hex = 7'b010_0100;
	3: hex = 7'b011_0000;
	4: hex = 7'b001_1001;
	5: hex = 7'b001_0010;
	6: hex = 7'b000_0010;
	7: hex = 7'b111_1000;
	8: hex = 7'b000_0000;
	9: hex = 7'b001_1000;
	10:	hex = 7'b000_1000;
	11:	hex = 7'b000_0011;
	12:	hex = 7'b100_0110;
	13:	hex = 7'b010_0001;
	14:	hex = 7'b000_0110;
	15:	hex = 7'b000_1110;
	endcase
end
endtask

// Assigned leds
reg ledr0=0, ledr1=0, ledr2=0, ledr3=0, ledr4=0, ledr5=0, ledr6=0, ledr7=0, ledr8=0, ledr9=0;
assign ledr[0] = ledr0;
assign ledr[1] = ledr1;
assign ledr[2] = ledr2;
assign ledr[3] = ledr3;
assign ledr[4] = ledr4;
assign ledr[5] = ledr5;
assign ledr[6] = ledr6;
assign ledr[7] = ledr7;
assign ledr[8] = ledr8;
assign ledr[9] = ledr9;

reg ledg0=0, ledg1=0, ledg2=0, ledg3=0, ledg4=0, ledg5=0, ledg6=0, ledg7=0;
assign ledg[0] = ledg0;
assign ledg[1] = ledg1;
assign ledg[2] = ledg2;
assign ledg[3] = ledg3;
assign ledg[4] = ledg4;
assign ledg[5] = ledg5;
assign ledg[6] = ledg6;
assign ledg[7] = ledg7;

// Begin Lab
always @ (posedge clock == 1)
begin
	if(flag == 0)
	begin
	// Initial State Display CID
	hex3 = 7'b100_0000;
	hex2 = 7'b100_0000; 
	hex1 = 7'b111_1001; 
	hex0 = 7'b001_1000;
		
	ledr0 = 0;
	ledr1 = 0;
	ledr2 = 0;
	ledr3 = 0;
	ledr4 = 0;
	ledr5 = 0;
	ledr6 = 0;
	ledr7 = 0;
	ledr8 = 0;
	ledr9 = 0;
		
	ledg0 = 0;
	ledg1 = 0;
	ledg2 = 0;
	ledg3 = 0;
	ledg4 = 0;
	ledg5 = 0;
	ledg6 = 0;
	ledg7 = 0;
	end
end // End first always

always @ (negedge key[3])
begin
	if(flag == 0)
	begin
		flag = 1;
	end
	
	if(flag == 1)
	begin
		hex3 = 7'b100_0000;
		hex2 = 7'b100_0000; 
		hex1 = 7'b100_0000; 
		hex0 = 7'b100_0000;
		
		/*
		if(sw[9] == 0)
		begin
			if()
			begin
				hex3 = 7'b000_0110;
				hex2 = 7'b010_1111; 
				hex1 = 7'b010_1111; 
				hex0 = 7'b111_1111;
			end 
		
			else
			begin
	
			end
		end
		else if(sw[9] == 1)
		begin

		end	
		*/

	end
end

endmodule // End Module