rng(1234);
Tfinal=20;
step_size = .005;
init_cond = [0; 0; 180*pi/180; 0];


x_variance = .001; % meters
theta_variance = 5*pi/180; % radians
s1_variance = .005;
s2_variance = .01;
s3_variance = .05;
s4_variance = .1;



% Variance deleter
% x_variance=.0001;theta_variance=.0001;s1_variance=.0001;s2_variance=.0001;s3_variance=.0001;s4_variance = .0001; x_variance=0.00001; theta_variance=0.0001;



Q = [s1_variance,0,0,0;
     0,s2_variance,0,0;
     0,0,s3_variance,0;
     0,0,0,s4_variance];
R = [x_variance,0;0,theta_variance];
run("lqr_calcs_2.m")
sim("model")
%%

figure(1)
plot(xhat);
legend('x','xdot','theta','thetadot');

figure(2)
plot(x_out);
legend('x','xdot','theta','thetadot');

figure(3)
plot(z_out);
legend('x','theta');

figure(4)
plot(control_effort);
