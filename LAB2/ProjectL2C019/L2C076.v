module L2C076( 
input [9:0] sw, // ten up-down switches, SW9 - SW0
input [3:0] key, // four pushbutton switches, KEY3 - KEY0
input clock, // 24MHz clock source on Altera DE1 board
output [9:0] ledr, // ten Red LEDs, LEDR9 - LEDR0
output [7:0] ledg, // eight Green LEDs, LEDG8 - LEDG0
output reg [6:0] hex3, hex2, hex1, hex0 // four 7-segment, HEX3 - HEX0
);

reg [3:0] count;

always @(*)
begin
/* Display Class ID */
if ( sw[9:5] == 5'b00000 )
begin
	hex0 = 7'b000_0010;
	hex1 = 7'b111_1000;
	hex2 = 7'b100_0000;
	hex3 = 7'b100_0000;
end

/* PART 1 */
else if ( sw[9:5] == 5'b10000 )
begin
	case (sw[3:0])
		4'b0000:   //0
		begin
		  hex0 = 7'b100_0000;
		  hex1 = 7'b111_1111;
		  hex2 = 7'b100_0000;
		  hex3 = 7'b100_0000;
		end
		  
		4'b0001:   //1
		begin
		  hex0 = 7'b111_1001;
		  hex1 = 7'b111_1111;
		  hex2 = 7'b100_0000;
		  hex3 = 7'b100_0000; 
		end
		  
		4'b0010:   //2
		begin
		  hex0 = 7'b010_0100;
		  hex1 = 7'b111_1111;
		  hex2 = 7'b100_0000;
		  hex3 = 7'b100_0000; 
		end
		  
		4'b0011:  //3
		begin
		  hex0 = 7'b011_1000;
		  hex1 = 7'b111_1111;
		  hex2 = 7'b100_0000;
		  hex3 = 7'b100_0000; 
		end
		  
		4'b0100:  //4
		begin
		  hex0 = 7'b001_1001;
		  hex1 = 7'b111_1111;
		  hex2 = 7'b100_0000;
		  hex3 = 7'b100_0000; 
		end
		  
		4'b0101:   //5
		begin
		  hex0 = 7'b001_0010;
		  hex1 = 7'b111_1111;
		  hex2 = 7'b100_0000;
		  hex3 = 7'b100_0000; 
		end
		  
		4'b0110:   //6
		begin
		  hex0 = 7'b000_0010;
		  hex1 = 7'b111_1111;
		  hex2 = 7'b100_0000;
		  hex3 = 7'b100_0000; 
		end
		  
		4'b0111:   //7
		begin
		  hex0 = 7'b111_1000;
		  hex1 = 7'b111_1111;
		  hex2 = 7'b100_0000;
		  hex3 = 7'b100_0000; 
		end	  
		  
		4'b1000:   //8
		begin
		  hex0 = 7'b000_0000;
		  hex1 = 7'b111_1111;
		  hex2 = 7'b100_0000;
		  hex3 = 7'b100_0000; 
		end	
		  
		4'b1001:   //9
		begin
		  hex0 = 7'b001_1000;
		  hex1 = 7'b111_1111;
		  hex2 = 7'b100_0000;
		  hex3 = 7'b100_0000; 
		end	
		  
		4'b1010:   //A
		begin
		  hex0 = 7'b000_1000;
		  hex1 = 7'b111_1111;
		  hex2 = 7'b100_0000;
		  hex3 = 7'b100_0000; 
		end	
		  
		4'b1011:   //b
		begin
		  hex0 = 7'b000_0011;
		  hex1 = 7'b111_1111;
		  hex2 = 7'b100_0000;
		  hex3 = 7'b100_0000; 
		end	
		  
		4'b1100:   //C
		begin
		  hex0 = 7'b100_0110;
		  hex1 = 7'b111_1111;
		  hex2 = 7'b100_0000;
		  hex3 = 7'b100_0000; 
		end	
		  
		4'b1101:   //d
		begin
		  hex0 = 7'b010_0001;
		  hex1 = 7'b111_1111;
		  hex2 = 7'b100_0000;
		  hex3 = 7'b100_0000; 
		end	
		  
		4'b1110:   //E
		begin
		  hex0 = 7'b000_0110;
		  hex1 = 7'b111_1111;
		  hex2 = 7'b100_0000;
		  hex3 = 7'b100_0000; 
		end	
		  
		4'b1111:   //F
		begin
		  hex0 = 7'b000_1110;
		  hex1 = 7'b111_1111;
		  hex2 = 7'b100_0000;
		  hex3 = 7'b100_0000; 
		end	
	endcase
end

/* PART 2 */
else if ( sw[9:5] == 5'b01000 )
begin
	if ( sw[0] == 0 )   //Adder
	begin
		case ( sw[4:1] )
			4'b0000:   //00
		    begin
		      hex0 = 7'b100_0000;
			  hex1 = 7'b111_1111;
			  hex2 = 7'b100_0000;
		      hex3 = 7'b100_0000;
		    end
		  
			4'b0001:   //01
		    begin
			  hex0 = 7'b111_1001;
			  hex1 = 7'b111_1111;
			  hex2 = 7'b111_1001;
			  hex3 = 7'b100_0000; 
			end
		  
			4'b0010:   //02
			begin
			  hex0 = 7'b010_0100;
			  hex1 = 7'b111_1111;
			  hex2 = 7'b010_0100; //2
			  hex3 = 7'b100_0000; 
			end
		  
			4'b0011:  //03
			begin
			  hex0 = 7'b011_0000;
			  hex1 = 7'b111_1111;
			  hex2 = 7'b011_0000; //3
			  hex3 = 7'b100_0000; 
			end
			  
			4'b0100:  //10
			begin
			  hex0 = 7'b111_1001;
			  hex1 = 7'b111_1111;
			  hex2 = 7'b100_0000;
			  hex3 = 7'b111_1001; 
			end
			  
			4'b0101:   //11
			begin
			  hex0 = 7'b010_0100; //2
			  hex1 = 7'b111_1111;
			  hex2 = 7'b111_1001;
			  hex3 = 7'b111_1001; 
			end
			  
			4'b0110:   //12
			begin
			  hex0 = 7'b011_0000; //3
			  hex1 = 7'b111_1111;
			  hex2 = 7'b010_0100;
			  hex3 = 7'b111_1001; 
			end
			  
			4'b0111:   //13
			begin
			  hex0 = 7'b001_1001; //4
			  hex1 = 7'b111_1111;
			  hex2 = 7'b011_0000;
			  hex3 = 7'b111_1001; 
			end	  
			  
			4'b1000:   //20
			begin
			  hex0 = 7'b010_0100;  //2
			  hex1 = 7'b111_1111;
			  hex2 = 7'b100_0000;
			  hex3 = 7'b010_0100; 
			end	
			  
			4'b1001:   //21
			begin
			  hex0 = 7'b011_0000;  //3
			  hex1 = 7'b111_1111;
			  hex2 = 7'b111_1001;
			  hex3 = 7'b010_0100; 
			end	
			  
			4'b1010:   //22
			begin
			  hex0 = 7'b001_1001; //4
			  hex1 = 7'b111_1111;
			  hex2 = 7'b010_0100;
			  hex3 = 7'b010_0100; 
			end	
			  
			4'b1011:   //23
			begin
			  hex0 = 7'b001_0010; //5
			  hex1 = 7'b111_1111;
			  hex2 = 7'b011_0000;
			  hex3 = 7'b010_0100; 
			end	
			  
			4'b1100:   //30
			begin
			  hex0 = 7'b011_0000; //3
			  hex1 = 7'b111_1111;
			  hex2 = 7'b100_0000;
			  hex3 = 7'b011_0000; 
			end	
			  
			4'b1101:   //31
			begin
			  hex0 = 7'b001_1001; //4
			  hex1 = 7'b111_1111;
			  hex2 = 7'b111_1001;
			  hex3 = 7'b011_0000; 
			end	
			  
			4'b1110:   //32
			begin
			  hex0 = 7'b001_0010;  //5
			  hex1 = 7'b111_1111;
			  hex2 = 7'b010_0100;
			  hex3 = 7'b011_0000; 
			end	
			  
			4'b1111:   //33
			begin
			  hex0 = 7'b000_0010;
			  hex1 = 7'b111_1111;
			  hex2 = 7'b011_0000;
			  hex3 = 7'b011_0000; 
			end	
		endcase
	end
	
    else //multiplier
    begin
		case (sw[4:1])
			4'b0000:   //00
		    begin
		      hex0 = 7'b100_0000;
			  hex1 = 7'b111_1111;
			  hex2 = 7'b100_0000;
		      hex3 = 7'b100_0000;
		    end
		  
			4'b0001:   //01
		    begin
			  hex0 = 7'b100_0000; //0
			  hex1 = 7'b111_1111;
			  hex2 = 7'b111_1001;
			  hex3 = 7'b100_0000; 
			end
		  
			4'b0010:   //02
			begin
			  hex0 = 7'b100_0000; //0
			  hex1 = 7'b111_1111;
			  hex2 = 7'b010_0100; //2
			  hex3 = 7'b100_0000; 
			end
		  
			4'b0011:  //03
			begin
			  hex0 = 7'b100_0000; //0
			  hex1 = 7'b111_1111;
			  hex2 = 7'b011_0000; //3
			  hex3 = 7'b100_0000; 
			end
			  
			4'b0100:  //10
			begin
			  hex0 = 7'b100_0000; //0
			  hex1 = 7'b111_1111;
			  hex2 = 7'b100_0000;
			  hex3 = 7'b111_1001; 
			end
			  
			4'b0101:   //11
			begin
			  hex0 = 7'b111_1001; //1
			  hex1 = 7'b111_1111;
			  hex2 = 7'b111_1001;
			  hex3 = 7'b111_1001; 
			end
			  
			4'b0110:   //12
			begin
			  hex0 = 7'b010_0100; //2
			  hex1 = 7'b111_1111;
			  hex2 = 7'b010_0100;
			  hex3 = 7'b111_1001; 
			end
			  
			4'b0111:   //13
			begin
			  hex0 = 7'b011_0000; //3
			  hex1 = 7'b111_1111;
			  hex2 = 7'b011_0000;
			  hex3 = 7'b111_1001; 
			end	  
			  
			4'b1000:   //20
			begin
			  hex0 = 7'b100_0000;  //0
			  hex1 = 7'b111_1111;
			  hex2 = 7'b100_0000;
			  hex3 = 7'b010_0100; 
			end	
			  
			4'b1001:   //21
			begin
			  hex0 = 7'b010_0100;  //2
			  hex1 = 7'b111_1111;
			  hex2 = 7'b111_1001;
			  hex3 = 7'b010_0100; 
			end	
			  
			4'b1010:   //22
			begin
			  hex0 = 7'b001_1001; //4
			  hex1 = 7'b111_1111;
			  hex2 = 7'b010_0100;
			  hex3 = 7'b010_0100; 
			end	
			  
			4'b1011:   //23
			begin
			  hex0 = 7'b000_0010; //6
			  hex1 = 7'b111_1111;
			  hex2 = 7'b011_0000;
			  hex3 = 7'b010_0100; 
			end	
			  
			4'b1100:   //30
			begin
			  hex0 = 7'b100_0000; //0
			  hex1 = 7'b111_1111;
			  hex2 = 7'b100_0000;
			  hex3 = 7'b011_0000; 
			end	
			  
			4'b1101:   //31
			begin
			  hex0 = 7'b011_0000; //3
			  hex1 = 7'b111_1111;
			  hex2 = 7'b111_1001;
			  hex3 = 7'b011_0000; 
			 end	
			  
			4'b1110:   //32
			begin
			  hex0 = 7'b000_0010;  //6
			  hex1 = 7'b111_1111;
			  hex2 = 7'b010_0100;
			  hex3 = 7'b011_0000; 
			end	
			  
			4'b1111:   //33
			begin
			  hex0 = 7'b001_1000; //9
			  hex1 = 7'b111_1111;
			  hex2 = 7'b011_0000;
			  hex3 = 7'b011_0000; 
			end	
		endcase
	end
end

/* PART 3 */
else if ( sw[9:5] == 5'b00100 )

begin
	count = 4'b0000;
	hex0 = 7'b100_0000;
	hex1 = 7'b111_1111;
	hex2 = 7'b111_1111;
	hex3 = 7'b111_1111;
	
	if ( sw[0] == 0 && sw[1] == 0 )
	begin
		//hex0 = counter;
	end
	
	else if ( sw[0] == 0 && sw[1] == 1 )
	begin
	  hex0 = 7'b100_0000;
	end
	

end


/*PART 4*/
else if ( sw[9:5] == 5'b00010 )
begin
end

end  //end always
	
/*always @(negedge key[0]) 
begin
	count[0] <= ~ count[0]
	//if ( sw[0] == 0 && sw[1] == 0 )
	//begin
	if ( count == 4'b0001 )
	begin
		hex0 = 7'b111_1001; //1
	end
	// count up using Key0
	//counter = counter + 1;
	//end
    
	//else if ( sw[0] == 1 )
	//begin
	//end

end //end initial
	
end //end always*/



endmodule		
