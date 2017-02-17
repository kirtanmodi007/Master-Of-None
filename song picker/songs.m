prompt = 'Enter your emotion? ';
x = input(prompt,'s')
s1 = 'happy';
s2 = 'sad';

if  strcmp(x,s2)
    song1 = randi(10,1);
    file_name=dir('E:\hackathon\Speech Recognition in MATLAB using correlation\Speech Recognition in MATLAB using correlation\sad\sad*.mp3');
    x=randi(5,1) %suppose there are 7 image
    disp(x);
    im=strcat('E:\hackathon\Speech Recognition in MATLAB using correlation\Speech Recognition in MATLAB using correlation\sad\',file_name(x).name);
    [a,Fs] = audioread(im);  
    sound(a,Fs);
elseif strcmp(x,s1)
    [b,Fs] = audioread('happy.mp3');
    sound(b,Fs);
end