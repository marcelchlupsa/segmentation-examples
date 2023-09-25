# segmentation-examples
processing grayscale arrays (e.g., phase-contrast or absorption-constrast images) into binary or specific-value arrays (e.g., inside-sample/outside-sample or multiple phases)
Last edit: 25 Sep 2023

1. Import an image array of interest
   ... continue to step 2 if you have a 3-dimensional array stored as a variable in the matlab workspace (probably double-type, single-type, or even int). Let the array be called:
   ```
   Vol
   ```
2. Examine the image
   Check the 100th z-slice of the image (tomography reconstructions near the first and last slices are typically poorer quality)
   ```
   figure, imshow(squeeze(Vol(:,:,100)))
   ```
   ![image](https://github.com/marcelchlupsa/segmentation-examples/assets/66844588/30721f5a-14e0-4497-8866-50a2cbb01aa7)

4. Examine the pixel data
   a. Plot the histogram of all pixel data (shows range and distribution of values)
   ```
   figure, histogram(reshape(Vol,[numel(Vol),1]))
   ```
   ![image](https://github.com/marcelchlupsa/segmentation-examples/assets/66844588/419456ad-f5a4-4986-b0cd-3d0617fe2ea6)

   This provided example of pixel data is both normalized and trimodal, having a sharp peak at 0, a second peak around 0.35, and a third peak around 0.8.
   b. check a slice to see

5. Perform the segmentation
6. Improve the segmentation
7. Visualize the segmented volume
