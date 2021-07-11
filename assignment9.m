% upper left white square
x_w1 = [0 0 -4 -4];
y_w1 = [0 4 4 0];
s_white1 = [x_w1(:) y_w1(:)];

% bottom left white square
x_w2 = [0 0 -4 -4];
y_w2 = [0 -4 -4 0];
s_white2 = [x_w2(:) y_w2(:)];

% bottom right white square
x_w3 = [0 0 4 4];
y_w3 = [0 -4 -4 0];
s_white3 = [x_w3(:) y_w3(:)];

% red square
x_r = [0 0 4 4];
y_r = [0 4 4 0];
s_red = [x_r(:) y_r(:)];

% gray square
x_g = [0 0 1 1];
y_g = [0 1 1 0];
s_gray = [x_g(:) y_g(:)];

% black square
x_b = [0 0 2 2];
y_b = [0 2 2 0];
s_black = [x_b(:) y_b(:)];

for t = 0:pi/180:2*pi
    % Rotation matrix
    R = [cos(t) -sin(t); sin(t) cos(t)];
    % executing the rotation
    s_black_rotate = s_black*R;
    
    % plotting
    fill(s_white1(:,1), s_white1(:,2), "w")
    hold on
    fill(s_white2(:,1), s_white2(:,2), "w")
    hold on
    fill(s_white3(:,1), s_white3(:,2), "w")
    hold on
    fill(s_red(:,1), s_red(:,2), "r")
    fill(s_black_rotate(:,1), s_black_rotate(:,2), "k")
    hold on
    fill(s_gray(:,1), s_gray(:,2), [0.5 0.5 0.5]);
    hold off

    % Animation can be done in different ways
    %pause(0.01)    % waits 0.01 seconds between plottings
    drawnow     % executes as fast as the computer can
end
