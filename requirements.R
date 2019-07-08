install.packages(c('devtools', 'gam','gsl','rgl','RNeXML','RColorBrewer','BiocManager'),repos="https://lib.ugent.be/CRAN/")
update.packages(ask=F)
BiocManager::install(c("scran","MAST","monocle","ComplexHeatmap","clusterExperiment","slingshot"), version = "3.9")
