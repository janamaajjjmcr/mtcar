# Step 1: Read the dataset
# Note: mtcars is built into R, so we can load it directly
data(mtcars)

# Display the first few rows to understand the data structure
head(mtcars)

# Step 2: Read values in column "cyl"
cylinders <- mtcars$cyl
unique(cylinders)  # Check the unique values in cylinders column

# Step 3: Create color vector based on cylinder values
# If cyl=8, then color red; if cyl=6, then color green; if cyl=4, then color blue
colors <- ifelse(cylinders == 8, "red", 
                ifelse(cylinders == 6, "green", "blue"))

# Step 4 & 5: Plot the values of mpg and qsec with colors based on cylinders
# Create the plot
plot(mtcars$mpg, mtcars$qsec, 
     main="Relationship between MPG and Quarter Mile Time by Cylinder Count",
     xlab="Miles Per Gallon (mpg)", 
     ylab="Quarter Mile Time (qsec)",
     pch=16,  # Solid circle point type
     col=colors)  # Apply our color coding

# Add a legend to the plot
legend("topright", 
       legend=c("4 cylinders", "6 cylinders", "8 cylinders"),
       col=c("blue", "green", "red"), 
       pch=16,
       title="Cylinder Groups")

# Additional analysis: Calculate summary statistics for each cylinder group
by_cyl <- split(mtcars, mtcars$cyl)
summary_stats <- lapply(by_cyl, function(df) {
  data.frame(
    count = nrow(df),
    avg_mpg = mean(df$mpg),
    avg_qsec = mean(df$qsec),
    cor_mpg_qsec = cor(df$mpg, df$qsec)
  )
})

# Display summary statistics
summary_stats