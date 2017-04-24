function angles = calc_angles_for_lines_with_constant_z(line1, line2)
    vec1 = line1.vec;
    vec2 = line2.vec;
    z_dir = [0 0 1];
    epsilon=0.00000001;
    is_line1_constant_z = norm(cross(vec1,z_dir))<epsilon;
    is_line2_constant_z = norm(cross(vec2,z_dir))<epsilon;
    
    if and(is_line1_constant_z, is_line2_constant_z)
        %both lines line1 and line2 have constant z
        z_val1 = line1.point(3);
        z_val2 = line2.point(3);
        if z_val1 ~= z_val2
            %line1 will never intersect with line2
           angles=[];
           return;
        else
            %line1 and line2 are in the same plane
            diff_vecs = line1.vec - line2.vec;
            norm_diff_vecs = norm(diff_vecs);
            if norm_diff_vecs < epsilon
                %line1 and line2 are parallel
                %there are infinite angles that will make the lines intersect
                %(any angle but 0 and 180 degrees).
                angles = 10; %arbitrary chosen
            else
                %lines are already intersecting
                angles=0;
            end
        end 
    elseif is_line1_constant_z
        %line1 is is with constant z
        %line2 is not
        %line1 is the line which is rotating
        %we need to find the point intersection between line2 and the plane
        %z_val where z_val is the z values line1 is in.
        %then we need to check for whi
        t = line1.point(3);
        
    end
end