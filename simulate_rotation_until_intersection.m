function simulate_rotation_until_intersection(line1, line2, axis_line, angles, relevant_points)
    num_of_angles = length(angles);
    if num_of_angles==0
       return; 
    end
    fixed_line = line1;
    figure('units','normalized','outerposition',[0 0 1 1]);
    for i=1:num_of_angles
        subplot(1,2,i);
        theta_for_intersection = angles(i);
        relevant_points_i = cell(1,2);
        relevant_points_i{1} = relevant_points{i,1};
        relevant_points_i{2} = relevant_points{i,2};                 
        new_theta_for_intersection = simulate_line_rotation_towards_other_line(fixed_line, line2, axis_line, theta_for_intersection, relevant_points_i);
        figure_title = sprintf('option %d for intersection:\nline1 (red) rotating %3.2f degrees around axis line (blue)\n towards line2 (green)',i, new_theta_for_intersection);
        title(figure_title);
    end
end