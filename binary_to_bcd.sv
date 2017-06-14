//source: http://www.eng.utah.edu/~nmcdonal/Tutorials/BCDTutorial/BCDConversion.html

module binary_to_bcd(input [7:0] binary, 
				  output logic [3:0] h,
				  output logic [3:0] t,
				  output logic [3:0] o);
				  
integer i;

always_comb begin

h = 4'd0;
t = 4'd0;
o = 4'd0;

for (i = 7; i >= 0; i = i - 1)
begin
	if(h >= 5)
		h = h + 3;
	if(t >= 5)
		t = t + 3;
	if(o >= 5)
		o = o + 3;
		
	h = h << 1;
	h[0] = t[3];
	t = t << 1;
	t[0] = o[3];
	o = o << 1;
	o[0] = binary[i];
end

end

endmodule
