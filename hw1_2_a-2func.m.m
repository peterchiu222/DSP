function y = hw1_2_a_func(x, n)
    if (n < 11)
        y = 0;
    elseif (n == 11) %#回傳x(11)
        y = x(11);
    else %#回傳recursive
        y = 1.8*cos(pi/16)*hw1_2_a_func(x, n-1) - 0.81 * hw1_2_a_func(x, n-2) + x(n) + 0.5*x(n-1);
    end