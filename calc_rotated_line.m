function [rotated_line, transformation_matrix] = calc_rotated_line(line, axis_line, theta)
    point1 = [line.point ; 1];
    point2 = [line.point + line.vec ; 1];
    [rotated_point1, transformation_matrix] = calc_rotated_point(point1, axis_line, theta);
    [rotated_point2, transformation_matrix] = calc_rotated_point(point2, axis_line, theta);
    rotated_vec = (rotated_point2(1:3)-rotated_point1(1:3));
    unit_rotated_vec = rotated_vec/norm(rotated_vec);
    rotated_line.point = rotated_point1;
    rotated_line.vec = unit_rotated_vec;
end