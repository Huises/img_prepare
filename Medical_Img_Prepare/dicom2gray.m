function dicom2gray()
% convert dicom to gray image
% writen by LihuiChen

%SET data dir
sourcedir = 'F:\Medicine MRI Dataset SR\ADNI\Head_MP\ADNI\002_S_0413\MP-RAGE_REPEAT\2006-05-02_12_40_13.0\S13894';
savedir = 'F:\Medicine MRI Dataset SR\ADNI\Head_MP\ADNI\002_S_0413\MP-RAGE_REPEAT\2006-05-02_12_40_13.0\S13894/png_dir';
% saveHRpath = fullfile(savedir, '', ['x' num2str(scale)]);



if ~exist(savedir, 'dir')
    mkdir(savedir);
end


filepaths = [dir(fullfile(sourcedir, '*.dcm'));dir(fullfile(sourcedir, '*.bmp'))];

parfor i = 1 : length(filepaths)
    
    filename = filepaths(i).name;
    fprintf('No.%d -- Processing %s\n', i, filename);
    [~, im_name, ~] = fileparts(filepaths(i).name);
    info=dicominfo(fullfile(sourcedir, filename));
    I=dicomread(info);
    I = double(I);
    minI = min(I(:));
    maxI = max(I(:));
    I = uint8(255.0*(I-minI)/(maxI-minI));
    savefile = strcat(im_name, '.png');
    imwrite(I, fullfile(savedir, savefile));
end
end
