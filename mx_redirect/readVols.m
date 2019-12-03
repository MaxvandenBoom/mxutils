% redirect to mx.nifti.readVols
function [volumesData, volumesFiles, volumes] = readVols(searchDir)
	[volumesData, volumesFiles, volumes] = mx.nifti.readVols(searchDir);
end
