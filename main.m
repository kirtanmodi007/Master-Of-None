% This is a sample script
% It demos the face expression recognition using the Eigenface method

disp('Face Expression Recognition Demo Using the Eigenface Method')
%disp('After your face appeared in the camera window, please left click your mouse to take a picture of youself')
%disp('Please save your cute picture to D:\CS6527-Computer Vision\Final Project\Project Code\TestImage')

%pictureCapture

TrainImagePath = 'C:\Users\Manoj\Desktop\Facial-Expression-Recognition-master\Facial-Expression-Recognition-master\Project Code\TrainingImage';
TestImagePath = 'C:\Users\Manoj\Desktop\Facial-Expression-Recognition-master\Facial-Expression-Recognition-master\Project Code\TestImage';
LabelPath = 'C:\Users\Manoj\Desktop\Facial-Expression-Recognition-master\Facial-Expression-Recognition-master\Project Code\ImageLabel.txt';

[NumTrainImg,TrainImg] = loadImage( TrainImagePath );
[NumTestImg,TestImg] = loadImage( TestImagePath );

[C,minDist,minDistIndex] = eigenFaceRecognition(TrainImg,TestImg,NumTrainImg,NumTestImg );
