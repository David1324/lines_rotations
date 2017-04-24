function new_theta_for_intersection = simulate_line_rotation_towards_other_line(fixed_line, line2, axis_line, theta_for_intersection, relevant_points)
    point1 = relevant_points{1,1};
    point2 = relevant_points{1,2};
    new_theta_for_intersection = take_angle_or_its_complementary_to_360_degrees(theta_for_intersection, fixed_line, line2, axis_line, point1, point2);
    
    %theta_range = linspace(0,new_theta_for_intersection, 10);
    theta_range = 0:3:new_theta_for_intersection;
    theta_range = [theta_range new_theta_for_intersection];
    for theta = theta_range
        cla;        
        set_figure();    
        axis_line_color = [0 0 1];
        plot_line(axis_line, axis_line_color, -30, 30);
        hold on;
        fixed_line_color = [0 1 0];
        plot_line(fixed_line, fixed_line_color, -30, 30);
        rotated_line_color = [1 0 0];   
        sz=15;
        [rotated_line, transformation_matrix] = calc_rotated_line(line2, axis_line, theta);
        plot_line(rotated_line, rotated_line_color, -30, 30);
        %plot_angle(theta, rotated_line);
        
        scatter3(point1(1), point1(2), point1(3), sz, 'MarkerEdgeColor',fixed_line_color,'MarkerFaceColor',fixed_line_color);
        
        rotated_point2 = calc_new_point_by_transformation(point2, transformation_matrix); 
        scatter3(rotated_point2(1), rotated_point2(2), rotated_point2(3), sz, 'MarkerEdgeColor',rotated_line_color,'MarkerFaceColor',rotated_line_color);
        pause(0.1);
    end
end