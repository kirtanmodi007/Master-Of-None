disp('Face Expression Recognition Demo Using the Eigenface Method')

TrainImagePath = 'E:\hackathon\newemoji\Facial-Expression-Recognition-master\Project Code\TrainingImage';
TestImagePath = 'E:\hackathon\newemoji\Facial-Expression-Recognition-master\Project Code\TestImage';
LabelPath = 'E:\hackathon\newemoji\Facial-Expression-Recognition-master\Project Code\ImageLabel.txt';

[NumTrainImg,TrainImg] = loadImage( TrainImagePath );
[NumTestImg,TestImg] = loadImage( TestImagePath );

[C,minDist,minDistIndex] = eigenFaceRecognition(TrainImg,TestImg,NumTrainImg,NumTestImg );

% Display the result
RecognizedExpression = strcat(int2str(minDistIndex),'.jpg');
    % read in the image label
    fid=fopen(LabelPath);
    imageLabel=textscan(fid,'%s %s','whitespace',',');
    fclose(fid);
    Best_Match = cell2mat(imageLabel{1,1}(minDistIndex));

for i=1:length(minDistIndex)
    %str1 = strcat('Your face expression is like this one:  ',RecognizedExpression(i));
    ExprLabel = cell2mat(imageLabel{1,2}(minDistIndex(i)));

    str2 = strcat('It tells me that you are:  ',ExprLabel);
    %disp(str1)
    disp(str2)
end
songs(ExprLabel)
