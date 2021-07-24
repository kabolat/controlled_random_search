function f = holder(x)

f = -abs(sin(x(:,1)).*cos(x(:,2))...
    .*exp(abs(1-sqrt(sum(x.^2,2))/pi)));

end