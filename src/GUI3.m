function varargout = GUI3(varargin)
% GUI3 MATLAB code for GUI3.fig
%      GUI3, by itself, creates a new GUI3 or raises the existing
%      singleton*.
%
%      H = GUI3 returns the handle to a new GUI3 or the handle to
%      the existing singleton*.
%
%      GUI3('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI3.M with the given input arguments.
%
%      GUI3('Property','Value',...) creates a new GUI3 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI3_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI3_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI3

% Last Modified by GUIDE v2.5 30-Mar-2022 22:19:53

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI3_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI3_OutputFcn, ...
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


% --- Executes just before GUI3 is made visible.
function GUI3_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI3 (see VARARGIN)

% Choose default command line output for GUI3
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI3 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI3_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
startingFolder = 'F:/';
if ~exist(startingFolder, 'dir')
  % If that folder doesn't exist, just start in the current folder.
  startingFolder = pwd;
end
% Get the name of the file that the user wants to use.
defaultFileName = fullfile(startingFolder, '*.*');
[baseFileName, folder] = uigetfile(defaultFileName, 'Select a file');
if baseFileName == 0
  % User clicked the Cancel button.
  return;
end
fullFileName = fullfile(folder, baseFileName);
a = imread(fullFileName);
axes(handles.axes1);
imshow(a);
setappdata(0, 'image1', a);

% --- Executes on button press in laplace8.
function laplace8_Callback(hObject, eventdata, handles)
% hObject    handle to laplace8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
image = getappdata(0, 'image1');
axes(handles.axes2);
gray = rgb2gray(image);
edge = laplacian8(gray);
imshow(edge);
axes(handles.axes3);
segment = segmentation(edge, "laplacian");
imshow(segment);
axes(handles.axes4);
bg_remove = remove_bg(segment, image);
imshow(bg_remove);

% --- Executes on button press in log.
function log_Callback(hObject, eventdata, handles)
% hObject    handle to log (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
image = getappdata(0, 'image1');
axes(handles.axes2);
gray = rgb2gray(image);
edge = LoG_edge_detect(gray);
imshow(edge);
axes(handles.axes3);
[segment, bg_remove] = clogp_bg_remove(image, "LoG");
imshow(segment);
axes(handles.axes4);
imshow(bg_remove);

% --- Executes on button press in laplace4.
function laplace4_Callback(hObject, eventdata, handles)
% hObject    handle to laplace4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
image = getappdata(0, 'image1');
axes(handles.axes2);
gray = rgb2gray(image);
edge = laplacian4(gray);
imshow(edge);
axes(handles.axes3);
segment = segmentation(edge, "laplacian");
imshow(segment);
axes(handles.axes4);
bg_remove = remove_bg(segment, image);
imshow(bg_remove);

% --- Executes on button press in sobel.
function sobel_Callback(hObject, eventdata, handles)
% hObject    handle to sobel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
image = getappdata(0, 'image1');
axes(handles.axes2);
gray = rgb2gray(image);
edge = sobel(gray);
imshow(edge);
axes(handles.axes3);
segment = segmentation(edge, "sobel");
imshow(segment);
axes(handles.axes4);
bg_remove = remove_bg(segment, image);
imshow(bg_remove);

% --- Executes on button press in prewitt.
function prewitt_Callback(hObject, eventdata, handles)
% hObject    handle to prewitt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
image = getappdata(0, 'image1');
axes(handles.axes2);
gray = rgb2gray(image);
edge = Prewitt_edge_detect(gray);
imshow(edge);
axes(handles.axes3);
[segment, bg_remove] = clogp_bg_remove(image, "Prewitt");
imshow(segment);
axes(handles.axes4);
imshow(bg_remove);

% --- Executes on button press in roberts.
function roberts_Callback(hObject, eventdata, handles)
% hObject    handle to roberts (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
image = getappdata(0, 'image1');
axes(handles.axes2);
gray = rgb2gray(image);
edge = roberts(gray);
imshow(edge);
axes(handles.axes3);
segment = segmentation(edge, "roberts");
imshow(segment);
axes(handles.axes4);
bg_remove = remove_bg(segment, image);
imshow(bg_remove);

% --- Executes on button press in canny.
function canny_Callback(hObject, eventdata, handles)
% hObject    handle to canny (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
image = getappdata(0, 'image1');
axes(handles.axes2);
gray = rgb2gray(image);
edge = Canny_edge_detect(gray);
imshow(edge);
axes(handles.axes3);
[segment, bg_remove] = clogp_bg_remove(image, "Canny");
imshow(segment);
axes(handles.axes4);
imshow(bg_remove);