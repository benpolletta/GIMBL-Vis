%% gvImageWindow - UI Image Window Class for GIMBL-Vis
%
% Description: An object of this class becomes a property of gvView to provide 
%              methods for a GIMBL-Vis image window

classdef gvImageWindowPlugin < gvWindowPlugin

  %% Public properties %%
  properties
    metadata = struct()
    
    plotDir = fullfile('.', 'plots')
  end
  
  
  %% Other properties %%
  properties (Hidden)
    controller
    view
    
    handles = struct()
  end
  
  
  properties (Constant, Hidden)
    pluginName = 'Image';
    pluginFieldName = 'image';
    
    windowName = 'Image Window';
  end
  
  
  %% Events %%
  events
    
  end
  
  
  %% Public methods %%
  methods
    
    function pluginObj = gvImageWindowPlugin(varargin)
      pluginObj@gvWindowPlugin(varargin{:});
    end

    openWindow(pluginObj)
    
  end
  
  %% Hidden methods %%
  methods (Hidden)
    
    makeControls(pluginObj, parentHandle)
    
  end
  
  
  %% Protected methods %%
  methods (Access = protected)
    
    function createFig(pluginObj)
      % createFig - create image window figure
      
      plotPanPos = pluginObj.controller.plugins.plot.handles.fig.Position;
      newPos = plotPanPos; % same size as plot window
      newPos(1) = newPos(1)+newPos(3)+50; % move right
      %       newPos(3:4) = newPos(3:4)*.8; %shrink
      imageWindowHandle = figure('Name',pluginObj.windowName, 'NumberTitle','off', 'Position',newPos);
      
      axes(imageWindowHandle, 'Position', [0 0 1 1], 'XTickLabels',[], 'YTickLabels',[],...
        'XTick',[], 'YTick',[]);
      
      % set image handle
      pluginObj.handles.fig = imageWindowHandle;
    end
    
    createImagePanelControls(pluginObj, parentHandle)

  end
  
  %% Callbacks %%
  methods (Static, Hidden)

    
    
  end
  
end