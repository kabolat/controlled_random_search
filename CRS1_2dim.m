clc; clear all; close all;

ObjFig = figure;
CRS1Fig = figure;

%% Objective Function Definition and Visualization

f = @(x)rosenbrock(x);

L=[-3 -3;
    3  3]; %%Upper & Lower Bounds for Each Variable

figure(ObjFig)
subplot 121
f3 = @(x,y)reshape(f([x(:),y(:)]),size(x));
fsurf(f3,L(:)')
xlabel('x')
ylabel('y')
subplot 122
fcontour(f3,L(:)','Fill','on')
xlabel('x')
ylabel('y')

%% CRS Initilization

n=2;    %%Number of Variables
Nsize=20;   %%Number of Points to be Stored
stopCrit = 1e-6;

N = rand(Nsize,n); %%Choose N Random x_i(1xn)
N = (N-.5).*(L(2,:)-L(1,:))+(L(2,:)+L(1,:))/2; %%Normalize wrt Boundaries

A = f(N);
func_eval = Nsize;
disp(['Number of Funtion Evaluations:' num2str(func_eval)])

figure(CRS1Fig)
fcontour(f3,L(:)')
xlabel('x')
ylabel('y')
hold on
h1 = plot(N(:,1),N(:,2),'kx','LineWidth',2);
hold off

[f_M,ind_M] = max(A);
f_L = min(A);
h2 = []; h3 = []; h4 = [];

acc = 2;
while f_M-f_L>stopCrit
    
    figure(CRS1Fig)
    hold on
    delete(h1);
    h1 = plot(N(:,1),N(:,2),'kx','LineWidth',2);
    hold off
    drawnow
       
    validFlag=false;
    while ~validFlag
        %%Randomly Select (n+1) Individuals from N
        rand_indx = randperm(size(N,1));
        R = N(rand_indx,:);
        R = R(1:n+1,:);
                
        %%Calculate the Centroid of the First n Individuals of R
        G = 1/n*sum(R(1:n,:));
        
        %%Calculate the Next Trial Point via Reflection
        P = 2*G-R(n+1,:);
        
        figure(CRS1Fig)
        hold on
        delete(h2);delete(h3); delete(h4);
        h3 = plot(R(:,1),R(:,2),'rx', R(1:n,1),R(1:n,2),'-.r','LineWidth',1);
        h4 = plot(P(1),P(2),'ro', [P(1) R(3,1)],[P(2) R(3,2)],'-.r','LineWidth',1);
        hold off
        xlim(L(:,1)');ylim(L(:,1)');
        drawnow
        
        %%Check the Validity of P
        if prod(P>L(1,:)) && prod(P<L(2,:))
            validFlag=true;
        else
            validFlag=false;
        end
        
        %%Check f_P<f_M?
        if validFlag
            f_P = f(P);
            func_eval = func_eval+1;
            disp(['Number of Funtion Evaluations:' num2str(func_eval)])
            
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

disp(['x* = [' num2str(N(ind_L,:)) ']'])
disp(['f(x*) = ' num2str(f_L)])


