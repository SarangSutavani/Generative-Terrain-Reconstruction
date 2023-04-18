# Generative-Terrain-Reconstruction
Using GAN to generate Terrain from LiDAR data


# Running LiDAR Simulations

1. Open matlab sae_wcx.m file
	- Run matlab to ensure folder is in the current .m file path
2. Open LIDAR_Data_Generator ipynb file
	- Click on explorer (open using jupyter or vscode)
	- If workspace is not open to the folder where the file LIDAR_Data_Generator is located, open workspace to that folder 
3. Open terminal
	- Run:
	```
		~/CoppeliaSim_Edu_V4_3_0_rev10_Ubuntu18_04/coppeliaSim.sh ~/Downloads/Sarang/sae_wcx_conference/Coppeliasim_Matlab_Communication/sae_wcx.ttt
	```

4. Orient windows according to screenshot located in Generative-Terrain-Reconstruction folder
5. Close unecessary windows
6. Change parameters in LIDAR_Data_Generator ipynb to correct environment etc.
7. Change parameters in sae_wcx.m file
8. Run LIDAR_Data_Generator ipynb file
