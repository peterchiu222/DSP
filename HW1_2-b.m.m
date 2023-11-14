a = [1, -1.8*cos(pi/16), 0.81];
b = [1, 0.5];

% 計算單位脈衝響應
n = -10:100; % n為-10到100
impulse_response = filter(b, a, [1 zeros(1, length(n)-1)]);

% 繪製單位脈衝響應 h[n]
stem(n, impulse_response);
xlabel('n');
ylabel('h[n]');
title('單位脈衝響應2 h[n]');