# Machine Learning Model Comparison (Iris Dataset)

## Overview
This project uses the Iris dataset to build and compare multiple machine learning classification models. The goal is to predict the species of an iris flower based on its physical measurements: sepal length, sepal width, petal length, and petal width.

Because the dataset contains labeled classes (three species), this is a supervised classification problem. The focus is not only on prediction accuracy, but also on comparing how different modeling approaches perform on the same structured dataset.

## Models  Used

Different machine learning models were selected to represent a range of statistical and algorithmic approaches to classification:

- **Linear Discriminant Analysis (LDA):**  
  Used as a baseline statistical model. It assumes linear separability between classes and normally distributed predictors. It provides a simple benchmark for performance.

- **Support Vector Machine (SVM):**  
  Used to capture potentially non-linear relationships between features. SVM is effective when class boundaries are complex and not strictly linear.

- **Random Forest:**  
  An ensemble learning method that combines multiple decision trees. It is included because it reduces overfitting and often performs well on structured tabular data like the Iris dataset.

---

## What is Being Analyzed

The analysis focuses on:

- How accurately each model classifies iris species based on physical measurements  
- How model performance varies under cross-validation  
- Which modeling approach is most robust for this dataset  

The evaluation metric used is **classification accuracy**, measured using 10-fold cross-validation to ensure results are not dependent on a single train-test split.

---

## Key Insight

This project highlights how different modeling assumptions (linear vs non-linear vs ensemble methods) affect classification performance, even on a relatively simple dataset. It provides a baseline comparison of classical and modern machine learning techniques for structured data.

## Methodology
- 80/20 train-test split
- 10-fold cross-validation
- Accuracy used as primary evaluation metric

## Key Result
Random Forest achieved the highest classification accuracy among tested models.

## Tools
- R
- caret
- e1071
- randomForest
- MASS
