function set_figure()
%     view(30,60);
    axis equal;
    limit=30;
    min_x=-limit;
    max_x=limit;
    min_y=-limit;
    max_y=limit;
    min_z=-limit;
    max_z=limit;
%     min_x = -400;
%     max_x = 400;
%     min_y = -100;
%     max_y = 100;
%     min_z = -100;
%     max_z = 600;
    axis([min_x max_x min_y max_y min_z max_z]);
    grid on;
    hold on;
    xlabel('X');
    ylabel('Y');
    zlabel('Z');
end