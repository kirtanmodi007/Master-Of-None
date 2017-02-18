function [numImage,img] = loadImage( strImagePath )

structImages = dir(strImagePath);
lenImages = length(structImages);
Images='';

if (lenImages==0)
    disp('Error: No image was detected in the Image Folder');
    return;
end

i=0;
for j = 3:lenImages
     if ((~structImages(j).isdir))
         if  (structImages(j).name(end-3:end)=='.jpg')
             i=i+1;
             Images{i,1} = [strImagePath,'\',structImages(j).name];
         end
     end
end
 if i==2
     imshow(Images{1,1})
     figure
    imshow(Images{2,1})

end    
numImage = i; % this is the number of loaded Images

% All Images are resized into a common size
imageSize = [600,800]; 


% Loading images
img = zeros(imageSize(1)*imageSize(2),numImage);
for i = 1:numImage
    aa = imresize(faceDetection(imresize(imread(Images{i,1}),[600,800])),imageSize);
   % aa = faceDetection(imresize(imread(Images{i,1}),[375,300]));
    imwrite(aa,Images{i,1})
    img(:,i) = aa(:);
    
    % disp(sprintf('Loading Image # %d',i));
end
% Generating the mean image
meanImage = mean(img,2);        

% Substracting the mean image from loaded image
img = (img - meanImage*ones(1,numImage))';     
end

