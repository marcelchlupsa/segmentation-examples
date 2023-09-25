function [map_out] = padfaces(map_in, varargin)

%% Marcel Chlupsa
% opened 15 Nov 2022
% last edit 7 Apr 2023

% PURPOSE: pad the 6 faces (4 edges) of a 3-D (2-D) array with a 
% 1-voxel-thick buffer of either zeros, ones, nan, or a copy of the faces (edges)

% INPUTS:
% map_in == the 2D or 3D volume array you seek to modify
% varargin == flag for the type of padding you desire
    % option 1 == 'zeros'
    % option 2 == 'copy'
    % option 3 == 'nan'
    % option 4 == 'ones'

% OUTPUTS:
% map_out: the padded 2D or 3D volume array

%%
if ndims(map_in)==3
    if strcmpi(varargin,'zeros')==1
        [~,m,n] = size(map_in);
        map_out = cat(1,zeros(1,m,n),map_in,zeros(1,m,n));
        [l,~,n] = size(map_out);
        map_out = cat(2,zeros(l,1,n),map_out,zeros(l,1,n));
        [l,m,~] = size(map_out);
        map_out = cat(3,zeros(l,m,1),map_out,zeros(l,m,1));
    elseif strcmpi(varargin,'copy')==1
        map_out = cat(1,map_in(1,:,:),map_in,map_in(end,:,:));
        map_out = cat(2,map_out(:,1,:),map_out,map_out(:,end,:));
        map_out = cat(3,map_out(:,:,1),map_out,map_out(:,:,end));
    elseif strcmpi(varargin,'nan')==1
        [~,m,n] = size(map_in);
        map_out = cat(1,nan(1,m,n),map_in,nan(1,m,n));
        [l,~,n] = size(map_out);
        map_out = cat(2,nan(l,1,n),map_out,nan(l,1,n));
        [l,m,~] = size(map_out);
        map_out = cat(3,nan(l,m,1),map_out,nan(l,m,1));
    elseif strcmpi(varargin,'ones')==1
        [~,m,n] = size(map_in);
        map_out = cat(1,ones(1,m,n),map_in,ones(1,m,n));
        [l,~,n] = size(map_out);
        map_out = cat(2,ones(l,1,n),map_out,ones(l,1,n));
        [l,m,~] = size(map_out);
        map_out = cat(3,ones(l,m,1),map_out,ones(l,m,1));
    else
        fprintf('provided varargin is invalid')
    end
elseif ndims(map_in)==2
    if strcmpi(varargin,'zeros')==1
        [~,n] = size(map_in);
        map_out = cat(1,zeros(1,n),map_in,zeros(1,n));
        [l,~] = size(map_out);
        map_out = cat(2,zeros(l,1),map_out,zeros(l,1));
    elseif strcmpi(varargin,'copy')==1
        map_out = cat(1,map_in(1,:),map_in,map_in(end,:));
        map_out = cat(2,map_out(:,1),map_out,map_out(:,end));
    elseif strcmpi(varargin,'nan')==1
        [~,n] = size(map_in);
        map_out = cat(1,nan(1,n),map_in,nan(1,n));
        [l,~] = size(map_out);
        map_out = cat(2,nan(l,1),map_out,nan(l,1));
    elseif strcmpi(varargin,'ones')==1
        [~,n] = size(map_in);
        map_out = cat(1,ones(1,n),map_in,ones(1,n));
        [l,~] = size(map_out);
        map_out = cat(2,ones(l,1),map_out,ones(l,1));
    else
        fprintf('provided varargin is invalid')
    end
else
    fprintf('map_in is not compatible with this script')
end