library(canvasXpress)
library(canvasXpress.data)
library(dplyr)
library(glue)
library(htmlwidgets)
library(limma)


# dataset is from canvasxpress.data
g_GSE9750 <- GSE9750

# we want to analyze age in groups
g_GSE9750$x$Age <- as.character(cut(as.numeric(g_GSE9750$x$Age),
                                    breaks = c(0, 40, 50, 60, 100),
                                    labels = c("<40", "40-50", "50-60", "60+")))
g_GSE9750$x$Age[is.na(g_GSE9750$x$Age)] <- "unknown"

# we would like to consider and "see" NA values for the rest of the metadata
g_GSE9750$x[is.na(g_GSE9750$x)] <- "<NA>"

# we would like to create new column with unique gene names
g_GSE9750$z$Symbol[g_GSE9750$z$Symbol == ""] <- g_GSE9750$z$vars[g_GSE9750$z$Symbol == ""]
g_GSE9750$z$Name <- g_GSE9750$z$Symbol

duplicatedGenes <- g_GSE9750$z$Symbol[duplicated(g_GSE9750$z$Symbol)]

g_GSE9750$z[g_GSE9750$z$Symbol %in% duplicatedGenes,] <- g_GSE9750$z %>%
    filter(Symbol %in% duplicatedGenes) %>%
    mutate(Name = gsub(' /// ', ';', glue("{Symbol}_{vars}")))

# gene choices used throughout the program
g_geneChoices <- setNames(g_GSE9750$z[rownames(g_GSE9750$y), "Symbol"],
                          gsub(' /// ', ';', g_GSE9750$z[rownames(g_GSE9750$y), "Symbol"]))

# custom sorting
g_geneChoices <- g_geneChoices[sort(names(g_geneChoices))]
g_geneChoices <- g_geneChoices[c(which(grepl('^A', names(g_geneChoices)))[1]:length(g_geneChoices),
                                 1:which(grepl('^A', names(g_geneChoices)))[1] - 1)]
