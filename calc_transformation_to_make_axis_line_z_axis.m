function transformation_matrix = calc_transformation_to_make_axis_line_z_axis(axis_line)
    axis_line.vec=axis_line.vec/norm(axis_line.vec);
    u = axis_line.vec(1);
    v = axis_line.vec(2);
    w = axis_line.vec(3);
    a = axis_line.point(1);
    b = axis_line.point(2);
    c = axis_line.point(3);
    epsilon=0.00000001;

    if norm(cross(axis_line.vec, [0,0,1]))<epsilon
        %if the axis line is parallel to Z axis
        transformation_matrix = eye(4);       
        return;
    end

    T_p1 = [1 0 0 -a;
        0 1 0 -b;
        0 0 1 -c;
        0 0 0 1];   
    inv_T_p1 = inv(T_p1);
    
    %T_xz is the matrix to rotate a vector about the z -axis to the xz -plane
    denominator_xz = sqrt(u*u+v*v);
    T_xz = [ u/denominator_xz v/denominator_xz 0 0;
            -v/denominator_xz u/denominator_xz 0 0;
            0 0 1 0;
            0 0 0 1];
    inv_T_xz = inv(T_xz);

    %T_z is the matrix to rotate the vector in the xz -plane to the z -axis
    denominator_z = sqrt(u*u+v*v+w*w);
    T_z = [ w/denominator_z 0 -denominator_xz/denominator_z 0;
            0 1 0 0;
            denominator_xz/denominator_z 0 w/denominator_z 0;
            0 0 0 1];
    inv_T_z = inv(T_z);

    transformation_matrix = T_z*T_xz*T_p1;
end