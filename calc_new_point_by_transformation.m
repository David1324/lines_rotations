function rotated_point = calc_new_point_by_transformation(point, transformation_matrix)
    if size(point,1)==1
       point = point'; 
    end
    
    if size(point,1)==3
       point = [point ; 1]; 
    end
    
    rotated_point4 = transformation_matrix*point;
    rotated_point = rotated_point4(1:3);
end