clear;
close all;
clc;

%Written by David Cohn

point1=[9 9 1]';
vec1 = [1 -1 3]';
%line1 is rotating around axis_line until it intersects with line2
line1 = create_line(point1, vec1);

point2=[2 -9 1]';
vec2 = [-1 -2 0]';
%line2 is not moving (line1 is rotating towards it)
line2 = create_line(point2, vec2);

axis_point=[7 8 0]';
axis_vec = [1 8 1]';
axis_line = create_line(axis_point, axis_vec);


% point1=[9 0 0]';
% vec1 = [0 0 1]';
% line1 = create_line(point1, vec1);
% alpha=30;
% point2=[-9 0 0]';
% vec2 = [0 0 1]';
% line2 = create_line(point2, vec2);
% axis_point=[0 0 0]';
% axis_vec = [0 0 1]';
% axis_line = create_line(axis_point, axis_vec);

%calculating transformation matrix for making axis_line the same as z axis
transformation_matrix_to_z_axis = calc_transformation_to_make_axis_line_z_axis(axis_line);

transformed_line1 = calc_new_line_by_transformation(line1, transformation_matrix_to_z_axis);
transformed_line2 = calc_new_line_by_transformation(line2, transformation_matrix_to_z_axis);
transformed_axis_line = calc_new_line_by_transformation(axis_line, transformation_matrix_to_z_axis);
%now transformed_axis_line should be z axis

[transformed_line1_new_representation, is_possible1] = calc_line_new_representation(transformed_line1);
[transformed_line2_new_representation, is_possible2] = calc_line_new_representation(transformed_line2);

if or(~is_possible1, ~is_possible2)
    %angles = calc_angles_for_lines_with_constant_z(line1, line2);
    error('line1 or line2 are with constant z. need to write relevant code for that');
else
    %now line1 and line2 are represented by a point on plane Z=0 and a
    %vector from that point to a point on plane Z=1 (assuming they don't have a constant Z value).
    %and axis_line is a line parallel to z axis
    %Therefore, we want to find two points so that one of them belongs to line1
    %and the other belongs to line2 and the distance between them to z axis
    %(the axis line) is the same.

    %t can have 0, 1 or 2 values
    %line1 = [p1x, p1y, 0]+t*[v1x, v1y, 1]
    %line2 = [p2x, p2y, 0]+t*[v2x, v2y, 1]
    %it's the same t for both lines since for the same t the Z value is the
    %same in both lines and that's what we care about (angle of rotation around
    %Z axis with the same value of Z all the time).
    t = calc_t_of_equal_distance_from_z_axis(transformed_line1_new_representation, transformed_line2_new_representation);
    relevant_points = calc_relevat_points(transformed_line1_new_representation, transformed_line2_new_representation, t);
    num_of_solutions = length(t);
    if num_of_solutions==0
       fprintf('line1 and line2 never intersect\n'); 
    end
    angles = calc_angles_of_rotation(relevant_points, num_of_solutions);   
end

inv_transformation_matrix_to_z_axis = inv(transformation_matrix_to_z_axis);
new_relevant_points = calc_relevant_points_on_original_lines(relevant_points, inv_transformation_matrix_to_z_axis, num_of_solutions);
simulate_rotation_until_intersection(line1, line2, axis_line, angles, new_relevant_points);

