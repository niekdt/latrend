# 2025-07-04 latrend [v1.6.2](https://github.com/niekdt/latrend/milestone/12)

- Migrated the git repository, changed all URLs to the new location.
- Fixed querying of model variables (#162)
- Reduced dtwclust example runtime

# 2024-05-14 latrend [v1.6.1](https://github.com/niekdt/latrend/milestone/11)

- Fixed CRAN note on HTML validation (#154)
- trajectories(lcModel) outputs cluster membership (#153)
- Improved visuals of trajectory plots (#152)
- Fixed dynamic variable handling (#151)

# 2024-04-03 latrend [v1.6.0](https://github.com/niekdt/latrend/milestone/10)

-   Resolved CRAN problems (#147)
-   Re-added clusterCrit as dependency (#145)
-   Ordering and labeling of cluster trajectories in plot (#144, #142)

# 2023-03-16 latrend [v1.5.2](https://github.com/niekdt/latrend/milestone/9)

- Fixed pre-set seed issue in `latrendBatch()` (#134)
- Generic `nClusters()` method (#133)

# 2023-03-16 latrend v1.5.1

-   Resolved CRAN errors and warnings
-   Alternative implementation of ASW and Dunn index due to removal of clusterCrit package from CRAN (#131, #132)
-   New PAP.adh dataset (#130)
-   Added support to lcmm methods for (parallel) gridsearch (#126)
-   More robust implementation of meta methods, allowing argument pass-through (#128)
-   Improved package documentation (#127)

# 2022-11-10 latrend [v1.5.0](https://github.com/niekdt/latrend/milestone/7)

## New features

-   Implemented virtual class for meta methods (#61)
-   Implemented a meta method for repeatedly fitting a method and selecting the best fit (see `lcFitRep`, `lcFitRepMin`, `lcFitRepMax`) (#61)
-   Implemented a meta method for repeatedly fitting a method until convergence (see `lcFitConverged`) (#61)

## Major changes

-   Made `getLcMethod()` generic

## Other changes

-   Added check for formula argument to LMKM method
-   Added "converged" slot to lcModelPartition
-   Generic validate() checks for correct output length
-   Added workaround for erroneous R CMD check rmarkdown import note

# latrend v1.4.3

-   Removed usage of soon-to-be deprecated ggplot functions

# latrend [v1.4.2](https://github.com/niekdt/latrend/milestone/5)

## Bug fixes

-   Fixed minor bug in `evaluate.lcMethod()`

## CRAN

-   Resolved lcmm test error
-   Shortened runtime of vignettes
-   Shortened runtime of tests

# latrend v1.4.1

## Bug fixes

-   Fixed bug in `predict.lcModel()` introduced by #116
-   Attempt to fix the documentation warning about how the escaped ampersand is not escaped

## Breaking changes

-   Default initialization of `lcMethodLcmmGMM` and `lcMethodLcmmGBTM` is set to `init = "lme"` to support lcmm v2.0.0 #121

# latrend v1.4.0

## New features

-   Added RMSE and WRMSE metrics
-   `plotMetric()` now shows legend when grouping
-   `externalMetric(lcModels)` returns a named distance matrix

## Bug fixes

-   Improved kml package compatibility; fixed errors on datasets with variable-length short trajectories
-   Resolved warnings from `latrendBoot()` and `latrendCV()`

## Breaking changes

-   Removed redundant `lcModelCustom` in favor of `lcModelPartition`
-   Renamed `lcMethodCustom` to `lcMethodFunction` for clarity

# latrend [v1.3.0](https://github.com/niekdt/latrend/milestone/4)

## New features

1.  Parameterized method testing framework for `lcMethod` and `lcModel` implementations. See `test.latrend()`.
2.  Warnings for missing data observations
3.  Better handling of data with missing observations

## Breaking changes

1.  Removed support for the `longclust` package as it is no longer available on CRAN.

## Other changes

1.  Updated examples, vignettes and tests to pass with `_R_CHECK_DEPENDS_ONLY_ = true`.

# latrend v1.2.1

1.  Fewer required imports
2.  Reduced test and example time
3.  Documentation of metrics and external metrics
4.  Enabled renv for CI

# latrend [v1.2.0](https://github.com/niekdt/latrend/milestone/2)

## New features

1.  Greatly expanded documentation of `lcMethod`, `lcModel`, `transformFitted()`, and `transformPredict()`.
2.  `latrendBatch()` evaluates and validates methods and datasets prior to any fitting ([#49](https://github.com/niekdt/latrend/issues/49)). This informs users of any errors as soon as possible. Moreover it makes it significantly easier to run parallel computations without the need to export parts of the global environment.
3.  Added `seed` argument to `latrendBatch()` ([#47](https://github.com/niekdt/latrend/issues/47)). Similar to `latrendRep()`, seeds are now generated for all methods, allowing for reproducible results.
4.  `latrendBatch()` now supports an expression for its `"data"` argument ([#50](https://github.com/niekdt/latrend/issues/50)).
5.  Variable argument pass-through for `lcModel` methods.
6.  Default implementation for `predictForCluster()`.
7.  Added timing information to log output of `latrend*()` methods ([#51](https://github.com/niekdt/latrend/issues/51)).
8.  Added `"unit"` option to `estimationTime()`.
9.  Implemented `estimationTime()` for `lcModels`.
10. `plot(lcModel)` only shows trajectories when `"what"` argument is not specified.
11. Support for `lcModel` objects without training data ([#36](https://github.com/niekdt/latrend/issues/36)).
12. Made it easier to define new `lcMethod` subclasses by defining better default methods.
13. `plot()` for `lcModels` ([#48](https://github.com/niekdt/latrend/issues/48))
14. `latrend()` and derivative methods automatically suppress console output when `verbose = FALSE` ([#45](https://github.com/niekdt/latrend/issues/45))
15. Better automatic axis breaks in metric plots (#44).
16. `trajectoryAssignments()` signature that accepts a posterior probability matrix ([#34](https://github.com/niekdt/latrend/issues/34))
17. Added convenient mixture initialization options to `lcMethodLcmmGBTM` and `lcMethodLcmmGMM` based on standard (single cluster) linear mixed model fit.
18. `lcMethodRandom()` accepts `seed` argument.
19. Expand trajectory assignment input options for `lcModelPartition`.
20. Methods can now be initialized by instantiating the `S4` class using `new()` [#56](https://github.com/niekdt/latrend/issues/56), [#57](https://github.com/niekdt/latrend/issues/57). `latrend()` functions accept a character name of the method class.
21. plotClusterTrajectories() to use logic of plotTrajectories() for showing trajectories [#65](https://github.com/niekdt/latrend/issues/65).
22. plotClusterTrajectories() with ribbon for trajectory range [#68](https://github.com/niekdt/latrend/issues/68).
23. `logLik()` for k-means based methods [#70](https://github.com/niekdt/latrend/issues/70).
24. Standard (interpolated) non-parametric cluster trajectory estimation through lcModelPartition and lcModelWeightedPartition [#72](https://github.com/niekdt/latrend/issues/72).
25. Option for disabling warning on redefining metrics and external metrics [#75](https://github.com/niekdt/latrend/issues/75).
26. Output warning in default lcModel postprob implementation [#78](https://github.com/niekdt/latrend/issues/78).
27. default predictAssignments() returns the assignments of trajectoryAssignments() when no newdata is specified [#79](https://github.com/niekdt/latrend/issues/79).
28. Lowered the number of required dependencies
29. Implemented APPA and OCC metrics. [#81](https://github.com/niekdt/latrend/issues/81).

## Breaking changes

1.  Significant: `trajectories()` now returns the original training data, instead of the fitted (predicted) data ([#32](https://github.com/niekdt/latrend/issues/32)). This was done to improve clarity. Previous uses of `trajectories()` and `plotTrajectories()` should be replaced by `fittedTrajectories()` and `plotFittedTrajectories()`, respectively.
2.  Significant: Reworked `lcMethod` initialization to use the standard `S4` mechanism [#56](https://github.com/niekdt/latrend/issues/56).
3.  Minor: `lcMethod` implementations: `prepareData()` must now return an `environment` ([#39](https://github.com/niekdt/latrend/issues/39)). In the past, `NULL` was allowed, but this increased code complexity further down the process.
4.  Minor: `estimationTime()` is now an S4 generic method. This does not affect existing code.

## Bug fixes

1.  Critical: Fixed `predict()` when cluster membership is specified for the new data ([#40](https://github.com/niekdt/latrend/issues/40)).
2.  Critical: Fixed computation of WMAE and WMSE metrics ([#52](https://github.com/niekdt/latrend/issues/52)).
3.  Fixed `lcMethod` argument evaluation for symbolic name input that equals the respective argument name ([#41](https://github.com/niekdt/latrend/issues/41)).
4.  Fixed `strip()` error related to use of `eapply()`.
5.  Fixed output error for `latrendBatch()` when `errorHandling = "pass"` ([#46](https://github.com/niekdt/latrend/issues/46))
6.  Defined estimation time for `lcModelPartition` and `lcModelWeightedPartition` ([#38](https://github.com/niekdt/latrend/issues/38)).
7.  Fixed default output of `logLik.lcModel` and other implementations ([#37](https://github.com/niekdt/latrend/issues/37)).
8.  Default `metric()` did not compute any metrics.
9.  Fixed indentation of messages for `latrend()` and derivative methods.
10. Fixed computation of WMAE and WMSE metrics [#52](https://github.com/niekdt/latrend/issues/52).
11. sprintf warning when running latrendBoot() or latrendCV() [#53](https://github.com/niekdt/latrend/issues/53).
12. lcMethodLMKM cluster coefficients are wrong when standardization is enabled [#69](https://github.com/niekdt/latrend/issues/69).
13. lcMethodGCKM fails to fit for nClusters = 1 in latrendBatch() [#71](https://github.com/niekdt/latrend/issues/71).
14. fittedTrajectories() now uses output of `fitted()` instead of `predict()` [#82](https://github.com/niekdt/latrend/issues/82).

# latrend [v1.1.1](https://github.com/niekdt/latrend/milestone/1)

# latrend v1.0

Initial release.
