function relevant_points = calc_relevat_points(line1, line2, t)
    %calculating the points in line1, line2 that will intersect after
    %rotationg line2 around z axis towards line1
    relevant_points=cell(2,2);
    num_of_solutions = length(t);
    if num_of_solutions==0
       %no angle
       return; 
    end
    for i=1:num_of_solutions
       point1 = line1.point + t(i)*line1.vec; 
       point2 = line2.point + t(i)*line2.vec;
       relevant_points{i,1}=point1;
       relevant_points{i,2}=point2;    
    end
end