library('tidyverse')
library('cluster')
library('readr')

#Read Data 
customer_data <- read_csv('retail_customer_data.csv')

# Scale the data for K-means clustering (only the numeric columns)
scaled_data <- scale(customer_data[, c("Age", "Annual Income (k$)", "Spending Score (1-100)", "Number of Purchases", "Days Since Last Purchase")])


# Determine the optimal number of clusters using the Elbow Method
wss <- (nrow(scaled_data)-1)*sum(apply(scaled_data, 2, var))
for (i in 2:15) wss[i] <- sum(kmeans(scaled_data, centers=i)$withinss)

# Plot the Elbow Method
plot(1:15, wss, type="b", pch = 19, frame = FALSE, 
     xlab="Number of Clusters", ylab="Total Within Sum of Squares",
     main="Elbow Method for Optimal Clusters")

# Set number of clusters (using 5 as an example, adjust based on the elbow plot)
k <- 5

# Apply K-means clustering on the entire dataset
kmeans_result <- kmeans(scaled_data, centers = k, nstart = 25)

# Add the cluster result to the original data
customer_data$Cluster <- as.factor(kmeans_result$cluster)

# Print the first few rows with the cluster assignment
head(customer_data)

# ---------- EVALUATION METRICS ----------

# 1. WCSS (Within-cluster sum of squares)
cat("Total Within-Cluster Sum of Squares (WCSS):", kmeans_result$tot.withinss, "\n")

# 2. BCSS (Between-cluster sum of squares)
cat("Total Between-Cluster Sum of Squares (BCSS):", kmeans_result$betweenss, "\n")

# 3. Silhouette Score for the Entire Data
silhouette_result <- silhouette(kmeans_result$cluster, dist(scaled_data))
cat("Average Silhouette Score:", mean(silhouette_result[, 3]), "\n")

# Calculate means and standard deviations of the original features
means <- colMeans(customer_data[, c("Age", "Annual Income (k$)", "Spending Score (1-100)", "Number of Purchases", "Days Since Last Purchase")])
sds <- apply(customer_data[, c("Age", "Annual Income (k$)", "Spending Score (1-100)", "Number of Purchases", "Days Since Last Purchase")], 2, sd)

# Convert the centroids back to the original scale
centroids <- as.data.frame((kmeans_result$centers) * sds + means)
print(original_centroids)


# ---------- VISUALIZATION ----------

# Visualize the clusters using ggplot2
#Boxplot for Annual Income
ggplot(customer_data, aes(x = factor(Cluster), y = `Annual Income (k$)`, fill = factor(Cluster))) +
    geom_boxplot() +
    labs(title = "Box Plot of Annual Income by Cluster",
         x = "Cluster",
         y = "Annual Income (in $1000)") +
    scale_fill_brewer(palette = "Set3") +  # Color palette for clusters
    theme_minimal() +
    theme(legend.position = "none") 

# Create a box plot for Spending Score
ggplot(customer_data, aes(x = factor(Cluster), y = `Spending Score (1-100)`, fill = factor(Cluster))) +
    geom_boxplot() +
    labs(title = "Box Plot of Spending Score by Cluster",
         x = "Cluster",
         y = "Spending Score (1-100)") +
    scale_fill_brewer(palette = "Set3") +  # Color palette for clusters
    theme_minimal() +
    theme(legend.position = "none") 

#Scatterplot for clusters
ggplot(customer_data, aes(x = `Annual Income (k$)`, y = `Spending Score (1-100)`, color = Cluster)) +
    geom_point(size = 3) +
    labs(title = "Customer Segments Based on K-Means Clustering", 
         x = "Annual Income (in $1000)", 
         y = "Spending Score (1-100)") +
    theme_minimal()













