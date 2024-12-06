operating_point = [0,0,0,0];
A = F_func(operating_point,0);
B = U_func(operating_point);

R=1;
Q=100*[.5,0,0,0;
   0,.5,0,0;
   0,0,1,0;
   0,0,0,1];
k_vert = lqr(A,B,Q,R);

operating_point_2 = [0,0,pi,0];
A = F_func(operating_point_2,0);
B = U_func(operating_point_2);

R=1;
Q=100*[.01,0,0,0;
   0,.01,0,0;
   0,0,100,0;
   0,0,0,.01];
k_down = lqr(A,B,Q,R);

function dFdu = U_func(xhat)

mb=2.3;
mp=1.4;
l=.88;
g=9.8;
Bp=.0178;
Bb=.734;

x1 = xhat(1);
x2 = xhat(2);
x3 = xhat(3);
x4 = xhat(4);

dFdu = [
                                       0;
            1/(- mp*cos(x3)^2 + mb + mp);
                                       0;
cos(x3)/(- l*mp*cos(x3)^2 + l*mb + l*mp)    
];

end

function dFdx = F_func(xhat,u)

mb=2.3;
mp=1.4;
l=.88;
g=9.8;
Bp=.0178;
Bb=.734;

x1 = xhat(1);
x2 = xhat(2);
x3 = xhat(3);
x4 = xhat(4);

dFdx = zeros(4,4);

dFdx(:,1)=[
0;
0;
0;
0];
dFdx(:,2)=[
                                             1;
                -Bb/(- mp*cos(x3)^2 + mb + mp);
                                             0;
-(Bb*cos(x3))/(- l*mp*cos(x3)^2 + l*mb + l*mp)];

dFdx(:,3)=[

                                                                                                                                                                                                                                                                                                                                                                                                                               0;
                                                                       (sin(x3)*(Bp*x4 - g*l*mp*sin(x3)))/(- l*mp*cos(x3)^2 + l*mb + l*mp) + (2*mp*cos(x3)*sin(x3)*(l*mp*sin(x3)*x4^2 - u + Bb*x2))/(- mp*cos(x3)^2 + mb + mp)^2 + (g*l*mp*cos(x3)^2)/(- l*mp*cos(x3)^2 + l*mb + l*mp) - (l*mp*x4^2*cos(x3))/(- mp*cos(x3)^2 + mb + mp) + (2*l*mp*cos(x3)^2*sin(x3)*(Bp*x4 - g*l*mp*sin(x3)))/(- l*mp*cos(x3)^2 + l*mb + l*mp)^2;
                                                                                                                                                                                                                                                                                                                                                                                                                               0;
(sin(x3)*(l*mp*sin(x3)*x4^2 - u + Bb*x2))/(- l*mp*cos(x3)^2 + l*mb + l*mp) - (l*mp*x4^2*cos(x3)^2)/(- l*mp*cos(x3)^2 + l*mb + l*mp) + (2*l*mp*cos(x3)^2*sin(x3)*(l*mp*sin(x3)*x4^2 - u + Bb*x2))/(- l*mp*cos(x3)^2 + l*mb + l*mp)^2 + (g*l*mp*cos(x3)*(mb + mp))/(- l^2*mp^2*cos(x3)^2 + l^2*mp^2 + mb*l^2*mp) + (2*l^2*mp^2*cos(x3)*sin(x3)*(Bp*x4 - g*l*mp*sin(x3))*(mb + mp))/(- l^2*mp^2*cos(x3)^2 + l^2*mp^2 + mb*l^2*mp)^2;
 ];

dFdx(:,4)=[

                                                                                                                            0;
                             - (Bp*cos(x3))/(- l*mp*cos(x3)^2 + l*mb + l*mp) - (2*l*mp*x4*sin(x3))/(- mp*cos(x3)^2 + mb + mp);
                                                                                                                            1;
- (Bp*(mb + mp))/(- l^2*mp^2*cos(x3)^2 + l^2*mp^2 + mb*l^2*mp) - (2*l*mp*x4*cos(x3)*sin(x3))/(- l*mp*cos(x3)^2 + l*mb + l*mp)
 ];
end