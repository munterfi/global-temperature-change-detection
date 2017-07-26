# Change detection in global temperature

Global warming is considered as a major issue for the further development of the conditions for living organisms on the Earth. In the northern Hemisphere, the warmest 30-year period of the last 1400 years was registered. Globally, the last three decades have been successively warmer than any preceding decade since 1850 (IPCC 2013). In this context, we argue that it is crucial to develop a better understanding of global warming. Since more insights open possibilities to react and adapt to global warming and its implications. By considering the earth system's dynamical complexity, it is unsurprising that global warming is not a spatially even distributed phenomenon, which results in spatial regions that are more affected than others.

Therefore, global surface temperature layers are interpolated for two time intervals (1950-1970 & 1990-2010) based on a point measurement data set of the worldwide surface temperature that has been recorded since 1950. For the spatial interpolation, an universal Kriging approach is applied with additional layers for the continentality, the atmospheric distance, the North-South topographic gradient and the sun inclination angle of every pixel. Finally two (summer & winter) difference images are created from the interpolated temperature layers to represent the change in temperature.

|![Screen01](results/diff_summer.tif) | ![Screen02](results/diff_winter.tif)|
|---|---|

## Installation

1. Install R & RStudio
2. Get the needed libraries: `install.packages('library-name')`
3. Clone the repository, by creating a new git project in RStudio

## Data

* Global digital elevation model - [swisstopo](https://www.swisstopo.admin.ch/en/home.html)
* Global temperature measurements

## Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :D

## Authors

* **Merlin Unterfinger** - *Development and implementation* - [munterfinger](https://github.com/munterfinger)
* **Olivier Niklaus** - *Development and implementation*

## Built With

* [R](https://www.r-project.org) -  The R Project for Statistical Computing
* [RStudio](https://www.rstudio.com) - Open source and enterprise-ready professional software for R

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details

## References
Hansen, J., Ruedy, R., Sato, M., & Lo, K., 2010. Global surface temperature change. Review of Geophysics, 48, pp.1–29.

Haylock, M. R., Hofstra, N., Klein Tank, A. M. G., Klok, E. J., Jones, P. D., & New, M. (2008). A European daily high-resolution gridded data set of surface temperature and precipitation for 1950–2006. Journal of Geophysical Research, pp.1–12.

IPCC, 2013. Summary fo Policymakers. Climate Change 2013: The Physical Science Basis.Contribution of Working Group I to the Fifth Assessment Report of the Intergovernmental Panel on Climate Change, pp.1–28.

Pebesma, E. J. (2004). Multivariable geostatistics in S: The gstat package. Computers and Geosciences, 30(7), pp.683–691.
