function plot_line(line, line_color, t1, t2)
    point = line.point;
    vec = line.vec;
    
    x1 = point(1) + t1*vec(1);
    x2 = point(1) + t2*vec(1);
    
    y1 = point(2) + t1*vec(2);
    y2 = point(2) + t2*vec(2);
    
    z1 = point(3) + t1*vec(3);
    z2 = point(3) + t2*vec(3);
    
    x=[x1 x2];
    y=[y1 y2];
    z=[z1 z2];
    
    plot3(x,y,z, 'color', line_color, 'LineWidth', 1);
    %patch(x, y, z,'EdgeColor', line_color, 'EdgeAlpha', 0.5, 'FaceColor', 'none');
    %scatter3(x,y,z);
end