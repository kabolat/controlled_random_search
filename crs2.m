function [x_star, f_L] = crs2(f, n, lim, Nsize, maxEvals)

N = rand(Nsize,n);
N = (N-.5)*2*lim;
A = f(N);
func_eval = Nsize;

[f_M,ind_M] = max(A);
[~,ind_L] = min(A);

while maxEvals>func_eval
      
    validFlag=false;
    while ~validFlag
        N_ = N; N_(ind_L,:) = [];
        R = N_(randperm(size(N_,1)),:);
        R = [N(ind_L,:);R(1:n,:)];
        
        %%Calculate the Centroid of the First n Individuals of R
        G = 1/n*sum(R(1:n,:));
        
        %%Calculate the Next Trial Point via Reflection
        P = 2*G-R(n+1,:);
        
        %%Check the Validity of P
        if prod(P>-lim) && prod(P<lim)
            validFlag=true;
        else
            validFlag=false;
        end
        
        %%Check f_P<f_M?
        if validFlag
            f_P = f(P);
            func_eval = func_eval+1;
            if maxEvals<func_eval
                break
            end
            
            if f_P<f_M
                N(ind_M,:) = P;
                A(ind_M) = f_P;
            else
                validFlag = false;
            end
        end 
    end
    
    
    [f_M,ind_M] = max(A);
    [f_L,ind_L] = min(A);
    
end

x_star = N(ind_L,:);
end