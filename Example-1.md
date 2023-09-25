# Segmenting a multi-modal scalar distribution (EASIEST)

1. Import an image array of interest
   
  ... continue to step 2 if you have a 3-dimensional array stored as a variable in the MATLAB workspace (probably double-type or single-type). Let the array be called:
  
  ```Matlab
  ImageVolume
  ```

2. Examine the image

  Check a close-to-the-middle z-slice of the image (tomography reconstructions are typically poorer quality nearer to the first and last slices )
  
  ```Matlab
  slice_idx = ceil(size(ImageVolume,3)/2);
  figure, imshow(squeeze(ImageVolume(:,:,slice_idx)))
  ```
  
  ![image](https://github.com/marcelchlupsa/segmentation-examples/assets/66844588/a5144715-c1d9-424b-bde5-b283d1f4d5a3)

3. Examine the pixel data

  Plot the histogram of all voxel data (shows range and distribution of values)
  ```Matlab
  figure, histogram(reshape(ImageVolume,[numel(ImageVolume),1]))
  xlabel('Values'), ylabel('Number of voxels')
  ```
  
  ![image](https://github.com/marcelchlupsa/segmentation-examples/assets/66844588/419456ad-f5a4-4986-b0cd-3d0617fe2ea6)
  
  This provided example of voxel data is both normalized and trimodal, having a sharp peak at 0, a second peak around 0.35, and a third peak around 0.8.

4. Perform the segmentation

  From the voxel data, we know that the lower tail of the highest mode (the mode representing the sample) ends around 0.7. The following logical operation will yield a binary array in which the sample voxels are '1' and all other voxels are '0'.
  ```Matlab
  ImageVolume_segment = ImageVolume > 0.7;
  ```

5. Improve the segmentation

  You may choose to improve the segmentation by tuning the threshold value (0.7 in step 4). Consider the smoothness of the boundary, existence of voids, etc. In this case, there is no overlap between the peak at 0.35 and the peak at 0.8. The segmentation should be close to optimal.

6. Visualize the segmented volume

  Use isosurface() and patch() to visualize the surface of the segmented volume.

  ```Matlab
  ImageVolume_segment_mesh = isosurface(ImageVolume_segment);
  figure, patch(ImageVolume_segment_mesh,'edgecolor','none','facecolor','green','facealpha',0.3)
  ```

  If 1's in the binary image are intersecting the surfaces of the array, then patch() will not mesh that surface. You may choose to use built-in padarray() or 'padfaces.m' to add 0's to the surfaces of the binary volume. 

  ```Matlab
  ImageVolume_segment_mesh = padfaces(ImageVolume_segment_mesh,'zeros');
  figure, patch(ImageVolume_segment_mesh,'edgecolor','none','facecolor','green','facealpha',0.3)
  ```
