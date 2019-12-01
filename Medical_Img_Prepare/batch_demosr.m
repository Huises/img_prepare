
sourcedir = '/home/server-248/下载/siim-medical-images/dicom_dir';
savedir = '/home/server-248/下载/siim-medical-images/png_dir';
% saveHRpath = fullfile(savedir, '', ['x' num2str(scale)]);



if ~exist(savedir, 'dir')
    mkdir(savedir);
end

filepaths = [dir(fullfile(sourcedir, '*.dcm'));dir(fullfile(sourcedir, '*.bmp'))];

for i = 1 : length(filepaths)
    
    filename = filepaths(i).name;
    fprintf('No.%d -- Processing %s\n', i, filename);
    [~, im_name, ~] = fileparts(filepaths(i).name);
    
    demo_SR(fullfile(sourcedir, filename),scale, savedir);
    
end