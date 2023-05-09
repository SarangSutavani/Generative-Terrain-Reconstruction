# Generative-Terrain-Reconstruction
## Motivation behind the project:
-	Terrain heightmap plays a key role in the off-road path planning. The question we want to explore here is, can we estimate the local heightmap based on local sensory information only? And can we do it in a way that enables real time navigation?

This research is targeted at scenarios where the vehicle is operating in an unknown environment and the terrain heightmap is not known / cannot be known a-priory.
LIDAR is a very useful tool at our disposal for this task because of its ability to directly measure the relative position of a point in the 3D space. But using LIDAR for heightmap estimation has its own set of challenges including,
-	unstructured nature of the measured data,
-	uncertainties, occlusions and sparsity in the data,
-	high computational burden associated with the processing of raw LIDAR point-cloud data.

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
We synthesized the required data from a simulation environment using the following process: i) generate a realistic heightmap with desired characteristics, ii) create a terrain in the simulation environment using the heightmap, generate the LIDAR scan in the simulation environment, process the scan into a ground projected image, iii) use the ground projected image as the input and the original heightmap as the output for training the artificial neural network.
