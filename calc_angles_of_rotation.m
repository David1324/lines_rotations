function angles = calc_angles_of_rotation(relevant_points, num_of_solutions)
    angles=[];
    if num_of_solutions==0
       %no angle
       return; 
    end
    epsilon = 0.00001;
    for i=1:num_of_solutions
        point1 = relevant_points{i,1};
        point2 = relevant_points{i,2};
       %distance of point1 and point2 from z axis should be the same
       dist1_square = point1(1)^2+point1(2)^2;
       dist2_square = point2(1)^2+point2(2)^2;
       %dist1_square and dist2_square should be the same
       if abs(dist1_square-dist2_square)>epsilon
           error('distances are not the same');
       end
       %z value of both points should be the same
       if abs(point1(3)-point2(3))>epsilon
          error('z values are not the same in both points'); 
       end
       vec1 = [point1(1), point1(2), 0]';
       vec2 = [point2(1), point2(2), 0]';
       vec1_unit = vec1/norm(vec1);
       vec2_unit = vec2/norm(vec2);
       cos_angle = dot(vec1_unit, vec2_unit);
       if cos_angle>1
          cos_angle=1; 
       end
       if cos_angle<-1
          cos_angle=-1; 
       end
       angles(i) = acosd(cos_angle);     
    end
end