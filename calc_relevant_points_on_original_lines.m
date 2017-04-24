function new_relevant_points = calc_relevant_points_on_original_lines(relevant_points, transformation, num_of_solutions)
    new_relevant_points=cell(2,2);
    for i=1:2
        for j=1:2
            current_point =  relevant_points{i,j};
            size_current_point = size(current_point,1);
            if size_current_point==0
               continue; 
            else
                new_point = calc_new_point_by_transformation(current_point,transformation);
                new_relevant_points{i,j}=new_point;
            end
        end
    end
end