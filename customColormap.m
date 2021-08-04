function cmap = customColormap(colorArray, n, method)

%%***********************************************************************%
%*                           Custom colormap                            *%
%*        Creates a custom colormap given the colors range array.       *%
%*                                                                      *%
%* Code author: Preetham Manjunatha                                     *%
%* Github link: https://github.com/preethamam
%* Date: 08/02/2021                                                     *%
%************************************************************************%
%
%************************************************************************%
%
% Usage: cmap = customColormap(colorArray, n)
% Inputs: colorArray    - color array containing RGB triplet - [N x 3]
%                          Example: map = [0 0 1
%                                          0 1 0
%                                          1 1 0 
%                                          1 0 0]; [blue, green, yellow, red]
%         n             - linearDivisions - integer scalar - default n = 50
%                         (optional)
%         method        - Interpolation method - 'linear' (default) 
%                         | 'nearest' | 'cubic' | 'spline' | 'makima'
%                         (optional)
% 
% Outputs: cmap - interpolated color map

% Input arguments check
if (nargin < 1)
    error('Require color array.')
end

if(nargin < 3)
    method = 'linear';
end

if (nargin < 2)
    n = 50;
    method = 'linear';
end

% Mesh of indices
maxGridValue = n*(size(colorArray,1)-1);
[X,Y] = meshgrid(1:3,1:maxGridValue);  

xx = X([1, n:n:maxGridValue],:);
yy = Y([1, n:n:maxGridValue],:);

% Interpolate colormap
cmap = interp2(xx, yy, colorArray, X, Y, method); 

end

