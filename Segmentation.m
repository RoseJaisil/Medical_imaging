clc;
clear all;
close all;
info = dicominfo('C:\Users\Admin\Downloads\example.dcm');%reading the dicom file
Y = dicomread(info);%reading the image
figure
imagesc(Y);% display image with scale colors
title('Input image');
Z=mat2gray(Y);%converting the scaled image into gray image
figure
imshow(Z);% displaying gray image
title('Grey image');
 
a=imbinarize(Z,0.3);% segmenting objetcs in binary image form based on threshold
figure;
imshow(a);
title('segmented lung lobes image');
a=~a;
figure;
imshow(a);
title('negative of segmented lung lobes image');
b=imbinarize(Z,0.5);% segmenting objetcs in binary image form based on threshold 
b=bwareafilt(b,2);%finding the largest two objects inside the image
% based on the area of the connected components 
figure;
imshow(b);
title('Segmented spinal cord image');
c=a+b;% combine the two segmented image to get the complete segmented image
figure;
imshow(c);% combined segmented image
title('combined segmented image');
 
[p,n]=bwlabel(c);% labeling each objects
R=label2rgb(p);% coloring each objects based on the label.
figure;
imshow(R);
title('colored segmented image');
cc = bwconncomp(c);% details of all the objects inside the object
disp(cc);
