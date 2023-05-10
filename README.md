# Generative-Terrain-Reconstruction
## Motivation behind the project:
-	Terrain heightmap plays a key role in the off-road path planning. The question we want to explore here is, can we estimate the local heightmap based on local sensory information only? And can we do it in a way that enables real time navigation?

This research is targeted at scenarios where the vehicle is operating in an unknown environment and the terrain heightmap is not known / cannot be known a-priory.
LIDAR is a very useful tool at our disposal for this task because of its ability to directly measure the relative position of a point in the 3D space. But using LIDAR for heightmap estimation has its own set of challenges including,
-	unstructured nature of the measured data,
-	uncertainties, occlusions and sparsity in the data,
-	high computational burden associated with the processing of raw LIDAR point-cloud data.
	
![Picture1](https://github.com/SarangSutavani/Generative-Terrain-Reconstruction/assets/45416495/dd57afe5-0a0c-45bf-ae90-744117bf793e)


## Proposed Approach:
We propose an image processing based approach that utilizes the well-known representation learning capabilities of the generative adversarial networks (GAN) for processing the LIDAR data.
In this approach we first project the sparce LIDAR scan on the ground plane and down sample it to represent the available information as a 2.5D heightmap image with many blank spaces.
Our goal is to then estimate the missing parts of the image in a manner consistent with the available/measured information.

We used the conditional GAN (cGAN) architecture for the estimation of the missing parts, where the cGAN heightmap estimation is conditioned on the ground projection of the space LIDAR scan.
We setup a pipeline to generate the data in the form of input image and corresponding label image, as required for the cGAN training.
We tested this methodology on several training sets differing in terrain variation, obstacle sets and the density of LIDAR scans.


## Two main components:
There are two main components of this project:
1.	Data generation and preprocessing 
2.	cGAN training 


### Data generation and preprocessing
We synthesized the required data from a simulation environment using the following process: i) generate a realistic heightmap with desired characteristics, ii) create a terrain in the simulation environment using the heightmap, generate the LIDAR scan in the simulation environment, process the scan into a ground projected image.

1. Heightmap generation:
The first step in acquiring the data in the required format was to generate the 2.5D heightmap images. 
To do the same, we utilized the Perlin Noise python library. 
Perlin noise is a type of gradient noise developed by Ken Perlin. 
It is a procedural texture primitive, a type of gradient noise used by visual effects artists to increase the appearance of realism in computer graphics. 
We utilized it to generate a realistic heightmap representation of rough terrain. 
Perlin noise implements multiple functions called 'octaves' to produce natural-looking surfaces.

2. LIDAR data generation:
We used CoppeliaSim software for generating 3D LIDAR point cloud data. CoppeliaSim, previously known as V-REP, is a robot simulator used in industry, education, and research. We import the heightmap generated in the previous step to the simulation environment of CoppeliaSim to construct a 3D representation of the terrain. Then using a LIDAR block available in the CoppeliaSim, we generate the required LIDAR point cloud in the simulation. This point cloud data is used to generate the LIDAR images.

![Picture2](https://github.com/SarangSutavani/Generative-Terrain-Reconstruction/assets/45416495/d3ddd031-8ba4-47ff-ad9e-936952ae8585)


### cGAN training
We used the ground projected image as the input and the original heightmap as the output for training the artificial neural network.
There are some key advantages of the proposed ANN based image processing method for terrain reconstruction. 
The LIDAR data processing pipeline (for individual scans) can be compressed to a single forward pass of the ANN. Therefore, it is possible to run the terrain reconstruction in the real time.
Additionally, by adjusting the complexity of the neural network it can implemented on devices with low memory and low compute power to run with low latency.
The output of this procedure can be used as a starting point other (computationally expensive) techniques to speed up the terrain reconstruction process. Or, it can also be used as a backup that requires only limited resources. 
Since, the LIDAR scan is represented in the form of an image, therefore well established methods from image processing can be used to improve the performance.

![Picture3](https://github.com/SarangSutavani/Generative-Terrain-Reconstruction/assets/45416495/3906e3e8-23b0-4cdd-9211-5058bb67968e)

