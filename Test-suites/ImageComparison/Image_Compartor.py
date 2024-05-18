from PIL import Image
from itertools import zip_longest
from io import BytesIO

def compare_images(path_one, path_two):
   image_one = Image.open(path_one)
   image_two = Image.open(path_two)

   comparison = zip_longest(image_one.getdata(), image_two.getdata())

   # if both images are smae then return TRUE
   return all(x == y for x, y in comparison)


def compare_images_byte(byte_str, expected_image_path):
   image = Image.open(BytesIO(byte_str))
   image_two = Image.open(expected_image_path)

   comparison = zip_longest(image.getdata(), image_two.getdata())

   return all(x == y for x, y in comparison)