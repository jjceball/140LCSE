module L2C019( // where yyy=your CID. e.g., L2C079 if your CID=079 
 input [9:0] sw, // ten up-down switches, SW9 - SW0 
 input [3:0] key, // four pushbutton switches, KEY3 - KEY0 
 input clock, // 24MHz clock source on Altera DE1 board 
 output [9:0] ledr, // ten Red LEDs, LEDR9 - LEDR0 
 output [7:0] ledg, // eight Green LEDs, LEDG8 - LEDG0 
 output reg [6:0] hex3, hex2, hex1, hex0 // four 7-segment, HEX3 - HEX0 
);

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

// Used in Part 4/5
integer timer = 0;
integer secs = 0;
integer hz = 0;
reg ledgon= 0;
assign ledg = ledgon;
integer N3, N2, N1, N0;

integer Value = 0; // Variable used to hold the value of the binary switches in Part 1

// More declarations to used in the Lab
integer x=0, y=0;
integer answer;

integer clockcount=0;
integer goLeft=1;
integer array = 0;
integer wordarray = 0;

// Assigned ledrs used in Part 5
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


// Begin Lab
always @ (*)
begin
	// Initial State Display CID
	if(sw[9:5] == 5'b00000) 
		begin
			hex3 = 7'b111_1111;
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
		end 
	
	// PART 1	
	else if(sw[9:5] == 5'b00001)
		begin
			hex1 = 7'b111_1111; //setting hex1 to completely off
		
			Value = 0;
		
			if(sw[0]) Value = Value + 1;
			if(sw[1]) Value = Value + 2;
			if(sw[2]) Value = Value + 4;
			if(sw[3]) Value = Value + 8;
				
			case(Value)
			0: 	begin hex3 = 7'b100_0000; hex2 = 7'b100_0000; hex0 = 7'b100_0000; end
			1:	begin hex3 = 7'b100_0000; hex2 = 7'b111_1001; hex0 = 7'b111_1001; end
			2:	begin hex3 = 7'b100_0000; hex2 = 7'b010_0100; hex0 = 7'b010_0100; end
			3:	begin hex3 = 7'b100_0000; hex2 = 7'b011_0000; hex0 = 7'b011_0000; end
			4:	begin hex3 = 7'b100_0000; hex2 = 7'b001_1001; hex0 = 7'b001_1001; end
			5: 	begin hex3 = 7'b100_0000; hex2 = 7'b001_0010; hex0 = 7'b001_0010; end
			6: 	begin hex3 = 7'b100_0000; hex2 = 7'b000_0010; hex0 = 7'b000_0010; end
			7: 	begin hex3 = 7'b100_0000; hex2 = 7'b111_1000; hex0 = 7'b111_1000; end
			8: 	begin hex3 = 7'b100_0000; hex2 = 7'b000_0000; hex0 = 7'b000_0000; end
			9: 	begin hex3 = 7'b100_0000; hex2 = 7'b001_1000; hex0 = 7'b001_1000; end
			10: begin hex3 = 7'b111_1001; hex2 = 7'b100_0000; hex0 = 7'b000_1000; end
			11: begin hex3 = 7'b111_1001; hex2 = 7'b111_1001; hex0 = 7'b000_0011; end
			12: begin hex3 = 7'b111_1001; hex2 = 7'b010_0100; hex0 = 7'b000_0011; end
			13: begin hex3 = 7'b111_1001; hex2 = 7'b011_0000; hex0 = 7'b010_0001; end
			14: begin hex3 = 7'b111_1001; hex2 = 7'b001_1001; hex0 = 7'b000_0110; end
			15: begin hex3 = 7'b111_1001; hex2 = 7'b001_0010; hex0 = 7'b000_1110; end
			endcase 
		end
	
	// PART 2
	else if(sw[9:5] == 5'b00010)
		begin
			hex1 = 7'b111_1111;
			x=0;
			y=0;
			answer=0;
			
			if(sw[1]) x = x + 1;
			if(sw[2]) x = x + 2;
			if(sw[3]) y = y + 1;
			if(sw[4]) y = y + 2;
				
			if(~sw[0]) answer = x + y;
			else answer = x*y;
				
			case(x)
			0: hex3 = 7'b100_0000;
			1: hex3 = 7'b111_1001;
			2: hex3 = 7'b010_0100;
			3: hex3 = 7'b011_0000;
			endcase
			
			case(y)
			0: hex2 = 7'b100_0000;
			1: hex2 = 7'b111_1001;
			2: hex2 = 7'b010_0100;
			3: hex2 = 7'b011_0000;
			endcase
			
			case(answer)
			0: hex0 = 7'b100_0000;
			1: hex0 = 7'b111_1001;
			2: hex0 = 7'b010_0100;
			3: hex0 = 7'b011_0000;
			4: hex0 = 7'b001_1001;
			5: hex0 = 7'b001_0010;
			6: hex0 = 7'b000_0010;
			7: hex0 = 7'b111_1000;
			8: hex0 = 7'b000_0000;
			9: hex0 = 7'b001_1000;
			endcase		
		end
	
	// PART 3
	else if(sw[9:5] == 5'b00100)
		begin
			hex0 = 7'b111_1111;
			hex1 = 7'b111_1111;
			hex3 = 7'b111_1111;
			
			begTask(timer, hex2);
		end
	
	// PART 4
	else if(sw[9:5] == 5'b01000)
		begin
			N3 = secs / 27;
			N2 = (secs - (N3 * 27)) / 9;
			N1 = (secs - (N3*27) - (N2*9)) / 3;
			N0 = (secs - (N3*27) - (N2*9) - (N1*3));
			
			begTask(N3, hex3);
			begTask(N2, hex2);
			begTask(N1, hex1);
			begTask(N0, hex0);	
		end
	
	// PART 5	
	else if(sw[9:5] == 5'b10000)
		begin
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
		
			case(array)
			0: ledr0 = 1;
			1: ledr1 = 1;
			2: ledr2 = 1;
			3: ledr3 = 1;
			4: ledr4 = 1;
			5: ledr5 = 1;
			6: ledr6 = 1;
			7: ledr7 = 1;
			8: ledr8 = 1;
			9: ledr9 = 1;
			endcase
			
			case(wordarray)
			0: begin hex3 = 7'b111_1111; hex2 = 7'b111_1111; hex1 = 7'b111_1111; hex0 = 7'b111_1111; end
			1: begin hex3 = 7'b111_1111; hex2 = 7'b111_1111; hex1 = 7'b111_1111; hex0 = 7'b000_1001; end
			2: begin hex3 = 7'b111_1111; hex2 = 7'b111_1111; hex1 = 7'b000_1001; hex0 = 7'b000_0110; end
			3: begin hex3 = 7'b111_1111; hex2 = 7'b000_1001; hex1 = 7'b000_0110; hex0 = 7'b100_0111; end
			4: begin hex3 = 7'b000_1001; hex2 = 7'b000_0110; hex1 = 7'b100_0111; hex0 = 7'b100_0111; end
			5: begin hex3 = 7'b000_0110; hex2 = 7'b100_0111; hex1 = 7'b100_0111; hex0 = 7'b100_0000; end
			6: begin hex3 = 7'b100_0111; hex2 = 7'b100_0111; hex1 = 7'b100_0000; hex0 = 7'b111_1111; end
			7: begin hex3 = 7'b100_0111; hex2 = 7'b100_0000; hex1 = 7'b111_1111; hex0 = 7'b111_1111; end
			8: begin hex3 = 7'b100_0000; hex2 = 7'b111_1111; hex1 = 7'b111_1111; hex0 = 7'b100_0110; end
			9: begin hex3 = 7'b111_1111; hex2 = 7'b111_1111; hex1 = 7'b100_0110; hex0 = 7'b111_1001; end
			10: begin hex3 = 7'b111_1111; hex2 = 7'b100_0110; hex1 = 7'b111_1001; hex0 = 7'b010_0001; end
			11: begin hex3 = 7'b100_0110; hex2 = 7'b111_1001; hex1 = 7'b010_0001; hex0 = 7'b111_1111; end
			12: begin hex3 = 7'b111_1001; hex2 = 7'b010_0001; hex1 = 7'b111_1111; begTask(0, hex0); end
			13: begin hex3 = 7'b010_0001; hex2 = 7'b111_1111; begTask(0, hex1); begTask(1, hex0); end
			14: begin hex3 = 7'b111_1111; begTask(0, hex2); begTask(1, hex1); begTask(9, hex0); end
			15: begin begTask(0, hex3); begTask(1, hex2); begTask(9, hex1); hex0 = 7'b111_1111; end
			16: begin begTask(1, hex3); begTask(9, hex2); hex1 = 7'b111_1111; hex0 = 7'b111_1111; end
			17: begin begTask(9, hex3); hex2 = 7'b111_1111; hex1 = 7'b111_1111; hex0 = 7'b111_1111; end
			18: begin hex3 = 7'b111_1111; hex2 = 7'b111_1111; hex1 = 7'b111_1111; hex0 = 7'b111_1111; end
			endcase			
		end
end // End first Always


//Always statement used in Part 3
always @(posedge sw[0] == 1 or negedge key[2] == 1 or negedge sw[9:5] == 5'b00100)
begin
	// RESET
	if(sw[0] == 1 || sw[9:5] != 5'b00100) 
	begin
		timer = 0;
	end
	else if(key[2] == 1)
	begin
	if(sw[1] == 0)
	begin
		if(timer == 15) timer = 0;
		else timer = timer + 1;
	end
	else if(sw[1] == 1) 
	begin
		if(timer == 0) timer = 15;
		else timer = timer - 1;
	end
end	
end // End always

//Always statements used in Part 4
always @ (negedge sw[9:5] == 5'b01000 or posedge clock or posedge sw[0] == 1)
begin
	if(sw[0] == 1 || sw[9:5] != 5'b01000)
	begin
		hz = 0;
		secs = 0;
		ledgon = 0;
	end
	else
	begin	
		if(hz == 24000000)
		begin
			ledgon = 0;
			if(secs == 80) secs = 0;
			else secs = secs + 1;
			hz = 0;
		end
		else  hz = hz + 1;
		if(hz == 12000000) ledgon = 1;
	end
end // End always

// Always used in Part 5
always @ (negedge sw[9:5] == 5'b10000 or posedge clock or posedge sw[0] == 1)
begin
	if(sw[0] == 1)
	begin
	end
	else if(sw[9:5]!=5'b10000)
	begin
		array = 0;
		goLeft = 1;
		wordarray = 0;
	end
	else
	begin
		if(clockcount == 1200000)
		begin
			if(goLeft)
			begin
				if(array == 9)
				begin
					goLeft = 0;
					array = 8;
					if(wordarray == 18) wordarray = 0;
					else wordarray = wordarray + 1;
				end
				else array = array + 1;
			end
			else if(~goLeft) //Go right Leds
			begin
				if(array == 0)
				begin
					goLeft = 1;
					array = 1;
				end
				else array = array - 1;
			end
			clockcount = 0;
		end
		else clockcount = clockcount + 1;
	end
end
endmodule // End Module