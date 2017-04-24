function [new_line, is_possible] = calc_line_new_representation(line)
    plane1.normal = [0 0 1]';
    plane1.point = [0 0 0]';
    %intersection with Z=0
    [point_intersection1, is_line_parallel1, is_line_contained_in_plane1] = calc_intersection_between_plane_and_line(plane1,line);
    
    plane2.normal = [0 0 1]';
    plane2.point = [0 0 1]';
    %intersection with Z=1
    [point_intersection2, is_line_parallel2, is_line_contained_in_plane2] = calc_intersection_between_plane_and_line(plane2,line); 
    
    if (and(~isinf(point_intersection1) , ~isinf(point_intersection2)))
        new_line.point = point_intersection1;
        new_line.vec = point_intersection2-point_intersection1;
        is_possible = true;
    else
        new_line = inf;
        is_possible = false;
    end
end