## Steps:

1. Generate terrain heightmaps (keep the folder containing heightmaps into the directory where the file LIDAR_Data_Generator.ipynb is placed).
2. Adjust the path parameters in LIDAR_Data_Generator.ipynb and run the code to generate ground projected LIDAR images. These images shold be stored in the same directory as the original heightmaps.
3. Run the pix2pix code located in the same directory as the heightmaps and LIDAR images to train the cGAN network.
