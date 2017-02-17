x='C:\Users\Manoj\Desktop\Facial-Expression-Recognition-master\Facial-Expression-Recognition-master\Project Code\TestImage';
structImages = dir(x);
lenImages = length(structImages);

Images='';

i=0;
for j = 1:lenImages
     if ((~structImages(j).isdir))
         if  (structImages(j).name(end-3:end)=='.jpg')
             i=i+1;
             Images{i,1} = [structImages(j).name];
             disp(Images);
         end
     end
end     

numImage = i; % this is the number of loaded Images

% All Images are resized into a common size
imageSize = [280,180]; 

y='';
% Loading images
img = zeros(imageSize(1)*imageSize(2),numImage);
for i = 1:numImage
    y=imread(Images{i,1});
    aa = imresize(y,imageSize);
    img(:,i) = aa(:);
    % disp(sprintf('Loading Image # %d',i));
end
% Generating the mean image
meanImage = mean(img,2);        

% Substracting the mean image from loaded image
img = (img - meanImage*ones(1,numImage))'; 


