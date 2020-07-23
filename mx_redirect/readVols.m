% redirect to mx.nifti.readVols
function [volumesData, volumesFiles, volumes] = readVols(searchDir, firstOnly)
    if ~exist('firstOnly', 'var')
        firstOnly = 0;
    end
	[volumesData, volumesFiles, volumes] = mx.nifti.readVols(searchDir, firstOnly);
end
