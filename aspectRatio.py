import cv2
import os
import csv

#read images from file of images, crop them to just cars
path = "C:\\Users\\Swathi\\Desktop\\sortedCarImages\\positivePartial"

#open text file of ROI'S of cars for partial car images
pROI = "C:\\Users\\Swathi\\Desktop\\sortedCarImages\\partialROIs.txt"
with open(pROI, 'r') as fCsvFile:
    fReader = csv.reader(fCsvFile, delimiter=',', lineterminator= ':')
    coordinates = '0,{},0,{}'.format(width, height)
    fReader.readrow([sortedPath + yPath + imageName] + [coordinates])

#determine smallest w/h for aspect ratio later
smallestWidth = 1000
smallestHeight = 1000

for imageName in os.listdir(path)[:-1]:
    img = path + "\\" + imageName
    image = cv2.imread(img)
    #r = 100.0 / image.shape[1]
    #dim = (100, int(image.shape[0] * r))
    x = 22
    y = 11
    w = 25
    h = 9

cv2.rectangle(image, (x, y), (x+w, y+h), (0, 0, 255), 2)
#resized = cv2.resize(image, dim, interpolation = cv2.INTER_AREA)
cv2.imshow("resized", image)
cv2.waitKey(0)
cv2.destroyAllWindows()