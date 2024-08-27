# Metacycle
to generate a heatmap of gene expression data for a selected list of genes, focusing on their phase-shifted expression patterns over time. The process involves several steps, including data loading, filtering, scaling, and visualizing. Here's a breakdown:

Loading Libraries:

ggplot2, reshape2, pheatmap, and readxl are loaded for data manipulation, transformation, and visualization.
Data Loading:

MetaCycle Results: A file named Sub743-300to370.csv is loaded, which contains data from a MetaCycle analysis, detailing cyclic gene expression (e.g., PhaseShift, Period, Amplitude).
Time Course Data: A CSV file Sub743_detrended_10_9_transposed_100_800_56samples.csv is loaded, which contains gene expression data across different time points.
Gene Filtering:

A predefined list of genes (genes_to_plot) is used to filter both the MetaCycle data and the time course data.
The filtered genes are then ordered based on their PhaseShift values.
Data Transformation:

The time course data is filtered and reordered to match the ordered list of genes.
The data is scaled (z-score normalization) across rows (genes), and missing or non-finite values are handled by removing rows with such values.
Heatmap Generation:

The scaled data is visualized as a heatmap using the pheatmap function, with a color gradient from blue to yellow representing the expression levels.
