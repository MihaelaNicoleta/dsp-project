function varargout = dsp_filtering_sound(varargin)
% DSP_FILTERING_SOUND MATLAB code for dsp_filtering_sound.fig
%      DSP_FILTERING_SOUND, by itself, creates a new DSP_FILTERING_SOUND or raises the existing
%      singleton*.
%
%      H = DSP_FILTERING_SOUND returns the handle to a new DSP_FILTERING_SOUND or the handle to
%      the existing singleton*.
%
%      DSP_FILTERING_SOUND('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DSP_FILTERING_SOUND.M with the given input arguments.
%
%      DSP_FILTERING_SOUND('Property','Value',...) creates a new DSP_FILTERING_SOUND or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before dsp_filtering_sound_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to dsp_filtering_sound_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help dsp_filtering_sound

% Last Modified by GUIDE v2.5 11-Dec-2016 14:00:49

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @dsp_filtering_sound_OpeningFcn, ...
                   'gui_OutputFcn',  @dsp_filtering_sound_OutputFcn, ...
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

% ---------------------------------------------semnal1 logic

% --- Executes just before dsp_filtering_sound is made visible.
function dsp_filtering_sound_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to dsp_filtering_sound (see VARARGIN)

% Choose default command line output for dsp_filtering_sound
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes dsp_filtering_sound wait for user response (see UIRESUME)
% uiwait(handles.figure1);

    global semnal1;
    semnal1 = 'semnal1.wav';
    
    global semnal2;
    semnal2 = 'semnal2.wav';

% --- Outputs from this function are returned to the command line.
function varargout = dsp_filtering_sound_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in btnOpenSemnalAudio1.
function btnOpenSemnalAudio1_Callback(hObject, eventdata, handles)
% hObject    handle to btnOpenSemnalAudio1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    global semnal1;
    global wav1;
    global Fs1;
        
    [wav1, Fs1] = wavread(semnal1);
    axes(handles.semnal_audio_1_axes);
    plot(wav1);
    zoom xon;

% --- Executes on button press in btnSpectruSemnal1Nefiltrat.
function btnSpectruSemnal1Nefiltrat_Callback(hObject, eventdata, handles)
% hObject    handle to btnSpectruSemnal1Nefiltrat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    global wav1
    global Fs1

    S = fftshift(abs(fft(wav1)));
    axaFFT = linspace(-Fs1/2, Fs1/2, length(wav1));
    
    axes(handles.spectru_semnal_audio_1_nefiltrat_axes);
    displayGraph(axaFFT, S, 'Spectru semnal audio 1 nefiltrat', 0, 0);
    zoom xon;


% --- Executes on button press in btnSpectruSemnal1Filtrat.
function btnSpectruSemnal1Filtrat_Callback(hObject, eventdata, handles)
% hObject    handle to btnSpectruSemnal1Filtrat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


global Fs1;
global fwav1;
global wav1;
hh = generateFOB(600,1300,2001,Fs1);
fwav1 = conv(wav1,hh);

fswav1 = fftshift(abs(fft(fwav1)));
ax = linspace(-Fs1/2 , Fs1/2, length(fswav1));

% put on axes
axes(handles.spectru_semnal_audio_1_filtrat_axes);
displayGraph(ax, fswav1, 'Spectru semnal audio 1 filtrat', 0, 0);
zoom xon;

% --- Executes on button press in btnRedareSemnal1Original.
function btnRedareSemnal1Original_Callback(hObject, eventdata, handles)
% hObject    handle to btnRedareSemnal1Original (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    global wav1;
    global Fs1;
    
    sound(wav1, Fs1);

% --- Executes on button press in btnRedareSemnal1Filtrat.
function btnRedareSemnal1Filtrat_Callback(hObject, eventdata, handles)
% hObject    handle to btnRedareSemnal1Filtrat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    %TO DO NEXT
%     TFDI la filtrat
global Fs1;
global fwav1;
sound(fwav1,Fs1);

% ---------------------------------------------end of semnal1 logic

% --- Executes on button press in btnInfo.
function btnInfo_Callback(hObject, eventdata, handles)
% hObject    handle to btnInfo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    h = msgbox({'Grupa 242/2:', 'Cozma Alexandru', 'Raulea Mihaela'}');

% --- Executes on button press in btnSinus.
function btnSinus_Callback(hObject, eventdata, handles)
% hObject    handle to btnSinus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    dsp_filtering

%     -------------------------------Semnal2 logic
    
% --- Executes on button press in btnSpectruSemnal2Filtrat.
function btnSpectruSemnal2Filtrat_Callback(hObject, eventdata, handles)
% hObject    handle to btnSpectruSemnal2Filtrat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%TO DO NEXT
global Fs2;
global fwav2;
global wav2;
hh = generateFTS(820,2001,Fs2);
fwav2 = conv(wav2,hh);

fswav2 = fftshift(abs(fft(fwav2)));
ax = linspace(-Fs2/2 , Fs2/2, length(fswav2));

% put on axes
axes(handles.spectru_semnal_audio_2_filtrat_axes);
displayGraph(ax, fswav2, 'Spectru semnal audio 2 filtrat', 0, 0);
zoom xon;

% --- Executes on button press in btnSpectruSemnal2Nefiltrat.
function btnSpectruSemnal2Nefiltrat_Callback(hObject, eventdata, handles)
% hObject    handle to btnSpectruSemnal2Nefiltrat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    global wav2
    global Fs2

    S = fftshift(abs(fft(wav2)));
    axaFFT = linspace(-Fs2/2, Fs2/2, length(wav2));
    
    axes(handles.spectru_semnal_audio_2_nefiltrat_axes);
    displayGraph(axaFFT, S, 'Spectru semnal audio 2 nefiltrat', 0, 0);
    zoom xon;


% --- Executes on button press in btnOpenSemnalAudio2.
function btnOpenSemnalAudio2_Callback(hObject, eventdata, handles)
% hObject    handle to btnOpenSemnalAudio2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    global semnal2;
    global wav2;
    global Fs2;
        
    [wav2, Fs2] = wavread(semnal2);
    axes(handles.semnal_audio_2_axes);
    plot(wav2);
    zoom xon;

% --- Executes on button press in btnRedareSemnal2Original.
function btnRedareSemnal2Original_Callback(hObject, eventdata, handles)
% hObject    handle to btnRedareSemnal2Original (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    global wav2;
    global Fs2;
    
    sound(wav2, Fs2);

% --- Executes on button press in btnRedareSemnal2Filtrat.
function btnRedareSemnal2Filtrat_Callback(hObject, eventdata, handles)
% hObject    handle to btnRedareSemnal2Filtrat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%TO DO NEXT
global Fs2;
global fwav2;
sound(fwav2, Fs2);
