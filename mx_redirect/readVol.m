% redirect to mx.nifti.readVol
function [volumeData, volume, xyzData] = readVol(filepath)
    if nargout > 2
        [volumeData, volume, xyzData] = mx.nifti.readVol(filepath);
    else
        [volumeData, volume] = mx.nifti.readVol(filepath);
    end
end