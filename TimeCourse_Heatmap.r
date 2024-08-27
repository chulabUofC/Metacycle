# Load necessary libraries
library(pheatmap)

# Load the MetaCycle results data
metacycle_data <- read.csv("Sub743-300to370.csv")
cat("MetaCycle data loaded successfully.\n")

# Load the time course data
time_course_data <- read.csv("Sub743_detrended_10_9_transposed_100_800_56samples.csv")
cat("Time course data loaded successfully.\n")

# List of genes to plot or upload file
genes_to_plot <- c("VAMP2", "CNTNAP1", "ARHGAP32", "PHF17", "IGF2BP3", "TMEM158", "SLC38A5", "PDE1C", "HES5",
                   "BAHCC1", "DCAF4", "GPSM1", "TLE3", "HES1", "RHOU", "NLN", "KLHL15", "AXIN2", "DUSP4",
                   "NRARP", "NPEPL1", "DUSP5", "SPIRE1", "TBL1XR1", "SLC20A2", "ZDHHC23", "SPARCL1", "DIO2",
                   "HES7", "tdTomato", "MYCN", "SMOC1", "DLL1", "LHFP", "HOXD4", "IGDCC3", "SLC29A1", "HEY1",
                   "ODC1", "PRRX1", "CDCA7L", "CRABP1", "CSK", "FOXL1", "NTM", "CRB2", "SOX12", "EFNA1",
                   "NanoLuc", "TANC2", "DES", "LZTS1", "CYB5R4", "RHOBTB3", "SLC50A1", "SLIT3", "STARD9", "SPIN4",
                   "PER1", "REV1", "SKIL", "PODXL", "EPHB3", "KIF21B", "EFCAB1", "SLIT2", "LPIN1", "TRERF1",
                   "ZIC3", "HMGA1", "STMN2", "AGMAT", "SNAI2", "HEYL", "LFNG", "SNAP91", "PTGDR2",
                   "TMEM100", "ZNF831", "EFCAB4B", "SERPINB11")

# Filter the MetaCycle data to include only the genes to plot
filtered_metacycle_data <- metacycle_data[metacycle_data$CycID %in% genes_to_plot, ]
cat("Filtered MetaCycle data:\n")
print(head(filtered_metacycle_data))

# Order the genes by PhaseShift
ordered_genes <- filtered_metacycle_data[order(filtered_metacycle_data$PhaseShift), ]$CycID
cat("Ordered genes by PhaseShift:\n")
print(ordered_genes)

# Assuming the first column in time course data contains gene identifiers
gene_column <- colnames(time_course_data)[1]

# Filter and reorder the time course data to match the ordered genes
filtered_time_course_data <- time_course_data[time_course_data[[gene_column]] %in% ordered_genes, ]
filtered_time_course_data <- filtered_time_course_data[match(ordered_genes, filtered_time_course_data[[gene_column]]), ]

# Print to check if the matching was successful
cat("Filtered and ordered time course data:\n")
print(head(filtered_time_course_data))

# Remove the gene names column for scaling and heatmap generation
data_for_heatmap <- as.matrix(filtered_time_course_data[, -1])

# Check for and replace NA values with 0
data_for_heatmap[is.na(data_for_heatmap)] <- 0

# Scale the data for the heatmap
data_scaled <- t(scale(t(data_for_heatmap)))

# Check the range of the scaled data to ensure it's finite
cat("Range of scaled data:\n")
print(range(data_scaled))

# Generate the heatmap
pheatmap(data_scaled, 
         cluster_rows = FALSE, 
         cluster_cols = FALSE, 
         color = colorRampPalette(c("blue", "black", "yellow"))(100), 
         main = "Heatmap of Phase-Shifted Gene Expression",
         show_rownames = TRUE,
         show_colnames = TRUE)
