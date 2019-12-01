import numpy as np
import matplotlib.pyplot as plt
import matplotlib
import os
import glob


def main():
    source_dir = r'C:\Users\606clh\Downloads\Compressed\MRNet-v1.0\MRNet-v1.0\train\axial'
    save_dir = r'C:\Users\606clh\Downloads\Compressed\MRNet-v1.0\MRNet-v1.0\train\axial_png'
    if not os.path.exists(save_dir):
        os.makedirs(save_dir)

    file_path = os.listdir(source_dir)
    for file in file_path:
        print('Processing the {}'.format(file))
        if file.endswith('.DS_Store'):
            continue
        file = source_dir + '\\' + file
        img = np.load(file)
        for i in range(img.shape[0]):
            save_path = save_dir + '\\' + file[-8:-4] + str(i) + '.png'
            matplotlib.image.imsave(save_path, np.uint8(img[i,:,:]), cmap = plt.cm.gray)


if __name__ == "__main__":
    main()