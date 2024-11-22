% States 
% x1: x cart
% x2: xdot cart
% x3: theta
% x4: theta dot

% function zdot = fcn(z,u)
% zdot=zeros(4,1);
% mb=2.3;
% mp=1.4;
% l=.88;
% g=9.8;
% Bp=.0178;
% Bb=.734;
% M=[mp+mb,           -mp*l*cos(z(3));
%    -mp*l*cos(z(3)), mp*l^2];
% b=[u - mp*l*sin(z(3))*z(4)^2-Bb*z(2);
%     mp*g*l*sin(z(3))-Bp*z(4)];
% temp=M^-1*b;
% 
% zdot(1)=z(2);
% zdot(2)=temp(1);
% zdot(3)=z(4);
% zdot(4)=temp(2);
% end

rng(1234);
Tfinal=20;
step_size = .01;
init_cond = [0, 0, 10*pi/180, 0];
x_variance = .05; % meters
theta_variance = 5*pi/180; % radians
sim("model")
%%
figure;
hold on;
plot(t_out, x_out(:, 1));
plot(t_out, x_out(:, 2));
plot(t_out, x_out(:, 3));
plot(t_out, x_out(:, 4));
plot(t_out, z_out(:, 1));
plot(t_out, z_out(:, 2));
legend('x','x dot', 'theta','theta dot', "x noise", "theta noise");


% figure;
% plot(z_out);
% figure;
% plot(noise);