
function varargout = VpLab_plot(varargin)
% VPLAB_PLOT MATLAB code for VpLab_plot.fig
%      VPLAB_PLOT, by itself, creates a new VPLAB_PLOT or raises the existing
%      singleton*.
%
%      H = VPLAB_PLOT returns the handle to a new VPLAB_PLOT or the handle to
%      the existing singleton*.
%
%      VPLAB_PLOT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in VPLAB_PLOT.M with the given input arguments.
%
%      VPLAB_PLOT('Property','Value',...) creates a new VPLAB_PLOT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before VpLab_plot_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to VpLab_plot_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help VpLab_plot

% Last Modified by GUIDE v2.5 02-Jan-2018 16:58:36

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @VpLab_plot_OpeningFcn, ...
                   'gui_OutputFcn',  @VpLab_plot_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before VpLab_plot is made visible.
function VpLab_plot_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to VpLab_plot (see VARARGIN)

% Choose default command line output for VpLab_plot
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes VpLab_plot wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = VpLab_plot_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in Xplot.
function Xplot_Callback(hObject, eventdata, handles)
% hObject    handle to Xplot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Xplot contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Xplot


% --- Executes during object creation, after setting all properties.
function Xplot_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Xplot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
Workspace=ArrangeFromWorkspaceData(0);
varlength=length(Workspace);
liststring={};
for i=1:varlength
    liststring{1,i}=Workspace(i).signals.name;
end
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
if isempty(liststring)
    set(hObject,'String','工作区无变量');
else
set(hObject,'String',liststring);
end


% --- Executes on selection change in Yplot.
function Yplot_Callback(hObject, eventdata, handles)
% hObject    handle to Yplot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Yplot contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Yplot


% --- Executes during object creation, after setting all properties.
function Yplot_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Yplot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
Workspace=ArrangeFromWorkspaceData(0);
varlength=length(Workspace);
liststring={};
for i=1:varlength
    liststring{1,i}=Workspace(i).signals.name;
end
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
if isempty(liststring)
    set(hObject,'String','工作区无变量');
else
set(hObject,'String',liststring);
end


% --- Executes on selection change in Yerrplot.
function Yerrplot_Callback(hObject, eventdata, handles)
% hObject    handle to Yerrplot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Yerrplot contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Yerrplot


% --- Executes during object creation, after setting all properties.
function Yerrplot_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Yerrplot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
Workspace=ArrangeFromWorkspaceData(0);
varlength=length(Workspace);
liststring={};
for i=1:varlength
    liststring{1,i}=Workspace(i).signals.name;
end
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
if isempty(liststring)
    set(hObject,'String','工作区无变量');
else
set(hObject,'String',liststring);
end


% --- Executes on selection change in styleplot.
function styleplot_Callback(hObject, eventdata, handles)
% hObject    handle to styleplot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns styleplot contents as cell array
%        contents{get(hObject,'Value')} returns selected item from styleplot


% --- Executes during object creation, after setting all properties.
function styleplot_CreateFcn(hObject, eventdata, handles)
% hObject    handle to styleplot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Workspace=ArrangeFromWorkspaceData(0);

varx=get(handles.Xplot,'value');
vary=get(handles.Yplot,'value');
varyerr=get(handles.Yerrplot,'value');
varstyle=get(handles.styleplot,'value');
varNew=get(handles.Newfigure,'value');
varfit=get(handles.fit_text,'String');
varfiten=get(handles.fiten,'value');
str=get(handles.edit2,'String');
x=Workspace(varx).signals.values;
y=Workspace(vary).signals.values;
yerr=Workspace(varyerr).signals.values;


if sum(size(x)~=size(y))||sum(size(yerr)~=size(x))||sum(size(yerr)~=size(y))
    msgbox('绘图数据个数不匹配');
    return;
end

varfit=polyfit(x,y,str2num(varfit));
if varNew==1
    figure;
    hold on;
else
    figure(1);
    hold on;
end



if varstyle==1
    errorbar(x,y,yerr,'.');
else
    errorbar(x,y,yerr);
end

if varfiten==1
xx=x(1):(x(end)-x(1))/100:x(end);
plot(xx,polyval(varfit,xx));
cftool(x,y);
end

for k=1:length(str)
    eval(char(str(k)));
end

guidata(hObject,handles);


% --- Executes on button press in Newfigure.
function Newfigure_Callback(hObject, eventdata, handles)
% hObject    handle to Newfigure (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Newfigure



function fit_text_Callback(hObject, eventdata, handles)
% hObject    handle to fit_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of fit_text as text
%        str2double(get(hObject,'String')) returns contents of fit_text as a double
input=str2num(get(hObject,'String'));
if (isempty(input))
    set(hObject,'String','0')
end
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function fit_text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fit_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in fiten.
function fiten_Callback(hObject, eventdata, handles)
% hObject    handle to fiten (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of fiten


% --- Executes on button press in refresh.
function refresh_Callback(hObject, eventdata, handles)
% hObject    handle to refresh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Workspace=ArrangeFromWorkspaceData(0);
varlength=length(Workspace);
liststring={};
for i=1:varlength
    liststring{1,i}=Workspace(i).signals.name;
end
if isempty(liststring)
    set(handles.Xplot,'String','工作区无变量');
    set(handles.Yplot,'String','工作区无变量');
    set(handles.Yerrplot,'String','工作区无变量');
else
    set(handles.Xplot,'String',liststring);
    set(handles.Yplot,'String',liststring);
    set(handles.Yerrplot,'String',liststring);
end
guidata(hObject,handles);



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
