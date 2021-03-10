module digitalclk(clear,clock,sec,min,hr);
input clock,clear;
output [5:0]sec,min;
output [4:0]hr;
and a5(aa5,sec[0],sec[1],~sec[2],sec[3],sec[4],sec[5]);
jksflip jks1(clock,1'b1,1'b1,clear,aa5,sec[0]);
jksflip jks2(clock,sec[0],sec[0],clear,aa5,sec[1]);
and a1(aa1,sec[0],sec[1]);
jksflip jks3(clock,aa1,aa1,clear,aa5,sec[2]);
and a2(aa2,aa1,sec[2]);
jksflip jks4(clock,aa2,aa2,clear,aa5,sec[3]);
and a3(aa3,aa2,sec[3]);
jksflip jks5(clock,aa3,aa3,clear,aa5,sec[4]);
and a4(aa4,aa3,sec[4]);
jkmflip jks6(clock,aa4,aa4,clear,aa5,sec[5],m);
and a6(aa6,min[0],min[1],~min[2],min[3],min[4],min[5]);
jksflip jkm7(m,1'b1,1'b1,clear,aa6,min[0]);
jksflip jkm8(m,min[0],min[0],clear,aa6,min[1]);
and a8(aa8,min[0],min[1]);
jksflip jkm9(m,aa8,aa8,clear,aa6,min[2]);
and a9(aa9,aa8,min[2]);
jksflip jkm10(m,aa9,aa9,clear,aa6,min[3]);

and a10(aa10,aa9,min[3]);
jksflip jkm11(m,aa10,aa10,clear,aa6,min[4]);
and a11(aa11,aa10,min[4]);
jkmflip jkm12(m,aa11,aa11,clear,aa6,min[5],h);
and a12(aa12,hr[0],hr[1],hr[2],~hr[3],hr[4]);
jksflip jkh13(h,1'b1,1'b1,clear,aa12,hr[0]);
jksflip jkh14(h,hr[0],hr[0],clear,aa12,hr[1]);
and a13(aa13,hr[0],hr[1]);
jksflip jkh15(h,aa13,aa13,clear,aa12,hr[2]);
and a14(aa14,aa13,hr[2]);
jksflip jkh16(h,aa14,aa14,clear,aa12,hr[3]);
and a15(aa15,aa14,hr[3]);
jkmflip jkh17(h,aa15,aa15,clear,aa12,hr[4],y);
endmodule

module jksflip(clk,j,k,rst1,rst2,q);
input j,k,clk,rst1,rst2;
output reg q;
always@(posedge clk)
begin
if (rst1|rst2)
begin
q=0;
end
else
begin
if(j==0 & k==0)

begin
q=q;
end
else if(j==0 & k==1)
begin
q=0;
end
else if(j==1 & k==0)
begin
q=1;
end
else if(j==1 & k==1)
begin
q=(~q);
end
end
end
endmodule
module jkmflip(clk,j,k,rst1,rst2,q,t1);
input j,k,clk,rst1,rst2;
output reg q,t1;
always@(posedge clk)
begin
if (rst1|rst2)
begin
q=0;
t1=1;

end
else
begin
if(j==0 & k==0)
begin
q=q;
t1=0;
end
else if(j==0 & k==1)
begin
q=0;
t1=0;
end
else if(j==1 & k==0)
begin
q=1;
t1=0;
end
else if(j==1 & k==1)
begin
q=(~q);
t1=0;
end
end
end
endmodule
