# Data Generation

The proposed approach uses heightmap images of unstructured terrain as the ground truth data. These heightmaps are used to train the neural network to approximate a function that produce accurate terrain heightmaps when fed with sparse LIDAR data images. 

To generate the data set required for the training of the cGAN, we used Perlin Noise python library, CoppeliaSim simulator, and Matlab software. 
A step-by-step layout of the data generation process is provided next.

## Running LiDAR Simulations

<img src="https://github.com/SarangSutavani/Generative-Terrain-Reconstruction/assets/45416495/4cd9480a-b2e2-4b06-8349-93c20c70908c" width=50% height=50%>

<!-- Picture4 -->

1. Open matlab lidar_datagen.m file
	- Run matlab to ensure folder is in the current .m file path
2. Open LIDAR_Data_Generator ipynb file
	- Click on explorer (open using jupyter or vscode)
	- If workspace is not open to the folder where the file LIDAR_Data_Generator is located, open workspace to that folder 
3. Open terminal
	- Run:
	```
		~/CoppeliaSim_Edu_V4_3_0_rev10_Ubuntu18_04/coppeliaSim.sh ~/Downloads/Sarang/sae_wcx_conference/Coppeliasim_Matlab_Communication/sae_wcx.ttt
	```

4. Orient windows according to screenshot located in Generative-Terrain-Reconstruction folder!

<img src="https://github.com/SarangSutavani/Generative-Terrain-Reconstruction/assets/45416495/a8ca9fef-4d1f-4b16-a6eb-d0ad16b594d1" width=100% height=100%>
<!-- Screenshot from 2022-10-10 11-27-24 -->

5. Close unecessary windows
6. Change parameters in LIDAR_Data_Generator ipynb to correct environment etc.
7. Change parameters in lidar_datagen.m file
8. Run LIDAR_Data_Generator ipynb file

https://github.com/SarangSutavani/Generative-Terrain-Reconstruction/assets/45416495/71d110c1-f46e-455a-9873-965aa050f486

### Some Resulting LIDAR Images
<img src="https://github.com/SarangSutavani/Generative-Terrain-Reconstruction/assets/45416495/cd30a2cc-265e-42c8-bbc5-2dc438979eb9" width=50% height=50%>
<!-- LIDAR_images_2 -->
