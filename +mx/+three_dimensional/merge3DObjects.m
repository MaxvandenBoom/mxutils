%	
%   Merge multiple giftis together into one mesh
%
%   [vertexMatrix, facesMatrix, vertexConversion] = merge3DObjects(gifti1, gifti2, ...)
%
%   gifti#          = the input giftis to merge
%
%   Returns: 
%       vertexMatrix     = the new vertex matrix
%       facesMatrix      = the new faces matrix (with vertex indices that
%                          correspond to the vertexMatrix)
%
%
%   Copyright (c) 2019, Max van den Boom

% 	This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License
%   as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
%   This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied 
%   warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
%   You should have received a copy of the GNU General Public License along with this program.  If not, see <https://www.gnu.org/licenses/>.
%
function [vertexMatrix, facesMatrix] = merge3DObjects(varargin)
    giftis = {};
    
    % loop through the input arguments and check for niftis
    for i = 1:nargin
        if isstruct(varargin{i}) || isobject(varargin{i})
            giftis{end + 1} = varargin{i};
        else
            disp('Invalid argument, ignored');
        end
    end
    
    % check if there are at least two giftis
    if length(giftis) < 2
        disp('At least two giftis are required to merge');
        return;
    end
    
    % the first gifti can be used as the basis, with the rest being added
    % onto it
    vertexMatrix = giftis{1}.vertices;
    facesMatrix = giftis{1}.faces;
    
    % loop through the remaining giftis
    for iGifti = 2:length(giftis)
        
        % determine the offset of the indices for the vertices in the combined matrices.
        vertexIndexOffset = size(vertexMatrix, 1);
        
        % increase the indices of the gifti's vertices with the offset
        newFaces = giftis{iGifti}.faces + vertexIndexOffset;
        
        % add the faces (with reindexed vertices) of the current gifti to the total
        facesMatrix = [facesMatrix; newFaces];
        
        % add the vertices of the current gifti to the total
        vertexMatrix = [vertexMatrix; giftis{iGifti}.vertices];
        
    end

end
