function [point_intersection, is_line_parallel, is_line_contained_in_plane] = calc_intersection_between_plane_and_line(plane,line)
    %from thie link:
    %https://en.wikipedia.org/wiki/Line%E2%80%93plane_intersection
    p0 = plane.point;
    n = plane.normal;
    l = line.vec;
    l0 = line.point;
    is_line_parallel = false;
    is_line_contained_in_plane = false;

    if dot(l,n)==0
        %the given line and plane are parallel
        point_intersection = inf;
        is_line_parallel = true;
        if dot(p0-l0, n)==0
            is_line_contained_in_plane = true;
        end
        return;
    end
    
    d = dot(p0-l0, n)/dot(l,n);
    point_intersection = d*l+l0;
end