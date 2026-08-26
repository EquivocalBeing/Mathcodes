function res = rotation_matrix(rot, theta, ang)



if ang == "deg"

    if rot == "rz"
        quuux = [[cosd(theta), -sind(theta), 0];
                 [sind(theta),  cosd(theta), 0];
                 [     0,          0,      1]];
    elseif rot == "ry"
        quuux = [[ cosd(theta), 0, sind(theta)];
                 [     0,      1,     0     ];
                 [-sind(theta), 0, cosd(theta)]];
    elseif rot == "rx"
        quuux = [[1,      0,           0    ];
                 [0, cosd(theta), -sind(theta)];
                 [0, sind(theta),  cosd(theta)]];
    else
        fprintf("invalid")
    end

elseif ang == "rad"

    if rot == "rz"
        quuux = [[cos(theta), -sin(theta), 0];
                 [sin(theta),  cos(theta), 0];
                 [     0,          0,      1]];
    elseif rot == "ry"
        quuux = [[ cos(theta), 0, sin(theta)];
                 [     0,      1,     0     ];
                 [-sin(theta), 0, cos(theta)]];
    elseif rot == "rx"
        quuux = [[1,      0,           0    ];
                 [0, cos(theta), -sin(theta)];
                 [0, sin(theta),  cos(theta)]];
    else
        fprintf("invalid")
    end
end

res = quuux;