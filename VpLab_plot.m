
function varargout = VpLab_plot(varargin)
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
warning off; %关闭warning警告
handles.output = hObject;

guidata(hObject, handles);


% --- Outputs from this function are returned to the command line.
function varargout = VpLab_plot_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;


% --- Executes on selection change in Xplot.
function Xplot_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function Xplot_CreateFcn(hObject, eventdata, handles)
%Workspace:提取的工作区变量
%liststring：工作区的变量名
Workspace=ArrangeFromWorkspaceData(0);
varlength=length(Workspace);
liststring={};
for i=1:varlength
    liststring{1,i}=Workspace(i).signals.name;
end
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
%防止无变量的判断
if isempty(liststring)
    set(hObject,'String','工作区无变量');
else
set(hObject,'String',liststring);
end


% --- Executes on selection change in Yplot.
function Yplot_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function Yplot_CreateFcn(hObject, eventdata, handles)
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



% --- Executes during object creation, after setting all properties.
function Yerrplot_CreateFcn(hObject, eventdata, handles)
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



% --- Executes during object creation, after setting all properties.
function styleplot_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
Workspace=ArrangeFromWorkspaceData(0);
%防止不选择变量的方法
if isempty(Workspace)
    msgbox('请选择变量');
    return;
end
%获取数据
%x,y,yerr是绘图变量
%varstyle表示折线/散点
%varNew是否新建画布
%varfit拟合次数
%varfiten是否拟合
%str高级设置代码
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
%保证均为数组变量
if ~isa(x,'double')||~isa(y,'double')||~isa(yerr,'double')
    msgbox('请选择数组变量');
    return;
end
%保证均为合适的size
if sum(size(x)~=size(y))||sum(size(yerr)~=size(x))||sum(size(yerr)~=size(y))
    msgbox('绘图数据个数不匹配');
    return;
end
%拟合
varfit=polyfit(x,y,str2double(varfit));

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
    try
        eval(char(str(k)));
    catch
        continue;
    end
end

guidata(hObject,handles);


% --- Executes on button press in Newfigure.
function Newfigure_Callback(hObject, eventdata, handles)


function fit_text_Callback(hObject, eventdata, handles)
input=str2num(get(hObject,'String'));
if (isempty(input))
    set(hObject,'String','0')
end
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function fit_text_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in fiten.
function fiten_Callback(hObject, eventdata, handles)

% --- Executes on button press in refresh.
function refresh_Callback(hObject, eventdata, handles)
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


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
