function T = T(theta)
C = cosd(theta);
S = sind(theta);
T = [C  S  0  0;
    -S  C  0  0;
     0  0  C  S;
     0  0 -S  C];
end