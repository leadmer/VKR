module non_restor #(parameter DATA_WIDTH=8/*,
ANSWER_WIDTH= 8,TRIAL_WIDTH = 4*/ )
(Q, D, R);
output reg [4:0] Q;  
input [DATA_WIDTH:0] D;
reg [DATA_WIDTH:0] D1;
output reg [6:0] R; 
integer i;
/*initial begin
$monitor("D is :%d   Q is :%d   R is :%d", D1, Q, R);
Q = 0;
R = 0;
D1 = 140;
end*/

always @ (D)
begin
for (i = 3; i >= 0; i = i - 1)
	begin
	if (R>=0)
		begin
		R = (R << 2) | (D >> (i + i) & 3);
		R = R - ((Q << 2) | 1);
		end
	else if(R<0)
		begin
		R = (R << 2) | (D >> (i + i) & 3);
		R = (R - ((Q << 2) | 3));		
		end
	if (R>=0)
		Q = (Q << 1) | 1;
	else if(R<0)
		Q = (Q << 1) | 0;
	end
end
endmodule
