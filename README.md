# K-Means Clustering: Customer Segmentation

## Project Overview

This project applies K-Means clustering to group customers of a retail store based on their purchase history. The goal is to identify distinct customer segments that can help the retail store in marketing, product recommendations, and customer retention strategies.

## Dataset

The dataset used in this project contains 2500 observations of customer behavior, including the following features:

- **Age**: Age of the customer.
- **Annual Income (k$)**: Annual income of the customer in $1000s.
- **Spending Score (1-100)**: Spending score assigned to the customer based on their purchasing behavior.
- **Number of Purchases**: Total number of purchases made by the customer.
- **Days Since Last Purchase**: Number of days since the customer last made a purchase.

## Project Structure

- **Data Preprocessing**: The dataset is preprocessed to handle missing values and scale the features to ensure that all variables contribute equally to the clustering algorithm.
- **K-Means Clustering**: The K-Means algorithm is used to segment the customers. The optimal number of clusters is determined using the Elbow Method.
- **Evaluation**: The model is evaluated using the silhouette score to assess the quality of the clusters.
- **Cluster Analysis**: Each cluster is analyzed by examining the centroid values to understand the characteristics of the different customer segments.

## Methodology

1. **Data Preprocessing**: 
   - Handled missing values.
   - Scaled the data using standardization.
   
2. **K-Means Clustering**:
   - Applied the K-Means algorithm to group customers.
   - Determined the number of clusters using the Elbow Method.

3. **Evaluation**:
   - Calculated the **silhouette score** to measure how well the customers fit into their respective clusters.
   
4. **Centroid Analysis**:
   - Analyzed the cluster centroids to describe the common characteristics of each segment.
   
5. **Visualization**:
   - Created various visualizations, including scatter plots and radar charts, to display customer segmentation and centroid analysis.

## Visualizations

- **Scatter Plot**: Displays customer segments based on annual income and spending score, with centroids highlighted.
- **Radar Chart**: Visualizes cluster centroids for a comparison of features like age, annual income, spending score, etc.
- **Silhouette Plot**: Shows how well each data point fits into its cluster.

## Outputs

- **centroids.csv**: The centroid values of each cluster saved as a CSV file.
- **Silhouette Score**: Printed in the console after running the clustering model.
- **Visualizations**: Plots will be displayed for customer segmentation and cluster characteristics.

## Conclusion

This project successfully identifies customer segments using K-Means clustering. The clusters are evaluated using the silhouette score, and the characteristics of each cluster are analyzed to gain insights into customer behavior. These insights can help the retail store tailor its marketing and retention strategies to different customer groups.

## Future Work

- Explore other clustering algorithms such as DBSCAN or hierarchical clustering.
- Incorporate additional features such as customer feedback or loyalty scores.
- Perform A/B testing on different marketing strategies targeted at specific clusters.

## License

This project is licensed under the MIT License.
