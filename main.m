x = linspace(0,2*pi,100);  %rotating the u_joint 360 degrees
A = ones(1,100); %for plotting
in = 1; %unit input velocity

hold
for i=[0,pi/8,pi/4,pi/3] %different misalignment to try
delta = i;
gamma = 0;
theta = sqrt((delta^2 - gamma^2)); %calculating theta
out = @(alpha, theta_eff) (in*cos(theta_eff))/...
        (1-(sin(alpha))^2*(sin(theta_eff))^2); %calculating output

plot(x,arrayfun(out,x, A*theta));
end


title('Output Velocity with a Uniform Input Velocity')
xlabel('Axial Rotation')
ylabel('Unit Output Velocity')
legend('0', '\pi/8', '\pi/4', '\pi/3')