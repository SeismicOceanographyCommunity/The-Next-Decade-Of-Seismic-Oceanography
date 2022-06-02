## The Next Decade of Seismic Oceanography: Supplementary Material

[![CC BY 4.0][cc-by-shield]][cc-by]

This repository contains supporting information for the [Frontiers in Marine Science](https://www.frontiersin.org/journals/marine-science) article [The Next Decade of Seismic Oceanography: Possibilities, Challenges and Solutions](https://www.doi.org/10.3389/fmars.2022.736693). Specifically, it contains the scripts and data needed to plot Figure 4. For further supplementary information, see the Figshare collection [The Next Decade of Seismic Oceanography: Supplementary Material](https://doi.org/10.6084/m9.figshare.c.5984767).

# Downloading this repository
The data are stored using [Git Large File Storage](https://git-lfs.github.com/) - see [github.com/git-lfs/git-lfs/tree/main/docs?utm_source=gitlfs_site&utm_medium=docs_link&utm_campaign=gitlfs](https://github.com/git-lfs/git-lfs/tree/main/docs?utm_source=gitlfs_site&utm_medium=docs_link&utm_campaign=gitlfs) for details of how to download them.

# Plotting Figure 4
The plotting script uses version 6.2.0 of the [Generic Mapping Tools (GMT)](https://www.generic-mapping-tools.org/).
To plot the figure, download the repository, navigate to the directory `figure4`, and run the command

```
./dickinson_gunn_2022_figure4_plot.gmt
```

# Data sources:
For details of data sources, see the Figshare item 
The original files downloaded from these sources are provided as zip files in this GitHub repository. See:



# Data conversion
Downloaded data were converted from various formats (e.g. `.kml`, `.shp`) into simple text files (with extensions `.dat` and `.csv`) for plotting. See the following script for details:

```
figure4/dickinson_gunn_2022_figure4_extract_kml_coordinates.sh
```





This work is licensed under a
[Creative Commons Attribution 4.0 International License][cc-by].

[![CC BY 4.0][cc-by-image]][cc-by]

[cc-by]: http://creativecommons.org/licenses/by/4.0/
[cc-by-image]: https://i.creativecommons.org/l/by/4.0/88x31.png
[cc-by-shield]: https://img.shields.io/badge/License-CC%20BY%204.0-lightgrey.svg
