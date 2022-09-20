# CSU Indoor Localization and Navigation Dataset with CSI and RSSI 

This repository contains channel state information (CSI) and received signal strength indicator (RSSI) data collected in 2021-2022 across buildings in the Colorado State University campus. If you use this dataset, please cite the following paper:

L. Wang, S. Pasricha, “A Framework for CSI-Based Indoor Localization with 1D Convolutional Neural Networks”, IEEE Conference on Indoor Positioning and Indoor Navigation (IPIN), 2022

## Overview

1. The complete dataset is in the “data” directory with “ref” and “test” meaning reference point data file and test point data file, respectively. Data was captured using the Nexmon tookit.
2. CSI data extraction scripts are stored in the “extraction” folder and require MATLAB
3. All location (label) information including name, mac address, protocol, channels, and coordinates are in the “locations” directory.
4. The naming convention of the labels and data files is as follows. Each room has at least two reference points with the “room number” + ”_” +  “space ID”. For example, “204” + “_”  + “1” (204_1) refers to the first reference point of room 204. The space IDs are simply the number of different reference points in front of the corresponding rooms. As plotted in our paper from IEEE IPIN 2022 (see citation above), the space ID naming follows an ascending order (1, 2, …) along the direction of X axis and Y axis, respectively.
5. Questions can be directed to Liping Wang, who collected and organized all of the data.
