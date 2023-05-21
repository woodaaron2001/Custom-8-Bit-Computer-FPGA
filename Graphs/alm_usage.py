import pandas as pd
import matplotlib.pyplot as plt

# Read the data from CSV file
data = pd.read_csv('alm_usage.csv')

# Total available LUTs in the FPGA
total_alms = 20000  # Replace with your actual total LUTs

# Compute proportions
data['Proportion'] = data['ALM_usage'] / total_alms

# Plot the data
plt.figure(figsize=(10, 6))
bars = plt.bar(data['Component'], data['Proportion'])

plt.xlabel('Component')
plt.ylabel('Proportion of Total ALMs')
plt.title('Proportion of Total ALMs Used by Different Components')

# Add total LUTs annotation
plt.text(0.8, 0.95, f'Total ALMs: {total_alms}', transform=plt.gca().transAxes)

# Add LUT count annotations for each Component
for bar in bars:
    yval = bar.get_height()
    plt.text(bar.get_x() + bar.get_width()/2, yval + 0.01, f'ALMs: {yval*total_alms:.0f}', ha='center', va='bottom')

plt.show()