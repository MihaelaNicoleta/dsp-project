function varargout = dsp_filtering(varargin)
% DSP_FILTERING MATLAB code for dsp_filtering.fig
%      DSP_FILTERING, by itself, creates a new DSP_FILTERING or raises the existing
%      singleton*.
%
%      H = DSP_FILTERING returns the handle to a new DSP_FILTERING or the handle to
%      the existing singleton*.
%
%      DSP_FILTERING('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DSP_FILTERING.M with the given input arguments.
%
%      DSP_FILTERING('Property','Value',...) creates a new DSP_FILTERING or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before dsp_filtering_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to dsp_filtering_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help dsp_filtering

% Last Modified by GUIDE v2.5 11-Dec-2016 13:41:56

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @dsp_filtering_OpeningFcn, ...
                   'gui_OutputFcn',  @dsp_filtering_OutputFcn, ...
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


% --- Executes just before dsp_filtering is made visible.
function dsp_filtering_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to dsp_filtering (see VARARGIN)

% Choose default command line output for dsp_filtering
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes dsp_filtering wait for user response (see UIRESUME)
% uiwait(handles.figure1);

global fi0;
global durata;

durata = 1;
fi0 = 0;

%frecventa de esantionare: Fs = 10kHz
global Fs; 
Fs = 10000;
global N;
N = 100;
set(handles.edit_N,'string',N);

global maxA;
global minA;

minA = 0;
maxA = 3;



% --- Outputs from this function are returned to the command line.
function varargout = dsp_filtering_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in student_info.
function student_info_Callback(hObject, eventdata, handles)
% hObject    handle to student_info (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    
    h = msgbox({'Grupa 242/2:', 'Cozma Alexandru', 'Raulea Mihaela'}');

% --- Executes on slider movement.
function slider_F1_Callback(hObject, eventdata, handles)
% hObject    handle to slider_F1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

    global F1
    F1 = get(handles.slider_F1,'Value');
    set(handles.F1,'String',F1);


% --- Executes during object creation, after setting all properties.
function slider_F1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_F1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes on slider movement.
function slider_F2_Callback(hObject, eventdata, handles)
% hObject    handle to slider_F2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

    global F2
    F2 = get(handles.slider_F2,'Value');
    set(handles.F2,'String',F2);

% --- Executes during object creation, after setting all properties.
function slider_F2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_F2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes on slider movement.
function slider_F3_Callback(hObject, eventdata, handles)
% hObject    handle to slider_F3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

    global F3
    F3 = get(handles.slider_F3,'Value');
    set(handles.F3,'String',F3);

% --- Executes during object creation, after setting all properties.
function slider_F3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_F3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider_F4_Callback(hObject, eventdata, handles)
% hObject    handle to slider_F4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

    global F4
    F4 = get(handles.slider_F4,'Value');
    set(handles.F4,'String',F4);

% --- Executes during object creation, after setting all properties.
function slider_F4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_F4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider_F5_Callback(hObject, eventdata, handles)
% hObject    handle to slider_F5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

    global F5
    F5 = get(handles.slider_F5,'Value');
    set(handles.F5,'String',F5);

% --- Executes during object creation, after setting all properties.
function slider_F5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_F5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


function edit_A1_Callback(hObject, eventdata, handles)
% hObject    handle to edit_A1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_A1 as text
%        str2double(get(hObject,'String')) returns contents of edit_A1 as a double

    global maxA
    global minA
    global A1
    A1 = str2double(get(handles.edit_A1, 'String'));
     
    if (A1 > maxA) || (A1 < minA)
       msgbox('Please add a value between 0 and 3.');
    end
    

% --- Executes during object creation, after setting all properties.
function edit_A1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_A1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_A2_Callback(hObject, eventdata, handles)
% hObject    handle to edit_A2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_A2 as text
%        str2double(get(hObject,'String')) returns contents of edit_A2 as a double

    global maxA
    global minA
    global A2
    A2 = str2double(get(handles.edit_A2, 'String'));
     
    if (A2 > maxA) || (A2 < minA)
       msgbox('Please add a value between 0 and 3.');
    end

% --- Executes during object creation, after setting all properties.
function edit_A2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_A2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_A3_Callback(hObject, eventdata, handles)
% hObject    handle to edit_A3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_A3 as text
%        str2double(get(hObject,'String')) returns contents of edit_A3 as a double

    global maxA
    global minA
    global A3
    A3 = str2double(get(handles.edit_A3, 'String'));
     
    if (A3 > maxA) || (A3 < minA)
       msgbox('Please add a value between 0 and 3.');
    end

% --- Executes during object creation, after setting all properties.
function edit_A3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_A3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit_A4_Callback(hObject, eventdata, handles)
% hObject    handle to edit_A4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_A4 as text
%        str2double(get(hObject,'String')) returns contents of edit_A4 as a double

    global maxA
    global minA
    global A4
    A4 = str2double(get(handles.edit_A4, 'String'));
     
    if (A4 > maxA) || (A4 < minA)
       msgbox('Please add a value between 0 and 3.');
    end

% --- Executes during object creation, after setting all properties.
function edit_A4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_A4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit_A5_Callback(hObject, eventdata, handles)
% hObject    handle to edit_A5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_A5 as text
%        str2double(get(hObject,'String')) returns contents of edit_A5 as a double

    global maxA
    global minA
    global A5
    A5 = str2double(get(handles.edit_A5, 'String'));
     
    if (A5 > maxA) || (A5 < minA)
       msgbox('Please add a value between 0 and 3.');
    end

% --- Executes during object creation, after setting all properties.
function edit_A5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_A5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btnGenerateS1.
function btnGenerateS1_Callback(hObject, eventdata, handles)
% hObject    handle to btnGenerateS1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    global fi0
    global durata
    global Fs
    global A1
    global F1
    global s1
    global maxA
    

    [t, s] = generateSineWave(A1, F1, Fs, durata, fi0);
    axes(handles.s1_axes);   
    displayGraph(t, s, durata, 'Sinusoida s1', 1, maxA);
    xlabel('timp[s]');
    zoom on;
    s1 = s;


% --- Executes on button press in btnGenerateS2.
function btnGenerateS2_Callback(hObject, eventdata, handles)
% hObject    handle to btnGenerateS2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    global fi0
    global durata
    global Fs
    global A2
    global F2
    global s2
    global maxA

    [t, s] = generateSineWave(A2, F2, Fs, durata, fi0);
    axes(handles.s2_axes);
    displayGraph(t, s, durata, 'Sinusoida s2', 1, maxA);
    xlabel('timp[s]');
    s2 = s;
    zoom on;

% --- Executes on button press in btnGenerateS3.
function btnGenerateS3_Callback(hObject, eventdata, handles)
% hObject    handle to btnGenerateS3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    global fi0
    global durata
    global Fs
    global A3
    global F3
    global s3
    global maxA
    

    [t, s] = generateTriangleWave(A3, F3, Fs, durata);
    axes(handles.s3_axes);
    displayGraph(t, s, durata, 'Semnal triunghiular s3', 1, maxA);
    xlabel('timp[s]');
    s3 = s;
    zoom on;

% --- Executes on button press in btnGenerateS4.
function btnGenerateS4_Callback(hObject, eventdata, handles)
% hObject    handle to btnGenerateS4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    global fi0
    global durata
    global Fs
    global A4
    global F4
    global s4
    
    global maxA

    [t, s] = generateSquareWave(A4, F4, Fs, durata);
    axes(handles.s4_axes);
    displayGraph(t, s, durata, 'Semnal dreptunghiular s4', 1, maxA);
    xlabel('timp[s]');
    s4 = s;
    zoom on;

% --- Executes on button press in btnGenerateS5.
function btnGenerateS5_Callback(hObject, eventdata, handles)
% hObject    handle to btnGenerateS5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    global fi0
    global durata
    global Fs
    global A5
    global F5

    global s1
    global s2
    global s3
    global s4
    
    global maxA
    
    global Semnal_1
    
    Semnal_1 = s1 + s2 + s3 + s4;
    t = 0:1/Fs:durata;
    
    axes(handles.semnal_1_axes);
    displayGraph(t, Semnal_1, durata, 'Suma: Semnal_1', 1, maxA);
    xlabel('timp[s]');
    zoom on;


% --- Executes on button press in btnFTJ.
function btnFTJ_Callback(hObject, eventdata, handles)
% hObject    handle to btnFTJ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    global N
    global Ft1
    global Fs
    global hh
    global filterType
    
    filterType = 'FTJ';
    hh = generateFTJ(Ft1, N, Fs);

% --- Executes on button press in btnFTS.
function btnFTS_Callback(hObject, eventdata, handles)
% hObject    handle to btnFTS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    global N
    global Ft1
    global Fs
    global hh
    global filterType
    
    filterType = 'FTS';    
    hh = generateFTS(Ft1, N, Fs);

% --- Executes on button press in btnFTB.
function btnFTB_Callback(hObject, eventdata, handles)
% hObject    handle to btnFTB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    global N
    global Ft1
    global Ft2
    global Fs
    global hh
    global filterType
    
    filterType = 'FTB';    
    hh = generateFTB(Ft1, Ft2, N, Fs);

% --- Executes on button press in btnFOB.
function btnFOB_Callback(hObject, eventdata, handles)
% hObject    handle to btnFOB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    global N
    global Ft1
    global Ft2
    global Fs
    global hh
    global filterType
    
    filterType = 'FOB';    
    hh = generateFOB(Ft1, Ft2, N, Fs);


function edit_N_Callback(hObject, eventdata, handles)
% hObject    handle to edit_N (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_N as text
%        str2double(get(hObject,'String')) returns contents of edit_N as a double

    global N;    
    N = str2double(get(handles.edit_N ,'String'));

% --- Executes during object creation, after setting all properties.
function edit_N_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_N (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_Ft1_Callback(hObject, eventdata, handles)
% hObject    handle to edit_Ft1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_Ft1 as text
%        str2double(get(hObject,'String')) returns contents of edit_Ft1 as a double

    global Ft1;    
    Ft1 = str2double(get(handles.edit_Ft1 ,'String'));

% --- Executes during object creation, after setting all properties.
function edit_Ft1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_Ft1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_Ft2_Callback(hObject, eventdata, handles)
% hObject    handle to edit_Ft2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_Ft2 as text
%        str2double(get(hObject,'String')) returns contents of edit_Ft2 as a double

    global Ft2;    
    Ft2 = str2double(get(handles.edit_Ft2,'String'));

% --- Executes during object creation, after setting all properties.
function edit_Ft2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_Ft2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btnSpectruSemnalNefiltrat.
function btnSpectruSemnalNefiltrat_Callback(hObject, eventdata, handles)
% hObject    handle to btnSpectruSemnalNefiltrat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    global Semnal_1
    global Fs
    S = fftshift(abs(fft(Semnal_1)));
    axaFFT = linspace(-Fs/2, Fs/2, length(Semnal_1));
    
    axes(handles.spectru_semnal_1_nefiltrat_axes);
    displayGraph(axaFFT, S, 'Spectru semnal nefiltrat', 0, 0);
    zoom on;

% --- Executes on button press in btnSpectruSemnalFiltrat.
function btnSpectruSemnalFiltrat_Callback(hObject, eventdata, handles)
% hObject    handle to btnSpectruSemnalFiltrat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    global Semnal_1
    global hh
    global Fs
    global S_filtrat
    S_filtrat = conv(Semnal_1, hh);
    Spectru_filtrat = fftshift(abs(fft(S_filtrat)));
    axaFFTS_filtrat = linspace(-Fs/2, Fs/2, length(Spectru_filtrat));
    
    axes(handles.spectru_semnal_1_filtrat_axes);
    displayGraph(axaFFTS_filtrat, Spectru_filtrat, 'Spectru semnal filtrat', 0, 0);
    zoom on;

% --- Executes on button press in btnSemnalFiltratTimp.
function btnSemnalFiltratTimp_Callback(hObject, eventdata, handles)
% hObject    handle to btnSemnalFiltratTimp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%TO DO NEXT
global S_filtrat
global Fs
global durata
t = 0:1/Fs:durata;
axes(handles.semnal_filtrat_timp_axes);
xlabel('timp [s]');
cla;
plot(S_filtrat);
title('Semnal filtrat');
zoom on;

% --- Executes on button press in btnCaracteristici.
function btnCaracteristici_Callback(hObject, eventdata, handles)
% hObject    handle to btnCaracteristici (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


    global Fs
    global hh
    global filterType
    global Ft1
    global Ft2
    
    cla(handles.caracteristica_amplitudine_filtru_axes);
    
    axes(handles.caracteristica_amplitudine_filtru_axes);
    generateCharacteristics( hh, Fs, filterType, Ft1, Ft2);
    zoom on;

% --- Executes on button press in btnSemnalAudio.
function btnSemnalAudio_Callback(hObject, eventdata, handles)
% hObject    handle to btnSemnalAudio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    dsp_filtering_sound
