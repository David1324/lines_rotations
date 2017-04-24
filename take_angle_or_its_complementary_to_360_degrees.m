function new_angle = take_angle_or_its_complementary_to_360_degrees(angle, line1, line2, axis_line, point1, point2)
    angle1=angle;
    [rotated_line, transformation_matrix_for_intersection] = calc_rotated_line(line2, axis_line, angle1);
    rotated_point2 = calc_new_point_by_transformation(point2, transformation_matrix_for_intersection);
    diff_points1 = point1-rotated_point2;
    norm_diff_points1 = norm(diff_points1);
    
    angle2=360-angle;
    [rotated_line, transformation_matrix_for_intersection] = calc_rotated_line(line2, axis_line, angle2);
    rotated_point2 = calc_new_point_by_transformation(point2, transformation_matrix_for_intersection);
    diff_points2 = point1-rotated_point2;
    norm_diff_points2 = norm(diff_points2);
    
    epsilon=0.000001;
    if norm_diff_points1<epsilon
        new_angle = angle1;
    elseif norm_diff_points2<epsilon
        new_angle = angle2;
    else
        new_angle = angle1;
        error('none of the angles fit');
    end

end