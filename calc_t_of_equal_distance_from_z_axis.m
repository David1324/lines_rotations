function t = calc_t_of_equal_distance_from_z_axis(line1, line2)
    t=[];
    v1x=line1.vec(1);
    v1y=line1.vec(2);
    p1x=line1.point(1);
    p1y=line1.point(2);
    
    v2x=line2.vec(1);
    v2y=line2.vec(2);
    p2x=line2.point(1);
    p2y=line2.point(2); 
    
    if v1x==0 && v1y==0 && v2x==0 && v2y==0
       t=3; %arbitrary. t can be any number
       return;
    end
    
    a=(v1x^2+v1y^2)-(v2x^2+v2y^2);
    b=(v1x*p1x+v1y*p1y)-(v2x*p2x+v2y*p2y);
    c=(p1x^2+p1y^2)-(p2x^2+p2y^2);
    
    epsilon = 0.00000001;
    
    %solving t for the equation a*t^2+2bt+c=0
    determinant = b^2-a*c;
    if determinant<0
        %no solution
        return;      
    elseif determinant<epsilon
        %one solution
        if abs(a)<epsilon
           error('a=0 (division by zero)'); 
        end
        t = -b/a;
    else
        %two solutions
        t(1) = (-b+sqrt(determinant))/a;
        t(2) = (-b-sqrt(determinant))/a;
    end
    
%     num_of_solutions = length(t);
%     for i=1:num_of_solutions
%        solution = a*t(i)^2+2*b*t(i)+c; 
%     end
end