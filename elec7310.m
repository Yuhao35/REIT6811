objective = @(x) -(80*x(1) + 60*x(2));
% Since the fmincon function is used to find the minimum value, we need to add a minus sign before the objective function to convert the maximum value problem into a minimum value problem.
x0 = [0, 0]; 
% The algorithm will start searching from the point [0,0] to find the x and y values ​​that satisfy the maximum benefit requirement.
A = [6, 4;   % Raw material Required for Chair A and Chair B
     4, 6];  % Time Reqiured to Produce Chair A and Chair B
b = [240;    % The total avaliable raw material
     180];   % The total avaliable time
% A and b are used to define the coefficient on the left side of the inequality and the constant on the right side of the constraint, respectively.
lb = [0, 0];
% Indicates that the values ​​of x1 and x2 are both greater than or equal to 0
ub = [];    
% Indicates that the values ​​of x1 and x2 have no upper limit
Aeq = [];
beq = [];
nonlcon = [];
% Since we do not use linear equality constraints and nonlinear constraints in our optimization problem, we need to set them to empty.
options = optimoptions('fmincon', 'Display', 'iter', 'Algorithm', 'sqp');
% In options, we set the optimization algorithm. Setting Display to iter allows us to observe the optimization process, and setting Algorithm to sqp allows us to handle constrained optimization problems.
[x_opt, fval_opt] = fmincon(objective, x0, A, b, Aeq, beq, lb, ub, nonlcon, options);
% Call fmincon function to solve
fprintf('A-type chair production quantity: %.2f\n', x_opt(1));
fprintf('B-type chair production quantity: %.2f\n', x_opt(2));
fprintf('Maximum profit: %.2f\n', -fval_opt); % Add a minus sign to convert the minimum value back to the maximum value
% Display results
fprintf('Maximum profit: %.2f\n', -fval_opt);
