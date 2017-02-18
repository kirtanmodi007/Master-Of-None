%prompt = 'Enter your emotion? ';
%x = input(prompt,'s')
function songs(filename)
x = filename;
s1 = 'happy';
s2 = 'sad';
s3 = 'natural';

if strcmp(x,s1)
    
    file_name=dir('E:\hackathon\Speech Recognition in MATLAB using correlation\Speech Recognition in MATLAB using correlation\happy\happy*.mp3');
    y=randi(2,1);
    %disp(x);
    im=strcat('E:\hackathon\Speech Recognition in MATLAB using correlation\Speech Recognition in MATLAB using correlation\happy\',file_name(y).name);
    [a,Fs] = audioread(im);  
    sound(a,Fs);
  
elseif  strcmp(x,s2)
  
    file_name=dir('E:\hackathon\Speech Recognition in MATLAB using correlation\Speech Recognition in MATLAB using correlation\sad\sad*.mp3');
    y=randi(5,1); %suppose there are 7 image
    %disp(x);
    im=strcat('E:\hackathon\Speech Recognition in MATLAB using correlation\Speech Recognition in MATLAB using correlation\sad\',file_name(y).name);
    [b,Fs] = audioread(im);  
    sound(b,Fs); 
    
elseif  strcmp(x,s3)
  
    file_name=dir('E:\hackathon\Speech Recognition in MATLAB using correlation\Speech Recognition in MATLAB using correlation\natural\natural*.mp3');
    y=randi(2,1); %suppose there are 7 image
    %disp(x);
    im=strcat('E:\hackathon\Speech Recognition in MATLAB using correlation\Speech Recognition in MATLAB using correlation\natural\',file_name(y).name);
    [c,Fs] = audioread(im);  
    sound(c,Fs); 
    
end
