function openWindow(pluginObj)

% check for main window
warnBool = true;
mainWindowExistBool = pluginObj.view.checkMainWindowExists(warnBool);

if mainWindowExistBool
  % check for plot window
  plotWindowExistBool = pluginObj.checkWindowExists();
  
  if plotWindowExistBool
    pluginObj.vprintf('Reopening plot window\n')

    % delete plot window handles
    delete(pluginObj.handles.fig)
    delete(pluginObj.handles.ax)
  end
  
  % Make New Panel
  pluginObj.makeFig();
  
  % Add listeners
%   addlistener(pluginObj, 'plotEvent', @gvPlotWindowPlugin.plotCallback);
  % TODO check if needed
  
  % Data cursor
  pluginObj.addDataCursor();
  
  % Make Axes/Update Panel
  pluginObj.makeAxes();
  
  % Plot
  pluginObj.plot();
end

end % main fn
