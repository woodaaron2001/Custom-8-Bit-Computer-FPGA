import pandas as pd
import matplotlib.pyplot as plt
import numpy as np

# Read the data from CSV file
data = pd.read_csv('module_versions.csv')

# Total available LUTs in the FPGA
total_luts = 18000  # Replace with your actual total LUTs

# Split the 'Module_Version' into 'Module' and 'Version'
data[['Module', 'Version']] = data['Module_Version'].str.split('-', expand=True)

# Compute proportions
data['Proportion'] = data['LUT_Usage'] / total_luts

# Pivot the data to have modules as rows, versions as columns, and proportions as values
pivot_data = data.pivot(index='Module', columns='Version', values='Proportion')

# Define bar width (you may need to adjust this based on your data)
bar_width = 0.35

# Define the positions for the groups of bars
r1 = np.arange(len(pivot_data))
r2 = [x + bar_width for x in r1]

# Plot the data
plt.figure(figsize=(10, 6))

# Plot 'Original' bars
bars1 = plt.bar(r1, pivot_data['Sync'], width=bar_width, label='Original')

# Plot 'Modified' bars
bars2 = plt.bar(r2, pivot_data['ASync'], width=bar_width, label='Modified')

# Add x-axis labels
plt.xlabel('Module')
plt.xticks([r + bar_width / 2 for r in range(len(pivot_data))], pivot_data.index.str.split('-').str[0])

# Add y-axis label and title
plt.ylabel('Proportion of Total LUTs')
plt.title('Proportion of Total LUTs Used by Original vs Modified Modules')

# Add total LUTs annotation
plt.text(0.02, 0.95, f'Total available ALM/LUTS: {total_luts}', transform=plt.gca().transAxes)

# Add LUT count annotations for each bar
for bars in [bars1, bars2]:
    for bar in bars:
        yval = bar.get_height()
        plt.text(bar.get_x() + bar.get_width()/2, yval + 0.01, f'LUTs: {yval*total_luts:.0f}', ha='center', va='bottom')

# Add legend
plt.legend()

plt.show()