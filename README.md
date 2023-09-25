# segmentation-examples
processing grayscale arrays (e.g., phase-contrast or absorption-constrast images) into binary or specific-value arrays (e.g., inside-sample/outside-sample or multiple phases)
Last edit: 25 Sep 2023

1. import an array of interest
   ... continue to step 2 if you have a 3-dimensional array stored as a variable in the matlab workspace (probably double-type, single-type, or even int). Let the array be called:
   ```
   volume
   ```
3. examine the pixel data
   a. plot the histogram of all pixel data (shows range and distribution of values)
   ```
   figure, histogram(reshape(volume,[numel(volume),1]))
   ```
   ![image](https://github.com/marcelchlupsa/segmentation-examples/assets/66844588/419456ad-f5a4-4986-b0cd-3d0617fe2ea6)
   b. check a slice to see

4. perform the segmentation
5. improve the segmentation
6. visualize the segmented volume
