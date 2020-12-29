function Sigma()
    Sum = 0;
    for ii = 1:1000
        Sum = Sum + pwr(ii,ii);
        Sum = mod(Sum, 10^10);
    end
    fprintf("The answer is: %d\n", Sum)
end

function ans = pwr(n,p)
    if p == 1
        ans = n;
        return;
    end
    if p == 0
        ans = 1;
        return;
    end
    if mod(p,2) == 0
        p = p/2;
        ans = mod(pwr(n,p),10^10);
        % disp("1 time")
        ans1 = mod(ans, 10^5);
        ans2 = (ans - ans1)/10^5;
        ans1 = mod(ans1*ans, 10^10);
        ans2 = mod(ans2*ans, 10^10);
        ans = mod(mod(ans2, 10^10)*10^5 + ans1, 10^10);
        % ans = mod(ans^2,10^10);
        return;
    end
    if mod(p,2) == 1
        p = (p - 1)/2;
        ans = mod(pwr(n,p),10^10);
        % disp("2 time")
        ans1 = mod(ans, 10^5);
        ans2 = (ans - ans1)/10^5;
        ans1 = mod(ans1*ans, 10^10);
        ans2 = mod(ans2*ans, 10^10);
        ans = mod(mod(ans2, 10^10)*10^5 + ans1, 10^10);
        % ans = mod(ans*ans,10^10);
        ans = mod(ans*n,10^10);
        return;
    end
end