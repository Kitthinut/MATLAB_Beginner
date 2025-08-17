%% MATLAB Roadmap: Clean Display Version
clc

%% Step 1: Interface & Command Basics
fprintf('==================== Step 1: Basics ====================\n');
a = 5;             
b = 10;
c = a + b;         
fprintf('c = %d\n', c)

clear a;           
save data.mat b;   
load data.mat;     
fprintf('Variables saved and loaded.\n\n');

%% Step 2: Vector & Matrix Operations
fprintf('================ Step 2: Vectors & Matrices ================\n');
v = [1 2 3 4];     
M = [1 2; 3 4];    

fprintf('v = [%s]\n', num2str(v))
fprintf('v(2) = %d\n', v(2))
fprintf('M =\n'); disp(M)
fprintf('M(2,1) = %d\n', M(2,1))

v2 = v .* 2;       
M2 = M * [5;6];    
fprintf('v2 = [%s]\n', num2str(v2))
fprintf('M2 = [%s]\n\n', num2str(M2.'))

%% Step 3: Visualization
x = 0:0.1:10;      % make sure x is a row vector
y1 = sin(x);       
y2 = cos(x);

figure('Name','Sin & Cos Plots','NumberTitle','off')
subplot(2,1,1)
plot(x,y1,'r','LineWidth',2)
grid on
title('sin(x)')
xlabel('x'), ylabel('sin(x)')

subplot(2,1,2)
plot(x,y2,'b--','LineWidth',2)
grid on
title('cos(x)')
xlabel('x'), ylabel('cos(x)')

disp('Press any key to continue to the next step...')
pause


%% Step 4: Calculus Tools
fprintf('=================== Step 4: Calculus ====================\n');
syms x_sym
df = diff(sin(x_sym),x_sym);        
int_val = int(exp(-x_sym^2),x_sym); 

fprintf('Derivative of sin(x) = %s\n', char(df))
fprintf('Symbolic integral of exp(-x^2) = %s\n', char(int_val))

% Numerical integration
x = 0:0.1:5;
y = exp(-x.^2);
area_num = trapz(x,y);              
fprintf('Numerical area = %.4f\n\n', area_num)

%% Step 5: ODE Solving
fprintf('==================== Step 5: ODE Solving ==================\n');
f = @(t,y) -2*y;
[t,y] = ode45(f,[0 5],1);
fprintf('ODE solved: dy/dt = -2y (see figure)\n\n');

figure
plot(t,y,'LineWidth',2)
xlabel('t'), ylabel('y')
title('dy/dt = -2y')

%% Step 6: Simulation & Animation
fprintf('==================== Step 6: Simulation & Animation ==================\n');
disp('Pendulum animation starting...')
disp('Press any key to start animation...')
pause  % Wait until user presses a key

figure('Name','Pendulum','NumberTitle','off') 

for k = 1:length(theta)
    x_p = L*sin(theta(k));
    y_p = -L*cos(theta(k));
    
    plot([0 x_p], [0 y_p], 'o-', 'LineWidth', 2)
    axis equal
    axis([-1.5 1.5 -1.5 0.5])
    title('Pendulum Animation')
    drawnow
    pause(0.05)
end

