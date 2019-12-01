function mat2img()
% mat to img
% writen by LihuiChen

% SET data dir
sourcedir = 'F:\Medicine MRI Dataset SR\mrimages';
savedir = 'F:\Medicine MRI Dataset SR\AIM_Dataset\Data';
% saveHRpath = fullfile(savedir, '', ['x' num2str(scale)]);



if ~exist(savedir, 'dir')
    mkdir(savedir);
end


filepaths = [dir(fullfile(sourcedir, '*.dcm'));dir(fullfile(sourcedir, '*.mat'))];

for i = 1 : length(filepaths)
    
    filename = filepaths(i).name;
    fprintf('No.%d -- Processing %s\n', i, filename);
    [~, im_name, ~] = fileparts(filepaths(i).name);    
    load(fullfile(sourcedir, filename));
    [~,~, c,h]=size(sol_yxzt);
    
    for t=1:c
        for j=1:h
            %imshow(sol_yxzt(:,:,i,j),[]);
            I = double(sol_yxzt(:,:,t,j));
            minI = min(I(:));
            maxI = max(I(:));
            I = uint8(255.0*(I-minI)/(maxI-minI));
            savefile =char(im_name + "_t" + sprintf('%03d', t) + "_z" + sprintf('%03d', j) + ".png");
            imwrite(I, fullfile(savedir, savefile));
        end
    end
end