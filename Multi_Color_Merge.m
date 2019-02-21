function varargout = Multi_Color_Merge(varargin)
% MULTI_COLOR_MERGE MATLAB code for Multi_Color_Merge.fig
%      MULTI_COLOR_MERGE, by itself, creates a new MULTI_COLOR_MERGE or raises the existing
%      singleton*.
%
%      H = MULTI_COLOR_MERGE returns the handle to a new MULTI_COLOR_MERGE or the handle to
%      the existing singleton*.
%
%      MULTI_COLOR_MERGE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MULTI_COLOR_MERGE.M with the given input arguments.
%
%      MULTI_COLOR_MERGE('Property','Value',...) creates a new MULTI_COLOR_MERGE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Multi_Color_Merge_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Multi_Color_Merge_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Multi_Color_Merge

% Last Modified by GUIDE v2.5 21-Feb-2019 00:07:43

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @Multi_Color_Merge_OpeningFcn, ...
    'gui_OutputFcn',  @Multi_Color_Merge_OutputFcn, ...
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


function saveState(handles)

global color1;
global color2;
global color3;
global ThreeD;

fileName = '.\RUN\para.mat';
ThreeD = get(handles.ThreeD,'Value' );
ingain= get(handles.gain1,'Value' );
color1.gain=2^((10* ingain-5));

color1.gamma= get(handles.gamma1,'Value' );
color1.R= get(handles.colorslider1,'Value' );
color1.G= get(handles.colorslider1G,'Value' );
color1.B= get(handles.colorslider1B,'Value' );

ingain= get(handles.gain2,'Value' );
color2.gain=2^((10* ingain-5));
color2.gamma= get(handles.gamma2,'Value' );
color2.R= get(handles.colorslider2,'Value' );
color2.G= get(handles.colorslider2G,'Value' );
color2.B= get(handles.colorslider2B,'Value' );

ingain= get(handles.gain3,'Value' );
color3.gain=2^((10* ingain-5));
color3.gamma= get(handles.gamma3,'Value' );
color3.R= get(handles.colorslider3,'Value' );
color3.G= get(handles.colorslider3G,'Value' );
color3.B= get(handles.colorslider3B,'Value' );




if ~exist('.\RUN','dir')==1
    save_file('.\RUN');
end

save(fileName, 'color1','color2','color3','ThreeD');
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function loadState(handles)
global color1;
global color2;
global color3;
global ThreeD;
color1.IMG = zeros(10,10);
color1.gain = 1;
color2.gain = 1;
color3.gain= 1;
fileName = '.\RUN\para.mat';
ingain=0.5;
if exist(fileName)
    
    load(fileName);
    set(handles.ThreeD,'Value', ThreeD );
    set(handles.gain1,'Value',ingain);
    color1.gain=2^(10*ingain-5);
    set(handles.gamma1,'Value',color1.gamma);
    set(handles.colorslider1,'Value',color1.R);
    set(handles.colorslider1G,'Value',color1.G);
    set(handles.colorslider1B,'Value',color1.B);
    
    set(handles.gain2,'Value',ingain);
    set(handles.gamma2,'Value',color2.gamma);
    set(handles.colorslider2,'Value',color2.R);
    set(handles.colorslider2G,'Value',color2.G);
    set(handles.colorslider2B,'Value',color2.B);
    color2.gain=2^(10*ingain-5);
    
    set(handles.gain3,'Value',ingain);
    set(handles.gamma3,'Value',color3.gamma);
    set(handles.colorslider3,'Value',color3.R);
    set(handles.colorslider3G,'Value',color3.G);
    set(handles.colorslider3B,'Value',color3.B);
    color2.gain=2^(10*ingain-5);
else
    
    set(handles.ThreeD,'Value',0);
    
    set(handles.gain1,'Value', 0.5 );
    set(handles.gamma1,'Value', 1 );
    
    set(handles.colorslider1,'Value', 1 );
    set(handles.colorslider1G,'Value',0);
    set(handles.colorslider1B,'Value',0);
    
    set(handles.gamma2,'Value', 1 );
    set(handles.gain2,'Value', 0.5 );
    set(handles.colorslider2,'Value',0);
    set(handles.colorslider2G,'Value',1);
    set(handles.colorslider2B,'Value',0);
    
    set(handles.gamma3,'Value', 1 );
    set(handles.gain3,'Value', 0.5 );
    set(handles.colorslider3,'Value',0);
    set(handles.colorslider3G,'Value',0);
    set(handles.colorslider3B,'Value',1);
end
saveState(handles);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function readState(handles)
global color1;
global color2;
global color3;
global ThreeD;

ThreeD = get(handles.ThreeD,'Value' );

ingain = get(handles.gain1,'Value' );
color1.gain=2^(10*ingain-5);
color1.gamma = get(handles.gamma1,'Value' );
color1.R = get(handles.colorslider1,'Value' );
color1.G= get(handles.colorslider1G,'Value' );
color1.B = get(handles.colorslider1B,'Value' );

ingain = get(handles.gain2,'Value' );
color2.gain=2^(10*ingain-5);
color2.gamma = get(handles.gamma2,'Value' );
color2.R = get(handles.colorslider2,'Value' );
color2.G= get(handles.colorslider2G,'Value' );
color2.B = get(handles.colorslider2B,'Value' );

ingain = get(handles.gain3,'Value' );
color3.gain=2^(10*ingain-5);
color3.gamma = get(handles.gamma3,'Value' );
color3.R = get(handles.colorslider3,'Value' );
color3.G= get(handles.colorslider3G,'Value' );
color3.B = get(handles.colorslider3B,'Value' );





% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function checkState(handles)

global color1;
global color2;
global color3;
global displaying
global ThreeD
global inputFilePath
global inputFileName

color1.check = 1;

% if ~ (exist([inputFilePath inputFileName])==2)
%     disp(' Please select at least one file !');
%     color1.check = 0;
% end


if (color1.check>0)
    saveState(handles);
    Savedata(color1,color2,color3,inputFileName,inputFilePath,displaying,ThreeD);
else
    disp('Retry after changing the variables according to the message !');
end





% --- Executes just before Multi_Color_Merge is made visible.
function Multi_Color_Merge_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Multi_Color_Merge (see VARARGIN)

% Choose default command line output for Multi_Color_Merge
%% handles.output = hObject;

% Update handles structure
%% guidata(hObject, handles);
clear global
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);

if ~exist('.\RUN','dir')==1
    save_file('.\RUN');
end
loadState(handles);
set(handles.color1_name,'visible','off');
set(handles.color2_name,'visible','off');
set(handles.color3_name,'visible','off');

global color1;
global color2;
global color3;
set(handles.color1_R,'String',num2str(color1.R));
set(handles.color1_G,'String',num2str(color1.G));
set(handles.color1_B,'String',num2str(color1.B));
set(handles.color1_gain,'String',num2str(color1.gain));
set(handles.color1_gamma,'String',num2str(color1.gamma));

set(handles.color2_R,'String',num2str(color2.R));
set(handles.color2_G,'String',num2str(color2.G));
set(handles.color2_B,'String',num2str(color2.B));
set(handles.color2_gain,'String',num2str(color2.gain));
set(handles.color2_gamma,'String',num2str(color2.gamma));

set(handles.color3_R,'String',num2str(color3.R));
set(handles.color3_G,'String',num2str(color3.G));
set(handles.color3_B,'String',num2str(color3.B));
set(handles.color3_gain,'String',num2str(color3.gain));
set(handles.color3_gamma,'String',num2str(color3.gamma));




% color1_R
imshow(zeros(1200,1200,3),'Parent', handles.Figure);
% UIWAIT makes Sparsity_SIM_recon wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% UIWAIT makes Multi_Color_Merge wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Multi_Color_Merge_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Read data%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% --- Executes on button press in color1.
function color1_Callback(hObject, eventdata, handles)
% hObject    handle to color1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear global inputFilePath
clear global inputFileName
% clear global color1
% clear global color2
% clear global color3
clear global displaying

global color1;
global color2;
global color3;
global ThreeD
global displaying
global inputFileName
global inputFilePath
n=1;
[inputFileName.c1,  inputFilePath.c1, gfindex] = uigetfile({'*.*',  'All files'}, 'Select data file', '..\Data\Raw\');


if gfindex==0
    inputFilePath.c1 = '';
    inputFileName.c1 = '';
%     flage=0;
end
if ~exist([inputFileName.c1 ])==0
    set(handles.color1_name,'visible','on');
    set(handles.color1_name,'String',[inputFilePath.c1, inputFileName.c1]);
    if (ThreeD)
        IMG=imreadTiff([inputFilePath.c1, inputFileName.c1], (ThreeD));
        disp= IMG;
        displaying.c1=MIP(disp);
    else
        color1.IMG=imreadTiff([inputFilePath.c1, inputFileName.c1]);
        disp= color1.IMG;
        displaying.c1=disp(:,:,n);
    end
    displayThecolor (color1,color2,color3,displaying,inputFileName,ThreeD,handles)
end




% --- Executes on button press in color2.

function color2_Callback(hObject, eventdata, handles)
% hObject    handle to color2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global color1;
global color2;
global color3;
global ThreeD
global displaying
global inputFileName
global inputFilePath
n=1;
[inputFileName.c2,  inputFilePath.c2, gfindex] = uigetfile({'*.*',  'All files'}, 'Select data file', '..\Data\Raw\');

if gfindex==0
    inputFilePath.c2 = '';
    inputFileName.c2 = '';
end
if ~exist([inputFileName.c2 ])==0
    set(handles.color2_name,'visible','on');
    set(handles.color2_name,'String',[inputFilePath.c2, inputFileName.c2]);
    if (ThreeD)
        IMG=imreadTiff([inputFilePath.c2, inputFileName.c2], (ThreeD));
        disp=MG;
        displaying.c2=MIP(disp);
    else
        IMG=imreadTiff([inputFilePath.c2, inputFileName.c2]);
        disp= IMG;
        displaying.c2=disp(:,:,n);
    end
    displayThecolor (color1,color2,color3,displaying,inputFileName,ThreeD,handles);

end


% --- Executes on button press in color3.
function color3_Callback(hObject, eventdata, handles)
% hObject    handle to color3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global color1;
global color2;
global color3;
global ThreeD
global displaying
global inputFileName
global inputFilePath
n=1;
[inputFileName.c3,  inputFilePath.c3, gfindex] = uigetfile({'*.*',  'All files'}, 'Select data file', '..\Data\Raw\');

if gfindex==0
    inputFilePath.c3 = '';
    inputFileName.c3= '';
end
if ~exist([inputFileName.c3 ])==0
        set(handles.color3_name,'visible','on');
        set(handles.color3_name,'String',[inputFilePath.c3, inputFileName.c3]);
    if (ThreeD)
        IMG=imreadTiff([inputFilePath.c3, inputFileName.c3], (ThreeD));
        disp= IMG;
        displaying.c3=MIP(disp);
    else
        IMG=imreadTiff([inputFilePath.c3, inputFileName.c3]);
        disp=IMG;
        displaying.c3=disp(:,:,n);
    end
    displayThecolor (color1,color2,color3,displaying,inputFileName,ThreeD,handles);

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Red %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes on slider movement.
function colorslider1_Callback(hObject, eventdata, handles)
% hObject    handle to colorslider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global color1;
global color2;
global color3;
global inputFileName
color1.R = get(hObject,'Value');
global ThreeD
global displaying
set(handles.color1_R,'String',num2str(color1.R));

displayThecolor (color1,color2,color3,displaying,inputFileName,ThreeD,handles);
% Hints: get(hObject,'Value') returns position of slider

%        to determine range of slider


% --- Executes during object creation, after setting all properties.
function colorslider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to colorslider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



% --- Executes on slider movement.
function colorslider2_Callback(hObject, eventdata, handles)
% hObject    handle to colorslider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global color1;
global color2;
global color3;
color2.R = get(hObject,'Value');
global inputFileName
global ThreeD
global displaying
set(handles.color2_R,'String',num2str(color2.R));

displayThecolor (color1,color2,color3,displaying,inputFileName,ThreeD,handles)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function colorslider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to colorslider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes on slider movement.
function colorslider3_Callback(hObject, eventdata, handles)
% hObject    handle to colorslider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global color1;
global color2;
global color3;
global inputFileName
color3.R = get(hObject,'Value');
global ThreeD
global displaying
set(handles.color3_B,'String',num2str(color3.B));

displayThecolor (color1,color2,color3,displaying,inputFileName,ThreeD,handles)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function colorslider3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to colorslider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Green %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes on slider movement.
function colorslider1G_Callback(hObject, eventdata, handles)
% hObject    handle to colorslider1G (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global color1;
global color2;
global color3;
global inputFileName
color1.G = get(hObject,'Value');
global ThreeD
global displaying
set(handles.color1_G,'String',num2str(color1.G));

displayThecolor (color1,color2,color3,displaying,inputFileName,ThreeD,handles)


% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function colorslider1G_CreateFcn(hObject, eventdata, handles)
% hObject    handle to colorslider1G (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function colorslider2G_Callback(hObject, eventdata, handles)
% hObject    handle to colorslider2G (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global color1;
global color2;
global color3;
global inputFileName
color2.G = get(hObject,'Value');
global ThreeD
global displaying
set(handles.color2_G,'String',num2str(color2.G));

displayThecolor (color1,color2,color3,displaying,inputFileName,ThreeD,handles)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function colorslider2G_CreateFcn(hObject, eventdata, handles)
% hObject    handle to colorslider2G (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function colorslider3G_Callback(hObject, eventdata, handles)
% hObject    handle to colorslider3G (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global color1;
global color2;
global color3;
global inputFileName
color3.G = get(hObject,'Value');
global ThreeD
global displaying
set(handles.color3_G,'String',num2str(color3.G));
displayThecolor (color1,color2,color3,displaying,inputFileName,ThreeD,handles)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function colorslider3G_CreateFcn(hObject, eventdata, handles)
% hObject    handle to colorslider3G (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Blue %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes on slider movement.
function colorslider1B_Callback(hObject, eventdata, handles)
% hObject    handle to colorslider1B (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global color1;
global color2;
global color3;
global inputFileName
color1.B = get(hObject,'Value');
global ThreeD
global displaying
set(handles.color1_B,'String',num2str(color1.B));

displayThecolor (color1,color2,color3,displaying,inputFileName,ThreeD,handles)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function colorslider1B_CreateFcn(hObject, eventdata, handles)
% hObject    handle to colorslider1B (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function colorslider2B_Callback(hObject, eventdata, handles)
% hObject    handle to colorslider2B (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global color1;
global color2;
global color3;
global inputFileName
color2.B = get(hObject,'Value');
global ThreeD
global displaying
set(handles.color2_B,'String',num2str(color2.B));
displayThecolor (color1,color2,color3,displaying,inputFileName,ThreeD,handles)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function colorslider2B_CreateFcn(hObject, eventdata, handles)
% hObject    handle to colorslider2B (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function colorslider3B_Callback(hObject, eventdata, handles)
% hObject    handle to colorslider3B (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global color1;
global color2;
global color3;
global inputFileName
color3.B = get(hObject,'Value');
global ThreeD
global displaying
set(handles.color3_B,'String',num2str(color3.B));
displayThecolor (color1,color2,color3,displaying,inputFileName,ThreeD,handles)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function colorslider3B_CreateFcn(hObject, eventdata, handles)
% hObject    handle to colorslider3B (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% GAIN %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes on slider movement.
function gain1_Callback(hObject, eventdata, handles)
% hObject    handle to gain1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global color1;
global color2;
global color3;
global inputFileName
ingain= get(hObject,'Value');
color1.gain= 2^((10*ingain-5));
global ThreeD
global displaying
set(handles.color1_gain,'String',num2str(color1.gain));

displayThecolor (color1,color2,color3,displaying,inputFileName,ThreeD,handles)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function gain1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to gain1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function gain2_Callback(hObject, eventdata, handles)
% hObject    handle to gain2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global color1;
global color2;
global color3;
global inputFileName
ingain2= get(hObject,'Value');
color2.gain= 2^((10*ingain2-5));
set(handles.color2_gain,'String',num2str(color2.gain));

global ThreeD
global displaying
displayThecolor (color1,color2,color3,displaying,inputFileName,ThreeD,handles)
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function gain2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to gain2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function gain3_Callback(hObject, eventdata, handles)
% hObject    handle to gain3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global color1;
global color2;
global color3;
global inputFileName
ingain3= get(hObject,'Value');
color3.gain= 2^((10*ingain3-5));
set(handles.color3_gain,'String',num2str(color3.gain));

global ThreeD
global displaying
displayThecolor (color1,color2,color3,displaying,inputFileName,ThreeD,handles)
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function gain3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to gain3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% GAMMA %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% --- Executes on slider movement.
function gamma1_Callback(hObject, eventdata, handles)
% hObject    handle to gamma1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global color1;
global color2;
global color3;
global inputFileName
color1.gamma = get(hObject,'Value');
global ThreeD
global displaying
set(handles.color1_gamma,'String',num2str(color1.gamma));

% displaying.c1=displaying.c1.^color1.gamma;
% displaying.c1=displaying.c1./max(displaying.c1(:));
displayThecolor (color1,color2,color3,displaying,inputFileName,ThreeD,handles)


% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function gamma1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to gamma1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in Save.
function Save_Callback(hObject, eventdata, handles)
% hObject    handle to Save (see GCBO)
readState(handles);
checkState(handles);
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in ThreeD.
function ThreeD_Callback(hObject, eventdata, handles)
% hObject    handle to ThreeD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ThreeD;
global color1;
global color2;
global color3;
global inputFileName
if (((get(hObject,'Value') == get(hObject,'Max'))))
    ThreeD = 1;
else
    ThreeD = 0;
end

numcolor=length(fieldnames(displaying));

% for i=1:numcolor
%     global eval(['color',num2str(totalcolor)]);
% end
global displaying
displayThecolor (color1,color2,color3,displaying,inputFileName,ThreeD,handles)
% Hint: get(hObject,'Value') returns toggle state of ThreeD





% --- Executes on slider movement.
function gamma2_Callback(hObject, eventdata, handles)
% hObject    handle to gamma2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global color1;
global color2;
global color3;
global inputFileName
color2.gamma = get(hObject,'Value');
global ThreeD
global displaying
% displaying.c1=displaying.c1.^color1.gamma;
% displaying.c1=displaying.c1./max(displaying.c1(:));
set(handles.color2_gamma,'String',num2str(color2.gamma));

displayThecolor (color1,color2,color3,displaying,inputFileName,ThreeD,handles)
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function gamma2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to gamma2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function gamma3_Callback(hObject, eventdata, handles)
% hObject    handle to gamma3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global color1;
global color2;
global color3;
global inputFileName
color3.gamma = get(hObject,'Value');
global ThreeD
global displaying
set(handles.color3_gamma,'String',num2str(color3.gamma));

% displaying.c1=displaying.c1.^color1.gamma;
% displaying.c1=displaying.c1./max(displaying.c1(:));
displayThecolor (color1,color2,color3,displaying,inputFileName,ThreeD,handles)
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function gamma3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to gamma3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end





function color1_name_Callback(hObject, eventdata, handles)
% hObject    handle to color1_name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of color1_name as text
%        str2double(get(hObject,'String')) returns contents of color1_name as a double


% --- Executes during object creation, after setting all properties.
function color1_name_CreateFcn(hObject, eventdata, handles)
% hObject    handle to color1_name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function color2_name_Callback(hObject, eventdata, handles)
% hObject    handle to color2_name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of color2_name as text
%        str2double(get(hObject,'String')) returns contents of color2_name as a double


% --- Executes during object creation, after setting all properties.
function color2_name_CreateFcn(hObject, eventdata, handles)
% hObject    handle to color2_name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function color3_name_Callback(hObject, eventdata, handles)
% hObject    handle to color3_name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of color3_name as text
%        str2double(get(hObject,'String')) returns contents of color3_name as a double


% --- Executes during object creation, after setting all properties.
function color3_name_CreateFcn(hObject, eventdata, handles)
% hObject    handle to color3_name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function color1_R_Callback(hObject, eventdata, handles)
% hObject    handle to color1_R (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of color1_R as text
%        str2double(get(hObject,'String')) returns contents of color1_R as a double


% --- Executes during object creation, after setting all properties.
function color1_R_CreateFcn(hObject, eventdata, handles)
% hObject    handle to color1_R (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function color1_G_Callback(hObject, eventdata, handles)
% hObject    handle to color1_G (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of color1_G as text
%        str2double(get(hObject,'String')) returns contents of color1_G as a double


% --- Executes during object creation, after setting all properties.
function color1_G_CreateFcn(hObject, eventdata, handles)
% hObject    handle to color1_G (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function color1_B_Callback(hObject, eventdata, handles)
% hObject    handle to color1_B (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of color1_B as text
%        str2double(get(hObject,'String')) returns contents of color1_B as a double


% --- Executes during object creation, after setting all properties.
function color1_B_CreateFcn(hObject, eventdata, handles)
% hObject    handle to color1_B (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function color1_gain_Callback(hObject, eventdata, handles)
% hObject    handle to color1_gain (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of color1_gain as text
%        str2double(get(hObject,'String')) returns contents of color1_gain as a double


% --- Executes during object creation, after setting all properties.
function color1_gain_CreateFcn(hObject, eventdata, handles)
% hObject    handle to color1_gain (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function color1_gamma_Callback(hObject, eventdata, handles)
% hObject    handle to color1_gamma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of color1_gamma as text
%        str2double(get(hObject,'String')) returns contents of color1_gamma as a double


% --- Executes during object creation, after setting all properties.
function color1_gamma_CreateFcn(hObject, eventdata, handles)
% hObject    handle to color1_gamma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function color2_R_Callback(hObject, eventdata, handles)
% hObject    handle to color2_R (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of color2_R as text
%        str2double(get(hObject,'String')) returns contents of color2_R as a double


% --- Executes during object creation, after setting all properties.
function color2_R_CreateFcn(hObject, eventdata, handles)
% hObject    handle to color2_R (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function color2_G_Callback(hObject, eventdata, handles)
% hObject    handle to color2_G (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of color2_G as text
%        str2double(get(hObject,'String')) returns contents of color2_G as a double


% --- Executes during object creation, after setting all properties.
function color2_G_CreateFcn(hObject, eventdata, handles)
% hObject    handle to color2_G (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function color2_B_Callback(hObject, eventdata, handles)
% hObject    handle to color2_B (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of color2_B as text
%        str2double(get(hObject,'String')) returns contents of color2_B as a double


% --- Executes during object creation, after setting all properties.
function color2_B_CreateFcn(hObject, eventdata, handles)
% hObject    handle to color2_B (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function color2_gain_Callback(hObject, eventdata, handles)
% hObject    handle to color2_gain (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of color2_gain as text
%        str2double(get(hObject,'String')) returns contents of color2_gain as a double


% --- Executes during object creation, after setting all properties.
function color2_gain_CreateFcn(hObject, eventdata, handles)
% hObject    handle to color2_gain (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function color2_gamma_Callback(hObject, eventdata, handles)
% hObject    handle to color2_gamma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of color2_gamma as text
%        str2double(get(hObject,'String')) returns contents of color2_gamma as a double


% --- Executes during object creation, after setting all properties.
function color2_gamma_CreateFcn(hObject, eventdata, handles)
% hObject    handle to color2_gamma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function color3_R_Callback(hObject, eventdata, handles)
% hObject    handle to color3_R (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of color3_R as text
%        str2double(get(hObject,'String')) returns contents of color3_R as a double


% --- Executes during object creation, after setting all properties.
function color3_R_CreateFcn(hObject, eventdata, handles)
% hObject    handle to color3_R (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function color3_G_Callback(hObject, eventdata, handles)
% hObject    handle to color3_G (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of color3_G as text
%        str2double(get(hObject,'String')) returns contents of color3_G as a double


% --- Executes during object creation, after setting all properties.
function color3_G_CreateFcn(hObject, eventdata, handles)
% hObject    handle to color3_G (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function color3_B_Callback(hObject, eventdata, handles)
% hObject    handle to color3_B (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of color3_B as text
%        str2double(get(hObject,'String')) returns contents of color3_B as a double


% --- Executes during object creation, after setting all properties.
function color3_B_CreateFcn(hObject, eventdata, handles)
% hObject    handle to color3_B (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function color3_gain_Callback(hObject, eventdata, handles)
% hObject    handle to color3_gain (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of color3_gain as text
%        str2double(get(hObject,'String')) returns contents of color3_gain as a double


% --- Executes during object creation, after setting all properties.
function color3_gain_CreateFcn(hObject, eventdata, handles)
% hObject    handle to color3_gain (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function color3_gamma_Callback(hObject, eventdata, handles)
% hObject    handle to color3_gamma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of color3_gamma as text
%        str2double(get(hObject,'String')) returns contents of color3_gamma as a double


% --- Executes during object creation, after setting all properties.
function color3_gamma_CreateFcn(hObject, eventdata, handles)
% hObject    handle to color3_gamma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function displaying=MIP(disp)
for i=1:size(color1.IMG,1)
    for j=1:size(color1.IMG,2)
        displaying(i,j)=max(disp(i,j,:));
    end
end

function displayThecolor (color1,color2,color3,displaying,inputFileName,ThreeD,handles)
% if (ThreeD)
numcolor=length(fieldnames(inputFileName));
displayingsum=zeros(size(displaying.c1,1),size(displaying.c1,2),3);
for totalcolor=1:numcolor
    displayingsum(:,:,1)=displayingsum(:,:,1)+(eval(['color',num2str(totalcolor),'.R'])*eval(['displaying.c',num2str(totalcolor)])*...
        eval(['color',num2str(totalcolor),'.gain'])).^eval(['color',num2str(totalcolor),'.gamma']);
    displayingsum(:,:,2)=displayingsum(:,:,2)+(eval(['color',num2str(totalcolor),'.G'])*eval(['displaying.c',num2str(totalcolor)])*...
        eval(['color',num2str(totalcolor),'.gain'])).^eval(['color',num2str(totalcolor),'.gamma']);
    displayingsum(:,:,3)=displayingsum(:,:,3)+(eval(['color',num2str(totalcolor),'.B'])*eval(['displaying.c',num2str(totalcolor)])*...
        eval(['color',num2str(totalcolor),'.gain'])).^eval(['color',num2str(totalcolor),'.gamma']);
end
imshow(displayingsum,'Parent', handles.Figure);
% else
% %     color1.gamma
%     numcolor=length(fieldnames(inputFileName));
%     displayingsum=zeros(size(displaying.c1,1),size(displaying.c1,2),3);
%     for totalcolor=1:numcolor
%         displayingsum(:,:,1)=displayingsum(:,:,1)+(eval(['color',num2str(totalcolor),'.R'])*eval(['displaying.c',num2str(totalcolor)])*...
%             eval(['color',num2str(totalcolor),'.gain'])).^eval(['color',num2str(totalcolor),'.gamma']);
%         displayingsum(:,:,2)=displayingsum(:,:,2)+(eval(['color',num2str(totalcolor),'.G'])*eval(['displaying.c',num2str(totalcolor)])*...
%             eval(['color',num2str(totalcolor),'.gain'])).^eval(['color',num2str(totalcolor),'.gamma']);
%         displayingsum(:,:,3)=displayingsum(:,:,3)+(eval(['color',num2str(totalcolor),'.B'])*eval(['displaying.c',num2str(totalcolor)])*...
%             eval(['color',num2str(totalcolor),'.gain'])).^eval(['color',num2str(totalcolor),'.gamma']);
%     end
%     imshow(displayingsum,'Parent', handles.Figure);
% end
% imwrite(displayingsum,['t.tif']);

function Savedata(color1,color2,color3,inputFileName,inputFilePath,displaying,ThreeD)
warning off
if ~exist('.\MulticolorData','dir')==1
    save_file('.\MulticolorData');
end
Time_Str=get_time;
if ThreeD
    filepath=['MulticolorData\',Time_Str,'MulticolorVolume'];
else
    filepath=['MulticolorData\',Time_Str,'MulticolorVideo'];
end

if ~exist(filepath,'dir')==1
    save_file(filepath);
end
if (ThreeD)
    numcolor=length(fieldnames(inputFileName));
    displayingsum=zeros(size(displaying.c1,1),size(displaying.c1,2),3);
    for totalcolor=1:numcolor
        displayingsum(:,:,1)=displayingsum(:,:,1)+eval(['color',num2str(totalcolor),'.R'])*eval(['displaying.c',num2str(totalcolor)])*eval(['color',num2str(totalcolor),'.gain']);
        displayingsum(:,:,2)=displayingsum(:,:,2)+eval(['color',num2str(totalcolor),'.G'])*eval(['displaying.c',num2str(totalcolor)])*eval(['color',num2str(totalcolor),'.gain']);
        displayingsum(:,:,3)=displayingsum(:,:,3)+eval(['color',num2str(totalcolor),'.B'])*eval(['displaying.c',num2str(totalcolor)])*eval(['color',num2str(totalcolor),'.gain']);
    end
    imwrite(displayingsum,'\MulticolorData\ThreeD.tif');
else
    
end
numcolor=length(fieldnames(inputFileName));
for totalcolor=1:numcolor
    memory=imreadTiff([    eval(['inputFilePath.c',num2str(totalcolor)]),   eval(['inputFileName.c',num2str(totalcolor)])    ]);
    eval(['IMGc',num2str(totalcolor),'=','memory;']);
end
%     IMGc1=imreadTiff([inputFilePath.c1, inputFileName.c1]);
%     IMGc2=imreadTiff([inputFilePath.c2, inputFileName.c2]);
%     IMGc3=imreadTiff([inputFilePath.c3, inputFileName.c3]);
n=size(IMGc1,3);
for i=1:n
    displayingsum=zeros(size(displaying.c1,1),size(displaying.c1,2),3);
    for totalcolor=1:numcolor
        dispmemory=eval(['IMGc',num2str(totalcolor)]);
        disp{totalcolor}=dispmemory(:,:,i);
        displayingsum(:,:,1)=displayingsum(:,:,1)+eval(['color',num2str(totalcolor),'.R'])*disp{totalcolor}*eval(['color',num2str(totalcolor),'.gain']);
        displayingsum(:,:,2)=displayingsum(:,:,2)+eval(['color',num2str(totalcolor),'.G'])*disp{totalcolor}*eval(['color',num2str(totalcolor),'.gain']);
        displayingsum(:,:,3)=displayingsum(:,:,3)+eval(['color',num2str(totalcolor),'.B'])*disp{totalcolor}*eval(['color',num2str(totalcolor),'.gain']);
    end
    imwrite(displayingsum,[filepath,'\TwoD','_frames_',int2str(i),'.tif']);
end

function save_file(filename)
dirname=filename;
a=['mkdir ' dirname];
system(a);

function Time_Str=get_time
Time=fix(clock);
Time_Str=0;
for T=size(Time,2)-2:-1:1
    Temp=strcat(num2str(Time(T)) , '_' );
    Time_Str=strcat(Temp,Time_Str );
end

function stack=imreadTiff(filename,threeD)
if nargin < 2 || isempty(threeD)
    threeD=0;
end
infor = imfinfo(filename);
frames = numel(infor);
stack=zeros(infor(1).Height,infor(1).Width,frames);
if threeD
    for k = 1:frames
        stack(:,:,k) =double(imread(filename, k));
    end
    stack=stack./max(stack(:));
else
    for k = 1:frames
        stack(:,:,k) =double(imread(filename, k));
        stack(:,:,k)=stack(:,:,k)./max(max(stack(:,:,k)));
    end
end




