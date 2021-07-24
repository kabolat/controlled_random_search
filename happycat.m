function f = happycat(x,alpha)

f = ((vecnorm(x')'.^2-size(x,2)).^2).^alpha+ 1/size(x,2)*(1/2*vecnorm(x')'.^2+sum(x,2))+1/2;

end