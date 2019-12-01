import pydicom
from matplotlib import pyplot as plt
import os

def main():
    source_dir = r'F:\Medicine MRI Dataset SR\ADNI\Head_MP\dcm'
    save_dir = source_dir + '_png'

    if not os.path.exists(save_dir):
        os.makedirs(save_dir)

    file_path = os.listdir(source_dir)
    for file in file_path:
        print('processing the {}.'.format(file))

        save_file = save_dir + '/' + file[:-4] + '.png'
        file = source_dir + '/' + file


        img = pydicom.read_file(file)
        img = img.pixel_array

        plt.imsave(save_file, img, cmap=plt.cm.gray)




if __name__ == '__main__':
    main()