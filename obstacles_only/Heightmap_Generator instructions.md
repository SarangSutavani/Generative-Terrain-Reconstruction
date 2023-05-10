
A heightmap has the following two main components that we can alter to generate the suitable heightmaps for a given type of terrain:
- Terrain variation
- Obstacles

### Terrain Variation
The first step in acquiring the data in the required format was to generate the 2.5D heightmap images. To do the same, we utilized the Perlin Noise python library. 
It is a procedural texture primitive, a type of gradient noise used by visual effects artists to increase the appearance of realism in computer graphics. 
We utilized it to generate a realistic heightmap representation of rough terrain. Perlin noise implements multiple functions called 'octaves' to produce natural-looking surfaces.

Every octave function adds a layer of detail to the surface. Each octave can represent a particular terrain characteristic, such as mountains, boulders, rocks, etc. 
Increasing the number of octaves increases the layer of information in the heightmap. This way, we can use the Perlin Noise package to generate a heightmap dataset.

<img src="https://github.com/SarangSutavani/Generative-Terrain-Reconstruction/assets/45416495/65987252-abb1-40d1-b98a-182c4c8f8a25" width=50% height=50%>
<!-- perlin_octave -->
