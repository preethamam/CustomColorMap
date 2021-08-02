clc; close all; clear;

colorArray  = [0 0 1
               0 1 0
               1 1 0
               1 0 0];
           
cmap = customColormap(colorArray);

[X,Y,Z] = peaks(25);
surf(X,Y,Z)
colormap(cmap);
colorbar;
xlabel('X'); ylabel('Y'); zlabel('Z');