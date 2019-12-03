%	
%   Read all the nifti files in a folder, with or with a search pattern (uses SPM to read)
%
%   [volumesData, volumesFiles, volumes] = readVols(searchDir)
%
%   searchDir  			= the path (and search pattern) to the niftis to be read
%
%   Returns: 
%       volumesData     = 3D or 4D matrix of image data
%       volumesFiles    = a cell array with all the nifti files that were read
%       volumes         = a structure array containing images volume information
%
%   Copyright (c) 2016, Max van den Boom

%   This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License
%   as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
%   This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied 
%   warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
%   You should have received a copy of the GNU General Public License along with this program.  If not, see <https://www.gnu.org/licenses/>.
%
function [volumesData, volumesFiles, volumes] = readVols(searchDir)

    % variable to hold the path to the search directory (regardless of any search pattern)
    searchDirPath = '';
    
    % variable to hold the files which are found
    files = [];
    
    % empty return variables
    volumesData = [];
    volumesFiles = [];

    % check if the searchdir is a existing folder
    if exist(searchDir, 'dir') ~= 0
        % is existing folder
    
        % removes the slash if there is one
        if strcmp(searchDir(length(searchDir):end), filesep)
            searchDirPath = searchDir(1:end - 1);
        else
            searchDirPath = searchDir;
        end
        
        % search the directory
        files = dir(searchDir);
        
    else
        % is not an existing folder but could still be a search pattern
        
        % strip the pattern in parts
        [searchDirPath, searchDirName, searchDirExt] = fileparts(searchDir);
        
        % check if the search dir is existing (could still be true if the
        % last directory of the entire path is wrong)
        if exist(searchDirPath, 'dir') == 0
            fprintf(2, ['Error: invalid search directory (', searchDir, ')\n']);
            return;
        end
        
        % search the directory by the entire search string (of which it is expected to be a pattern
        files = dir(searchDir);
        
        % check if there are no files in the directory
        if numel(files) == 0
            fprintf(2, ['Error: invalid search directory or contains no files (', searchDir, ')\n']);
            return;
        end
    
    end
    
    % message the input directory
    disp(['Input directory: ', searchDirPath]);
    
    if numel(files) == 0
        fprintf(2, 'Error: no files found in directory or by the given pattern\n');
    end
    
    % loop throug the files and list the files to read
    readFiles = {};
    fileCounter = 1;
    for i=1:numel(files)
        
        % split the filepath so we also have the extension
        [~, ~, fileExt] = fileparts([searchDirPath, filesep, files(i).name]);
        
        % only read nifti files (.nii and .img)
        if strcmp(fileExt, '.nii') || strcmp(fileExt, '.img')
            
            % add the file to an array to read
            readFiles{fileCounter, 1} = [searchDirPath, filesep, files(i).name];

            % message the file read
            if fileCounter < 4
                disp(['Reading file: ', readFiles{fileCounter, 1}]);
                if fileCounter == 3
                    disp('Reading file: ...');
                end
            end
            
            % increment the filecounter
            fileCounter = fileCounter + 1;
            
        end
        
    end
    
    % read all volumes
	volumes = spm_vol(readFiles);
	volumes = [volumes{:}]';
	volumesData = spm_read_vols(volumes);
    
    % return the read files
    volumesFiles = readFiles;
    
    fprintf(['Read ', int2str(fileCounter - 1), ' file(s).\n']);

end