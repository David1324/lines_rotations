function new_line = calc_new_line_by_transformation(line, transformation)
    point1 = line.point;
    point2 = line.point + line.vec;
    new_point1 = calc_new_point_by_transformation(point1,transformation);
    new_point2 = calc_new_point_by_transformation(point2,transformation);
    new_line.point = new_point1;
    vec = new_point2 - new_point1;
    new_line.vec = vec/norm(vec);
end