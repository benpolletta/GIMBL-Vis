function makePlotMarkerPanelControls(pluginObj, parentHandle)
%% makePlotMarkerPanelControls
%
% Input: parentHandle - handle for uicontrol parent

markerDefaultSize = 16;
markerMinSize = 2;
markerMaxSize = 50;

fontSize = pluginObj.fontSize;

spacing = 2; % px
padding = 2; % px

uiControlsHandles = struct();

vBox = uix.VBox('Parent',parentHandle, 'Spacing',spacing, 'Padding',padding);

% Row 1
row1hBox = uix.HBox('Parent', vBox, 'Spacing', spacing);
makeRow1hBox(row1hBox);


% Row 2
row2hBox = uix.HBox( 'Parent', vBox, 'Spacing', spacing);
makeRow2hBox(row2hBox);

% Set vBox Heights
set(vBox, 'Heights',[-1 -1]);

% Store Handles
% pluginObj.handles.plotMarkerPanel.controls = uiControlsHandles;


%% Nested fn
  function makeRow1hBox(parentHandle)
    % autoSizeMarkerLabel
    uiControlsHandles.autoSizeMarkerLabel = uicontrol(...
      'Tag','autoSizeMarkerLabel',...    
      'Style','text',...
      'FontUnits','points',...
      'FontSize',fontSize,...
      'String','AutoSize:',...
      'Max',get(0,'defaultuicontrolMax'),...
      'Min',get(0,'defaultuicontrolMin'),...
      'SliderStep',get(0,'defaultuicontrolSliderStep'),...
      'Value',get(0,'defaultuicontrolValue'),...
      'Parent',parentHandle);
    
    
    % autoSizeMarkerCheckbox
    uiControlsHandles.autoSizeMarkerCheckbox = uicontrol(...
      'Tag','autoSizeMarkerCheckbox',...    
      'Style','checkbox',...    
      'FontUnits','points',...  
      'FontSize',fontSize,...
      'Value',1,...
      'Callback',@(hObject,eventdata)gvMainWindow_export('autoSizeMarkerCheckbox_Callback',hObject,eventdata,guidata(hObject)),...
      'Parent',parentHandle);
    
    
    % markerSizeSlider
    uiControlsHandles.markerSizeSlider = uicontrol(...
      'Tag','markerSizeSlider',...
      'Style','slider',...
      'FontUnits','points',...
      'FontSize',fontSize,...
      'Min',markerMinSize,...
      'Max',markerMaxSize,...
      'Value',markerDefaultSize,...  
      'SliderStep',get(0,'defaultuicontrolSliderStep'),...
      'Callback',@(hObject,eventdata)gvMainWindow_export('markerSizeSlider_Callback',hObject,eventdata,guidata(hObject)),...
      'Parent',parentHandle);
    
    % Set Box Widths
    set(parentHandle, 'Widths',[-3 -1 -6]);
  end


  function makeRow2hBox(parentHandle)
    
    % markerTypeLabel
    uiControlsHandles.markerTypeLabel = uicontrol(...
      'Tag','markerTypeLabel',...
      'Style','text',...    
      'FontUnits','points',...
      'FontSize',fontSize,...
      'String','MarkerType:',...
      'Parent',parentHandle);
    
    
    % markerTypeMenu
    uiControlsHandles.markerTypeMenu = uicontrol(...
      'Tag','markerTypeMenu',...
      'Style','popupmenu',...  
      'FontUnits','points',...
      'FontSize',fontSize,...
      'String','markerType',...
      'Value',1,...
      'Callback',@(hObject,eventdata)gvMainWindow_export('markerTypeMenu_Callback',hObject,eventdata,guidata(hObject)),...
      'Parent',parentHandle);
    
    % Set row2hBox Widths
    set(parentHandle, 'Widths',[-2 -3]);
  end

end