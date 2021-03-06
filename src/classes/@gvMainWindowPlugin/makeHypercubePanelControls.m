function uiControlsHandles = makeHypercubePanelControls(pluginObj, parentHandle)
%% makeHypercubePanelControls
%
% Input: parentHandle - handle for uicontrol parent

fontSize = pluginObj.fontSize;
panelTitleFontSize = fontSize;
spacing = 2; % px
padding = 2; % px

uiControlsHandles = struct();

% mainData panel
thisTag = pluginObj.panelTag('dataPanel');
mainDataPanel = uix.Panel(...
  'Tag',thisTag,...
  'Parent',parentHandle,...
  'Title','Data',...
  'FontUnits','points',...
  'FontSize',panelTitleFontSize...
);

makeHyperCubeSelectionControls(mainDataPanel);

%% Nested Fn
  function makeHyperCubeSelectionControls(parentHandle)
    thisHbox = uix.HBox('Parent',parentHandle, 'Spacing',spacing, 'Padding',padding);
    
    % activeHyperCubeText
    thisTag = pluginObj.panelTag('activeHypercubeText');
    uiControlsHandles.activeHypercubeText= uicontrol(...
      'Tag',thisTag,...
      'Style','text',...
      'FontUnits','points',...
      'FontSize',fontSize,...
      'String','Active Hypercube:',...
      'Parent',thisHbox);
    
    % hypercubeMenu
    menuStr = fieldnames(orderfields(pluginObj.controller.model.data));
    activeHypercubeName = pluginObj.controller.view.activeHypercubeName;
    menuValue = find( strcmp( menuStr, activeHypercubeName ) );
    
    if isempty(menuStr)
      menuStr = {'[None]'};
      menuValue = 1;
    elseif isempty(menuValue)
      menuValue = 1;
    end
    
    thisTag = pluginObj.panelTag('hypercubeMenu');
    uiControlsHandles.hypercubeMenu = uicontrol(...
      'Tag',thisTag,...
      'Style','popupmenu',...
      'FontUnits','points',...
      'FontSize',fontSize,...
      'String',menuStr,...
      'Value',menuValue,...
      'UserData',pluginObj.userData,...
      'Callback',@gvMainWindowPlugin.Callback_activeHyperCubeMenu,...
      'Parent',thisHbox);
    
    set(thisHbox, 'Widths',[-1, -1])
  end

end
