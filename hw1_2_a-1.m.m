x = zeros(1,111);%#不能小於0 所以範圍取1 ~ 111
x(11) = 1;
y = zeros(1,111);
for i = 1 : 40
     y(i) = hw1_2_a_func(x,i);
end
stem(-10:100,y);