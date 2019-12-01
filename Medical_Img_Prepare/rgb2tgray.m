function rgb2tgray()
% convert rgb image to 3 channel gray image.
% Written by LihuiChen
clear, clc

% SET data dir
sourcedir = 'F:\Medicine MRI Dataset SR\MedicalSR_Test';
savedir = 'F:\Medicine MRI Dataset SR\AIM_Dataset\Deeplesson';
% saveHRpath = fullfile(savedir, '', ['x' num2str(scale)]);

if ~exist(savedir, 'dir')
    mkdir(savedir);
end

filepaths = [dir(fullfile(sourcedir, '*.bmp'));dir(fullfile(sourcedir, '*.tif'));dir(fullfile(sourcedir, '*.png'))];

for i = 1 : length(filepaths)
    
    filename = filepaths(i).name;
    fprintf('No.%d -- Processing %s\n', i, filename);
    [~, im_name, ~] = fileparts(filepaths(i).name);    
    % info=dicominfo(fullfile(sourcedir, filename));
    % I=dicomread(info);
    I = imread(fullfile(sourcedir, filename));
    img = zeros(size(I, 1), size(I,2), 3);
    I = rgb2gray(I);
    I = im2double(I);
    minI = min(I(:));
    maxI = max(I(:));
    I = uint8(255.0*(I-minI)/(maxI-minI));
    %imshow(I)
    img(:,:,1) = I;
    img(:,:,2) = I;
    img(:,:,3) = I;
    img = uint8(img);
    imshow(uint8(img));
    savefile = strcat(im_name, '.png');
    imwrite(I, fullfile(savedir, savefile));
end
