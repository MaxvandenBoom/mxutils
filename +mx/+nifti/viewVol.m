%
%   Display nifti volume data matrices
%
%   Usage: viewVol( vol1, vol2, ... , {'title 1, 'title 2', ...} )
%
% 	From: Mark Bruurmijn
% 
function viewVol( varargin )
	nrvolumes = sum(~cellfun(@iscellstr,varargin)); 
	volumes = varargin(1:nrvolumes);
	if nargin > nrvolumes
		titles = varargin{nrvolumes+1};
	else
		titles = [];
	end
	
	startslice = 1;
	
	ax = NaN(1,nrvolumes);
	im = NaN(1,nrvolumes);
	figure('Position',[300 300 nrvolumes*350 400]);
	
	for i = 1 : nrvolumes
		ax(i) = subplot(1,nrvolumes,i);
		im(i) = imagesc( volumes{i}(:,:,startslice), [min(volumes{i}(:)) max(volumes{i}(:))+eps] );
		colormap gray;
		axis image;
		if ~isempty(titles)
			title( [titles{i} ' (z = ' num2str(startslice) ')'] );
		else
			title( ['(z = ' num2str(startslice) ')'] );
		end
	end
	
	maxslice = size(volumes{1},3);
	uicontrol( 'Style','Slider', 'Units','normalized', 'Position',[0,0,1,1/20], 'Min',1, 'Max',maxslice, ...
		'SliderStep',[1/(maxslice-1) 5/(maxslice-1)], 'Value',1, 'Callback',{@slide,im,ax,volumes,titles} );
end

function slide( hObject, ~, im, ax, volumes, titles )
	newslice = round( get(hObject,'Value') );
	for i = 1 : length(im)
		set(im(i), 'CData', volumes{i}(:,:,newslice) );
		if ~isempty(titles)
			title( ax(i), [titles{i} ' (z = ' num2str(newslice) ')'] );
		else
			title( ax(i), ['(z = ' num2str(newslice) ')'] );
		end
	end
end