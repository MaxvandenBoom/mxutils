%
%   View and editing tools for GIfTI objects. Provides several tools, including 
%	morping, cutting, navigation and overlays.
%
%   giftiTools(figHandle, toolConfig)
%	
%   input = A gifti object or an existing patch handle in which the gifti is
%           plotted. If a patch handle is given then the gifti data (vertices
%           and faces) will be retrieved from this object
%
%   toolConfig                          = the configuration which is used to pass
%                                         additional data and overlay information
%   toolConfig.secGifti                 = (optional) if a secondary gifti object is
%                                         provided then the tools will allow morphing
%   toolConfig.hideToolWindow           = (optional) whether the tool window should be hidden [0 or 1]
%
%   toolConfig.pointSet1                = (optional) matrix of points to plot. Each row in the matrix (first
%                                         dimension) represents a point; where the second dimension (colums)
%                                         represents the x, y and z coordinates
%   toolConfig.pointSet#                  (2, 3 ..., input same as above)
%   toolConfig.pointSet#Color           = (optional) color to be used for pointset (e.g. 'b' will result in blue star markers)
%   toolConfig.pointSet#Marker          = (optional) marker to be used for pointset (e.g. '*' will result in star markers)
%   toolConfig.pointSet#WireSphereRad   = (optional) each point will have a wire-sphere surrounding it, the
%                                         given value will define the sphere's radius
%   toolConfig.pointSet#WireSphereCol   = (optional) color to be used for the wire-spheres (default will be the same as point color)
%
%   toolConfig.lineSet1                 = (optional) matrix of lines to plot. Each row in the matrix (first
%                                         dimension) represents a line. The first three columns (second dimension
%                                         in the matrix) represent the x, y and z coordinates of the start of the
%                                         line, whereas the last three columns represent the x, y and z coordinates
%                                         of the end of the line
%   toolConfig.lineSet#                   (2, 3 ..., input same as above)
%   toolConfig.lineSet#Color            = (optional) color to be used for lineset (e.g. 'b' will result in blue lines)
%   toolConfig.lineSet#Size             = (optional) size to be used for lineset (e.g. '1.5' will result in lines with 1.5 thickness)
%   toolConfig.lineSet#WireCylinderRad  = (optional) each line will have a wire-cylinder surrounding it, the
%                                         given value will define the cylinder's radius
%   toolConfig.lineSet#WireCylinderCol  = (optional) color to be used for the wire-cylinders (default will be the same as line color)
%
%   toolConfig.faceText                 = (optional) array of strings, a text should be given for each face/triangle. 
%                                         The text will be positioned in front of the face/triangle based on it's normal
%   toolConfig.faceTextColor            = (optional) color to be used for the face/triangle texts (e.g. 'b' will result in blue text)
%   toolConfig.faceTextSize             = (optional) text size to be used for the face/triangle texts (e.g. '8' will result in text with a font size of 8)
%
%   toolConfig.vertexText               = (optional) array of strings, a text should be given for each vertex.
%                                         The text will be positioned in front of the vertex based on it's normal
%   toolConfig.vertexTextColor          = (optional) color to be used for the vertex texts (e.g. 'b' will result in blue text)
%   toolConfig.vertexTextSize           = (optional) text size to be used for the vertex texts (e.g. '8' will result in text with a font size of 8)
%
%   toolConfig.background1              = (optional) background data. Input should be either a
%                                         list of values (same length as vectices, or a matrix
%                                         where the first column holds vertex indices
%                                         and the second the values
%   toolConfig.background#                (2, 3 ..., input same as above)
%   toolConfig.background#Min           = (optional) background 
%   toolConfig.background#Max           = (optional) background 
%   toolConfig.background#Enabled       = (optional) background 
%   toolConfig.background#Alpha         = (optional) background 
%
%   toolConfig.overlay1                 = (optional) overlay data. Input should be either a
%                                         list of values (same length as vectices, or a matrix
%                                         where the first column holds vertex indices
%                                         and the second the values
%   toolConfig.overlay#                   (2, 3 ..., input same as above)
%   toolConfig.overlay#NegColormap      = (optional) overlay negative colormap
%   toolConfig.overlay#PosColormap      = (optional) overlay positive colormap
%   toolConfig.overlay#NegMin           = (optional) overlay 
%   toolConfig.overlay#NegMax           = (optional) overlay 
%   toolConfig.overlay#PosMin           = (optional) overlay 
%   toolConfig.overlay#PosMax           = (optional) overlay 
%   toolConfig.overlay#NegEnabled       = (optional) overlay 
%   toolConfig.overlay#PosEnabled       = (optional) overlay 
%
%   toolConfig.overlayOnBackgroundType  = 
%   toolConfig.overlayOnBackgroundAlpha =  
%   toolConfig.overlayOnOverlayType     = 
%   toolConfig.overlayOnOverlayAlpha    = 
%
%   toolConfig.camPos                   = (optional) 
%   toolConfig.camTarget                = (optional) 
%   toolConfig.camUp                    = (optional) 
%   toolConfig.camVA                    = (optional) 
%   toolConfig.morph                    = (optional) 
%
%   toolConfig.yokeCam                  = (optional) yoke the cam with other gifti displays
%   toolConfig.showWireframe            = (optional) whether the wireframe of the model is shown [0 or 1]
%   toolConfig.showVertices             = (optional) whether the vertices of the model are shown [0 or 1]
%   toolConfig.showFaceCenters          = (optional) calculate and show the face/triangle centers [0 or 1]
%   toolConfig.showFaceNormals          = (optional) calculate and show the face/triangle normals [0 = off, > 0 = on, where
%                                         the given value defines the length of the normal lines for display by multiplication
%                                         of the normals by the given value]
%   toolConfig.showVertexNormals        = (optional) calculate and show the vertex normals [0 = off, > 0 = on, where
%                                         the given value defines the length of the normal lines for display by multiplication
%                                         of the normals by the given value]
%   toolConfig.showFaceAreas            = (optional) calculate and show the face areas [0 or 1]
%   toolConfig.wireframeColor           = (optional) color of the wireframe lines, default [0 0 0]
%   toolConfig.vertexMarkerFaceColor    = (optional) face color of the vertex markers, default [1 .6 .6]
%   toolConfig.vertexMarkerEdgeColor    = (optional) edge color of the vertex markers, default [1 0 0]
%   toolConfig.selectedVertexMarkerEdgeColor = (optional) edge color of the selected vertex markers, default [0 0 1]
%   toolConfig.selectedFaceColor        = (optional) face color of an selected face, default [0.7 0.7 1]
%   
%   
%   Controls:
%
%     W-key                         = toggle wireframe display
%     V-key                         = toggle vertex display
%     E-key                         = toggle edit mode
%     S-key                         = Save gifti as...
% 
%     View mode
%       Left-mouse + mousemove      = rotate
%       Right-mouse + mousemove     = zoom
%       Mousescroll                 = zoom
%       Shift-key + mousemove       = pan
%       Control-key + mouseclick    = set cam rotation pivot point to click point
%       two-times C-key             = reset pivot point to initial
% 
%     Edit mode
%       Left-mouse                  = select/deselect vertex or face
%       Escape-key                  = clear selection
%       A-key                       = create new face between three selected vertices
%       R-key                       = remove the selected faces (plus their unshared vertices) and the selected
%                                     vertices (including the faces they define)
%       Arrow-keys                  = move the selected vertices and faces left, right, up or down (from the perspective of the camera)
%       Page-up and Page-down       = move the selected vertices and faces toward (page-up) or away (page-down) from the camera
%
% 
%   Example:
%       gSurfPial = gifti(giiPialFilepath);
%
%       figure;
%       figHandle = plot(gSurfPial);
%
%       toolConfig = {};
%       toolConfig.overlay1 = [];
%
%       giftiTools(figHandle, toolConfig);
%
%
%   Copyright (c) 2019, Max van den Boom

% 	This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License
%   as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
%   This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied 
%   warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
%   You should have received a copy of the GNU General Public License along with this program.  If not, see <https://www.gnu.org/licenses/>.
%
function giftiTools(input, toolConfig)
    global globalVarsMx;
    
    
    %%%
    % check and prepare the geometry input
    %%%
    
    % check if the input is a struct and can be converted to a gifti
    if isstruct(input)
        
        % try to convert the input to a gifti
        giftiInput = gifti(input);
        if isfield(giftiInput, 'faces') &&  isfield(giftiInput, 'vertices')
            input = giftiInput;
        end
        
    end
    
    % check if the input is a gifti
    if isobject(input) && strcmpi(class(input), 'gifti')
        
        % create a figure
        figure;
        
        % plot the gifti and pass the handle as input
        input = plot(input);
        
    end
    
    % check whether a patch handle was passed
    if ~exist('input', 'var') || isempty(input)
        fprintf(2, 'Error: no patch handle passed\n');
        return;
    end
    
    % check whether a patch handle was passed
    if ~ishandle(input)
        fprintf(2, 'Error: invalid or deleted patch handle\n');
        return;
    end
    
    % check whether the patch holds 3D information (has vertices and faces)
    try
        baseVertices = get(input, 'Vertices');
        baseFaces = get(input, 'Faces');
    catch
        fprintf(2, 'Error: invalid handle or the handle holds no gifti patch, plot the gifti first\n');    
        return;
    end
    
    
    % store the figure handle
    patchHandle = input;
    
    % get the axis handle
    axisHandle = input.Parent;
    
    % get the figure handle
    figHandle = axisHandle.Parent;
    
    % determine the figure number
    figNum = figHandle.Number;
    
    % check of another instance of these tools already exists (uses globalVarsMx.(['giftiFig', num2str(figNum)]).giftiFigs<window num>)
    if checkInstance(figNum) == 1
        
        % message and quit
        fprintf(2, 'Warning: another instance of Gifti display tools has already claimed the figure\n');   
        return;
        
    end
    
    % create a global field for this figure (or resets it if the window was closed before)
    globalVarsMx.(['giftiFig', num2str(figNum)]) = [];
    
    
    % transfer the already loaded information
    globalVarsMx.(['giftiFig', num2str(figNum)]).baseVertices = baseVertices;
    globalVarsMx.(['giftiFig', num2str(figNum)]).baseFaces = baseFaces;
    globalVarsMx.(['giftiFig', num2str(figNum)]).patchHandle = patchHandle;
    globalVarsMx.(['giftiFig', num2str(figNum)]).axisHandle = axisHandle;
    globalVarsMx.(['giftiFig', num2str(figNum)]).figHandle = figHandle;
    globalVarsMx.(['giftiFig', num2str(figNum)]).figNum = figNum;
        
    
    % hard-coded configurables
    globalVarsMx.(['giftiFig', num2str(figNum)]).toolFigWidth = 500;
    globalVarsMx.(['giftiFig', num2str(figNum)]).toolFigHeight = 170;
    globalVarsMx.(['giftiFig', num2str(figNum)]).maxPointSets = 10;
    globalVarsMx.(['giftiFig', num2str(figNum)]).maxLineSets = 10;
    globalVarsMx.(['giftiFig', num2str(figNum)]).maxBackgrounds = 5;
    globalVarsMx.(['giftiFig', num2str(figNum)]).maxOverlays = 5;
    
    % create and set some standard settings
    globalVarsMx.(['giftiFig', num2str(figNum)]).mode = 0;
    globalVarsMx.(['giftiFig', num2str(figNum)]).selectedVertices = [];
    globalVarsMx.(['giftiFig', num2str(figNum)]).selectedFaces = [];
    globalVarsMx.(['giftiFig', num2str(figNum)]).selectedFacesPlot = {};
    globalVarsMx.(['giftiFig', num2str(figNum)]).triangulation = [];
    globalVarsMx.(['giftiFig', num2str(figNum)]).faceCenters = [];
    globalVarsMx.(['giftiFig', num2str(figNum)]).faceNormals = [];
    globalVarsMx.(['giftiFig', num2str(figNum)]).vertexNormals = [];
    globalVarsMx.(['giftiFig', num2str(figNum)]).wireframeColor = [0, 0, 0];
    globalVarsMx.(['giftiFig', num2str(figNum)]).vertexMarkerFaceColor = [1, .6, .6];
    globalVarsMx.(['giftiFig', num2str(figNum)]).vertexMarkerEdgeColor = [1, 0, 0];
    globalVarsMx.(['giftiFig', num2str(figNum)]).selectedVertexMarkerEdgeColor = [0, 0, 1];
    globalVarsMx.(['giftiFig', num2str(figNum)]).selectedFaceColor = [0.7, 0.7, 1];
    
    
    % define the available colormaps
    defineColormaps(figNum);
    
    % create an initial copy of the base gifti, for displaying
    globalVarsMx.(['giftiFig', num2str(figNum)]).displayVertices = globalVarsMx.(['giftiFig', num2str(figNum)]).baseVertices;
    globalVarsMx.(['giftiFig', num2str(figNum)]).displayFaces = globalVarsMx.(['giftiFig', num2str(figNum)]).baseFaces;
    
    % make sure all config fields exist, or are at least empty
    if ~exist('toolConfig', 'var') || isempty(toolConfig) || ~isstruct(toolConfig)
        toolConfig = {};
    end
    if ~isfield(toolConfig, 'secGifti')
        toolConfig.secGifti = [];
    end
    if ~isfield(toolConfig, 'camPos')
        toolConfig.camPos = [];
    end
    if ~isfield(toolConfig, 'camTarget')
        toolConfig.camTarget = [];
    end
    if ~isfield(toolConfig, 'camUp')
        toolConfig.camUp = [];
    end
    if ~isfield(toolConfig, 'camVA')
        toolConfig.camVA = [];
    end
    if ~isfield(toolConfig, 'morph')
        toolConfig.morph = [];
    end
    if ~isfield(toolConfig, 'yokeCam')
        toolConfig.yokeCam = [];
    end
    
    % transfer the toolconfig parameters
    globalVarsMx.(['giftiFig', num2str(figNum)]).hideToolWindow = (isfield(toolConfig, 'hideToolWindow') && toolConfig.hideToolWindow == 1);
    globalVarsMx.(['giftiFig', num2str(figNum)]).showWireframe = (isfield(toolConfig, 'showWireframe') && toolConfig.showWireframe == 1);
    globalVarsMx.(['giftiFig', num2str(figNum)]).showVertices = (isfield(toolConfig, 'showVertices') && toolConfig.showVertices == 1);
    globalVarsMx.(['giftiFig', num2str(figNum)]).showFaceCenters = (isfield(toolConfig, 'showFaceCenters') && toolConfig.showFaceCenters == 1);
    if isfield(toolConfig, 'showFaceNormals')
        globalVarsMx.(['giftiFig', num2str(figNum)]).showFaceNormals = toolConfig.showFaceNormals;
    else
        globalVarsMx.(['giftiFig', num2str(figNum)]).showFaceNormals = 0;
    end
    if isfield(toolConfig, 'showVertexNormals')
        globalVarsMx.(['giftiFig', num2str(figNum)]).showVertexNormals = toolConfig.showVertexNormals;
    else
        globalVarsMx.(['giftiFig', num2str(figNum)]).showVertexNormals = 0;
    end
    globalVarsMx.(['giftiFig', num2str(figNum)]).showFaceAreas = (isfield(toolConfig, 'showFaceAreas') && toolConfig.showFaceAreas == 1);
    if isfield(toolConfig, 'wireframeColor') && length(toolConfig.wireframeColor) == 3
        globalVarsMx.(['giftiFig', num2str(figNum)]).wireframeColor = toolConfig.wireframeColor;
    end
    if isfield(toolConfig, 'vertexMarkerFaceColor') && length(toolConfig.vertexMarkerFaceColor) == 3
        globalVarsMx.(['giftiFig', num2str(figNum)]).vertexMarkerFaceColor = toolConfig.vertexMarkerFaceColor;
    end
    if isfield(toolConfig, 'vertexMarkerEdgeColor') && length(toolConfig.vertexMarkerEdgeColor) == 3
        globalVarsMx.(['giftiFig', num2str(figNum)]).vertexMarkerEdgeColor = toolConfig.vertexMarkerEdgeColor;
    end
    if isfield(toolConfig, 'selectedVertexMarkerEdgeColor') && length(toolConfig.selectedVertexMarkerEdgeColor) == 3
        globalVarsMx.(['giftiFig', num2str(figNum)]).selectedVertexMarkerEdgeColor = toolConfig.selectedVertexMarkerEdgeColor;
    end
    if isfield(toolConfig, 'selectedFaceColor') && length(toolConfig.selectedFaceColor) == 3
        globalVarsMx.(['giftiFig', num2str(figNum)]).selectedFaceColor = toolConfig.selectedFaceColor;
    end
    
    % if the secondary gifti is set
    if ~isempty(toolConfig.secGifti)
        
        % check whether the secondary holds a gifti (has vertices and faces)
        try

            % transfer the vertices and faces of the secondary giti
            globalVarsMx.(['giftiFig', num2str(figNum)]).secVertices = toolConfig.secGifti.vertices;
            globalVarsMx.(['giftiFig', num2str(figNum)]).secFaces = toolConfig.secGifti.faces;

        catch
            fprintf(2, 'Error: invalid secondary gitfi\n');    
            return;
        end
        
        % check whether the base gifti and second gifti are similar in
        % terms of vertices and faces
        if ~all(size(globalVarsMx.(['giftiFig', num2str(figNum)]).displayVertices) == size(globalVarsMx.(['giftiFig', num2str(figNum)]).secVertices))
            fprintf(2, 'Error: secondary gitfi does not have the same number of vertices as the base gifti\n');
            return;
        end
        if ~all(size(globalVarsMx.(['giftiFig', num2str(figNum)]).displayFaces) == size(globalVarsMx.(['giftiFig', num2str(figNum)]).secFaces))
            fprintf(2, 'Error: secondary gitfi does not have the same number of faces as the base gifti\n');
            return;
        end
        
        % calculate the difference between the vertices
        globalVarsMx.(['giftiFig', num2str(figNum)]).secDiff = squeeze(diff(permute(cat(3, globalVarsMx.(['giftiFig', num2str(figNum)]).baseVertices, globalVarsMx.(['giftiFig', num2str(figNum)]).secVertices), [3,1,2])));    
        
    end
    
    
    
    %%%
    % check, prepare and plot pointset data
    %%%
    globalVarsMx.(['giftiFig', num2str(figNum)]).pointSetData = {};
    for pointSetID = 1:globalVarsMx.(['giftiFig', num2str(figNum)]).maxPointSets
        
        % check if the field is set
        if isfield(toolConfig, ['pointSet', num2str(pointSetID)])

            % retrieve the data
            globalVarsMx.(['giftiFig', num2str(figNum)]).pointSetData{pointSetID} = toolConfig.(['pointSet', num2str(pointSetID)]);
            globalVarsMx.(['giftiFig', num2str(figNum)]).pointSetMarker{pointSetID} = '*';
            if isfield(toolConfig, ['pointSet', num2str(pointSetID), 'Marker'])
                globalVarsMx.(['giftiFig', num2str(figNum)]).pointSetMarker{pointSetID} = toolConfig.(['pointSet', num2str(pointSetID), 'Marker']);
            end
            globalVarsMx.(['giftiFig', num2str(figNum)]).pointSetColor{pointSetID} = [0 0 1];
            if isfield(toolConfig, ['pointSet', num2str(pointSetID), 'Color'])
                globalVarsMx.(['giftiFig', num2str(figNum)]).pointSetColor{pointSetID} = toolConfig.(['pointSet', num2str(pointSetID), 'Color']);
            end
            
            hold on;
            globalVarsMx.(['giftiFig', num2str(figNum)]).pointSetPlot{pointSetID} = plot3(  globalVarsMx.(['giftiFig', num2str(figNum)]).axisHandle, ...
                                                                                            globalVarsMx.(['giftiFig', num2str(figNum)]).pointSetData{pointSetID}(:,1), ...
                                                                                            globalVarsMx.(['giftiFig', num2str(figNum)]).pointSetData{pointSetID}(:,2), ...
                                                                                            globalVarsMx.(['giftiFig', num2str(figNum)]).pointSetData{pointSetID}(:,3), ...
                                                                                            globalVarsMx.(['giftiFig', num2str(figNum)]).pointSetMarker{pointSetID}, ...
                                                                                            'Color', globalVarsMx.(['giftiFig', num2str(figNum)]).pointSetColor{pointSetID});
            hold off;
            
            % check if wire-spheres should be drawn around the points
            if isfield(toolConfig, ['pointSet', num2str(pointSetID), 'WireSphereRad'])

                % check if a color was given for the wire-spheres
                if isfield(toolConfig, ['pointSet', num2str(pointSetID), 'WireSphereCol'])
                    % wire color was given
                    
                    % store
                    globalVarsMx.(['giftiFig', num2str(figNum)]).pointSetSphereColor{pointSetID} = toolConfig.(['pointSet', num2str(pointSetID), 'WireSphereCol']);
                    
                else
                    % no wire color was given
                    
                    % use the same as point color
                    globalVarsMx.(['giftiFig', num2str(figNum)]).pointSetSphereColor{pointSetID} = globalVarsMx.(['giftiFig', num2str(figNum)]).pointSetColor{pointSetID};
                    
                end
                
                % sphere constants
                spherePointsPerCircle = 30;         % number of points per circle
                sphereNumVertCircles = 3;           % number of vertical circles per sphere
                
                % store the radius of the wire-spheres
                globalVarsMx.(['giftiFig', num2str(figNum)]).pointSetWireSphereRad{pointSetID} = toolConfig.(['pointSet', num2str(pointSetID), 'WireSphereRad']);
                
                % create a base sphere
                [baseSphere] = build3DWireSphere(   globalVarsMx.(['giftiFig', num2str(figNum)]).pointSetWireSphereRad{pointSetID}, ...
                                                    sphereNumVertCircles, ...
                                                    spherePointsPerCircle);

                % create as many spheres as there are points and position them
                points = globalVarsMx.(['giftiFig', num2str(figNum)]).pointSetData{pointSetID};
                numSpheres = size(points, 1);
                allSpheres = [];
                for iSphere = 1:numSpheres
                    cSphere = reshape(baseSphere, 3, []);
                    cSphere = cSphere + points(iSphere, :)';
                    cSphere = reshape(cSphere, 3, size(baseSphere, 2), size(baseSphere, 3));
                    allSpheres = cat(3, allSpheres, cSphere);
                end

                hold on;
                % loop through all the circles that define the spheres and draw
                % them as seperate line segments
                numCircles = size(allSpheres, 3);
                for iCircle = 1:numCircles
                    plot3(  globalVarsMx.(['giftiFig', num2str(figNum)]).axisHandle, ...
                            allSpheres(1, :, iCircle), ...
                            allSpheres(2, :, iCircle), ...
                            allSpheres(3, :, iCircle), ...
                            'Color', globalVarsMx.(['giftiFig', num2str(figNum)]).pointSetSphereColor{pointSetID});
                end
                hold off;
                
            end
            
        end
    end
    

    %%%
    % check, prepare and plot lineset data
    %%%
    globalVarsMx.(['giftiFig', num2str(figNum)]).lineSetData = {};
    for lineSetID = 1:globalVarsMx.(['giftiFig', num2str(figNum)]).maxLineSets
        
        % check if the field is set
        if isfield(toolConfig, ['lineSet', num2str(lineSetID)])

            % retrieve the data
            globalVarsMx.(['giftiFig', num2str(figNum)]).lineSetData{lineSetID} = toolConfig.(['lineSet', num2str(lineSetID)]);
            globalVarsMx.(['giftiFig', num2str(figNum)]).lineSetColor{lineSetID} = [1 0 0];
            if isfield(toolConfig, ['lineSet', num2str(lineSetID), 'Color'])
                globalVarsMx.(['giftiFig', num2str(figNum)]).lineSetColor{lineSetID} = toolConfig.(['lineSet', num2str(lineSetID), 'Color']);
            end
            globalVarsMx.(['giftiFig', num2str(figNum)]).lineSetSize{lineSetID} = 1;
            if isfield(toolConfig, ['lineSet', num2str(lineSetID), 'Size'])
                globalVarsMx.(['giftiFig', num2str(figNum)]).lineSetSize{lineSetID} = toolConfig.(['lineSet', num2str(lineSetID), 'Size']);
            end
            
            % loop through and plot the lines
            hold on
            lines = globalVarsMx.(['giftiFig', num2str(figNum)]).lineSetData{lineSetID};
            globalVarsMx.(['giftiFig', num2str(figNum)]).lineSetPlot{lineSetID} = [];
            for iLine = 1:size(lines, 1)
                globalVarsMx.(['giftiFig', num2str(figNum)]).lineSetPlot{lineSetID}(end + 1) = ...
                    plot3(  globalVarsMx.(['giftiFig', num2str(figNum)]).axisHandle, ...
                            [lines(iLine, 1), lines(iLine, 4)], ...
                            [lines(iLine, 2), lines(iLine, 5)], ...
                            [lines(iLine, 3), lines(iLine, 6)], ...
                            'Color', globalVarsMx.(['giftiFig', num2str(figNum)]).lineSetColor{lineSetID}, ...
                            'LineWidth', globalVarsMx.(['giftiFig', num2str(figNum)]).lineSetSize{lineSetID});
                        
            end
            hold off;
            

            % check if wire-cylinders should be drawn around the lines
            if isfield(toolConfig, ['lineSet', num2str(lineSetID), 'WireCylinderRad'])
                
                % check if a color was given for the wire-cylinders
                if isfield(toolConfig, ['lineSet', num2str(lineSetID), 'WireCylinderCol'])
                    % wire color was given
                    
                    % store
                    globalVarsMx.(['giftiFig', num2str(figNum)]).lineSetCylinderColor{lineSetID} = toolConfig.(['lineSet', num2str(lineSetID), 'WireCylinderCol']);
                    
                else
                    % no wire color was given
                    
                    % use the same as point color
                    globalVarsMx.(['giftiFig', num2str(figNum)]).lineSetCylinderColor{lineSetID} = globalVarsMx.(['giftiFig', num2str(figNum)]).lineSetColor{lineSetID};
                    
                end
                
                % cylinder constants
                cylinderPointsPerCircle = 30;      % number of points per circle (caps of cylinder)
                cylinderSpokeEveryXPoints = 4;     % spoke the cylinder cap circles every ... points
                
                % store the radius of the wire-cylinders
                globalVarsMx.(['giftiFig', num2str(figNum)]).lineSetWireCylinderRad{lineSetID} = toolConfig.(['lineSet', num2str(lineSetID), 'WireCylinderRad']);

                % create the base cap and determine the number of circle points
                baseCylinder = build3DWireCylinder( globalVarsMx.(['giftiFig', num2str(figNum)]).lineSetWireCylinderRad{lineSetID}, ...
                                                    cylinderPointsPerCircle);
                numCirclePoints = size(baseCylinder, 2);
                
                % calculate rotation matrices for each cylinder (to rotate the caps)
                dir = lines(:, 4:6) - lines(:, 1:3);
                dir = dir ./ vecnorm(dir')';
                dirOrtho1 = [dir(:, 2), -dir(:, 1), zeros(size(dir, 1), 1)];
                dirOrtho1 = dirOrtho1 ./ vecnorm(dirOrtho1')';
                dirOrtho2 = cross(dir, dirOrtho1);
                rotMat = cat(3, dirOrtho2, dirOrtho1, dir);
                
                % loop through the lines (cylinders)
                for iLine = 1:size(lines, 1)
                    cCylinder = baseCylinder;
                    
                    % rotate both caps into the right angle (todo)
                    cCylinder(:, :, 1) = squeeze(rotMat(iLine, :, :, :)) * cCylinder(:, :, 1);
                    cCylinder(:, :, 2) = squeeze(rotMat(iLine, :, :, :)) * cCylinder(:, :, 2);
                    
                    % move each cap to one end of the line
                    cCylinder(:, :, 1) = cCylinder(:, :, 1) + lines(iLine, 1:3)';
                    cCylinder(:, :, 2) = cCylinder(:, :, 2) + lines(iLine, 4:6)';

                    hold on;
                    % loop through the two circles that define the caps of the 
                    % cylinders and draw them as seperate line segments
                    for iCircle = 1:2
                        globalVarsMx.(['giftiFig', num2str(figNum)]).lineSetPlot{lineSetID}(end + 1) = ...
                            plot3(  globalVarsMx.(['giftiFig', num2str(figNum)]).axisHandle, ...
                                    cCylinder(1, :, iCircle), ...
                                    cCylinder(2, :, iCircle), ...
                                    cCylinder(3, :, iCircle), ...
                                    'Color', globalVarsMx.(['giftiFig', num2str(figNum)]).lineSetCylinderColor{lineSetID}, ...
                                    'LineWidth', 1);
                    end
                    
                    % loop through the points in the circle to create the spokes
                    for iSpoke = 1:cylinderSpokeEveryXPoints:numCirclePoints
                        globalVarsMx.(['giftiFig', num2str(figNum)]).lineSetPlot{lineSetID}(end + 1) = ...
                            plot3(  globalVarsMx.(['giftiFig', num2str(figNum)]).axisHandle, ...
                                    [cCylinder(1, iSpoke, 1), cCylinder(1, iSpoke, 2)], ...
                                    [cCylinder(2, iSpoke, 1), cCylinder(2, iSpoke, 2)], ...
                                    [cCylinder(3, iSpoke, 1), cCylinder(3, iSpoke, 2)], ...
                                    'Color', globalVarsMx.(['giftiFig', num2str(figNum)]).lineSetCylinderColor{lineSetID}, ...
                                    'LineWidth', 1);
                    end
                    hold off;
                    
                    
                end     % end line (cylinder) loop
                
            end     % end wirecylinderrad if
            
        end
        
    end     % end of lineset loop

    
    %%%
    % check, prepare and plot face-text data
    %%%
    globalVarsMx.(['giftiFig', num2str(figNum)]).faceTextData = [];
    if isfield(toolConfig, 'faceText')

        % check whether the number of face texts equals the number of faces
        if length(toolConfig.faceText) ~= size(globalVarsMx.(['giftiFig', num2str(figNum)]).baseFaces, 1)

            % message
            fprintf(2, 'Warning: The number of face texts does not equal the number of faces/triangles in the gifti, ignoring texts\n');
            
        else

            % retrieve the data
            globalVarsMx.(['giftiFig', num2str(figNum)]).faceTextData = toolConfig.faceText;
            globalVarsMx.(['giftiFig', num2str(figNum)]).faceTextColor = 'r';
            if isfield(toolConfig, 'faceTextColor')
                globalVarsMx.(['giftiFig', num2str(figNum)]).faceTextColor = toolConfig.faceTextColor;
            end
            globalVarsMx.(['giftiFig', num2str(figNum)]).faceTextSize = 8;
            if isfield(toolConfig, 'faceTextSize')
                globalVarsMx.(['giftiFig', num2str(figNum)]).faceTextSize = toolConfig.faceTextSize;
            end
            
        end

    end
    
    
    %%%
    % check, prepare and plot vertex-text data
    %%%
    globalVarsMx.(['giftiFig', num2str(figNum)]).vertexTextData = [];
    if isfield(toolConfig, 'vertexText')

        % check whether the number of vertex texts equals the number of vertices
        if length(toolConfig.vertexText) ~= size(globalVarsMx.(['giftiFig', num2str(figNum)]).baseVertices, 1)

            % message
            fprintf(2, 'Warning: The number of vertex texts does not equal the number of vertices in the gifti, ignoring texts\n');
            
        else

            % retrieve the data
            globalVarsMx.(['giftiFig', num2str(figNum)]).vertexTextData = toolConfig.vertexText;
            globalVarsMx.(['giftiFig', num2str(figNum)]).vertexTextColor = 'r';
            if isfield(toolConfig, 'vertexTextColor')
                globalVarsMx.(['giftiFig', num2str(figNum)]).vertexTextColor = toolConfig.vertexTextColor;
            end
            globalVarsMx.(['giftiFig', num2str(figNum)]).vertexTextSize = 8;
            if isfield(toolConfig, 'vertexTextSize')
                globalVarsMx.(['giftiFig', num2str(figNum)]).vertexTextSize = toolConfig.vertexTextSize;
            end
            
        end

    end
 
    
    % check whether triangulation primary mesh should be performed
    % 
    % this is needed when face centers/normals or vertex normals are
    % required; which is also the case when face/vertex texts are set
    if  globalVarsMx.(['giftiFig', num2str(figNum)]).showFaceCenters || ...
        globalVarsMx.(['giftiFig', num2str(figNum)]).showFaceNormals ~= 0 || ...
        globalVarsMx.(['giftiFig', num2str(figNum)]).showVertexNormals ~= 0 || ...
        globalVarsMx.(['giftiFig', num2str(figNum)]).showFaceAreas || ...
        ~isempty(globalVarsMx.(['giftiFig', num2str(figNum)]).vertexTextData) || ...
        ~isempty(globalVarsMx.(['giftiFig', num2str(figNum)]).faceTextData)
        
        % calculate face centers if needed (also needed to display normal
        % lines, or when plotting text on face normals)
        if  globalVarsMx.(['giftiFig', num2str(figNum)]).showFaceCenters || ...
            globalVarsMx.(['giftiFig', num2str(figNum)]).showFaceNormals ~= 0 || ...
            globalVarsMx.(['giftiFig', num2str(figNum)]).showFaceAreas || ...
            ~isempty(globalVarsMx.(['giftiFig', num2str(figNum)]).faceTextData)
        
            % check and calculate face centers
            checkFaceCenters(figNum);
            
        end
        
        % calculate face normals if needed
        if  globalVarsMx.(['giftiFig', num2str(figNum)]).showFaceNormals ~= 0 || ...
            globalVarsMx.(['giftiFig', num2str(figNum)]).showFaceAreas || ...
            ~isempty(globalVarsMx.(['giftiFig', num2str(figNum)]).faceTextData)
        
            % check and calculate face normals
            checkFaceNormals(figNum);
            
        end
        
        % calculate vertex normals if needed
        if globalVarsMx.(['giftiFig', num2str(figNum)]).showVertexNormals ~= 0 || ~isempty(globalVarsMx.(['giftiFig', num2str(figNum)]).vertexTextData)
            
            % check and calculate vertex normals
            checkVertexNormals(figNum);
            
        end
        
    end
    
    
    % check if the face centers should be shown
    if globalVarsMx.(['giftiFig', num2str(figNum)]).showFaceCenters
        hold on;
        globalVarsMx.(['giftiFig', num2str(figNum)]).faceCenterPlot = plot3(globalVarsMx.(['giftiFig', num2str(figNum)]).axisHandle, ...
                                                                            globalVarsMx.(['giftiFig', num2str(figNum)]).faceCenters(:, 1), ...
                                                                            globalVarsMx.(['giftiFig', num2str(figNum)]).faceCenters(:, 2), ...
                                                                            globalVarsMx.(['giftiFig', num2str(figNum)]).faceCenters(:, 3), ...
                                                                            '*', ...
                                                                            'Color', [1 0 0], ...
                                                                            'MarkerSize', 6);
        hold off;
    end
    
    
    % check if the face normals should be shown
    if globalVarsMx.(['giftiFig', num2str(figNum)]).showFaceNormals ~= 0
        
        % draw the normals as x times the normal length, originating
        % from the face center
        normals = globalVarsMx.(['giftiFig', num2str(figNum)]).faceNormals;
        normals = normals * globalVarsMx.(['giftiFig', num2str(figNum)]).showFaceNormals;
        normals = globalVarsMx.(['giftiFig', num2str(figNum)]).faceCenters + normals;
        
        % loop through the normals and plot as lines
        hold on;
        numNormals = size(normals, 1);
        globalVarsMx.(['giftiFig', num2str(figNum)]).faceNormalPlot = [];
        for iNormal = 1:numNormals
            globalVarsMx.(['giftiFig', num2str(figNum)]).faceNormalPlot(end + 1) = ...
                plot3(  globalVarsMx.(['giftiFig', num2str(figNum)]).axisHandle, ...
                        [globalVarsMx.(['giftiFig', num2str(figNum)]).faceCenters(iNormal, 1), normals(iNormal, 1)], ...
                        [globalVarsMx.(['giftiFig', num2str(figNum)]).faceCenters(iNormal, 2), normals(iNormal, 2)], ...
                        [globalVarsMx.(['giftiFig', num2str(figNum)]).faceCenters(iNormal, 3), normals(iNormal, 3)], ...
                        'Color', [1 0 0], ...
                        'LineWidth', 1.0);
        end
        hold off;
        
    end
    
    
    % check if the vertex normals should be shown
    if globalVarsMx.(['giftiFig', num2str(figNum)]).showVertexNormals ~= 0
        
        % draw the normals as x times the normal length, originating from the vertex
        normals = globalVarsMx.(['giftiFig', num2str(figNum)]).vertexNormals;
        normals = normals * globalVarsMx.(['giftiFig', num2str(figNum)]).showVertexNormals;
        normals = globalVarsMx.(['giftiFig', num2str(figNum)]).displayVertices + normals;
        
        % loop through the normals and plot as lines
        hold on;
        numNormals = size(normals, 1);
        globalVarsMx.(['giftiFig', num2str(figNum)]).faceNormalPlot = [];
        for iNormal = 1:numNormals
            globalVarsMx.(['giftiFig', num2str(figNum)]).faceNormalPlot(end + 1) = ...
                plot3(  globalVarsMx.(['giftiFig', num2str(figNum)]).axisHandle, ...
                        [globalVarsMx.(['giftiFig', num2str(figNum)]).displayVertices(iNormal, 1), normals(iNormal, 1)], ...
                        [globalVarsMx.(['giftiFig', num2str(figNum)]).displayVertices(iNormal, 2), normals(iNormal, 2)], ...
                        [globalVarsMx.(['giftiFig', num2str(figNum)]).displayVertices(iNormal, 3), normals(iNormal, 3)], ...
                        'Color', [1 0 0], ...
                        'LineWidth', 1.0);
        end
        hold off;
        
    end
    
    
    % check if face texts should be shown
    if ~isempty(globalVarsMx.(['giftiFig', num2str(figNum)]).faceTextData)
        
        % determine the text positions, set them at one normal distance
        textPositions = globalVarsMx.(['giftiFig', num2str(figNum)]).faceNormals;
        textPositions = textPositions * 1;
        textPositions = globalVarsMx.(['giftiFig', num2str(figNum)]).faceCenters + textPositions;
        
        % loop through the normals and plot text
        hold on;
        numTexts = length(globalVarsMx.(['giftiFig', num2str(figNum)]).faceTextData);
        globalVarsMx.(['giftiFig', num2str(figNum)]).faceTextPlot = [];
        for iText = 1:numTexts
            globalVarsMx.(['giftiFig', num2str(figNum)]).faceTextPlot(end + 1) = ...
                text(   globalVarsMx.(['giftiFig', num2str(figNum)]).axisHandle, ...
                        textPositions(iText, 1), ...
                        textPositions(iText, 2), ...
                        textPositions(iText, 3), ...
                        globalVarsMx.(['giftiFig', num2str(figNum)]).faceTextData(iText), ...
                        'Color', globalVarsMx.(['giftiFig', num2str(figNum)]).faceTextColor, ...
                        'HorizontalAlignment', 'left', ...
                        'FontSize', globalVarsMx.(['giftiFig', num2str(figNum)]).faceTextSize);
        end
        hold off;
        
    end
    
    
    % check if vertex texts should be shown
    if ~isempty(globalVarsMx.(['giftiFig', num2str(figNum)]).vertexTextData)
                
        % determine the text positions, set them at one normal distance
        textPositions = globalVarsMx.(['giftiFig', num2str(figNum)]).vertexNormals;
        textPositions = textPositions * 1;
        textPositions = globalVarsMx.(['giftiFig', num2str(figNum)]).displayVertices + textPositions;
        textPositions = double(textPositions);
        
        % loop through the normals and plot text
        hold on;
        numTexts = length(globalVarsMx.(['giftiFig', num2str(figNum)]).vertexTextData);
        globalVarsMx.(['giftiFig', num2str(figNum)]).vertexTextPlot = [];
        for iText = 1:numTexts
            globalVarsMx.(['giftiFig', num2str(figNum)]).vertexTextPlot(end + 1) = ...
                text(   globalVarsMx.(['giftiFig', num2str(figNum)]).axisHandle, ...
                        textPositions(iText, 1), ...
                        textPositions(iText, 2), ...
                        textPositions(iText, 3), ...
                        globalVarsMx.(['giftiFig', num2str(figNum)]).vertexTextData(iText), ...
                        'Color', globalVarsMx.(['giftiFig', num2str(figNum)]).vertexTextColor, ...
                        'HorizontalAlignment', 'left', ...
                        'FontSize', globalVarsMx.(['giftiFig', num2str(figNum)]).vertexTextSize);
        end
        hold off;
        
    end
    
    
    % check if face areas should be shown
    if globalVarsMx.(['giftiFig', num2str(figNum)]).showFaceAreas
        
        % calculate the face areas
        vertices = globalVarsMx.(['giftiFig', num2str(figNum)]).displayVertices;
        faces = globalVarsMx.(['giftiFig', num2str(figNum)]).displayFaces;
        faceSide1 = vertices(faces(:, 2), :) - vertices(faces(:, 1), :);
        faceSide2 = vertices(faces(:, 3), :) - vertices(faces(:, 1), :);
        faceCross = cross(faceSide1, faceSide2, 2);
        faceAreas = 1/2 * sqrt(sum(faceCross.^2, 2));

        % convert to strings with two decimals
        strFaceAreas = {};
        for i = 1:length(faceCross)
            strFaceAreas{i} = num2str(round(faceAreas(i), 2));
        end        
        
        % determine the text positions, set them at one normal distance
        textPositions = globalVarsMx.(['giftiFig', num2str(figNum)]).faceNormals;
        textPositions = textPositions * 1;
        textPositions = globalVarsMx.(['giftiFig', num2str(figNum)]).faceCenters + textPositions;
        
        % loop through the normals and plot text
        hold on;
        numTexts = length(strFaceAreas);
        globalVarsMx.(['giftiFig', num2str(figNum)]).faceAreaTextPlot = [];
        for iText = 1:numTexts
            globalVarsMx.(['giftiFig', num2str(figNum)]).faceAreaTextPlot(end + 1) = ...
                text(   globalVarsMx.(['giftiFig', num2str(figNum)]).axisHandle, ...
                        textPositions(iText, 1), ...
                        textPositions(iText, 2), ...
                        textPositions(iText, 3), ...
                        strFaceAreas(iText), ...
                        'Color', 'r', ...
                        'HorizontalAlignment', 'left', ...
                        'FontSize', 8);
        end
        hold off;
        
    end
    
    % show or hide the wireframe and vertices
    showWireframe(figNum, globalVarsMx.(['giftiFig', num2str(figNum)]).showWireframe);
    showVertices(figNum, globalVarsMx.(['giftiFig', num2str(figNum)]).showVertices);
    
    
    
    %%%
    % check and prepare background data
    %%%

    % loop through the background data
    globalVarsMx.(['giftiFig', num2str(figNum)]).backgroundData = {};
    for backgroundID = 1:globalVarsMx.(['giftiFig', num2str(figNum)]).maxBackgrounds
        
        % check if the field is set
        if isfield(toolConfig, ['background', num2str(backgroundID)])
            
            % retrieve the data
            backgroundData = toolConfig.(['background', num2str(backgroundID)]);

            % check the type of background input
            if ~iscell(backgroundData) && ~isvector(backgroundData) && size(backgroundData, 2) == 2 && size(backgroundData, 1) > 0
                % matrix

                % create a list the same size as the number of vertices
                globalVarsMx.(['giftiFig', num2str(figNum)]).backgroundData{backgroundID} = NaN(size(globalVarsMx.(['giftiFig', num2str(figNum)]).baseVertices, 1), 1);    
                
                % set the values in the new list
                try
                    globalVarsMx.(['giftiFig', num2str(figNum)]).backgroundData{backgroundID}(backgroundData(:,1)) = backgroundData(:,2);
                catch

                    % error message
                    fprintf(2, ['Error: invalid input format for background', num2str(backgroundID), ', could not map the values to the vertex indices.\nMake sure the vertex indices in the first column are 1-based and do not exceed the number of vertices in the base gifti\n']);
                    return;

                end

            elseif ~iscell(backgroundData) && isvector(backgroundData) && ~isempty(backgroundData)
                % vector
                
                % check whether the background length matches the base gifti vectices length
                if length(backgroundData) ~= size(globalVarsMx.(['giftiFig', num2str(figNum)]).baseVertices, 1)

                    fprintf(2, ['Error: invalid input format for background', num2str(backgroundID), ', the number of values in the background does not match the number of vertices in the base gifti\n']);
                    return;

                end
                
                % directly store the background data
                globalVarsMx.(['giftiFig', num2str(figNum)]).backgroundData{backgroundID} = backgroundData;
            
            else

                % error message
                fprintf(2, ['Error: unknown input format for background', num2str(backgroundID), '\n']);
                return;

            end

        end
        
    end
    
    
    % set the standard values
    for backgroundID = 1:length(globalVarsMx.(['giftiFig', num2str(figNum)]).backgroundData)
        
        % determine the lowest and highest value for the current background
        lowestValue = min(globalVarsMx.(['giftiFig', num2str(figNum)]).backgroundData{backgroundID});
        highestValue = max(globalVarsMx.(['giftiFig', num2str(figNum)]).backgroundData{backgroundID});

        % set standard background settings
        globalVarsMx.(['giftiFig', num2str(figNum)]).backgroundEnabled(backgroundID) = 1;
        globalVarsMx.(['giftiFig', num2str(figNum)]).backgroundMinValue(backgroundID) = lowestValue;
        globalVarsMx.(['giftiFig', num2str(figNum)]).backgroundMaxValue(backgroundID) = highestValue;
        globalVarsMx.(['giftiFig', num2str(figNum)]).backgroundAlpha(backgroundID) = 100;

        % check if the background enabled/min/max fields are set
        if isfield(toolConfig, ['background', num2str(backgroundID), 'Enabled'])    
            try
                globalVarsMx.(['giftiFig', num2str(figNum)]).backgroundEnabled(backgroundID) = toolConfig.(['background', num2str(backgroundID), 'Enabled']) == 1;
            catch
                warning(['Could not apply enabled/disabled for background', num2str(backgroundID)]);
            end
        end
        if isfield(toolConfig, ['background', num2str(backgroundID), 'Min'])
            try
                globalVarsMx.(['giftiFig', num2str(figNum)]).backgroundMinValue(backgroundID) = toolConfig.(['background', num2str(backgroundID), 'Min']);
            catch
                warning(['Could not apply minimum value for background', num2str(backgroundID)]);
            end
        end
        if isfield(toolConfig, ['background', num2str(backgroundID), 'Max'])
            try
                globalVarsMx.(['giftiFig', num2str(figNum)]).backgroundMaxValue(backgroundID) = toolConfig.(['background', num2str(backgroundID), 'Max']);
            catch
                warning(['Could not apply maximum value for background', num2str(backgroundID)]);
            end
        end
        if isfield(toolConfig, ['background', num2str(backgroundID), 'Alpha'])
            try
                globalVarsMx.(['giftiFig', num2str(figNum)]).backgroundAlpha(backgroundID) = toolConfig.(['background', num2str(backgroundID), 'Alpha']);
            catch
                warning(['Could not apply alpha value for background', num2str(backgroundID)]);
            end
        end

        % (re)set the background range
        % also calculates the delta
        setBackgroundRange(figNum, backgroundID, globalVarsMx.(['giftiFig', num2str(figNum)]).backgroundMinValue(backgroundID), globalVarsMx.(['giftiFig', num2str(figNum)]).backgroundMaxValue(backgroundID));
        
        % set an initial background colormap
        % (this call will also set the list index)
        setBackgroundColormap(figNum, backgroundID, backgroundID);

        % check if the background color map field is set
        if isfield(toolConfig, ['background', num2str(backgroundID), 'Colormap'])
            
            % (try to) retrieve the colormap
            backgroundColormapName = toolConfig.(['background', num2str(backgroundID), 'Colormap']);
            [index, ~, ~, ~] = findColormapByName(figNum, backgroundColormapName, 0);
            
            % check if the background colormap was found
            if index == 0
                
                % warning message
                warning(['Could not find colormap ''', backgroundColormapName ,''' for background', num2str(backgroundID)]);

            else
                
                % set the background colormap to the found index
                % (this call will also set the list index)
                setBackgroundColormap(figNum, backgroundID, index);
                
            end
            
        end

    end

    
    
    %%%
    % check and prepare overlay data
    %%%
    
    % loop through the overlay data
    globalVarsMx.(['giftiFig', num2str(figNum)]).overlayData = {};
    for overlayID = 1:globalVarsMx.(['giftiFig', num2str(figNum)]).maxOverlays
        
        % check if the field is set
        if isfield(toolConfig, ['overlay', num2str(overlayID)])
            
            % retrieve the data
            overlayData = toolConfig.(['overlay', num2str(overlayID)]);

            % check the type of overlay input
            if ~iscell(overlayData) && ~isvector(overlayData) && size(overlayData, 2) == 2 && size(overlayData, 1) > 0
                % matrix

                % create a list the same size as the number of vertices
                globalVarsMx.(['giftiFig', num2str(figNum)]).overlayData{overlayID} = NaN(size(globalVarsMx.(['giftiFig', num2str(figNum)]).baseVertices, 1), 1);    
                
                % set the values in the new list
                try
                    globalVarsMx.(['giftiFig', num2str(figNum)]).overlayData{overlayID}(overlayData(:,1)) = overlayData(:,2);
                catch

                    % error message
                    fprintf(2, ['Error: invalid input format for overlay', num2str(overlayID), ', could not map the values to the vertex indices.\nMake sure the vertex indices in the first column are 1-based and do not exceed the number of vertices in the base gifti\n']);
                    return;

                end

            elseif ~iscell(overlayData) && isvector(overlayData) && ~isempty(overlayData)
                % vector
                
                % check whether the overlay length matches the base gifti vectices length
                if length(overlayData) ~= size(globalVarsMx.(['giftiFig', num2str(figNum)]).baseVertices, 1)

                    fprintf(2, ['Error: invalid input format for overlay', num2str(overlayID), ', the number of values in the overlay does not match the number of vertices in the base gifti\n']);
                    return;

                end
                
                % directly store the overlay data
                globalVarsMx.(['giftiFig', num2str(figNum)]).overlayData{overlayID} = overlayData;
            
            else

                % error message
                fprintf(2, ['Error: unknown input format for overlay', num2str(overlayID), '\n']);
                return;

            end

        end
        
    end
    
    % set the standard values for the overlays
    for overlayID = 1:length(globalVarsMx.(['giftiFig', num2str(figNum)]).overlayData)
        
        % determine the lowest and highest value for the current overlay
        lowestValue = min(globalVarsMx.(['giftiFig', num2str(figNum)]).overlayData{overlayID});
        highestValue = max(globalVarsMx.(['giftiFig', num2str(figNum)]).overlayData{overlayID});

        % set the standard negative range
        if (lowestValue > 0)
            globalVarsMx.(['giftiFig', num2str(figNum)]).overlayEnabled(1, overlayID) = 0;
            globalVarsMx.(['giftiFig', num2str(figNum)]).overlayMinValue(1, overlayID) = 0;
            globalVarsMx.(['giftiFig', num2str(figNum)]).overlayMaxValue(1, overlayID) = 0;
        else
            globalVarsMx.(['giftiFig', num2str(figNum)]).overlayEnabled(1, overlayID) = 1;
            globalVarsMx.(['giftiFig', num2str(figNum)]).overlayMinValue(1, overlayID) = lowestValue;
            if (highestValue > 0)
                globalVarsMx.(['giftiFig', num2str(figNum)]).overlayMaxValue(1, overlayID) = 0;                
            else
                globalVarsMx.(['giftiFig', num2str(figNum)]).overlayMaxValue(1, overlayID) = highestValue;
            end
        end
        
        % set the standard positive range
        if (highestValue < 0)
            globalVarsMx.(['giftiFig', num2str(figNum)]).overlayEnabled(2, overlayID) = 0;
            globalVarsMx.(['giftiFig', num2str(figNum)]).overlayMinValue(2, overlayID) = 0;
            globalVarsMx.(['giftiFig', num2str(figNum)]).overlayMaxValue(2, overlayID) = 0;
        else
            globalVarsMx.(['giftiFig', num2str(figNum)]).overlayEnabled(2, overlayID) = 1;
            globalVarsMx.(['giftiFig', num2str(figNum)]).overlayMaxValue(2, overlayID) = highestValue;
            if (lowestValue < 0)
                globalVarsMx.(['giftiFig', num2str(figNum)]).overlayMinValue(2, overlayID) = 0;                
            else
                globalVarsMx.(['giftiFig', num2str(figNum)]).overlayMinValue(2, overlayID) = lowestValue;
            end
        end
        
        % other standards
        for pos = 1:2

            % determine neg/pos string
            strPos = 'Neg';
            if pos == 2, strPos = 'Pos';    end
            
            
            % check if the overlay enabled/min/max fields are set
            if isfield(toolConfig, ['overlay', num2str(overlayID), strPos, 'Enabled'])    
                try
                    globalVarsMx.(['giftiFig', num2str(figNum)]).overlayEnabled(pos, overlayID) = toolConfig.(['overlay', num2str(overlayID), strPos ,'Enabled']) == 1;
                catch
                    warning(['Could not apply enabled/disabled for overlay', num2str(overlayID)]);
                end
            end
            if isfield(toolConfig, ['overlay', num2str(overlayID), strPos, 'Min'])
                try
                    globalVarsMx.(['giftiFig', num2str(figNum)]).overlayMinValue(pos, overlayID) = toolConfig.(['overlay', num2str(overlayID), strPos ,'Min']);
                catch
                    warning(['Could not apply minimum value for overlay', num2str(overlayID)]);
                end
            end
            if isfield(toolConfig, ['overlay', num2str(overlayID), strPos, 'Max'])
                try
                    globalVarsMx.(['giftiFig', num2str(figNum)]).overlayMaxValue(pos, overlayID) = toolConfig.(['overlay', num2str(overlayID), strPos ,'Max']);
                catch
                    warning(['Could not apply maximum value for overlay', num2str(overlayID)]);
                end
            end
            
            % (re)set the overlay range, in case it was updated
            % also calculates the delta
            setOverlayRange(figNum, pos, overlayID, globalVarsMx.(['giftiFig', num2str(figNum)]).overlayMinValue(pos, overlayID), globalVarsMx.(['giftiFig', num2str(figNum)]).overlayMaxValue(pos, overlayID));
            
            % set an initial overlay colormap
            % (this call will also set the list index)
            setOverlayColormap(figNum, pos, overlayID, (((overlayID - 1) * overlayID) + pos));

            % check if the overlay colormap field is set
            if isfield(toolConfig, ['overlay', num2str(overlayID), strPos, 'Colormap'])

                % (try to) retrieve the colormap
                overlayColormapName = toolConfig.(['overlay', num2str(overlayID), strPos ,'Colormap']);
                [index, ~, ~, ~] = findColormapByName(figNum, overlayColormapName, 0);

                % check if the overlay colormap was found
                if index == 0

                    % warning message
                    warning(['Could not find colormap ''', overlayColormapName ,''' for overlay', num2str(overlayID)]);

                else

                    % set the overlay colormap to the found index
                    % (this call will also set the list index)
                    setOverlayColormap(figNum, pos, overlayID, index);

                end

            end           
            
        end
    end
    
    % set the standard overlay/background values
    globalVarsMx.(['giftiFig', num2str(figNum)]).currentMorphValue = 0;
    globalVarsMx.(['giftiFig', num2str(figNum)]).overlayBackgroundType = 1;
    globalVarsMx.(['giftiFig', num2str(figNum)]).overlayBackgroundAlpha = 100;
    globalVarsMx.(['giftiFig', num2str(figNum)]).overlayOverlayType = 2;
    globalVarsMx.(['giftiFig', num2str(figNum)]).overlayOverlayAlpha = 100;
    
    % check if the overlay/background on fields are set
    if isfield(toolConfig, 'overlayOnBackgroundType')
        try
            globalVarsMx.(['giftiFig', num2str(figNum)]).overlayBackgroundType = toolConfig.overlayOnBackgroundType;
            if ~isnumeric(globalVarsMx.(['giftiFig', num2str(figNum)]).overlayBackgroundType) || mod(globalVarsMx.(['giftiFig', num2str(figNum)]).overlayBackgroundType, 1) ~= 0 || ...
                    globalVarsMx.(['giftiFig', num2str(figNum)]).overlayBackgroundType < 1 || globalVarsMx.(['giftiFig', num2str(figNum)]).overlayBackgroundType > 2
                throw exception;
            end
        catch
            globalVarsMx.(['giftiFig', num2str(figNum)]).overlayBackgroundType = 1;
            warning('Could not apply overlay on background type (options are 1 or 2)');
        end
    end
    if isfield(toolConfig, 'overlayOnBackgroundAlpha')
        try
            globalVarsMx.(['giftiFig', num2str(figNum)]).overlayBackgroundAlpha = floor(toolConfig.overlayOnBackgroundAlpha);
            if ~isnumeric(globalVarsMx.(['giftiFig', num2str(figNum)]).overlayBackgroundAlpha) || globalVarsMx.(['giftiFig', num2str(figNum)]).overlayBackgroundAlpha < 0 || globalVarsMx.(['giftiFig', num2str(figNum)]).overlayBackgroundAlpha > 100
                throw exception;
            end
        catch
            globalVarsMx.(['giftiFig', num2str(figNum)]).overlayBackgroundAlpha = 100;
            warning('Could not apply overlay on background alpha value');
        end
    end
    if isfield(toolConfig, 'overlayOnOverlayType')
        try
            globalVarsMx.(['giftiFig', num2str(figNum)]).overlayOverlayType = floor(toolConfig.overlayOnOverlayType);
            if ~isnumeric(globalVarsMx.(['giftiFig', num2str(figNum)]).overlayOverlayType) || mod(globalVarsMx.(['giftiFig', num2str(figNum)]).overlayOverlayType, 1) ~= 0 || ...
                    globalVarsMx.(['giftiFig', num2str(figNum)]).overlayOverlayType < 1 || globalVarsMx.(['giftiFig', num2str(figNum)]).overlayOverlayType > 3
                throw exception;
            end
        catch
            globalVarsMx.(['giftiFig', num2str(figNum)]).overlayOverlayType = 1;
            warning('Could not apply overlay on overlay type (options are 1, 2 or 3)');
        end
    end
    if isfield(toolConfig, 'overlayOnOverlayAlpha')
        try
            globalVarsMx.(['giftiFig', num2str(figNum)]).overlayOverlayAlpha = floor(toolConfig.overlayOnOverlayAlpha);
            if ~isnumeric(globalVarsMx.(['giftiFig', num2str(figNum)]).overlayOverlayAlpha) || globalVarsMx.(['giftiFig', num2str(figNum)]).overlayOverlayAlpha < 0 || globalVarsMx.(['giftiFig', num2str(figNum)]).overlayOverlayAlpha > 100
                throw exception;
            end
        catch
            globalVarsMx.(['giftiFig', num2str(figNum)]).overlayOverlayAlpha = 100;
            warning('Could not apply overlay on overlay alpha value');
        end
    end

    if ~isempty(globalVarsMx.(['giftiFig', num2str(figNum)]).displayFaces)

        % determine the edge metrics edge
        globalVarsMx.(['giftiFig', num2str(figNum)]).edges = [  globalVarsMx.(['giftiFig', num2str(figNum)]).displayFaces(:, 1), globalVarsMx.(['giftiFig', num2str(figNum)]).displayFaces(:, 2); ...
                                                                globalVarsMx.(['giftiFig', num2str(figNum)]).displayFaces(:, 1), globalVarsMx.(['giftiFig', num2str(figNum)]).displayFaces(:, 3); ...
                                                                globalVarsMx.(['giftiFig', num2str(figNum)]).displayFaces(:, 2), globalVarsMx.(['giftiFig', num2str(figNum)]).displayFaces(:, 3)];
        globalVarsMx.(['giftiFig', num2str(figNum)]).edges = unique(sort(globalVarsMx.(['giftiFig', num2str(figNum)]).edges, 2), 'rows');

        edgeDiff = globalVarsMx.(['giftiFig', num2str(figNum)]).displayVertices(globalVarsMx.(['giftiFig', num2str(figNum)]).edges(:, 1), :) - globalVarsMx.(['giftiFig', num2str(figNum)]).displayVertices(globalVarsMx.(['giftiFig', num2str(figNum)]).edges(:, 2), :);
        globalVarsMx.(['giftiFig', num2str(figNum)]).edgeLengths = sqrt(sum(edgeDiff .^ 2, 2));
        globalVarsMx.(['giftiFig', num2str(figNum)]).edgeAverage = mean(globalVarsMx.(['giftiFig', num2str(figNum)]).edgeLengths);
        globalVarsMx.(['giftiFig', num2str(figNum)]).edgeMax = max(globalVarsMx.(['giftiFig', num2str(figNum)]).edgeLengths);
        globalVarsMx.(['giftiFig', num2str(figNum)]).edgeTotal = sum(globalVarsMx.(['giftiFig', num2str(figNum)]).edgeLengths);
        
    end

    %%%
    % create the GUI controls
    %%%    
    
    % check if the tool window should be shown (created)
    if globalVarsMx.(['giftiFig', num2str(figNum)]).hideToolWindow ~= 1

        % reserve extra height for the background controls
        globalVarsMx.(['giftiFig', num2str(figNum)]).toolFigHeight = globalVarsMx.(['giftiFig', num2str(figNum)]).toolFigHeight + length(globalVarsMx.(['giftiFig', num2str(figNum)]).backgroundData) * 30;      % overlay element

        % reserve extra height for the overlay controls
        globalVarsMx.(['giftiFig', num2str(figNum)]).toolFigHeight = globalVarsMx.(['giftiFig', num2str(figNum)]).toolFigHeight + length(globalVarsMx.(['giftiFig', num2str(figNum)]).overlayData) * 90;      % overlay element
        if length(globalVarsMx.(['giftiFig', num2str(figNum)]).overlayData) > 0
            globalVarsMx.(['giftiFig', num2str(figNum)]).toolFigHeight = globalVarsMx.(['giftiFig', num2str(figNum)]).toolFigHeight + 75;         % overlay on background elements
            globalVarsMx.(['giftiFig', num2str(figNum)]).toolFigHeight = globalVarsMx.(['giftiFig', num2str(figNum)]).toolFigHeight + 70;         % overlay on overlay elements
        end

        % create the GUI elements
        screensize = get(0, 'Screensize');
        globalVarsMx.(['giftiFig', num2str(figNum)]).thisFig = figure(  'Position', [screensize(3) - globalVarsMx.(['giftiFig', num2str(figNum)]).toolFigWidth, screensize(4) - globalVarsMx.(['giftiFig', num2str(figNum)]).toolFigHeight - 24, globalVarsMx.(['giftiFig', num2str(figNum)]).toolFigWidth, globalVarsMx.(['giftiFig', num2str(figNum)]).toolFigHeight], ...
                                                                        'ToolBar', 'none', ...
                                                                        'Name', ['Gifti display tools (', num2str(figNum), ')'], ...
                                                                        'NumberTitle', 'off', ...
                                                                        'Resize', 'off', ...
                                                                        'Units', 'pixels', ...
                                                                        'MenuBar', 'none');

        % offset from the top                    
        ctrlY = 15;


        % background label
        uicontrol(  globalVarsMx.(['giftiFig', num2str(figNum)]).thisFig, ...
                    'Style', 'text', 'Units', 'pixels', ...
                    'Position', getTDPos(figNum, 0, ctrlY, globalVarsMx.(['giftiFig', num2str(figNum)]).toolFigWidth, 15), ...
                    'HorizontalAlignment', 'center', ...
                    'FontSize', 10, 'String', ' - Background - ');

        % move the Y postion (after the label + extra spacing)
        ctrlY = ctrlY + 15 + 8;

        % background overlay controls
        for backgroundID = 1:length(globalVarsMx.(['giftiFig', num2str(figNum)]).backgroundData)

            % background enabled control
            globalVarsMx.(['giftiFig', num2str(figNum)]).chkBackgroundEnabled(backgroundID) = uicontrol(globalVarsMx.(['giftiFig', num2str(figNum)]).thisFig, ...
                                                                        'Style', 'Checkbox', 'Units', 'pixels', ...
                                                                        'Position', getTDPos(figNum, 7, ctrlY + 6, 15, 15), ...
                                                                        'Value', globalVarsMx.(['giftiFig', num2str(figNum)]).backgroundEnabled( backgroundID), ...
                                                                        'Callback', {@switchBackgroundEnabled,  backgroundID, figNum});

            % background range control
            globalVarsMx.(['giftiFig', num2str(figNum)]).txtBackgroundMin(backgroundID) = uicontrol('Style', 'edit', 'Units', 'pixels', ...
                                                                    'Position', getTDPos(figNum, 30, ctrlY, 70, 25), ...
                                                                    'String', num2str(globalVarsMx.(['giftiFig', num2str(figNum)]).backgroundMinValue(backgroundID)), ...
                                                                    'FontSize', 9);
            uicontrol(  globalVarsMx.(['giftiFig', num2str(figNum)]).thisFig, ...
                        'Style', 'text', 'Units', 'pixels', ...
                        'Position', getTDPos(figNum, 100, ctrlY + 5, 20, 15), ...
                        'HorizontalAlignment', 'center', ...
                        'FontSize', 8, 'String', '-');

            globalVarsMx.(['giftiFig', num2str(figNum)]).txtBackgroundMax(backgroundID) = uicontrol('Style', 'edit', 'Units', 'pixels', ...
                                                                    'Position', getTDPos(figNum, 120, ctrlY, 70, 25), ...
                                                                    'String', num2str(globalVarsMx.(['giftiFig', num2str(figNum)]).backgroundMaxValue(backgroundID)), ...
                                                                    'FontSize', 9);

            set(globalVarsMx.(['giftiFig', num2str(figNum)]).txtBackgroundMin(backgroundID), 'KeyPressFcn', {@changeBackgroundRange, globalVarsMx.(['giftiFig', num2str(figNum)]).txtBackgroundMax(backgroundID), backgroundID, figNum});
            set(globalVarsMx.(['giftiFig', num2str(figNum)]).txtBackgroundMax(backgroundID), 'KeyPressFcn', {@changeBackgroundRange, globalVarsMx.(['giftiFig', num2str(figNum)]).txtBackgroundMin(backgroundID), backgroundID, figNum});

            % background alpha control
            globalVarsMx.(['giftiFig', num2str(figNum)]).scrBackgroundAlpha(backgroundID) = uicontrol(  globalVarsMx.(['giftiFig', num2str(figNum)]).thisFig, ...
                                                                        'Style', 'Slider', 'Units','pixels', ...
                                                                        'Position', getTDPos(figNum, 200, ctrlY + 3, 160, 20), ...
                                                                        'Min', 0, 'Max', 100, ...
                                                                        'SliderStep', [1/10 1/5], ...
                                                                        'Value', globalVarsMx.(['giftiFig', num2str(figNum)]).backgroundAlpha(backgroundID), ...
                                                                        'Callback', @(src, evt)  changeBackgroundAlpha(figNum, backgroundID, get(src,'Value')));
            addlistener(globalVarsMx.(['giftiFig', num2str(figNum)]).scrBackgroundAlpha(backgroundID), 'Value', 'PostSet', @(src, evt) changeBackgroundAlpha(figNum, backgroundID, get(evt.AffectedObject, 'Value')));

            % background colormap control
            globalVarsMx.(['giftiFig', num2str(figNum)]).cmbBackgroundColormap(backgroundID) = uicontrol(    globalVarsMx.(['giftiFig', num2str(figNum)]).thisFig, ...
                                                                            'Style', 'popupmenu', 'Units', 'pixels', ...
                                                                            'Position', getTDPos(figNum, 370, ctrlY + 2, 122, 25), ...
                                                                            'FontSize', 9, 'HorizontalAlignment', 'left', ...
                                                                            'String', getAllColormapNames(figNum, 0), ...
                                                                            'Value', globalVarsMx.(['giftiFig', num2str(figNum)]).backgroundColormapListIndex(backgroundID), ...
                                                                            'Callback', {@switchBackgroundColormap, backgroundID, figNum});

            % move the Y position (to after the background layer control)
            ctrlY = ctrlY + 25 + 2;

        end

        % move the Y position (to create distance after all background layer controls)
        ctrlY = ctrlY + 15;


        % overlay on ... controls
        if length(globalVarsMx.(['giftiFig', num2str(figNum)]).overlayData) > 0

            % overlay on background label
            uicontrol(  globalVarsMx.(['giftiFig', num2str(figNum)]).thisFig, ...
                        'Style', 'text', 'Units', 'pixels', ...
                        'Position', getTDPos(figNum, 0, ctrlY, globalVarsMx.(['giftiFig', num2str(figNum)]).toolFigWidth, 15), ...
                        'HorizontalAlignment', 'center', ...
                        'FontSize', 10, 'String', ' - Overlay(s) on background - ');

            % move the Y postion (after the label + extra spacing)
            ctrlY = ctrlY + 15 + 8;

            % overlay on background alpha control
            globalVarsMx.(['giftiFig', num2str(figNum)]).scrOverlayBackgroundAlpha = uicontrol( globalVarsMx.(['giftiFig', num2str(figNum)]).thisFig, ...
                                                                'Style', 'Slider', 'Units','pixels', ...
                                                                'Position', getTDPos(figNum, 10, ctrlY, 240, 20), ...
                                                                'Min', 0, 'Max', 100, ...
                                                                'SliderStep', [1/10 1/5], ...
                                                                'Value', globalVarsMx.(['giftiFig', num2str(figNum)]).overlayBackgroundAlpha, ...
                                                                'Callback', @(src, evt)  changeoverlayBackgroundAlpha(figNum, get(src, 'Value')));
            addlistener(globalVarsMx.(['giftiFig', num2str(figNum)]).scrOverlayBackgroundAlpha, 'Value', 'PostSet', @(src, evt) changeoverlayBackgroundAlpha(figNum, get(evt.AffectedObject, 'Value')));

            % overlay colormap control
            globalVarsMx.(['giftiFig', num2str(figNum)]).cmbOverlayBackgroundType = uicontrol(  globalVarsMx.(['giftiFig', num2str(figNum)]).thisFig, ...
                                                                'Style', 'popupmenu', 'Units', 'pixels', ...
                                                                'Position', getTDPos(figNum, 260, ctrlY, 230, 20), ...
                                                                'FontSize', 8, 'HorizontalAlignment', 'left', ...
                                                                'String', {'Alpha', 'Additive'}, ...
                                                                'Value', globalVarsMx.(['giftiFig', num2str(figNum)]).overlayBackgroundType, ...
                                                                'Callback', {@switchOverlayBackgroundType, figNum});



            % move the Y position (to create distance after overlay on background layer controls)
            ctrlY = ctrlY + 25 + 20;

            % overlay label
            uicontrol(  globalVarsMx.(['giftiFig', num2str(figNum)]).thisFig, ...
                        'Style', 'text', 'Units', 'pixels', ...
                        'Position', getTDPos(figNum, 0, ctrlY, globalVarsMx.(['giftiFig', num2str(figNum)]).toolFigWidth, 15), ...
                        'HorizontalAlignment', 'center', ...
                        'FontSize', 10, 'String', ' - Overlay(s) on overlay(s) - ');


            % move the Y postion (after the label + extra spacing)
            ctrlY = ctrlY + 15 + 8;

            % overlay on overlay alpha control
            globalVarsMx.(['giftiFig', num2str(figNum)]).scrOverlayOverlayAlpha = uicontrol(globalVarsMx.(['giftiFig', num2str(figNum)]).thisFig, ...
                                                            'Style', 'Slider', 'Units','pixels', ...
                                                            'Position', getTDPos(figNum, 10, ctrlY, 240, 20), ...
                                                            'Min', 0, 'Max', 100, ...
                                                            'SliderStep', [1/10 1/5], ...
                                                            'Value', globalVarsMx.(['giftiFig', num2str(figNum)]).overlayOverlayAlpha, ...
                                                            'Callback', @(src, evt)  changeOverlayOverlayAlpha(figNum, get(src, 'Value')));
            addlistener(globalVarsMx.(['giftiFig', num2str(figNum)]).scrOverlayOverlayAlpha, 'Value', 'PostSet', @(src, evt) changeOverlayOverlayAlpha(figNum, get(evt.AffectedObject, 'Value')));

            % overlay colormap control
            globalVarsMx.(['giftiFig', num2str(figNum)]).cmbOverlayOverlayType(pos, overlayID) = uicontrol( globalVarsMx.(['giftiFig', num2str(figNum)]).thisFig, ...
                                                                            'Style', 'popupmenu', 'Units', 'pixels', ...
                                                                            'Position', getTDPos(figNum, 260, ctrlY, 230, 20), ...
                                                                            'FontSize', 8, 'HorizontalAlignment', 'left', ...
                                                                            'String', { 'Stacking with alpha', 'Additive', 'linear color blending' }, ...
                                                                            'Value', globalVarsMx.(['giftiFig', num2str(figNum)]).overlayOverlayType, ...
                                                                            'Callback', {@switchOverlayOverlayType, figNum});

            % move the Y position (to create distance after overlay on overlay layer controls)
            ctrlY = ctrlY + 25;

        end


        % move the Y position (to create distance after all overlay on ... layer controls)
        ctrlY = ctrlY + 10;


        % overlay controls
        for overlayID = 1:length(globalVarsMx.(['giftiFig', num2str(figNum)]).overlayData)

            % overlay label
            uicontrol(  globalVarsMx.(['giftiFig', num2str(figNum)]).thisFig, ...
                        'Style', 'text', 'Units', 'pixels', ...
                        'Position', getTDPos(figNum, 0, ctrlY, globalVarsMx.(['giftiFig', num2str(figNum)]).toolFigWidth, 15), ...
                        'HorizontalAlignment', 'center', ...
                        'FontSize', 10, 'String', [' - Overlay ', num2str(overlayID), ' - ']);

            % move the Y postion (after the label + extra spacing)
            ctrlY = ctrlY + 15 + 8;

            % both pos and neg
            for pos = 1:2

                % pos/neg label
                strPos = 'Neg';
                if pos == 2,    strPos = 'Pos'; end
                uicontrol(  globalVarsMx.(['giftiFig', num2str(figNum)]).thisFig, ...
                            'Style', 'text', 'Units', 'pixels', ...
                            'Position', getTDPos(figNum, 6, ctrlY + 5, 28, 15), ...
                            'HorizontalAlignment', 'left', ...
                            'FontSize', 10, 'String', strPos);

                % overlay enabled control
                globalVarsMx.(['giftiFig', num2str(figNum)]).chkOverlayEnabled(pos, overlayID) = uicontrol( globalVarsMx.(['giftiFig', num2str(figNum)]).thisFig, ...
                                                                                'Style', 'Checkbox', 'Units', 'pixels', ...
                                                                                'Position', getTDPos(figNum, 40, ctrlY + 6, 15, 15), ...
                                                                                'Value', globalVarsMx.(['giftiFig', num2str(figNum)]).overlayEnabled(pos, overlayID), ...
                                                                                'Callback', {@switchOverlayEnabled, pos, overlayID, figNum});

                % overlay range control
                globalVarsMx.(['giftiFig', num2str(figNum)]).txtOverlayMin(pos, overlayID) = uicontrol( 'Style', 'edit', 'Units', 'pixels', ...
                                                                            'Position', getTDPos(figNum, 65, ctrlY, 70, 25), ...
                                                                            'String', num2str(globalVarsMx.(['giftiFig', num2str(figNum)]).overlayMinValue(pos, overlayID)), ...
                                                                            'FontSize', 9);
                uicontrol(  globalVarsMx.(['giftiFig', num2str(figNum)]).thisFig, ...
                            'Style', 'text', 'Units', 'pixels', ...
                            'Position', getTDPos(figNum, 135, ctrlY + 5, 20, 15), ...
                            'HorizontalAlignment', 'center', ...
                            'FontSize', 8, 'String', '-');

                globalVarsMx.(['giftiFig', num2str(figNum)]).txtOverlayMax(pos, overlayID) = uicontrol( 'Style', 'edit', 'Units', 'pixels', ...
                                                                            'Position', getTDPos(figNum, 155, ctrlY, 70, 25), ...
                                                                            'String', num2str(globalVarsMx.(['giftiFig', num2str(figNum)]).overlayMaxValue(pos, overlayID)), ...
                                                                            'FontSize', 9);

                set(globalVarsMx.(['giftiFig', num2str(figNum)]).txtOverlayMin(pos, overlayID), 'KeyPressFcn', {@changeOverlayRange, globalVarsMx.(['giftiFig', num2str(figNum)]).txtOverlayMax(pos, overlayID), pos, overlayID, figNum});
                set(globalVarsMx.(['giftiFig', num2str(figNum)]).txtOverlayMax(pos, overlayID), 'KeyPressFcn', {@changeOverlayRange, globalVarsMx.(['giftiFig', num2str(figNum)]).txtOverlayMin(pos, overlayID), pos, overlayID, figNum});

                % overlay colormap control
                globalVarsMx.(['giftiFig', num2str(figNum)]).cmbOverlayColormap(pos, overlayID) = uicontrol(    globalVarsMx.(['giftiFig', num2str(figNum)]).thisFig, ...
                                                                                'Style', 'popupmenu', 'Units', 'pixels', ...
                                                                                'Position', getTDPos(figNum, 240, ctrlY + 2, 250, 25), ...
                                                                                'FontSize', 10, 'HorizontalAlignment', 'left', ...
                                                                                'String', getAllColormapNames(figNum, 1), ...
                                                                                'Value', globalVarsMx.(['giftiFig', num2str(figNum)]).overlayColormapListIndex(pos, overlayID), ...
                                                                                'Callback', {@switchOverlayColormap, pos, overlayID, figNum});

                % move further after the overlay's negative elements
                ctrlY = ctrlY + 25 + 5;

            end

            % move further after the overlay element (after the positive
            % element + extra spacing)
            ctrlY = ctrlY + 10;

        end

        % move the Y position (to create distance after all overlay layer controls)
        ctrlY = ctrlY + 20;


        % cut controls
        globalVarsMx.(['giftiFig', num2str(figNum)]).btnCutX = uicontrol(   globalVarsMx.(['giftiFig', num2str(figNum)]).thisFig, ...
                                            'Style', 'pushbutton', 'Units', 'pixels', ...
                                            'Position', getTDPos(figNum, 10, ctrlY + 2, 100, 30), ...
                                            'String', 'Cut X', ...
                                            'FontSize', 8, 'HorizontalAlignment', 'left', ...
                                            'Callback', {@btnCut, 0, figNum});                                     
        globalVarsMx.(['giftiFig', num2str(figNum)]).btnCutY = uicontrol(   globalVarsMx.(['giftiFig', num2str(figNum)]).thisFig, ...
                                            'Style', 'pushbutton', 'Units', 'pixels', ...
                                            'Position', getTDPos(figNum, 125, ctrlY + 2, 100, 30), ...
                                            'String', 'Cut Y', ...
                                            'FontSize', 8, 'HorizontalAlignment', 'left', ...
                                            'Callback', {@btnCut, 1, figNum}); 
        globalVarsMx.(['giftiFig', num2str(figNum)]).btnCutZ = uicontrol(   globalVarsMx.(['giftiFig', num2str(figNum)]).thisFig, ...
                                            'Style', 'pushbutton', 'Units', 'pixels', ...
                                            'Position', getTDPos(figNum, 240, ctrlY + 2, 100, 30), ...
                                            'String', 'Cut Z', ...
                                            'FontSize', 8, 'HorizontalAlignment', 'left', ...
                                            'Callback', {@btnCut, 2, figNum});

        globalVarsMx.(['giftiFig', num2str(figNum)]).btnCutZ = uicontrol(   globalVarsMx.(['giftiFig', num2str(figNum)]).thisFig, ...
                                            'Style', 'pushbutton', 'Units', 'pixels', ...
                                            'Position', getTDPos(figNum, 360, ctrlY + 2, 130, 30), ...
                                            'String', 'Print config', ...
                                            'FontSize', 8, 'HorizontalAlignment', 'left', ...
                                            'Callback', {@btnPrintConfig, figNum});


        % move the Y position (to create distance after all the button controls)
        ctrlY = ctrlY + 30 + 30;


        % morph slidebar
        if ~isempty(toolConfig.secGifti)

            globalVarsMx.(['giftiFig', num2str(figNum)]).lblMorph = uicontrol(  globalVarsMx.(['giftiFig', num2str(figNum)]).thisFig, ...
                                                'Style', 'text', 'Units', 'pixels', ...
                                                'Position', getTDPos(figNum, 10, ctrlY + 4, 130, 30), ...
                                                'HorizontalAlignment', 'left', ...
                                                'FontSize', 9, 'String', 'Morph: 0%');

            globalVarsMx.(['giftiFig', num2str(figNum)]).sliderMorph = uicontrol(   globalVarsMx.(['giftiFig', num2str(figNum)]).thisFig, ...
                                                    'Style', 'Slider', 'Units','pixels', ...
                                                    'Position', getTDPos(figNum, 110, ctrlY, 380, 20), ...
                                                    'Min', 0, 'Max', 100, ...
                                                    'SliderStep', [1/100 1/5], 'Value', globalVarsMx.(['giftiFig', num2str(figNum)]).currentMorphValue, ...
                                                    'Callback', @(src, evt)  changeMorph(figNum, get(src,'Value')));
            addlistener(globalVarsMx.(['giftiFig', num2str(figNum)]).sliderMorph, 'Value', 'PostSet', @(src, evt) changeMorph(figNum, get(evt.AffectedObject, 'Value')));

        end


    end     % end globalVarsMx.(['giftiFig', num2str(figNum)]).hideToolWindow if
    
    
    
        
    %%%
    % camera and display settings
    %%%
    
    % set camera target to the middle of the object
    camtarget(globalVarsMx.(['giftiFig', num2str(figNum)]).axisHandle, [0, 0, 0]);
    
    % store the camera toolbar visibility and hide
    globalVarsMx.(['giftiFig', num2str(figNum)]).prevCameraToolbarVisibility = cameratoolbar(globalVarsMx.(['giftiFig', num2str(figNum)]).figHandle, 'GetVisible');
    cameratoolbar(globalVarsMx.(['giftiFig', num2str(figNum)]).figHandle, 'Hide');
    
    % store the toolbar setting and hide
    globalVarsMx.(['giftiFig', num2str(figNum)]).prevToolbar = get(globalVarsMx.(['giftiFig', num2str(figNum)]).figHandle, 'ToolBar');
    set(globalVarsMx.(['giftiFig', num2str(figNum)]).figHandle, 'ToolBar', 'none');
    
    % set the standard lighting and material properties
    lighting(globalVarsMx.(['giftiFig', num2str(figNum)]).axisHandle, 'gouraud');
    material(globalVarsMx.(['giftiFig', num2str(figNum)]).axisHandle, 'dull');
    %material([0.4, 0.8, 0.0]);   % sets the ambient/diffuse/specular strength of the objects
    
    % set the initial coloring
    buildColoring(figNum, 1);
    updateColoring(figNum);
    
    % set the morph percentage (by config)
    if globalVarsMx.(['giftiFig', num2str(figNum)]).hideToolWindow ~= 1 && ~isempty(toolConfig.morph) && ~isempty(toolConfig.secGifti)
        set(globalVarsMx.(['giftiFig', num2str(figNum)]).sliderMorph, 'Value', toolConfig.morph);
    end
    
    % store the initial target position and camera position
    globalVarsMx.(['giftiFig', num2str(figNum)]).originalCameraPosition = campos(globalVarsMx.(['giftiFig', num2str(figNum)]).axisHandle);
    globalVarsMx.(['giftiFig', num2str(figNum)]).originalTargetPosition = camtarget(globalVarsMx.(['giftiFig', num2str(figNum)]).axisHandle);
    globalVarsMx.(['giftiFig', num2str(figNum)]).originalUpPosition = camup(globalVarsMx.(['giftiFig', num2str(figNum)]).axisHandle);
    
    % store whether the cam should be yoked
    globalVarsMx.(['giftiFig', num2str(figNum)]).yokeCam = toolConfig.yokeCam;
    
    % check if the cam should be yoked to other displays
    if toolConfig.yokeCam == 1
        
        % make sure the yoke field exists as a global variable
        if ~isfield(globalVarsMx, 'giftiYoke')
            globalVarsMx.giftiYoke = [];
        end
        
        % loop through the yoked axis
        firstYoke = 1;
        for iYoke = length(globalVarsMx.giftiYoke):-1:1
            
            % check if the display (axis) has stopped being valid
            if isempty(globalVarsMx.giftiYoke{iYoke}) || ...
                ~isfield(globalVarsMx, ['giftiFig', num2str(globalVarsMx.giftiYoke{iYoke})]) || ...
                ~isfield(globalVarsMx.(['giftiFig', num2str(globalVarsMx.giftiYoke{iYoke})]), 'axisHandle') || ...
                ~isvalid(globalVarsMx.(['giftiFig', num2str(globalVarsMx.giftiYoke{iYoke})]).axisHandle)
                % not a valid display
                
                % remove from the yoke list
                globalVarsMx.giftiYoke(iYoke) = [];
                
            else
                % a valid (yoked) display exists
                
                % check if this display is still considered the first yoke
                if firstYoke == 1
                    
                   % flag as not being the first yoke
                   firstYoke = 0;
           
                   % (over)write the toolconfig initial camera pos/target and VA
                   % so that this display will adjust to the already existing ones
                   toolConfig.camPos = campos(globalVarsMx.(['giftiFig', num2str(globalVarsMx.giftiYoke{iYoke})]).axisHandle);
                   toolConfig.camTarget = camtarget(globalVarsMx.(['giftiFig', num2str(globalVarsMx.giftiYoke{iYoke})]).axisHandle);
                   toolConfig.camUp = camup(globalVarsMx.(['giftiFig', num2str(globalVarsMx.giftiYoke{iYoke})]).axisHandle);
                   toolConfig.camVA = camva(globalVarsMx.(['giftiFig', num2str(globalVarsMx.giftiYoke{iYoke})]).axisHandle);
                    
                end
                
            end
            
        end
        
        % add to the list of yoked displays
        globalVarsMx.giftiYoke{end + 1} = figNum;
        
    end

    % set the target, pos and zoom to manual (so they do not auto adjust to each other)
    camtarget(globalVarsMx.(['giftiFig', num2str(figNum)]).axisHandle, 'manual');
    campos(globalVarsMx.(['giftiFig', num2str(figNum)]).axisHandle, 'manual');
    camup(globalVarsMx.(['giftiFig', num2str(figNum)]).axisHandle, 'manual');
    camva(globalVarsMx.(['giftiFig', num2str(figNum)]).axisHandle, 'manual');
    
    % set the camera position and target (by config)
    if ~isempty(toolConfig.camTarget)
       camtarget(globalVarsMx.(['giftiFig', num2str(figNum)]).axisHandle, toolConfig.camTarget); 
    end
    if ~isempty(toolConfig.camPos)
       campos(globalVarsMx.(['giftiFig', num2str(figNum)]).axisHandle, toolConfig.camPos); 
    end
    if ~isempty(toolConfig.camUp)
       camup(globalVarsMx.(['giftiFig', num2str(figNum)]).axisHandle, toolConfig.camUp); 
    end
    
    % set the camera view-angle (by config)
    if ~isempty(toolConfig.camVA)
        camva(globalVarsMx.(['giftiFig', num2str(figNum)]).axisHandle, toolConfig.camVA); 
    end

    % store the current view angle (assuming the current is 0)
    globalVarsMx.(['giftiFig', num2str(figNum)]).cameraVA = camva(globalVarsMx.(['giftiFig', num2str(figNum)]).axisHandle);
    
    % set the light coming from the camera
    delete(findall(globalVarsMx.(['giftiFig', num2str(figNum)]).figHandle, 'Type', 'light'))
    globalVarsMx.(['giftiFig', num2str(figNum)]).cameraLight = camlight(globalVarsMx.(['giftiFig', num2str(figNum)]).axisHandle, 'headlight');
    
    % set the local (GUI) figure close callback
    if globalVarsMx.(['giftiFig', num2str(figNum)]).hideToolWindow ~= 1
        set(globalVarsMx.(['giftiFig', num2str(figNum)]).thisFig, 'CloseRequestFcn', {@thisFigureCloseReq, figNum});
    end
    
    % set the remote figure close callback
    globalVarsMx.(['giftiFig', num2str(figNum)]).prevCloseRequestFnc = globalVarsMx.(['giftiFig', num2str(figNum)]).figHandle.CloseRequestFcn;
    set(globalVarsMx.(['giftiFig', num2str(figNum)]).figHandle, 'CloseRequestFcn', {@remoteFigureCloseReq, figNum});
    
    % set the navigation handlers for the figure and patch
    globalVarsMx.(['giftiFig', num2str(figNum)]).prevWindowButtonDownFcn = globalVarsMx.(['giftiFig', num2str(figNum)]).figHandle.WindowButtonDownFcn;
    globalVarsMx.(['giftiFig', num2str(figNum)]).prevKeyPressFcn = globalVarsMx.(['giftiFig', num2str(figNum)]).figHandle.KeyPressFcn;
    globalVarsMx.(['giftiFig', num2str(figNum)]).prevKeyReleaseFcn = globalVarsMx.(['giftiFig', num2str(figNum)]).figHandle.KeyReleaseFcn;
    set(globalVarsMx.(['giftiFig', num2str(figNum)]).figHandle, 'WindowButtonDownFcn', {@mouseDownFnc, figNum});
    set(globalVarsMx.(['giftiFig', num2str(figNum)]).figHandle, 'WindowButtonUpFcn', {@mouseUpFnc, figNum});
    set(globalVarsMx.(['giftiFig', num2str(figNum)]).figHandle,'windowscrollWheelFcn', {@mouseScrollFnc, figNum});
    set(globalVarsMx.(['giftiFig', num2str(figNum)]).patchHandle,'ButtonDownFcn', {@patchMouseDownFnc, figNum});
    set(globalVarsMx.(['giftiFig', num2str(figNum)]).figHandle,'KeyPressFcn',{@keyPressFnc, figNum});
    set(globalVarsMx.(['giftiFig', num2str(figNum)]).figHandle,'KeyReleaseFcn',{@keyReleaseFnc, figNum});
    
end

function instanceExists = checkInstance(figNum)
    global globalVarsMx;
    
    % check if a handle to a tools GUI is still present in the global variable
    if isfield(globalVarsMx, ['giftiFig', num2str(figNum)]) && ~isempty(globalVarsMx.(['giftiFig', num2str(figNum)]))
        
        % check whether the tools GUI still exists
        if isfield(globalVarsMx.(['giftiFig', num2str(figNum)]), 'thisFig') && isvalid(globalVarsMx.(['giftiFig', num2str(figNum)]).thisFig)
            
            % return existence of other instance
            instanceExists = 1;
            return;
            
        end

    end
    
    % return no other instance
    instanceExists = 0;
    
end

% function to calculate the matlab postion, given a
% normal top-left orientation. Makes UI element positioning a lot more
% intuiitive
function position = getTDPos(figNum, left, top, width, height)
    global globalVarsMx;
    position = [left, globalVarsMx.(['giftiFig', num2str(figNum)]).toolFigHeight - top - height, width, height];
end




%%%
% navigation controls
%%%

function keyPressFnc(~, event, figNum)
    
end

function keyReleaseFnc(~, event, figNum)
    global globalVarsMx;

    % check for general key-releases
    if(strcmp (event.Key , 'w'))
        % W-key
        
        % toggle the wireframe display
        globalVarsMx.(['giftiFig', num2str(figNum)]).showWireframe = ~globalVarsMx.(['giftiFig', num2str(figNum)]).showWireframe;
        
        % show or hide the wireframe
        showWireframe(figNum, globalVarsMx.(['giftiFig', num2str(figNum)]).showWireframe);
        
        return;

    elseif(strcmp (event.Key , 'v'))
        % V-key
        
        % toggle the vertex display
        globalVarsMx.(['giftiFig', num2str(figNum)]).showVertices = ~globalVarsMx.(['giftiFig', num2str(figNum)]).showVertices;
        
        % show or hide the vertices
        showVertices(figNum, globalVarsMx.(['giftiFig', num2str(figNum)]).showVertices);
        
        return;
        
    elseif(strcmp (event.Key , 'e'))
        % E-key
        
        % check which mode
        if globalVarsMx.(['giftiFig', num2str(figNum)]).mode == 1
            % edit mode
            
            % set the mode to viewing (0)
            globalVarsMx.(['giftiFig', num2str(figNum)]).mode = 0;
        
            % set arrow pointer
            set(globalVarsMx.(['giftiFig', num2str(figNum)]).figHandle, 'pointer', 'arrow');
            
        else
            % viewing mode
            
            % set the mode to edit mode (1)
            globalVarsMx.(['giftiFig', num2str(figNum)]).mode = 1;
            
            % disable whatever was happening on mouse movement
            set(globalVarsMx.(['giftiFig', num2str(figNum)]).figHandle, 'WindowButtonMotionFcn', '');
            
            % set crosshair pointer
            set(globalVarsMx.(['giftiFig', num2str(figNum)]).figHandle, 'pointer', 'crosshair' )        
            
        end
        
        return;

    elseif(strcmp (event.Key , 's'))
        % S-key
        
        filter = {'*.gii';'*.*'};
        [file,path] = uiputfile(filter, 'Save gifti as...');
        if isequal(file,0) || isequal(path,0)
           
        else
            
            % create gifti to save
            displayGifti.vertices = globalVarsMx.(['giftiFig', num2str(figNum)]).displayVertices;
            displayGifti.faces = globalVarsMx.(['giftiFig', num2str(figNum)]).displayFaces;
            displayGifti = gifti(displayGifti);
            
            % save the gifti
            save(displayGifti, fullfile(path,file));
            
            % message
            disp(['Succesfully stored gifti: ', fullfile(path,file)]);
            
        end
        
        
        return;
        
    end

    if globalVarsMx.(['giftiFig', num2str(figNum)]).mode == 0
        % in viewing mode
        
        % 
        if(strcmp (event.Key , 'c'))
            % C-key

            % retrieve the elapsed time (if a earlier control release is there)
            elapsed = 10000000;
            if isfield(globalVarsMx.(['giftiFig', num2str(figNum)]), 'lastCtrlReleaseTime') && ~isempty(globalVarsMx.(['giftiFig', num2str(figNum)]).lastCtrlReleaseTime)
                elapsed = toc(globalVarsMx.(['giftiFig', num2str(figNum)]).lastCtrlReleaseTime);
            end

            % check if the latest control release was within a second from now    
            if elapsed < 0.5

                % reset the release time, this causes another
                % two control releases to be required
                globalVarsMx.(['giftiFig', num2str(figNum)]).lastCtrlReleaseTime = globalVarsMx.(['giftiFig', num2str(figNum)]).lastCtrlReleaseTime - 1000000001;

                % reset the camera
                camtarget(globalVarsMx.(['giftiFig', num2str(figNum)]).axisHandle, [0, 0, 0]);

                % yoke propegate the camera position
                yokePropegateCam(figNum);

            else

                % store the new timestamp for the laster control release
                globalVarsMx.(['giftiFig', num2str(figNum)]).lastCtrlReleaseTime = tic;    

            end
            
            return;
            
        end
        
    elseif globalVarsMx.(['giftiFig', num2str(figNum)]).mode == 1
        % in edit mode
        
        if(strcmp (event.Key , 'escape'))
            % escape-key

            % reset the selected vertices
            globalVarsMx.(['giftiFig', num2str(figNum)]).selectedVertices = [];
            
            % check if the vertices are shown
            if isfield(globalVarsMx.(['giftiFig', num2str(figNum)]), 'vertexPlot') && ~isempty(globalVarsMx.(['giftiFig', num2str(figNum)]).vertexPlot)
                
                % reset the colors in the plot
                cData = repmat( globalVarsMx.(['giftiFig', num2str(figNum)]).vertexMarkerEdgeColor, ...
                                [length(globalVarsMx.(['giftiFig', num2str(figNum)]).vertexPlot.XData) 1]);
                set(globalVarsMx.(['giftiFig', num2str(figNum)]).vertexPlot, 'CData', cData);
                
            end
            
            % reset the selected faces
            globalVarsMx.(['giftiFig', num2str(figNum)]).selectedFaces = [];

            % delete the face-patches from the view
            for i = 1:size(globalVarsMx.(['giftiFig', num2str(figNum)]).selectedFacesPlot, 1)    
                delete(globalVarsMx.(['giftiFig', num2str(figNum)]).selectedFacesPlot{i, 1});
                delete(globalVarsMx.(['giftiFig', num2str(figNum)]).selectedFacesPlot{i, 2});
            end
            globalVarsMx.(['giftiFig', num2str(figNum)]).selectedFacesPlot = [];

            % build and update the coloring
            buildColoring(figNum, 1);
            updateColoring(figNum);
        
            return;
            
        end

        if strcmp(event.Key , 'a')
            % A-key
            
            % check if there are exactly three vertices selected
            if length(globalVarsMx.(['giftiFig', num2str(figNum)]).selectedVertices) ~= 3
                fprintf(2, 'Error: could not create new faces based on the selected vertices, exactly 3 vertices need to be selected\n');
                return; 
            end
            
            % check and make sure the vertex normals are available
            checkVertexNormals(figNum);
            
            % retrieve the normals of the vertices
            selAverageNormal = globalVarsMx.(['giftiFig', num2str(figNum)]).vertexNormals(globalVarsMx.(['giftiFig', num2str(figNum)]).selectedVertices, :);
            selAverageNormal = mean(selAverageNormal, 1);
            
            % calculate the normal of the triangle (if it would be created with this order of vertices)
            sel = double(globalVarsMx.(['giftiFig', num2str(figNum)]).displayVertices(globalVarsMx.(['giftiFig', num2str(figNum)]).selectedVertices, :));
            AB = sel(2, :) - sel(1, :);
            AC = sel(3, :) - sel(1, :);
            newTriangleNormal = cross(AB,AC);
            newTriangleNormal = newTriangleNormal / norm(newTriangleNormal);
            
            % calculate the angle between the average normal vector of the
            % selected vertices and the normal of the future triangle
            angle = atan2(norm(cross(selAverageNormal, newTriangleNormal)), dot(selAverageNormal, newTriangleNormal));
            
            % check if future triangle normal would be pointing more
            % than 90 degrees away from the average normal
            if angle > deg2rad(90)
                % pointing the other way
                
                % reverse order of vertices
                globalVarsMx.(['giftiFig', num2str(figNum)]).selectedVertices = flip(globalVarsMx.(['giftiFig', num2str(figNum)]).selectedVertices);
                
            end
            
            % add a new face based on the three vertices
            globalVarsMx.(['giftiFig', num2str(figNum)]).displayFaces(end + 1, :) = globalVarsMx.(['giftiFig', num2str(figNum)]).selectedVertices;
            globalVarsMx.(['giftiFig', num2str(figNum)]).baseFaces(end + 1, :) = globalVarsMx.(['giftiFig', num2str(figNum)]).selectedVertices;
            if isfield(globalVarsMx.(['giftiFig', num2str(figNum)]), 'secVertices')
                globalVarsMx.(['giftiFig', num2str(figNum)]).secFaces(end + 1, :) = globalVarsMx.(['giftiFig', num2str(figNum)]).selectedVertices;
            end
            
            % message
            disp(['Succesfully added face ', num2str(length(globalVarsMx.(['giftiFig', num2str(figNum)]).displayFaces))]);
            
            % update the geometry and coloring
            updateGeometry(figNum, 0);
            buildColoring(figNum, 1);
            updateColoring(figNum);

        elseif strcmp (event.Key , 'r')
            % R-key
            
            % store whether the vertices are shown
            verticesShown = globalVarsMx.(['giftiFig', num2str(figNum)]).showVertices;
            
            % variable to store the faces that should be deleted
            delFaces = [];

            % check if the vertices were shown
            if verticesShown == 1
                
                % determine which vertices are selected and set to be deleted
                delVertices = globalVarsMx.(['giftiFig', num2str(figNum)]).selectedVertices;

                % determine which faces should be deleted because they will be
                % missing one of their three vertices
                delFaces = ismember(globalVarsMx.(['giftiFig', num2str(figNum)]).displayFaces, delVertices);
                delFaces = any(delFaces, 2);
                delFaces = find(delFaces);

            end
            
            % determine which faces are selected and concatenate these to
            % the list of faces to be deleted because of their vertices
            delFaces = [delFaces; globalVarsMx.(['giftiFig', num2str(figNum)]).selectedFaces'];
            delFaces = unique(delFaces);
            
            % check if there are faces to be deleted
            if ~isempty(delFaces)

                % retrieve the faces list (and exclude the faces bound to be deleted)
                keepFaces = 1:1:size(globalVarsMx.(['giftiFig', num2str(figNum)]).displayFaces, 1);
                keepFaces(delFaces) =[];

                % get a vertex and faces list of the 3d object with all but the deleted faces
                % this will renumber the vertices
                [vertexMatrix, facesMatrix, vertexConversion] = mx.three_dimensional.extract3DFaces(globalVarsMx.(['giftiFig', num2str(figNum)]).displayVertices, ...
                                                                                                    globalVarsMx.(['giftiFig', num2str(figNum)]).displayFaces, ...
                                                                                                    keepFaces);


                % remove the faces and vertices
                % the face list can be overwritten, whereas the vertices are moved to keep the coordinates in place.
                globalVarsMx.(['giftiFig', num2str(figNum)]).displayFaces = facesMatrix;
                globalVarsMx.(['giftiFig', num2str(figNum)]).displayVertices = globalVarsMx.(['giftiFig', num2str(figNum)]).displayVertices(vertexConversion(:, 1), :);
                globalVarsMx.(['giftiFig', num2str(figNum)]).baseFaces = facesMatrix;
                globalVarsMx.(['giftiFig', num2str(figNum)]).baseVertices = globalVarsMx.(['giftiFig', num2str(figNum)]).baseVertices(vertexConversion(:, 1), :);
                if isfield(globalVarsMx.(['giftiFig', num2str(figNum)]), 'secVertices')
                    globalVarsMx.(['giftiFig', num2str(figNum)]).secVertices = globalVarsMx.(['giftiFig', num2str(figNum)]).secVertices(vertexConversion(:, 1), :);
                    globalVarsMx.(['giftiFig', num2str(figNum)]).secFaces = facesMatrix;
                end

                % todo: coloring

                % message
                disp(['Succesfully added removed faces and vertices']);

                % empty the list of selected faces
                globalVarsMx.(['giftiFig', num2str(figNum)]).selectedFaces = [];

                % delete the face-patches from the view
                for i = 1:size(globalVarsMx.(['giftiFig', num2str(figNum)]).selectedFacesPlot, 1)    
                    delete(globalVarsMx.(['giftiFig', num2str(figNum)]).selectedFacesPlot{i, 1});
                    delete(globalVarsMx.(['giftiFig', num2str(figNum)]).selectedFacesPlot{i, 2});
                end
                globalVarsMx.(['giftiFig', num2str(figNum)]).selectedFacesPlot = [];

                % empty the list of selected vertices
                globalVarsMx.(['giftiFig', num2str(figNum)]).selectedVertices = [];

                % (temporarily) hide the vertices if they are shown
                if verticesShown, showVertices(figNum, 0); end

                % update the geometry and coloring
                updateGeometry(figNum, 0);
                buildColoring(figNum, 1);
                updateColoring(figNum);

                % if the vertices were shown before, show them again
                if verticesShown, showVertices(figNum, 1); end
                
            end     % if there are faces to be deleted
            
        elseif strcmp(event.Key , 'leftarrow') || strcmp(event.Key , 'rightarrow') || ...
                strcmp(event.Key , 'uparrow') || strcmp(event.Key , 'downarrow') || ...
                strcmp(event.Key , 'pageup') || strcmp(event.Key , 'pagedown')
            
            % list of vertices to be moved
            movVertices = [];

            % check if vertices are shown
            if globalVarsMx.(['giftiFig', num2str(figNum)]).showVertices
                
                % determine which vertices are selected and set to be moved
                movVertices = globalVarsMx.(['giftiFig', num2str(figNum)]).selectedVertices;
                
            end

            % determine which face vertices should be moved
            faceVertices = globalVarsMx.(['giftiFig', num2str(figNum)]).displayFaces(globalVarsMx.(['giftiFig', num2str(figNum)]).selectedFaces, :);
            
            % cumulate the face vertices and 
            movVertices = [movVertices, faceVertices(:)'];
            movVertices = unique(movVertices);

            % retrieve the camup vector as the initial move vector and normalize
            vecMove = camup(globalVarsMx.(['giftiFig', num2str(figNum)]).axisHandle);
            
            % transform the vector depending on the key pressed
            if strcmp(event.Key , 'leftarrow')
                
                target = camtarget(globalVarsMx.(['giftiFig', num2str(figNum)]).axisHandle);
                pos = campos(globalVarsMx.(['giftiFig', num2str(figNum)]).axisHandle);
                vecAt = target - pos;
                vecAt = vecAt / norm(vecAt);
                vecMove = cross(vecMove, vecAt);
                
            elseif strcmp(event.Key , 'rightarrow')
                
                target = camtarget(globalVarsMx.(['giftiFig', num2str(figNum)]).axisHandle);
                pos = campos(globalVarsMx.(['giftiFig', num2str(figNum)]).axisHandle);
                vecAt = pos - target;
                vecAt = vecAt / norm(vecAt);
                vecMove = cross(vecMove, vecAt);
                
            elseif strcmp(event.Key , 'uparrow')
                % do nothing, initialized to the camera up vector
            elseif strcmp(event.Key , 'downarrow')
                vecMove = vecMove * -1;     % take the inverse direction
            elseif strcmp(event.Key, 'pageup')
                
                target = camtarget(globalVarsMx.(['giftiFig', num2str(figNum)]).axisHandle);
                pos = campos(globalVarsMx.(['giftiFig', num2str(figNum)]).axisHandle);
                vecAt = pos - target;
                vecAt = vecAt / norm(vecAt);
                vecMove = vecAt;

            elseif strcmp(event.Key, 'pagedown')
                
                target = camtarget(globalVarsMx.(['giftiFig', num2str(figNum)]).axisHandle);
                pos = campos(globalVarsMx.(['giftiFig', num2str(figNum)]).axisHandle);
                vecAt = target - pos;
                vecAt = vecAt / norm(vecAt);
                vecMove = vecAt;
                
            end
            
            vecMove = vecMove * 0.5;
            
            % move the vertices
            globalVarsMx.(['giftiFig', num2str(figNum)]).displayVertices(movVertices, :) = globalVarsMx.(['giftiFig', num2str(figNum)]).displayVertices(movVertices, :) + vecMove;
            globalVarsMx.(['giftiFig', num2str(figNum)]).baseVertices(movVertices, :) = globalVarsMx.(['giftiFig', num2str(figNum)]).baseVertices(movVertices, :) + vecMove;
            if isfield(globalVarsMx.(['giftiFig', num2str(figNum)]), 'secVertices')
                globalVarsMx.(['giftiFig', num2str(figNum)]).secVertices(movVertices, :) = globalVarsMx.(['giftiFig', num2str(figNum)]).secVertices(movVertices, :) + vecMove;
            end
            
            % check if the vertices are shown
            if isfield(globalVarsMx.(['giftiFig', num2str(figNum)]), 'vertexPlot') && ~isempty(globalVarsMx.(['giftiFig', num2str(figNum)]).vertexPlot)
            
                % move the plotted vertices that are involved in the selection (faces and seperate vertices)
                pPos = [globalVarsMx.(['giftiFig', num2str(figNum)]).vertexPlot.XData', ...                        
                        globalVarsMx.(['giftiFig', num2str(figNum)]).vertexPlot.YData', ...
                        globalVarsMx.(['giftiFig', num2str(figNum)]).vertexPlot.ZData'];
                pPos(movVertices, :) = pPos(movVertices, :) + vecMove;
                set(globalVarsMx.(['giftiFig', num2str(figNum)]).vertexPlot, ...
                    'XData', pPos(:, 1), ...
                    'YData', pPos(:, 2), ...
                    'ZData', pPos(:, 3));
            end
            
            
            % move the faces that indicate the selections
            for i = 1:size(globalVarsMx.(['giftiFig', num2str(figNum)]).selectedFacesPlot, 1)    
                globalVarsMx.(['giftiFig', num2str(figNum)]).selectedFacesPlot{i, 1}.Vertices = globalVarsMx.(['giftiFig', num2str(figNum)]).selectedFacesPlot{i, 1}.Vertices + vecMove;
                globalVarsMx.(['giftiFig', num2str(figNum)]).selectedFacesPlot{i, 2}.Vertices = globalVarsMx.(['giftiFig', num2str(figNum)]).selectedFacesPlot{i, 2}.Vertices + vecMove;
            end

            % update the geometry (only vertices)
            updateGeometry(figNum, 1);
            
        end     % selection of key
        
    end     % mode
    
end

function patchMouseDownFnc(~, hit, figNum)
    global globalVarsMx;
    
    % check the mode
    if globalVarsMx.(['giftiFig', num2str(figNum)]).mode == 0
        % viewing

        % check if the control modifier was set
        modifiers = get(globalVarsMx.(['giftiFig', num2str(figNum)]).figHandle,'CurrentModifier');
        ctrlPressed  = ismember('control', modifiers);
        if ctrlPressed

            % set the clicked 3d point as the new camera target
            camtarget(hit.IntersectionPoint);

            % yoke propegate the camera position
            yokePropegateCam(figNum);

        end
        
    elseif globalVarsMx.(['giftiFig', num2str(figNum)]).mode == 1
        % edit
        
        %
        % determine which face was clicked
        %
        
        % convert the vertex datatype to double, this will prevent a lot of
        % missing the triangle when clicking on edges between triangles
        vertices = double(globalVarsMx.(['giftiFig', num2str(figNum)]).displayVertices);
        faces = globalVarsMx.(['giftiFig', num2str(figNum)]).displayFaces;
        
        % calculate the distance from the interception point to the vertices       
        distances = sqrt(sum((vertices - hit.IntersectionPoint) .^ 2, 2));
        
        % check which vertices could be within the range to be part of the clicked face
        withinVertices = distances < globalVarsMx.(['giftiFig', num2str(figNum)]).edgeMax * 1.5;
        
        % determine the indices of the vertices within search distance
        withinVertexIndices = find(withinVertices);

        % determine the faces that have at least one vertex within search distance
        withinFaces = ismember(faces, withinVertexIndices);
        withinFaces = any(withinFaces, 2);

        % determine the indices of the faces within search distance
        withinFaceIndices = find(withinFaces);
        
        % shift the origin to the first vertex of every triangle
        % and calculate the (x, y, z) difference between the origin and the hit point
        E1 = vertices(faces(withinFaceIndices, 2), :) - vertices(faces(withinFaceIndices, 1), :);
        E2 = vertices(faces(withinFaceIndices, 3), :) - vertices(faces(withinFaceIndices, 1), :);
        D  = bsxfun(@minus, hit.IntersectionPoint, vertices(faces(withinFaceIndices, 1), :));
        
        % determine barycentric coordinates
        bCoord = zeros(numel(withinFaceIndices), 2);
        for i = 1:numel(withinFaceIndices)
            bCoord(i,1:2) = ([E1(i,:)' E2(i, :)'] \ D(i, :)')';
        end
        
        % determine for each triangle whether both barycentric coordinates
        % of the hit point are higher than 0 and added up are below 1
        % (meaning the point is inside that triangle)
        pInTriangle = all(bCoord >= 0 & sum(bCoord, 2) <= 1, 2);
        
        % determine if there is at least one triangle that contains the hitpoint
        selectedFace = [];
        if nnz(pInTriangle) > 0
            % triangle
        
            % store the selected face
            selectedFace = withinFaceIndices(find(pInTriangle, 1));
            
        else
            return;
        end
        
        
        % check if vertices are shown, in that case first try to snap to
        % vertex (if the vertex is close enough)
        % 
        % this is particularly important since the vertex markers are shown
        % on the vertex itself, which in some orientation of the object
        % cause the markers to be partially behind an object triangle. This
        % snap functionallity allows for the selection of the vertex while
        % clicking on a object triangle instead of the vertex marker (which
        % callbacks on vertexPlotMouseDownFnc).
        selectedVertex = [];
        if globalVarsMx.(['giftiFig', num2str(figNum)]).showVertices
            
            % check which vertices belong to the selected face
            faceVertices = vertices(faces(selectedFace, :), :);
            
            % determine which of the vertices is the closest
            distances = sqrt(sum((faceVertices - hit.IntersectionPoint) .^ 2, 2));
            [~, closestVertex] = min(distances);
            
            % calculate the barycentric coordinate to the closest vertex
            originVertex = faceVertices(closestVertex, :);
            otherVertices = faceVertices((1:1:3) ~= closestVertex, :);
            E = otherVertices - originVertex;
            D = hit.IntersectionPoint - originVertex;
            bCoord = ([E(1,:)' E(2, :)'] \ D')';
            
            % check if the vertex varycentric coordinates are close enough to be  
            if (bCoord < 0.2 & sum(bCoord, 2) < .3)
                
                % store the selected vertex
                selectedVertex = faces(selectedFace, closestVertex);
                
            end
            
        end
        
        % check if a vertex is found, if not, it is a face click
        if ~isempty(selectedVertex)
            % vertex click
            
            % pass to callback
            vertexClicked(figNum, selectedVertex);
            
        else
            % face click
            
            % pass to callback
            faceClicked(figNum, selectedFace);
         
        end 
    end
    
end

function vertexPlotMouseDownFnc(~, hit, figNum)
    global globalVarsMx;

    % check the mode
    if globalVarsMx.(['giftiFig', num2str(figNum)]).mode == 0
        % viewing
        
        
    elseif globalVarsMx.(['giftiFig', num2str(figNum)]).mode == 1
        % edit
        
        % determine which of the vertices is the closest
        distances = sqrt(sum((globalVarsMx.(['giftiFig', num2str(figNum)]).displayVertices - hit.IntersectionPoint) .^ 2, 2));
        [~, selectedVertex] = min(distances);
        
        % pass to callback
        vertexClicked(figNum, selectedVertex);
        
    end    
    
    
end

function mouseScrollFnc(~, event, figNum)
    global globalVarsMx;
    
    % check the mode
    if globalVarsMx.(['giftiFig', num2str(figNum)]).mode == 0
        % viewing
        
        % calculate the new camera view angle
        globalVarsMx.(['giftiFig', num2str(figNum)]).cameraVA = globalVarsMx.(['giftiFig', num2str(figNum)]).cameraVA * (1 + event.VerticalScrollCount / 10);
        if (globalVarsMx.(['giftiFig', num2str(figNum)]).cameraVA < 0.1)
            globalVarsMx.(['giftiFig', num2str(figNum)]).cameraVA = 0.1;
        end

        % set the new camera view angle
        camva(globalVarsMx.(['giftiFig', num2str(figNum)]).axisHandle, globalVarsMx.(['giftiFig', num2str(figNum)]).cameraVA);

        % yoke propegate the zoom
        yokePropegateZoom(figNum);
        
    end
    
end

function mouseDownFnc(src, ~, figNum)
    global globalVarsMx;

    % check if in viewing mode
    if globalVarsMx.(['giftiFig', num2str(figNum)]).mode == 0

        % detect modifiers (shift/control/alt)
        modifiers = get(globalVarsMx.(['giftiFig', num2str(figNum)]).figHandle,'CurrentModifier');
        shiftPressed = ismember('shift',   modifiers);
        ctrlPressed  = ismember('control', modifiers);
        modifierPressed = shiftPressed | ctrlPressed;

        % set an initial mouse position point
        globalVarsMx.(['giftiFig', num2str(figNum)]).dragStartPoint = get(src, 'CurrentPoint');

        % check which button was clicked
        st = get(src,'SelectionType');
        if strcmpi(st,'normal') || strcmpi(st,'extend')
            % left mousebutton (normal) or shift and left (extend)

            % check if no modifier was pressed
            if ~modifierPressed

                % rotate (orbit) camera on mouse movement
                set(globalVarsMx.(['giftiFig', num2str(figNum)]).figHandle, 'WindowButtonMotionFcn', {@mouseMoveRotateFnc, figNum});

            elseif shiftPressed && ~ctrlPressed

                % move (pan) camera on mouse movement
                set(globalVarsMx.(['giftiFig', num2str(figNum)]).figHandle, 'WindowButtonMotionFcn', {@mouseMoveTransFnc, figNum});

            end

        elseif strcmpi(st,'alt')
            % right mousebutton

            % check if no modifier was pressed
            if ~modifierPressed

                % zoom camera on mouse movement
                set(globalVarsMx.(['giftiFig', num2str(figNum)]).figHandle, 'WindowButtonMotionFcn', {@mouseMoveZoomFnc, figNum});

            end

        else
            % left and right mousebutton

            % check if no modifier was pressed
            if ~modifierPressed

                % do not do anything on mouse movement
                set(globalVarsMx.(['giftiFig', num2str(figNum)]).figHandle, 'WindowButtonMotionFcn', '');

            end

        end
        
    end
    
end

function mouseMoveTransFnc(~, event, figNum)
    global globalVarsMx;

    % retrieve the current mouse position
    pt = get(event.Source, 'CurrentPoint');
    
    % calculate the difference between the points and update the current mouse position
    ptDiff = pt - globalVarsMx.(['giftiFig', num2str(figNum)]).dragStartPoint;
    globalVarsMx.(['giftiFig', num2str(figNum)]).dragStartPoint = pt;
    
    % move the camera and target
    camdolly(-ptDiff(1) / 100, -ptDiff(2) / 100, 0, 'movetarget');
    
    % delete and recreate the light at the camera position
    delete(globalVarsMx.(['giftiFig', num2str(figNum)]).cameraLight);
    globalVarsMx.(['giftiFig', num2str(figNum)]).cameraLight = camlight(globalVarsMx.(['giftiFig', num2str(figNum)]).axisHandle, 'headlight');
    
    % yoke propegate the camera position
    yokePropegateCam(figNum);
    
end

function mouseMoveRotateFnc(~, event, figNum)
    global globalVarsMx;
    
    % retrieve the current mouse position
    pt = get(event.Source, 'CurrentPoint');
    
    % calculate the difference between the points and update the current mouse position
    ptDiff = pt - globalVarsMx.(['giftiFig', num2str(figNum)]).dragStartPoint;
    globalVarsMx.(['giftiFig', num2str(figNum)]).dragStartPoint = pt;
    
    % rotate the camera
    camorbit(globalVarsMx.(['giftiFig', num2str(figNum)]).axisHandle, -ptDiff(1), -ptDiff(2));
    
    % delete and recreate the light at the camera position
    delete(globalVarsMx.(['giftiFig', num2str(figNum)]).cameraLight);
    globalVarsMx.(['giftiFig', num2str(figNum)]).cameraLight = camlight(globalVarsMx.(['giftiFig', num2str(figNum)]).axisHandle, 'headlight');
    
    % yoke propegate the camera position
    yokePropegateCam(figNum);
    
end

function mouseMoveZoomFnc(~, event, figNum)
    global globalVarsMx;

    % retrieve the current mouse position
    pt = get(event.Source, 'CurrentPoint');
    
    % calculate the difference between the points and update the current mouse position
    ptDiff = pt - globalVarsMx.(['giftiFig', num2str(figNum)]).dragStartPoint;
    globalVarsMx.(['giftiFig', num2str(figNum)]).dragStartPoint = pt;
    
    % calculate the new camera view angle
    globalVarsMx.(['giftiFig', num2str(figNum)]).cameraVA = globalVarsMx.(['giftiFig', num2str(figNum)]).cameraVA * (1 + ptDiff(2) / 100);
    if (globalVarsMx.(['giftiFig', num2str(figNum)]).cameraVA < 0.1)
        globalVarsMx.(['giftiFig', num2str(figNum)]).cameraVA = 0.1;
    end
    
    % set the new camera view angle
    camva(globalVarsMx.(['giftiFig', num2str(figNum)]).axisHandle, globalVarsMx.(['giftiFig', num2str(figNum)]).cameraVA);
    
    % yoke propegate the zoom
    yokePropegateZoom(figNum);
    
end

function mouseUpFnc(~, ~, figNum)
    global globalVarsMx;
    
    % check the mode
    if globalVarsMx.(['giftiFig', num2str(figNum)]).mode == 0
        % viewing
        
        % do not do anything on mouse movement
        set(globalVarsMx.(['giftiFig', num2str(figNum)]).figHandle, 'WindowButtonMotionFcn', '');
        
    end 
    
end

function yokePropegateCam(figNum)
    global globalVarsMx;
    
    % check if other displays (axis) should be adjusted)
    if (~isempty(globalVarsMx.(['giftiFig', num2str(figNum)]).yokeCam) && globalVarsMx.(['giftiFig', num2str(figNum)]).yokeCam == 1) && length(globalVarsMx.giftiYoke) > 1
        
        % retrieve the pos/target and up vectors from the current display
        newCamPos = campos(globalVarsMx.(['giftiFig', num2str(figNum)]).axisHandle);
        newCamTarget = camtarget(globalVarsMx.(['giftiFig', num2str(figNum)]).axisHandle);
        newCamUp = camup(globalVarsMx.(['giftiFig', num2str(figNum)]).axisHandle);
        
        % loop through the yoke displays
        for iYoke = 1:length(globalVarsMx.giftiYoke)
            
            % check if the display is not this one
            if globalVarsMx.giftiYoke{iYoke} ~= figNum
                
                % set the new camera position
                campos(globalVarsMx.(['giftiFig', num2str(globalVarsMx.giftiYoke{iYoke})]).axisHandle, newCamPos);
                camtarget(globalVarsMx.(['giftiFig', num2str(globalVarsMx.giftiYoke{iYoke})]).axisHandle, newCamTarget);
                camup(globalVarsMx.(['giftiFig', num2str(globalVarsMx.giftiYoke{iYoke})]).axisHandle, newCamUp);
    
                % delete and recreate the light at the camera position
                delete(globalVarsMx.(['giftiFig', num2str(globalVarsMx.giftiYoke{iYoke})]).cameraLight);
                globalVarsMx.(['giftiFig', num2str(globalVarsMx.giftiYoke{iYoke})]).cameraLight = camlight(globalVarsMx.(['giftiFig', num2str(globalVarsMx.giftiYoke{iYoke})]).axisHandle, 'headlight');
                
            end
             
        end
        
    end
    
end

function yokePropegateZoom(figNum)
    global globalVarsMx;
    
    % check if other displays (axis) should be adjusted)
    if (~isempty(globalVarsMx.(['giftiFig', num2str(figNum)]).yokeCam) && globalVarsMx.(['giftiFig', num2str(figNum)]).yokeCam == 1) && length(globalVarsMx.giftiYoke) > 1
        
        % retrieve the viewangle from the current display
        newCamVa = camva(globalVarsMx.(['giftiFig', num2str(figNum)]).axisHandle);
        
        % loop through the yoke displays
        for iYoke = 1:length(globalVarsMx.giftiYoke)
            
            % check if the display is not this one
            if globalVarsMx.giftiYoke{iYoke} ~= figNum
                
                % set the new camera position
                camva(globalVarsMx.(['giftiFig', num2str(globalVarsMx.giftiYoke{iYoke})]).axisHandle, newCamVa);
                
            end
             
        end
        
    end
    
end



%%%
% control callbacks and value update functions
%%%

% make sure triangulation is available
function checkTriangulation (figNum)
    global globalVarsMx;
    if isempty(globalVarsMx.(['giftiFig', num2str(figNum)]).triangulation)
    globalVarsMx.(['giftiFig', num2str(figNum)]).triangulation = triangulation( double(globalVarsMx.(['giftiFig', num2str(figNum)]).displayFaces), ...
                                                                                double(globalVarsMx.(['giftiFig', num2str(figNum)]).displayVertices));        
    end
end

% make sure face centers are available
function checkFaceCenters (figNum)
    global globalVarsMx;
    checkTriangulation(figNum);
    if isempty(globalVarsMx.(['giftiFig', num2str(figNum)]).faceCenters)
        globalVarsMx.(['giftiFig', num2str(figNum)]).faceCenters = incenter(globalVarsMx.(['giftiFig', num2str(figNum)]).triangulation);
    end
end

% make sure face normals are available
function checkFaceNormals (figNum)
    global globalVarsMx;
    checkTriangulation(figNum);
    if isempty(globalVarsMx.(['giftiFig', num2str(figNum)]).faceNormals)
        globalVarsMx.(['giftiFig', num2str(figNum)]).faceNormals = faceNormal(globalVarsMx.(['giftiFig', num2str(figNum)]).triangulation);
    end
end

% make sure vertex normals are available
function checkVertexNormals (figNum)
    global globalVarsMx;
    checkTriangulation(figNum);
    if isempty(globalVarsMx.(['giftiFig', num2str(figNum)]).vertexNormals)
        globalVarsMx.(['giftiFig', num2str(figNum)]).vertexNormals = vertexNormal(globalVarsMx.(['giftiFig', num2str(figNum)]).triangulation);
    end
end

% callback on a vertex being clicked (when in edit mode where vertices are shown)
function vertexClicked(figNum, vertexIndex)
    global globalVarsMx;
    
    % see if the vertex was already selected
    selected = find(globalVarsMx.(['giftiFig', num2str(figNum)]).selectedVertices == vertexIndex, 1);
    if isempty(selected)
        % vertex is not selected
        
        globalVarsMx.(['giftiFig', num2str(figNum)]).selectedVertices(end + 1) = vertexIndex;
        selected = 1;
        
    else
        % vertex is selected
        
        globalVarsMx.(['giftiFig', num2str(figNum)]).selectedVertices(selected) = [];
        selected = 0;
        
    end
    
    % update the color properties of the selected vertex
    if selected
        globalVarsMx.(['giftiFig', num2str(figNum)]).vertexPlot.CData(vertexIndex, :) = globalVarsMx.(['giftiFig', num2str(figNum)]).selectedVertexMarkerEdgeColor;
    else
        globalVarsMx.(['giftiFig', num2str(figNum)]).vertexPlot.CData(vertexIndex, :) = globalVarsMx.(['giftiFig', num2str(figNum)]).vertexMarkerEdgeColor;
    end
    
end

% callback on a face being clicked (when in edit mode)
function faceClicked(figNum, faceIndex)
    global globalVarsMx;
    
    % see if the face was already selected
    selected = find(globalVarsMx.(['giftiFig', num2str(figNum)]).selectedFaces == faceIndex, 1);
    if isempty(selected)
        % face is not selected
        
        % add the face to the selection
        globalVarsMx.(['giftiFig', num2str(figNum)]).selectedFaces(end + 1) = faceIndex;
        
        % make sure face centers available
        checkFaceCenters(figNum);
        checkFaceNormals(figNum);
        
        % get the face normal
        normal = globalVarsMx.(['giftiFig', num2str(figNum)]).faceNormals(faceIndex, :);
        
        % get the face coordinates
        faceVertices = globalVarsMx.(['giftiFig', num2str(figNum)]).displayVertices(globalVarsMx.(['giftiFig', num2str(figNum)]).displayFaces(faceIndex, :), :);
        
        % move the new faces slighty in front of and behind the selected face
        faceVerticesMarked1 = faceVertices + normal * -0.01;
        faceVerticesMarked2 = faceVertices + normal *  0.01;
        
        % add the new faces to show the selection
        hold on;
        globalVarsMx.(['giftiFig', num2str(figNum)]).selectedFacesPlot{end + 1, 1} = patch( faceVerticesMarked1(:, 1), ...
                                                                                            faceVerticesMarked1(:, 2), ...
                                                                                            faceVerticesMarked1(:, 3), ...
                                                                                            globalVarsMx.(['giftiFig', num2str(figNum)]).selectedFaceColor, ...
                                                                                            'FaceLighting', 'none', ...
                                                                                            'ButtonDownFcn', {@patchMouseDownFnc, figNum} ...
                                                                                        );
        globalVarsMx.(['giftiFig', num2str(figNum)]).selectedFacesPlot{end, 2} = patch( faceVerticesMarked2(:, 1), ...
                                                                                            faceVerticesMarked2(:, 2), ...
                                                                                            faceVerticesMarked2(:, 3), ...
                                                                                            globalVarsMx.(['giftiFig', num2str(figNum)]).selectedFaceColor, ...
                                                                                            'FaceLighting', 'none', ...
                                                                                            'ButtonDownFcn', {@patchMouseDownFnc, figNum} ...
                                                                                        );
        hold off;
        
    else
        % face is selected
        
        % delete the patches from the view
        delete(globalVarsMx.(['giftiFig', num2str(figNum)]).selectedFacesPlot{selected, 1});
        delete(globalVarsMx.(['giftiFig', num2str(figNum)]).selectedFacesPlot{selected, 2});
        
        % remove the selected face
        globalVarsMx.(['giftiFig', num2str(figNum)]).selectedFaces(selected) = [];
        globalVarsMx.(['giftiFig', num2str(figNum)]).selectedFacesPlot(selected, :) = [];
        
    end
    
    % build and update the coloring
    buildColoring(figNum, 1);
    updateColoring(figNum);
    
end

% callback on the overlay on overlay type combobox
function switchOverlayOverlayType(hObject, ~, figNum)
    global globalVarsMx;
    
    % set the overlay on overlay type
    globalVarsMx.(['giftiFig', num2str(figNum)]).overlayOverlayType = get(hObject, 'Value');
    
    % build and update the coloring
    buildColoring(figNum, 1);
    updateColoring(figNum);
    
end

% callback on the overlay on overlay ratio slider
function changeOverlayOverlayAlpha(figNum, value)
    global globalVarsMx;
    
    % store the value
    globalVarsMx.(['giftiFig', num2str(figNum)]).overlayOverlayAlpha = round(value);
    
    % build and update the coloring
    buildColoring(figNum, 1);
    updateColoring(figNum);
    
end

% callback on the overlay on background type combobox
function switchOverlayBackgroundType(hObject, ~, figNum)
    global globalVarsMx;
    
    % set the overlay on background type
    globalVarsMx.(['giftiFig', num2str(figNum)]).overlayBackgroundType = get(hObject, 'Value');
    
    % build and update the coloring
    buildColoring(figNum, 1);
    updateColoring(figNum);
    
end


% callback on the overlay on background ratio slider
function changeoverlayBackgroundAlpha(figNum, value)
    global globalVarsMx;
    
    % store the value
    globalVarsMx.(['giftiFig', num2str(figNum)]).overlayBackgroundAlpha = round(value);
    
    % build and update the coloring
    buildColoring(figNum, 1);
    updateColoring(figNum);
    
end



% callback on the overlay colormap combobox
function switchOverlayColormap(hObject, ~, pos, overlayID, figNum)
    
    % set the colormap
    setOverlayColormap(figNum, pos, overlayID, get(hObject, 'Value'));
    
    % update the coloring
    buildColoring(figNum, 1);
    updateColoring(figNum);
    
end

% set the colormap of an overlay
function setOverlayColormap(figNum, pos, overlayID, listIndex)
    global globalVarsMx;
    
    globalVarsMx.(['giftiFig', num2str(figNum)]).overlayColormapListIndex(pos, overlayID) = listIndex;
    
    % retrieve the colormap by list index
    [colormap, name, full] = getColormapByListIndex(figNum, listIndex);
    
    % store the colormap name and whether it is the full spectrum
    globalVarsMx.(['giftiFig', num2str(figNum)]).overlayColormapName{pos, overlayID} = name;
    globalVarsMx.(['giftiFig', num2str(figNum)]).overlayColormapFull{pos, overlayID} = full;
    
    % check whether to use the full or half of the colormap
    if full == 1
        % use full colormap
        
        globalVarsMx.(['giftiFig', num2str(figNum)]).overlayColormap{pos, overlayID} = colormap;
        
    else
        % use half of the colormap
        
        % work on a copy of the colormap
        splitColormap = colormap;
        
        % check if the number of rows in the colormap is even
        if mod(size(splitColormap, 1), 2) == 0
            
            % extend the colormap by adding one interpolated value in the middle
            middleValR = interp1(linspace(0, 1, size(splitColormap(:, 1), 1)), splitColormap(:, 1), 0.5);
            middleValG = interp1(linspace(0, 1, size(splitColormap(:, 2), 1)), splitColormap(:, 2), 0.5);
            middleValB = interp1(linspace(0, 1, size(splitColormap(:, 3), 1)), splitColormap(:, 3), 0.5);
            k = size(splitColormap, 1) / 2;
            splitColormap = [splitColormap(1:k,:); [middleValR, middleValG, middleValB]; splitColormap(k+1:end,:)];
            
        end
        
        % determine the index of the matrix it's middle
        halfIndex = ceil(size(splitColormap, 1) / 2);
        
        % check whether the pos is positive or negative (whether the
        % top or bottom half should be isolated from the colormap)
        if pos == 1
            % negative (lower half)
            
            splitColormap = splitColormap(1:halfIndex, :);
            
        else
            % positive (upper half)
            
            splitColormap = splitColormap(halfIndex:end, :);
            
            
        end
        
        % store the split colormap
        globalVarsMx.(['giftiFig', num2str(figNum)]).overlayColormap{pos, overlayID} = splitColormap;
        
    end
    
    
end

% callback on the overlay checkboxes
function switchOverlayEnabled(hObject, ~, pos, overlayID, figNum)
    global globalVarsMx;
    
    % store the value
    globalVarsMx.(['giftiFig', num2str(figNum)]).overlayEnabled(pos, overlayID) = get(hObject, 'Value');

    % build the new coloring
    buildColoring(figNum, 1);
    
    % update the coloring
    updateColoring(figNum);
    
end

% callback on the overlay display range controls
function changeOverlayRange(hObject, ~, otherControl, pos, overlayID, figNum)
    
    % prevent the selection of text on focus
    jObject = findjobj(hObject);
    jObject.setSelectAllOnFocus(false);
    
    % get the value of the box being edited
    inValueStr = jObject.Text;
    
    % check if the input is a number (valid)
    inValue = str2double(inValueStr);
    if isnan(inValue)
       %errordlg('You must enter a numeric value', 'Invalid Input', 'modal');
       return;
    end
    
    % get the value of the other box
    inValueOtherStr = get(otherControl, 'String');
    
    % check if the input of the other box is a number
    % (don't present an error, that error was already given before)
    inValueOther = str2double(inValueOtherStr);
    if isnan(inValueOther)
        return;
    end
    
    % set the overlay range
    setOverlayRange(figNum, pos, overlayID, inValue, inValueOther);
    
    % build the new coloring
    buildColoring(figNum, 1);
    
    % update the coloring
    updateColoring(figNum)
    
end


% set the value range of an overlay
function setOverlayRange(figNum, pos, overlayID, min, max)
    global globalVarsMx;
    
    % set the values
    if (max > min)
        globalVarsMx.(['giftiFig', num2str(figNum)]).overlayMinValue(pos, overlayID) = min;
        globalVarsMx.(['giftiFig', num2str(figNum)]).overlayMaxValue(pos, overlayID) = max;
    else
        globalVarsMx.(['giftiFig', num2str(figNum)]).overlayMinValue(pos, overlayID) = max;
        globalVarsMx.(['giftiFig', num2str(figNum)]).overlayMaxValue(pos, overlayID) = min;
    end
    globalVarsMx.(['giftiFig', num2str(figNum)]).overlayDeltaValue(pos, overlayID) = globalVarsMx.(['giftiFig', num2str(figNum)]).overlayMaxValue(pos, overlayID) - globalVarsMx.(['giftiFig', num2str(figNum)]).overlayMinValue(pos, overlayID);
    
end

% callback on the background colormap combobox
function switchBackgroundColormap(hObject, ~, backgroundID, figNum)
    
    % set the colormap
    setBackgroundColormap(figNum, backgroundID, get(hObject, 'Value'));
    
    % update the coloring
    buildColoring(figNum, 1);
    updateColoring(figNum);
    
end

% set the colormap of a background
function setBackgroundColormap(figNum, backgroundID, listIndex)
    global globalVarsMx;
    
    globalVarsMx.(['giftiFig', num2str(figNum)]).backgroundColormapListIndex(backgroundID) = listIndex;
    
    % retrieve the colormap by list index
    [colormap, name, full] = getColormapByListIndex(figNum, listIndex);
    
    % store the colormap name and whether it is the full spectrum
    globalVarsMx.(['giftiFig', num2str(figNum)]).backgroundColormapName{backgroundID} = name;
    globalVarsMx.(['giftiFig', num2str(figNum)]).backgroundColormapFull{backgroundID} = full;
    
    % use the colormap
    globalVarsMx.(['giftiFig', num2str(figNum)]).backgroundColormap{backgroundID} = colormap;
    
end

% set the display range of a background
function setBackgroundRange(figNum, backgroundID, min, max)
    global globalVarsMx;
    
    % set the values
    if (max > min)
        globalVarsMx.(['giftiFig', num2str(figNum)]).backgroundMinValue(backgroundID) = min;
        globalVarsMx.(['giftiFig', num2str(figNum)]).backgroundMaxValue(backgroundID) = max;
    else
        globalVarsMx.(['giftiFig', num2str(figNum)]).backgroundMinValue(backgroundID) = max;
        globalVarsMx.(['giftiFig', num2str(figNum)]).backgroundMaxValue(backgroundID) = min;
    end
    globalVarsMx.(['giftiFig', num2str(figNum)]).backgroundDeltaValue(backgroundID) = globalVarsMx.(['giftiFig', num2str(figNum)]).backgroundMaxValue(backgroundID) - globalVarsMx.(['giftiFig', num2str(figNum)]).backgroundMinValue(backgroundID);
    
end

% callback on the background display range controls
function changeBackgroundRange(hObject, ~, otherControl, backgroundID, figNum)
    
    % prevent the selection of text on focus
    jObject = findjobj(hObject);
    jObject.setSelectAllOnFocus(false);
    
    % get the value of the box being edited
    inValueStr = jObject.Text;
    
    % check if the input is a number (valid)
    inValue = str2double(inValueStr);
    if isnan(inValue)
       %errordlg('You must enter a numeric value', 'Invalid Input', 'modal');
       return;
    end
    
    % get the value of the other box
    inValueOtherStr = get(otherControl, 'String');
    
    % check if the input of the other box is a number
    % (don't present an error, that error was already given before)
    inValueOther = str2double(inValueOtherStr);
    if isnan(inValueOther)
        return;
    end
    
    % set the background range
    setBackgroundRange(figNum, backgroundID, inValue, inValueOther);
    
    % build the new coloring
    buildColoring(figNum, 1);
    
    % update the coloring
    updateColoring(figNum);
        
end


% callback on the background checkboxes
function switchBackgroundEnabled(hObject, ~, backgroundID, figNum)
    global globalVarsMx;
    
    % store the value
    globalVarsMx.(['giftiFig', num2str(figNum)]).backgroundEnabled(backgroundID) = get(hObject, 'Value');

    % build the new coloring
    buildColoring(figNum, 1);
    
    % update the coloring
    updateColoring(figNum);
    
end


% callback on the background alpha sliders
function changeBackgroundAlpha(figNum, backgroundID, value)
    global globalVarsMx;
    
    % store the value
    globalVarsMx.(['giftiFig', num2str(figNum)]).backgroundAlpha(backgroundID) = round(value);
    
    % build the new coloring
    buildColoring(figNum, 1);
    
    % update the coloring
    updateColoring(figNum);
    
end


% callback on the morph slider
function changeMorph(figNum, value)
    global globalVarsMx;
    
    % retrieve the value
    globalVarsMx.(['giftiFig', num2str(figNum)]).currentMorphValue = round(value);
    
    % set the label text
    set(globalVarsMx.(['giftiFig', num2str(figNum)]).lblMorph, 'String', ['Morph: ', num2str(round((globalVarsMx.(['giftiFig', num2str(figNum)]).currentMorphValue))), '%']);
    
    % calculate the inbetween values
    globalVarsMx.(['giftiFig', num2str(figNum)]).displayVertices = globalVarsMx.(['giftiFig', num2str(figNum)]).baseVertices + globalVarsMx.(['giftiFig', num2str(figNum)]).secDiff * (globalVarsMx.(['giftiFig', num2str(figNum)]).currentMorphValue / 100);

    % update the geometry
    updateGeometry(figNum, 1);
    
    
end

% callback on the cut buttons
function btnCut(hObject, ~, axis, figNum)
    global globalVarsMx;
    
    % axis in text
    strAxis = 'X';
    if axis == 1
        strAxis = 'Y';
    elseif axis == 2
        strAxis = 'Z';
    end
    
    % prompt the user for a cutoff
    cutExpr = inputdlg( {['Enter a conditional cutoff expression for the ', strAxis, '-axis', newline ,'(for example: > or <; and value is a percentage of axis length)', sprintf('\n') ,' ']}, ...
                        'Cutoff', 1, {'> 50'});
                
    % check if an expression was given (cancel was not pressed on the dialog)
    if ~isempty(cutExpr) && ~isempty(cutExpr{1})
        
        % test the expression
        try
            eval(['rand(3, 3, 3) ', cutExpr{1}, ';']);
            
        catch
            warning('Invalid expression for cutoff');
            return
        end

        % cut the geometry
        cutGeometry(figNum, axis, cutExpr{1});

        % update the geometry
        updateGeometry(figNum, 0);

    end

end

% callback on the print config button
function btnPrintConfig(~, ~, figNum)
    global globalVarsMx;
    
    
    disp('toolConfig = {};');

    for backgroundID = 1:length(globalVarsMx.(['giftiFig', num2str(figNum)]).backgroundData)
        %disp('toolConfig.background1Colormap      = ''cm_angle'';');
        %toolConfig.background1Min           = 9;
        %toolConfig.background1Max           = 3;
        %toolConfig.background1Max           = 3;
        %   toolConfig.background#Enabled     = (optional) background 
        %   toolConfig.background#Alpha       = (optional) background 
    end
    for overlayID = 1:length(globalVarsMx.(['giftiFig', num2str(figNum)]).overlayData)

        % loop for both the negative and positive slot
        for pos = 1:2

            % check if the overlay and slot are enabled
            %globalVarsMx.(['giftiFig', num2str(figNum)]).overlayEnabled(pos, overlayID)
            %   toolConfig.overlay#NegColormap    = (optional) overlay negative colormap
            %   toolConfig.overlay#PosColormap    = (optional) overlay positive colormap
            %   toolConfig.overlay#NegMin         = (optional) overlay 
            %   toolConfig.overlay#NegMax         = (optional) overlay 
            %   toolConfig.overlay#PosMin         = (optional) overlay 
            %   toolConfig.overlay#PosMax         = (optional) overlay 
            %   toolConfig.overlay#NegEnabled     = (optional) overlay 
            %   toolConfig.overlay#PosEnabled     = (optional) overlay 
        end
    end
    

    %   toolConfig.overlayOnBackgroundType  = 
    %   toolConfig.overlayOnBackgroundAlpha =  
    %   toolConfig.overlayOnOverlayType     = 
    %   toolConfig.overlayOnOverlayAlpha    = 
    %
    %   toolConfig.camPos                 = (optional) 
    %   toolConfig.camTarget              = (optional) 
    %   toolConfig.camVA                  = (optional) 
    %   toolConfig.morph                  = (optional) 
    %

    %
    cp = campos(globalVarsMx.(['giftiFig', num2str(figNum)]).axisHandle);
    disp(['toolConfig.camPos                   = [', num2str(cp(1)), ', ', num2str(cp(2)), ', ', num2str(cp(3)) ,'];']);
    ct = camtarget(globalVarsMx.(['giftiFig', num2str(figNum)]).axisHandle);
    disp(['toolConfig.camTarget                = [', num2str(ct(1)), ', ', num2str(ct(2)), ', ', num2str(ct(3)) ,'];']);
    cu = camup(globalVarsMx.(['giftiFig', num2str(figNum)]).axisHandle);
    disp(['toolConfig.camUp                    = [', num2str(cu(1)), ', ', num2str(cu(2)), ', ', num2str(cu(3)) ,'];']);
    disp(['toolConfig.camVA                    = ', num2str(camva(globalVarsMx.(['giftiFig', num2str(figNum)]).axisHandle)), ';']);
    
    
    
end

% called when the local figure (GUI) closes 
function thisFigureCloseReq(hObject, ~, figNum)
    global globalVarsMx;

    try
        
        % if the display is yoked, then remove the display from the yoke list
        if globalVarsMx.(['giftiFig', num2str(figNum)]).yokeCam == 1
            for iYoke = length(globalVarsMx.giftiYoke):-1:1
                if globalVarsMx.giftiYoke{iYoke} == figNum
                    globalVarsMx.giftiYoke(iYoke) = [];
                end
            end
        end
        
    catch
    end
    
    
    try

        % restore and clear the figure callback handles
        set(globalVarsMx.(['giftiFig', num2str(figNum)]).figHandle, 'CloseRequestFcn', globalVarsMx.(['giftiFig', num2str(figNum)]).prevCloseRequestFnc);
        set(globalVarsMx.(['giftiFig', num2str(figNum)]).figHandle, 'WindowButtonDownFcn', globalVarsMx.(['giftiFig', num2str(figNum)]).prevWindowButtonDownFcn);
        set(globalVarsMx.(['giftiFig', num2str(figNum)]).figHandle, 'KeyPressFcn', globalVarsMx.(['giftiFig', num2str(figNum)]).prevKeyPressFcn);
        set(globalVarsMx.(['giftiFig', num2str(figNum)]).figHandle, 'KeyReleaseFcn', globalVarsMx.(['giftiFig', num2str(figNum)]).prevKeyReleaseFcn);
        set(globalVarsMx.(['giftiFig', num2str(figNum)]).figHandle, 'WindowButtonUpFcn', '');
        set(globalVarsMx.(['giftiFig', num2str(figNum)]).figHandle, 'windowscrollWheelFcn', '');
        set(globalVarsMx.(['giftiFig', num2str(figNum)]).patchHandle, 'ButtonDownFcn', '');

        % restore the camera toolbar visibility
        if globalVarsMx.(['giftiFig', num2str(figNum)]).prevCameraToolbarVisibility == 1
            cameratoolbar(globalVarsMx.(['giftiFig', num2str(figNum)]).figHandle, 'Show')
        end

        % restore the toolbar
        set(globalVarsMx.(['giftiFig', num2str(figNum)]).figHandle, 'ToolBar', globalVarsMx.(['giftiFig', num2str(figNum)]).prevToolbar);

        % restore the initial target position and camera position
        campos(globalVarsMx.(['giftiFig', num2str(figNum)]).axisHandle, globalVarsMx.(['giftiFig', num2str(figNum)]).originalCameraPosition);
        camtarget(globalVarsMx.(['giftiFig', num2str(figNum)]).axisHandle, globalVarsMx.(['giftiFig', num2str(figNum)]).originalTargetPosition);
        camup(globalVarsMx.(['giftiFig', num2str(figNum)]).axisHandle, globalVarsMx.(['giftiFig', num2str(figNum)]).originalUpPosition);

        % set the vertices back to the original base
        globalVarsMx.(['giftiFig', num2str(figNum)]).displayVertices = globalVarsMx.(['giftiFig', num2str(figNum)]).baseVertices;
        updateGeometry(figNum, 0);

        % set the coloring back to default (no overlays)
        buildColoring(figNum, 0);
        updateColoring(figNum);
        
    catch
    end
    
    % close the calling figure
    delete(hObject);

end

% called when the remote figure (3d brain window) closes
function remoteFigureCloseReq(hObject, ~, figNum)
    global globalVarsMx;

    try
        
        % if the display is yoked, then remove the display from the yoke list
        if globalVarsMx.(['giftiFig', num2str(figNum)]).yokeCam == 1
            for iYoke = length(globalVarsMx.giftiYoke):-1:1
                if globalVarsMx.giftiYoke{iYoke} == figNum
                    globalVarsMx.giftiYoke(iYoke) = [];
                end
            end
        end
        
    catch
    end
            
    % close the calling figure
    delete(hObject);
    
    try
    
        % check if the tool window is hidden (does not exist)
        if globalVarsMx.(['giftiFig', num2str(figNum)]).hideToolWindow ~= 1
            
            % close these tools
            delete(globalVarsMx.(['giftiFig', num2str(figNum)]).thisFig);
            
        end
        
    catch
    end
    
end




%%%
% function that manipulate the object or update the view
%%%

% function to show or hide the wireframe
function showWireframe(figNum, show)
    global globalVarsMx;
    
    % check whether the wireframe should be shown
    if show == 1
        
        % show
        set(globalVarsMx.(['giftiFig', num2str(figNum)]).patchHandle, ...
            'EdgeAlpha', 1, ...
            'EdgeColor', globalVarsMx.(['giftiFig', num2str(figNum)]).wireframeColor, ...
            'LineStyle', '-', ...
            'LineWidth', 1);
        
    else
        
        % hide
        set(globalVarsMx.(['giftiFig', num2str(figNum)]).patchHandle, ...
            'EdgeColor', 'none');
        
    end
    
end

% function to show or hide the vertices
function showVertices(figNum, show)
    global globalVarsMx;
    
    % check whether the vertices should be shown
    if show == 1
        
        % retrieve the vertices
        V = globalVarsMx.(['giftiFig', num2str(figNum)]).displayVertices;
        
        % set the marker size
        markerSize = 30;
        %markerSize = 3 + globalVarsMx.(['giftiFig', num2str(figNum)]).edgeAverage * 5;
        
        % add to plot
        hold on;
        globalVarsMx.(['giftiFig', num2str(figNum)]).vertexPlot = scatter3( globalVarsMx.(['giftiFig', num2str(figNum)]).axisHandle, ...
                                                                            V(:,1), ...
                                                                            V(:,2), ...
                                                                            V(:,3), ...
                                                                            markerSize, ...
                                                                            globalVarsMx.(['giftiFig', num2str(figNum)]).vertexMarkerEdgeColor, ...
                                                                            'o', ...
                                                                            'MarkerFaceColor', globalVarsMx.(['giftiFig', num2str(figNum)]).vertexMarkerFaceColor, ...
                                                                            'lineWidth', 7.5);
        
        % create and set the color data for the scatterplot (changed on selection)
        cData = repmat( globalVarsMx.(['giftiFig', num2str(figNum)]).vertexMarkerEdgeColor, ...
                        [length(globalVarsMx.(['giftiFig', num2str(figNum)]).vertexPlot.XData) 1]);
        cData(globalVarsMx.(['giftiFig', num2str(figNum)]).selectedVertices, :) = repmat(   globalVarsMx.(['giftiFig', num2str(figNum)]).selectedVertexMarkerEdgeColor, ...
                                                                                            length(globalVarsMx.(['giftiFig', num2str(figNum)]).selectedVertices), 1);
        set(globalVarsMx.(['giftiFig', num2str(figNum)]).vertexPlot, 'CData', cData);
        
        % 
        hold off;
        
        % set the mousedown for the vertex plot
        set(globalVarsMx.(['giftiFig', num2str(figNum)]).vertexPlot, 'ButtonDownFcn', {@vertexPlotMouseDownFnc, figNum});
        
    else
        
        % check if the vertexplot exists
        if isfield(globalVarsMx.(['giftiFig', num2str(figNum)]), 'vertexPlot') && ~isempty(globalVarsMx.(['giftiFig', num2str(figNum)]).vertexPlot)

            % remove vertices from plot
            delete(globalVarsMx.(['giftiFig', num2str(figNum)]).vertexPlot);

            % empty the handle
            globalVarsMx.(['giftiFig', num2str(figNum)]).vertexPlot = [];
            
        end
        
    end
    
end

% function to cut the geometry
function cutGeometry(figNum, axis, expression)
    global globalVarsMx;

    % retrieve the list of coordinates of a specific axis
    axisValues = globalVarsMx.(['giftiFig', num2str(figNum)]).baseVertices(:, axis + 1);

    % TODO apply cutoff expression
    
    % determine the minimum, maximum and cutoff
    axisMin = min(axisValues);
    axisMax = max(axisValues);
    axisCutoffVal = axisMin + diff([axisMin, axisMax]) / 2;
    keepVertInd = find(axisValues < axisCutoffVal);
    
    
    % TODO: this can go a lot faster, I wrote the function
    % extract3DFaces, implement here using a similar or faster method

    % rebuild vertices list (they need to be renumbered)
    globalVarsMx.(['giftiFig', num2str(figNum)]).baseVertices = globalVarsMx.(['giftiFig', num2str(figNum)]).baseVertices(keepVertInd, :);
    if isfield(globalVarsMx.(['giftiFig', num2str(figNum)]), 'secVertices') 
        globalVarsMx.(['giftiFig', num2str(figNum)]).secVertices = globalVarsMx.(['giftiFig', num2str(figNum)]).secVertices(keepVertInd, :);
    end
    globalVarsMx.(['giftiFig', num2str(figNum)]).displayVertices = globalVarsMx.(['giftiFig', num2str(figNum)]).displayVertices(keepVertInd, :);
    
    
    % rebuild the faces list
    globalVarsMx.(['giftiFig', num2str(figNum)]).baseFaces = globalVarsMx.(['giftiFig', num2str(figNum)]).baseFaces(all(ismember(globalVarsMx.(['giftiFig', num2str(figNum)]).baseFaces, keepVertInd), 2),:);
    f = waitbar(0, 'Cutting...'); pause(.5);
    updateSteps = round(size(globalVarsMx.(['giftiFig', num2str(figNum)]).baseVertices, 1) / 10);
    for v = 1:size(globalVarsMx.(['giftiFig', num2str(figNum)]).baseVertices, 1)
        globalVarsMx.(['giftiFig', num2str(figNum)]).baseFaces(globalVarsMx.(['giftiFig', num2str(figNum)]).baseFaces == keepVertInd(v)) = v;
        if mod(v, updateSteps) == 0
            waitbar(v / size(globalVarsMx.(['giftiFig', num2str(figNum)]).baseVertices, 1) , f);
            pause(1)
        end
    end
    close(f)
    if isfield(globalVarsMx.(['giftiFig', num2str(figNum)]), 'secVertices')     % only copy the faces to secFaces if there are secVertices
        globalVarsMx.(['giftiFig', num2str(figNum)]).secFaces = globalVarsMx.(['giftiFig', num2str(figNum)]).baseFaces;
    end
    globalVarsMx.(['giftiFig', num2str(figNum)]).displayFaces = globalVarsMx.(['giftiFig', num2str(figNum)]).baseFaces;

    % rebuild the color list
    globalVarsMx.(['giftiFig', num2str(figNum)]).displayColors = globalVarsMx.(['giftiFig', num2str(figNum)]).displayColors(keepVertInd, :);
    
    % if there are secondary vertices
    if isfield(globalVarsMx.(['giftiFig', num2str(figNum)]), 'secVertices')
        
        % calculate the difference between the vertices
        globalVarsMx.(['giftiFig', num2str(figNum)]).secDiff = squeeze(diff(permute(cat(3, globalVarsMx.(['giftiFig', num2str(figNum)]).baseVertices, globalVarsMx.(['giftiFig', num2str(figNum)]).secVertices), [3,1,2])));
        
    end
    
end

% update the geometry (vertices and faces) from memory to the figure display
function updateGeometry(figNum, onlyVertexGeometry)
    global globalVarsMx;
    
    % check if only vertices should be flushed
    if onlyVertexGeometry == 1
        
        % update only the vertices
        set(globalVarsMx.(['giftiFig', num2str(figNum)]).patchHandle, 'Vertices', globalVarsMx.(['giftiFig', num2str(figNum)]).displayVertices)
        
    else
        
        % update both vertices, faces and colors
        set(    globalVarsMx.(['giftiFig', num2str(figNum)]).patchHandle, ...
                'Vertices', globalVarsMx.(['giftiFig', num2str(figNum)]).displayVertices, ...
                'Faces', globalVarsMx.(['giftiFig', num2str(figNum)]).displayFaces, ...
                'FaceVertexCData', globalVarsMx.(['giftiFig', num2str(figNum)]).displayColors);
        
    end
    
    % reset the triangulation, face centers and face normals so the will be
    % re-calculated upon the next usage (checkFaceCenters etc..)
    globalVarsMx.(['giftiFig', num2str(figNum)]).triangulation = [];
    globalVarsMx.(['giftiFig', num2str(figNum)]).faceCenters = [];
    globalVarsMx.(['giftiFig', num2str(figNum)]).faceNormals = [];
    globalVarsMx.(['giftiFig', num2str(figNum)]).vertexNormals = [];
    
end

% flush the coloring from memory to the figure display
function updateColoring(figNum)
    global globalVarsMx;

    % apply to the figure
    set(globalVarsMx.(  ['giftiFig', num2str(figNum)]).patchHandle, ...
                        'FaceColor', 'interp', ...
                        'FaceVertexCData', globalVarsMx.(['giftiFig', num2str(figNum)]).displayColors)
    
end

% define all the colormaps in a global variable
function defineColormaps(figNum)
    global globalVarsMx;
    
    % Benson 2018 ELife colors angle, but one hemisphere from 1:180
    cm_angle = zeros(180,3);
    cm_angle(1:45,:) = [zeros(45,1),(0:1/44:1)',(0.5:0.5/44:1)'];
    cm_angle(46:90,:) = [zeros(45,1),(1:-.5/44:.5)',(1:-1/44:0)'];
    cm_angle(91:135,:) = [(0:1/44:1)',(0.5:0.5/44:1)',zeros(45,1)];
    cm_angle(136:180,:) = [(1:-.5/44:.5)',(1:-1/44:0)',zeros(45,1)];

    % Benson 2018 ELife colors eccentricity 
    % Dora: In my rendering functions, the colors are rounded to integers, so in
    % order to plot 1.25 as different from 1.5, we have to use a colormap that
    % is 4x longer than the data values, here: 90*4 = 360. An eccentricity of 1
    % should be plotted with the index of 4 etc..
    cm_eccen = zeros(360,3);
    cm_eccen(1:5,:) = [zeros(5,1),zeros(5,1),(0:0.5/4:.5)'];%1.25*4 = 5
    cm_eccen(6:10,:) = [(0:1/4:1)',zeros(5,1),(.5:0.5/4:1)'];%2.5*4 = 10
    cm_eccen(11:20,:) = [(1:-.5/9:.5)',zeros(10,1),(1:-1/9:0)'];%5*4 = 20
    cm_eccen(21:40,:) = [(.5:.5/19:1)',(0:1/19:1)',zeros(20,1)];%10*4 = 40
    cm_eccen(41:80,:) = [(1:-1/39:0)',(1:-0.5/39:0.5)',zeros(40,1)];%20*4 = 80
    cm_eccen(81:160,:) = [zeros(80,1),(.5:0.5/79:1)',(0:1/79:1)'];%40*4 = 160
    cm_eccen(161:360,:) = [(0:1/199:1)',ones(200,1),ones(200,1)];%161:360

    %
    globalVarsMx.(['giftiFig', num2str(figNum)]).colormaps = {
                                'Red',        {[0.3 0 0
                                                0.4 0 0
                                                0.5 0 0
                                                0.6 0 0
                                                0.8 0 0
                                                1.0 0 0]}; ...
                                'Blue',       {[0 0 0.3
                                                0 0 0.4
                                                0 0 0.5
                                                0 0 0.6
                                                0 0 0.8
                                                0 0 1.0]}; ...
                                'Green',      {[0 0.3 0
                                                0 0.4 0
                                                0 0.5 0
                                                0 0.6 0
                                                0 0.8 0
                                                0 1.0 0]}; ...
                                'Violet',     {[0.3 0 0.3
                                                0.4 0 0.4
                                                0.5 0 0.5
                                                0.6 0 0.6
                                                0.8 0 0.8
                                                1.0 0 1.0]}; ...
                                'Yellow',     {[0.3 0.3 0
                                                0.4 0.4 0
                                                0.5 0.5 0
                                                0.6 0.6 0
                                                0.8 0.8 0
                                                1.0 1.0 0]}; ...
                                'Cyan',       {[0 0.3 0.3
                                                0 0.4 0.4
                                                0 0.5 0.5
                                                0 0.6 0.6
                                                0 0.8 0.8
                                                0 1.0 1.0]}; ...
                                'Orange',     {[1.0 0.7  0.0
                                                1.0 0.78 0.04
                                                1.0 0.85 0.4]}; ...
                                'Hot_0',      {[   0    0    0
                                                   0.33 0    0
                                                   0.66 0    0
                                                   1    0    0
                                                   1    0.25 0
                                                   1    0.50 0
                                                   1    0.75 0
                                                   1    1    0
                                                   1    1    0.33
                                                   1    1    0.66
                                                   1    1    1     ]}; ...
                                'Hot',        {hot}; ...
                                'Winter',     {winter}; ...
                                'Jet',        {jet}; ...
                                'Grey',       {gray}; ...
                                'cm_angle',     {cm_angle}; ...
                                'cm_eccen',     {cm_eccen}; ...
                                
                             };
end


     
% retrieve a list with the all selectable color maps
function names = getAllColormapNames(figNum, includePartials)
    global globalVarsMx;
    
    % loop through the maps
    names = {};
    for c = 1:size(globalVarsMx.(['giftiFig', num2str(figNum)]).colormaps, 1)
        names{end + 1} = [globalVarsMx.(['giftiFig', num2str(figNum)]).colormaps{c, 1}, ' (full)'];
    end
    
    % check if partials should be added to the list
    if includePartials == 1
        
        % loop throug the maps
        for c = 1:size(globalVarsMx.(['giftiFig', num2str(figNum)]).colormaps, 1)
            names{end + 1} = [globalVarsMx.(['giftiFig', num2str(figNum)]).colormaps{c, 1}, ' (half)'];        
        end
        
    end
    
end

% retrieve the colormap, colormap name and whether it is the full or half spectrum by (list) index
function [colormap, name, full] = getColormapByListIndex(figNum, index)
    global globalVarsMx;
    
    % retrieve the the id in the colormap array
    if index <= size(globalVarsMx.(['giftiFig', num2str(figNum)]).colormaps, 1)
        % full
        
        arrId = index;
        full = 1;
        
    else
        % half
        
        arrId = index - size(globalVarsMx.(['giftiFig', num2str(figNum)]).colormaps, 1);
        full = 0;
        
    end
    
    % retrieve the name and colormap
    name = globalVarsMx.(['giftiFig', num2str(figNum)]).colormaps{arrId, 1};
    colormap = globalVarsMx.(['giftiFig', num2str(figNum)]).colormaps{arrId, 2}{1};
    
end

% find the colormap listindex, colormap colors, colormap name and whether it is
% the full or half spectrum by name (case insensitive)
function [index, colormap, name, full] = findColormapByName(figNum, searchName, includePartials)
    global globalVarsMx;
    
    % retrieve all the names
    names = getAllColormapNames(figNum, includePartials);
    
    % remove spaces from all names (search and list)
    names = replace(names,' ','');
    searchName = replace(searchName,' ','');
    
    % try to find the name (full or partial)
    index = find(contains(names, searchName, 'IgnoreCase', true));
    
    % check if no match could be found
    if isempty(index)
        index = 0;
        colormap = [];
        name = '';
        full = '';
        return;
    end
    
    % if there are multiple results, pick only the first
    index = index(1);
    
    % retrieve the the id in the colormap array
    if index <= size(globalVarsMx.(['giftiFig', num2str(figNum)]).colormaps, 1)
        % full
        
        arrId = index;
        full = 1;
        
    else
        % half
        
        arrId = index - size(globalVarsMx.(['giftiFig', num2str(figNum)]).colormaps, 1);
        full = 0;
        
    end
    
    % retrieve the name and colormap
    name = globalVarsMx.(['giftiFig', num2str(figNum)]).colormaps{arrId, 1};
    colormap = globalVarsMx.(['giftiFig', num2str(figNum)]).colormaps{arrId, 2}{1};
    
end

% build the coloring based on the configuration
function buildColoring(figNum, addOverlays)
    global globalVarsMx;
    
    % apply a grey base color
    globalVarsMx.(['giftiFig', num2str(figNum)]).displayColors = 0.7 + zeros(size(globalVarsMx.(['giftiFig', num2str(figNum)]).displayVertices, 1), 3);
    
    % check if overlays should be drawn
    if addOverlays == 1
        
        % create a single background data array (including alpha)
        backgroundData = nan(size(globalVarsMx.(['giftiFig', num2str(figNum)]).displayVertices, 1), 4);
        
        % loop over the backgrounds
        for backgroundID = 1:length(globalVarsMx.(['giftiFig', num2str(figNum)]).backgroundData)

            % check if the background and slot are enabled
            if globalVarsMx.(['giftiFig', num2str(figNum)]).backgroundEnabled(backgroundID)

                % retrieve the colormap
                colormap = globalVarsMx.(['giftiFig', num2str(figNum)]).backgroundColormap{backgroundID};

                % copy the background data
                vertexColorMask = globalVarsMx.(['giftiFig', num2str(figNum)]).backgroundData{backgroundID};                    

                % nan the values in the mask which are smaller than
                % the minimum value or bigger than the maximum value in 
                % the range (causing vertices with very low or hight values to not be drawn)
                vertexColorMask(vertexColorMask < globalVarsMx.(['giftiFig', num2str(figNum)]).backgroundMinValue(backgroundID) | vertexColorMask > globalVarsMx.(['giftiFig', num2str(figNum)]).backgroundMaxValue(backgroundID)) = nan;
                
                % extract the list of values which need to be converted to colors
                vertexColorValueList = vertexColorMask(~isnan(vertexColorMask));

                % normalize the values (values will range from 0-1
                % depending on the range that was set for the background)
                if globalVarsMx.(['giftiFig', num2str(figNum)]).backgroundDeltaValue(backgroundID) == 0
                    vertexColorValueList(:) = 1;
                else
                    vertexColorValueList = (vertexColorValueList - globalVarsMx.(['giftiFig', num2str(figNum)]).backgroundMinValue(backgroundID)) / globalVarsMx.(['giftiFig', num2str(figNum)]).backgroundDeltaValue(backgroundID);
                end
                
                % determine the r-g-b color values for each vertex based on the (relative) activity value and colormap
                vertexColorRed = interp1(linspace(0, 1, size(colormap(:,1), 1)), colormap(:,1), vertexColorValueList);
                vertexColorGreen = interp1(linspace(0, 1, size(colormap(:,2), 1)), colormap(:,2), vertexColorValueList);
                vertexColorBlue = interp1(linspace(0, 1, size(colormap(:,3), 1)), colormap(:,3), vertexColorValueList);
                
                % TODO: optimize if 100% alpha
                % retrieve the alpha for the layer
                vertexAlpha = globalVarsMx.(['giftiFig', num2str(figNum)]).backgroundAlpha(backgroundID) / 100;
                
                % blending function, blending every layer direct onto opaque surface
                %globalVarsMx.(['giftiFig', num2str(figNum)]).displayColors(~isnan(vertexColorMask), 1) = (vertexAlpha * vertexColorRed) + (globalVarsMx.(['giftiFig', num2str(figNum)]).displayColors(~isnan(vertexColorMask), 1) * (1 - vertexAlpha));
                %globalVarsMx.(['giftiFig', num2str(figNum)]).displayColors(~isnan(vertexColorMask), 2) = (vertexAlpha * vertexColorGreen) + (globalVarsMx.(['giftiFig', num2str(figNum)]).displayColors(~isnan(vertexColorMask), 2) * (1 - vertexAlpha));
                %globalVarsMx.(['giftiFig', num2str(figNum)]).displayColors(~isnan(vertexColorMask), 3) = (vertexAlpha * vertexColorBlue) + (globalVarsMx.(['giftiFig', num2str(figNum)]).displayColors(~isnan(vertexColorMask), 3) * (1 - vertexAlpha));
                
                % first combine layers and only later blend to opaque surface
                % blending function, using "over" operator (1977, Alvy Smith & Ed Catnull)
                %{
                i = 1;
                for p = 1:length(vertexColorMask)
                    if ~isnan(vertexColorMask(p))
                        if isnan(backgroundData(p, 1))
                            backgroundData(p, 1) = vertexColorRed(i);
                            backgroundData(p, 2) = vertexColorGreen(i);
                            backgroundData(p, 3) = vertexColorBlue(i);
                            backgroundData(p, 4) = vertexAlpha;
                        else
                            backgroundData(p, 1) = vertexAlpha * vertexColorRed(i) + backgroundData(p, 1) * (1 - vertexAlpha);
                            backgroundData(p, 2) = vertexAlpha * vertexColorGreen(i) + backgroundData(p, 2) * (1 - vertexAlpha);
                            backgroundData(p, 3) = vertexAlpha * vertexColorBlue(i) + backgroundData(p, 3) * (1 - vertexAlpha);
                            backgroundData(p, 4) = vertexAlpha * vertexAlpha + (1 - vertexAlpha) * backgroundData(p, 4);
                        end
                        i = i + 1;
                    end
                end
                %}
                
                % first combine layers and only later blend to opaque surface
                % blending function, using associative "over" operator (Bruce Wallace, Marc Levoy, Tim Porter and Tom Duff)
                i = 1;
                for p = 1:length(vertexColorMask)
                    if ~isnan(vertexColorMask(p))
                        if isnan(backgroundData(p, 1))
                            backgroundData(p, 1) = vertexColorRed(i);
                            backgroundData(p, 2) = vertexColorGreen(i);
                            backgroundData(p, 3) = vertexColorBlue(i);
                            backgroundData(p, 4) = vertexAlpha;
                        else
                            backgroundData(p, 1) = (vertexAlpha * vertexColorRed(i)) + (backgroundData(p, 1) * backgroundData(p, 4) * (1 - vertexAlpha));
                            backgroundData(p, 2) = (vertexAlpha * vertexColorGreen(i)) + (backgroundData(p, 2) * backgroundData(p, 4) * (1 - vertexAlpha));
                            backgroundData(p, 3) = (vertexAlpha * vertexColorBlue(i)) + (backgroundData(p, 3) * backgroundData(p, 4) * (1 - vertexAlpha));
                            backgroundData(p, 4) = (1- vertexAlpha) * backgroundData(p, 4) + vertexAlpha;
                        end
                        i = i + 1;
                    end
                end
                
                
            end     % endif layer enabled

        end     % end background loop

        % TODO: optimize if 100% alpha
        % blend the combined layer (blended before) onto the opaque surface using the combined layers alpha
        backgroundAlpha = backgroundData(~isnan(backgroundData(:, 4)), 4);
        globalVarsMx.(['giftiFig', num2str(figNum)]).displayColors(~isnan(backgroundData(:, 1)), 1) = backgroundAlpha .* backgroundData(~isnan(backgroundData(:, 1)), 1) + (1 - backgroundAlpha) .* globalVarsMx.(['giftiFig', num2str(figNum)]).displayColors(~isnan(backgroundData(:, 1)), 1);
        globalVarsMx.(['giftiFig', num2str(figNum)]).displayColors(~isnan(backgroundData(:, 2)), 2) = backgroundAlpha .* backgroundData(~isnan(backgroundData(:, 2)), 2) + (1 - backgroundAlpha) .* globalVarsMx.(['giftiFig', num2str(figNum)]).displayColors(~isnan(backgroundData(:, 2)), 2);
        globalVarsMx.(['giftiFig', num2str(figNum)]).displayColors(~isnan(backgroundData(:, 3)), 3) = backgroundAlpha .* backgroundData(~isnan(backgroundData(:, 3)), 3) + (1 - backgroundAlpha) .* globalVarsMx.(['giftiFig', num2str(figNum)]).displayColors(~isnan(backgroundData(:, 3)), 3);
        
        
        
        
        
        %%%
        % color the overlays
        %%%
        
        % determine whether layers should first be determined and then
        % mixed (1) or no mixing is required (0)
        %
        % no mixing happens when the type is set to alpha and that alpha is 100%
        %
        % TODO: or when only one single layer is enabled
        mixLayers = globalVarsMx.(['giftiFig', num2str(figNum)]).overlayOverlayType ~= 1 | (globalVarsMx.(['giftiFig', num2str(figNum)]).overlayOverlayType == 1 & globalVarsMx.(['giftiFig', num2str(figNum)]).overlayOverlayAlpha ~= 100);
        
        % TODO: optimize speed (do/do not draw certain voxels, combine
        % calculations), more matrix usage
        
        % check the overlay-overlay mixing setting
        if (mixLayers == 0)
            % no mixing of layers
            
            % create a single overlay data array
            overlayData = nan(size(globalVarsMx.(['giftiFig', num2str(figNum)]).displayVertices, 1), 3);
            
        else
            % first determine layer values, then mix
            
            % create a data array for each overlay (to determine color before mixing)
            overlayLayerData = nan(2, length(globalVarsMx.(['giftiFig', num2str(figNum)]).overlayData), size(globalVarsMx.(['giftiFig', num2str(figNum)]).displayVertices, 1), 3);
            
        end
        
        % loop over the overlays
        for overlayID = 1:length(globalVarsMx.(['giftiFig', num2str(figNum)]).overlayData)

            % loop for both the negative and positive slot
            for pos = 1:2

                % check if the overlay and slot are enabled
                if globalVarsMx.(['giftiFig', num2str(figNum)]).overlayEnabled(pos, overlayID)
                    
                    % retrieve the colormap
                    colormap = globalVarsMx.(['giftiFig', num2str(figNum)]).overlayColormap{pos, overlayID};
                    colormapFull = globalVarsMx.(['giftiFig', num2str(figNum)]).overlayColormapFull{pos, overlayID};
                    
                    % copy the overlay data
                    vertexColorMask = globalVarsMx.(['giftiFig', num2str(figNum)]).overlayData{overlayID};                    
                    
                    % 
                    if (pos == 1)
                        % neg

                        % nan the values in the mask which are bigger than
                        % the maximum value in the range (causing vertices 
                        % with high values to not be drawn)
                        vertexColorMask(vertexColorMask > globalVarsMx.(['giftiFig', num2str(figNum)]).overlayMaxValue(pos, overlayID)) = nan;
                        
                        % cap the values in the mask which are smaller than
                        % the minimum value in the range to the minimum
                        % value (causing vertices with values lower than the
                        % minimum to be capped)
                        vertexColorMask(vertexColorMask < globalVarsMx.(['giftiFig', num2str(figNum)]).overlayMinValue(pos, overlayID)) = globalVarsMx.(['giftiFig', num2str(figNum)]).overlayMinValue(pos, overlayID);
                        
                        if colormapFull == 1
                            
                            % flip the colormap for the negative activity
                            colormap = flip(colormap, 1);
                            
                        end
                        
                    else
                        % pos
                        
                        % nan the values in the mask which are smaller than
                        % the minimum value in the range (causing vertices 
                        % with low values to not be drawn)
                        vertexColorMask(vertexColorMask < globalVarsMx.(['giftiFig', num2str(figNum)]).overlayMinValue(pos, overlayID)) = nan;
                        
                        % cap the values in the mask which are bigger than
                        % the maximum value in the range to the maximum
                        % value (causing vertices with values higher than the
                        % maximum to be capped)
                        vertexColorMask(vertexColorMask > globalVarsMx.(['giftiFig', num2str(figNum)]).overlayMaxValue(pos, overlayID)) = globalVarsMx.(['giftiFig', num2str(figNum)]).overlayMaxValue(pos, overlayID);
                        
                    end
                    
                    % extract the list of values which need to be converted to colors
                    vertexColorValueList = vertexColorMask(~isnan(vertexColorMask));
                    
                    % normalize the values (values will range from 0-1
                    % depending on the range that was set for the overlay)
                    if globalVarsMx.(['giftiFig', num2str(figNum)]).overlayDeltaValue(pos, overlayID) == 0
                        vertexColorValueList(:) = 1;
                    else
                        vertexColorValueList = (vertexColorValueList - globalVarsMx.(['giftiFig', num2str(figNum)]).overlayMinValue(pos, overlayID)) / globalVarsMx.(['giftiFig', num2str(figNum)]).overlayDeltaValue(pos, overlayID);
                    end        
                    % determine the r-g-b color values for each vertex based on the (relative) activity value and colormap
                    vertexColorRed = interp1(linspace(0, 1, size(colormap(:,1), 1)), colormap(:,1), vertexColorValueList);
                    vertexColorGreen = interp1(linspace(0, 1, size(colormap(:,2), 1)), colormap(:,2), vertexColorValueList);
                    vertexColorBlue = interp1(linspace(0, 1, size(colormap(:,3), 1)), colormap(:,3), vertexColorValueList);
                    
                    % check the overlay-overlay mixing setting
                    if (mixLayers == 0)
                        % no mixing of layers
                        
                        % store the r-g-b color values in the layer
                        overlayData(~isnan(vertexColorMask), 1) = vertexColorRed;
                        overlayData(~isnan(vertexColorMask), 2) = vertexColorGreen;
                        overlayData(~isnan(vertexColorMask), 3) = vertexColorBlue;
                        
                    else
                        % first determine layer values, then mix
                        
                        overlayLayerData(pos, overlayID, ~isnan(vertexColorMask), 1) = vertexColorRed;
                        overlayLayerData(pos, overlayID, ~isnan(vertexColorMask), 2) = vertexColorGreen;
                        overlayLayerData(pos, overlayID, ~isnan(vertexColorMask), 3) = vertexColorBlue;
                        
                    end
                    
                end     % endif layer enabled

            end     % end pos/neg loop
            
        end     % end overlay loop

        
        %%%
        % mix the overlays
        %%%
        
        % check the overlay-overlay mixing setting
        if (mixLayers == 1)
            % layer values have been determined, mix overlay layers into a single layer

            % create a single overlay data array
            overlayData = nan(size(globalVarsMx.(['giftiFig', num2str(figNum)]).displayVertices, 1), 3);
            
            if globalVarsMx.(['giftiFig', num2str(figNum)]).overlayOverlayType == 1
                % stacking with alpha 
                % alpha will be less than 100% here, elsewise mixLayers would be false)
                
                for overlayID = 1:length(globalVarsMx.(['giftiFig', num2str(figNum)]).overlayData)
                    for pos = 1:2

                        % check if the overlay and slot are enabled
                        if globalVarsMx.(['giftiFig', num2str(figNum)]).overlayEnabled(pos, overlayID)

                            % retrieve the current color layer
                            vertexColorMask = squeeze(overlayLayerData(pos, overlayID, :, :));

                            % retrieve the overlay on overlay ratio (alpha)
                            vertexAlpha = globalVarsMx.(['giftiFig', num2str(figNum)]).overlayOverlayAlpha / 100;

                            % combine layers, letting the first layer (or vertex) to be drawn count as the opaque background
                            i = 1;
                            for p = 1:length(vertexColorMask)
                                if ~isnan(vertexColorMask(p, 1))
                                    if isnan(overlayData(p, 1))
                                        overlayData(p, 1) = vertexColorMask(p, 1);
                                        overlayData(p, 2) = vertexColorMask(p, 2);
                                        overlayData(p, 3) = vertexColorMask(p, 3);
                                    else
                                        overlayData(p, 1) = vertexAlpha * vertexColorMask(p, 1) + overlayData(p, 1) * (1 - vertexAlpha);
                                        overlayData(p, 2) = vertexAlpha * vertexColorMask(p, 2) + overlayData(p, 2) * (1 - vertexAlpha);
                                        overlayData(p, 3) = vertexAlpha * vertexColorMask(p, 3) + overlayData(p, 3) * (1 - vertexAlpha);
                                    end
                                    i = i + 1;
                                end
                            end
                            
                        end     % endif enabled
                        
                    end     % end pos loop
                end     % end overlay loop
                
                
            elseif globalVarsMx.(['giftiFig', num2str(figNum)]).overlayOverlayType == 2
                % additive
                
                for overlayID = 1:length(globalVarsMx.(['giftiFig', num2str(figNum)]).overlayData)
                    for pos = 1:2

                        % check if the overlay and slot are enabled
                        if globalVarsMx.(['giftiFig', num2str(figNum)]).overlayEnabled(pos, overlayID)
                            
                            % retrieve the current color layer
                            vertexColorMask = squeeze(overlayLayerData(pos, overlayID, :, :));

                            % set 0 values in the places where the current layer has
                            % a value and the combined layer has nan
                            overlayData(~isnan(vertexColorMask) & isnan(overlayData)) = 0;

                            % add the values of the current layer to the combined layer
                            overlayData(~isnan(vertexColorMask)) = overlayData(~isnan(vertexColorMask)) + vertexColorMask(~isnan(vertexColorMask));

                        end
                        
                    end
                end
                
                % cap the values in the combined layer to 1
                overlayData(~isnan(overlayData)) = min(1, overlayData(~isnan(overlayData)));
                
            elseif globalVarsMx.(['giftiFig', num2str(figNum)]).overlayOverlayType == 3
                % linear color blending
                
                % count the amount of color set at a specific vertex
                overlayDataCount = zeros(size(globalVarsMx.(['giftiFig', num2str(figNum)]).displayVertices, 1), 1);
                
                for overlayID = 1:length(globalVarsMx.(['giftiFig', num2str(figNum)]).overlayData)
                    for pos = 1:2

                        % check if the overlay and slot are enabled
                        if globalVarsMx.(['giftiFig', num2str(figNum)]).overlayEnabled(pos, overlayID)
                            
                            % retrieve the current color layer
                            vertexColorMask = squeeze(overlayLayerData(pos, overlayID, :, :));

                            % count the places where a values is set
                            overlayDataCount(~isnan(vertexColorMask(:,1))) = overlayDataCount(~isnan(vertexColorMask(:,1))) + 1;

                            % set 0 values in the places where the current layer has
                            % a value and the combined layer has nan
                            overlayData(~isnan(vertexColorMask) & isnan(overlayData)) = 0;

                            % add the values of the current layer to the combined layer
                            overlayData(~isnan(vertexColorMask)) = overlayData(~isnan(vertexColorMask)) + vertexColorMask(~isnan(vertexColorMask));
                                
                        end
                        
                    end
                end
                
                % take the average
                overlayData(overlayDataCount ~= 0, :) = overlayData(overlayDataCount ~= 0, :) ./ overlayDataCount(overlayDataCount ~= 0);
                
            end
        
    
            
        end
        
        
        %%%
        % mix the overlay on background
        %%%
        
        if globalVarsMx.(['giftiFig', num2str(figNum)]).overlayBackgroundType == 1
            % alpha
            
            if globalVarsMx.(['giftiFig', num2str(figNum)]).overlayBackgroundAlpha == 100
                % 100% alpha
                
                % just overwrite
                globalVarsMx.(['giftiFig', num2str(figNum)]).displayColors(~isnan(overlayData)) = overlayData(~isnan(overlayData));
            else
                % less than 100%

                % blend the combined layer (blended before) onto the opaque surface using the combined layers alpha
                alpha = globalVarsMx.(['giftiFig', num2str(figNum)]).overlayBackgroundAlpha / 100;
                globalVarsMx.(['giftiFig', num2str(figNum)]).displayColors(~isnan(overlayData(:, 1)), 1) = alpha * overlayData(~isnan(overlayData(:, 1)), 1) + (1 - alpha) * globalVarsMx.(['giftiFig', num2str(figNum)]).displayColors(~isnan(overlayData(:, 1)), 1);
                globalVarsMx.(['giftiFig', num2str(figNum)]).displayColors(~isnan(overlayData(:, 2)), 2) = alpha * overlayData(~isnan(overlayData(:, 2)), 2) + (1 - alpha) * globalVarsMx.(['giftiFig', num2str(figNum)]).displayColors(~isnan(overlayData(:, 2)), 2);
                globalVarsMx.(['giftiFig', num2str(figNum)]).displayColors(~isnan(overlayData(:, 3)), 3) = alpha * overlayData(~isnan(overlayData(:, 3)), 3) + (1 - alpha) * globalVarsMx.(['giftiFig', num2str(figNum)]).displayColors(~isnan(overlayData(:, 3)), 3);

            end
            
        elseif globalVarsMx.(['giftiFig', num2str(figNum)]).overlayBackgroundType == 2
            % additive
            
            % add the values of the combined overlay layer to the display layer
            globalVarsMx.(['giftiFig', num2str(figNum)]).displayColors(~isnan(overlayData)) = globalVarsMx.(['giftiFig', num2str(figNum)]).displayColors(~isnan(overlayData)) + overlayData(~isnan(overlayData));
            
            % cap the values in the combined layer to 1
            globalVarsMx.(['giftiFig', num2str(figNum)]).displayColors(~isnan(globalVarsMx.(['giftiFig', num2str(figNum)]).displayColors)) = min(1, globalVarsMx.(['giftiFig', num2str(figNum)]).displayColors(~isnan(globalVarsMx.(['giftiFig', num2str(figNum)]).displayColors)));
            
        end
    
        
    end

    %globalVarsMx.(['giftiFig', num2str(figNum)]).selectedFaces
    % todo, better coloring before we can use face selection.
    % adding a plot dot on the face center could work
    %{
    if ~isempty(globalVarsMx.(['giftiFig', num2str(figNum)]).selectedFaces)
        vertices = globalVarsMx.(['giftiFig', num2str(figNum)]).displayFaces(globalVarsMx.(['giftiFig', num2str(figNum)]).selectedFaces,:);
        vertices = vertices(:);
        vertices = unique(vertices);
        globalVarsMx.(['giftiFig', num2str(figNum)]).displayColors(vertices, 1) = 1;
        globalVarsMx.(['giftiFig', num2str(figNum)]).displayColors(vertices, 2) = 0;
        globalVarsMx.(['giftiFig', num2str(figNum)]).displayColors(vertices, 3) = 0;
        %vertices
        %globalVarsMx.(['giftiFig', num2str(figNum)]).displayColors
        
    end
    %}
    
end

function [circlePoints] = build3DCircle(radius, pointsPerCircle)

    % set defaults
    if isempty(radius)
        radius = 5;
    end
    if isempty(pointsPerCircle)
        pointsPerCircle = 20;
    end
    
    % define a base circle
    v = [1,0;0,1;0,0];
    lineStepSize = 2 * pi / pointsPerCircle;
    theta = 0:lineStepSize:2 * pi;
    circlePoints = radius * (v(:,1) * cos(theta) + v(:,2) * sin(theta));
    
end

%
%
% returns:   an array of 3 x N x 2; there are 3 coordinates for each N, and N are the points
%            that make up a circle (pointsPerCircle). There are 2 circles, the first the
%            top, the second the bottom
function [cylinderPoints] = build3DWireCylinder(radius, pointsPerCircle)

    % define a circle lying flat on the z-plane
    topCircle = build3DCircle(radius, pointsPerCircle);
    
    % copy the flat-lying circle
    bottomCircle = topCircle;
    
    % return the cylinder caps (top and bottom circles)
    cylinderPoints = cat(3, topCircle, bottomCircle);
    
end

% 
%
% returns:   an array of 3 x N x M; where N are the points that make up a
%            circle and each M is a circle that makes up the sphere
function [spherePoints] = build3DWireSphere(radius, vertCircles, pointsPerCircle)

    % set defaults
    if isempty(radius)
        radius = 5;
    end
    if isempty(vertCircles)
        vertCircles = 3;
    end
    if isempty(pointsPerCircle)
        pointsPerCircle = 20;
    end
    
    % define a base circle and put it upright instead of it lying flat
    baseCircle = build3DCircle(radius, pointsPerCircle);
    baseCircle = roty(-90) * baseCircle;
    
    % determine the rotation steps for the vertical circles
    vertRotStepSize = 180 / vertCircles;

    % rotate the base circle of the z axis
    spherePoints = repmat(baseCircle, 1, 1, vertCircles + 2);
    for i = 1:vertCircles - 1
        spherePoints(:, :, i + 1) = rotz(i * vertRotStepSize) * spherePoints(:, :, i + 1);
    end

    % rotate the last two circles along the y
    spherePoints(:, :, end - 1) = roty(60) * spherePoints(:, :, end - 1);
    spherePoints(:, :, end) = rotz(180) * roty(60) * spherePoints(:, :, end);

end