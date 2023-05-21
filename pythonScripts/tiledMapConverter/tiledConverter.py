import json

# Open the file and read its content
with open('gameMap..tmj', 'r') as file:
    file_content = file.read()

# Parse the content as JSON
map_data = json.loads(file_content)

# Access the layers
layers = map_data['layers']

layer1_data = layers[0]["data"]
layer2_data = layers[1]["data"]

layer1_final = ""
layer2_final = ""

for tile in layer1_data:
    
    if(tile == 0):
        layer1_final += 'ff'  # Directly append 'FF' instead of converting 255 to hex
    else:
        layer1_final += format(tile-1, '02x')
    layer1_final += "\n"

for tile in layer2_data:
    
    if(tile == 0):
        layer2_final += 'ff'  # Directly append 'FF' instead of converting 255 to hex
    else:
        layer2_final += format(tile-1, '02x')
    layer2_final += "\n"

# Open file in write mode
with open('vramL1.hex', 'w') as f:
    # Write string to file
    f.write(layer1_final)


# Open file in write mode
with open('vramL2.hex', 'w') as f:
    # Write string to file
    f.write(layer2_final)