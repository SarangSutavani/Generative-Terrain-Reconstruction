# Pix2pix GAN

Pix2pix is a conditional GAN (cGAN) architecture where the generation target image is conditioned on the input. Hence the synthetic output image can be compared with the source image to calculate the loss and update the weights of the GAN using gradient descent. It is a general-purpose GAN architecture that is designed for image-to-image translation. Pix2pix provides a general solution to various image synthesis tasks such as image inpainting, image colorization, edge to image reconstruction, etc.

The generator in the Pix2pix architecture learns the loss function for the given task. Hence, the same architecture can be used for multiple tasks with fine-tuning. The generator is trained with the adversarial loss function and an additional term, i.e., $L_1$ loss function, which captures the loss between the generated image and the ground truth. 

The discriminator uses the PatchGAN structure, which relates the output size and the input image patches. This allows for processing of the input image at various scales, i.e., from whole image to patches in the image as small as a pixel. The discriminator learns to distinguish between the patches that are part of a real image from those comming from a synthetic image. This approach also helps reduce the number of parameters and can be applied to high-resolution images.

The pix2pix GAN uses pairwise image data (input image and the lable/ground truth image) for training. We use the data obtained from the data generation pipeline to train the GAN architecture. The trained model takes an image that contains partial information of the terrain obtained through the LIDAR scan and provides an estimate on the geometry of the parts of the terrain not observed in the scan.

## Architecture

![Picture5](https://github.com/SarangSutavani/Generative-Terrain-Reconstruction/assets/45416495/fe94586c-c12a-4e81-839e-318f7dd4fbfd)

### Genrator Loss

$\mathcal{L}_{GAN}^{\mathcal{G}} = log(\mathcal{D}(\mathcal{G}(u))) + \lambda\ L_1 loss$.

### Discriminator Loss

$\mathcal{L}_{GAN}^{\mathcal{D}}(x) =\ y\ log(\mathcal{D}(x)) + (1-y)\ log(1 - \mathcal{D}(\mathcal{G}(u)))$.
