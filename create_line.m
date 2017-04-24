function line = create_line(point, vec)
    if size(point,1)==1
       point = point'; 
    end
    if size(vec,1)==1
       vec = vec'; 
    end    
    line.point = point;
    line.vec = vec;
end