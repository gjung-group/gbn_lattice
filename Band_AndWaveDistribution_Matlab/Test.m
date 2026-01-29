B = -0.39969;
C = -0.4277;
A = -0.37776;
dx = 0.0;
dy = 0.0;
Interpolation(dx,dy,A,B,C,1)

dx = 0.0;
dy = 0.0;
pos = [dx,dy]
Onsite = Interpolation(dx,dy,A,B,C,1)

dx = 0.5;
dy = 0.5/sqrt(3);
pos = [dx,dy]
Onsite = Interpolation(dx,dy,A,B,C,1)

dx = 0.5001;
dy = 0.5/sqrt(3);
pos = [dx,dy]
Onsite = Interpolation(dx,dy,A,B,C,1)

dx = 0.4999;
dy = 0.5/sqrt(3);
pos = [dx,dy]
Onsite = Interpolation(dx,dy,A,B,C,1)

dx = 0.0;
dy = -1/sqrt(3);
pos = [dx,dy]
Onsite = Interpolation(dx,dy,A,B,C,1)