
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
warning off; %�ر�warning����
handles.output = hObject;

guidata(hObject, handles);


% --- Outputs from this function are returned to the command line.
function varargout = VpLab_plot_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;


% --- Executes on selection change in Xplot.
function Xplot_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function Xplot_CreateFcn(hObject, eventdata, handles)
%Workspace:��ȡ�Ĺ���������
%liststring���������ı�����
Workspace=ArrangeFromWorkspaceData(0);
varlength=length(Workspace);
liststring={};
for i=1:varlength
    liststring{1,i}=Workspace(i).signals.name;
end
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
%��ֹ�ޱ������ж�
if isempty(liststring)
    set(hObject,'String','�������ޱ���');
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
    set(hObject,'String','�������ޱ���');
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
    set(hObject,'String','�������ޱ���');
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
%��ֹ��ѡ������ķ���
if isempty(Workspace)
    msgbox('��ѡ�����');
    return;
end
%��ȡ����
%x,y,yerr�ǻ�ͼ����
%varstyle��ʾ����/ɢ��
%varNew�Ƿ��½�����
%varfit��ϴ���
%varfiten�Ƿ����
%str�߼����ô���
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
%��֤��Ϊ�������
if ~isa(x,'double')||~isa(y,'double')||~isa(yerr,'double')
    msgbox('��ѡ���������');
    return;
end
%��֤��Ϊ���ʵ�size
if sum(size(x)~=size(y))||sum(size(yerr)~=size(x))||sum(size(yerr)~=size(y))
    msgbox('��ͼ���ݸ�����ƥ��');
    return;
end
%���
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
    set(handles.Xplot,'String','�������ޱ���');
    set(handles.Yplot,'String','�������ޱ���');
    set(handles.Yerrplot,'String','�������ޱ���');
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
