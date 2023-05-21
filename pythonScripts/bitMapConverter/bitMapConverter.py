import numpy as np
import cv2
import os 


def convertBinary(colour):
    binColour = bin(colour)
    #We remove "0x" and pad with 0s so we always have the form b'xxxx
    return  binColour[2:].zfill(4)


def scalePixels(RGB8Bit):
    bin4BitCol = ""
    #CV2 outputs as BGR when looping: we need the reverse
    for colour in reversed(RGB8Bit):
        #Scaling down to fit to 12 bits
        bin4BitCol += convertBinary(colour //16)
    return bin4BitCol

#file load
def load_tilemap(file_path):
    return cv2.imread(file_path)

#Splitting the tilemap based on max sprites, width and height (W/H should always be 16 though anyways)
def split_tilemap(tilemap, sprite_width, sprite_height, max_sprites):
    tilemap_height, tilemap_width, _ = tilemap.shape
    sprites = []
    count = 0

    for y in range(0, tilemap_height, sprite_height):
        for x in range(0, tilemap_width, sprite_width):
            if count >= max_sprites:
                break
            sprite = tilemap[y:y + sprite_height, x:x + sprite_width]
            sprites.append(sprite)
            count += 1

        if count >= max_sprites:
            break

    return sprites

#Reading through each image and converting it to 12 bit rgb and writing as binary
def process_sprites(sprites):
    result = ""
    imageBinFile = open("sprites.bin", "w")
    for i, sprite in enumerate(sprites):
        img_list = sprite.tolist()
        for row in img_list:
            for pixel in row:
                binColour = scalePixels(pixel)
                result += binColour
                result += "\n"
    imageBinFile.write(result)
    imageBinFile.close()

def main():
    file_path = "./gameMap.png"
    sprite_width, sprite_height = 16, 16
    max_sprites = 50  # Change this value to the number of sprites you want to read

    tilemap = load_tilemap(file_path)
    sprites = split_tilemap(tilemap, sprite_width, sprite_height, max_sprites)
    process_sprites(sprites)

if __name__ == "__main__":
    main()