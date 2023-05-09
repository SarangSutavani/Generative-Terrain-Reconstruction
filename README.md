# Generative-Terrain-Reconstruction
Motivation behind the project:
-	Terrain heightmap plays a key role in the off-road path planning. The question we want to explore here is, can we estimate the local heightmap based on local sensory information only? And can we do it in a way that enables real time navigation?

This research is targeted at scenarios where the vehicle is operating in an unknown environment and the terrain heightmap is not known / cannot be known a-priory.
LIDAR is a very useful tool at our disposal for this task because of its ability to directly measure the relative position of a point in the 3D space. But using LIDAR for heightmap estimation has its own set of challenges including,
•	unstructured nature of the measured data,
•	uncertainties, occlusions and sparsity in the data,
•	high computational burden associated with the processing of raw LIDAR point-cloud data.
Therefore, we propose an image processing based approach that utilizes the well-known representation learning capabilities of the generative adversarial networks (GAN) for processing the LIDAR data.
In this approach we first project the sparce LIDAR scan on the ground plane and down sample it to represent the available information as a 2.5D heightmap image with many blank spaces.
Our goal is to then estimate the missing parts of the image in a manner consistent with the available/measured information.
We used the conditional GAN (cGAN) approach for the estimation of the missing parts, where the cGAN heightmap estimation is conditioned on the ground projection of the space LIDAR scan.
We setup a pipeline to generate the data in the form of input image and corresponding label image, as required for the cGAN training.
We tested this methodology on several training sets differing in terrain variation, obstacle sets and the density of LIDAR scans.



# Running LiDAR Simulations

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

4. Orient windows according to screenshot located in Generative-Terrain-Reconstruction folder![Screenshot from 2022-10-10 11-27-24](https://github.com/SarangSutavani/Generative-Terrain-Reconstruction/assets/45416495/a8ca9fef-4d1f-4b16-a6eb-d0ad16b594d1)

5. Close unecessary windows
6. Change parameters in LIDAR_Data_Generator ipynb to correct environment etc.
7. Change parameters in lidar_datagen.m file
8. Run LIDAR_Data_Generator ipynb file

