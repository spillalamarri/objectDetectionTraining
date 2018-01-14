% load('stopSignsAndCars.mat');
% positiveInstances = stopSignsAndCars(:,1:2);
% disp(size(positiveInstances));
% imDir = fullfile(matlabroot,'toolbox','vision','visiondata','stopSignImages');
% addpath(imDir);
% negativeFolder = fullfile(matlabroot,'toolbox','vision','visiondata',...
%     'nonStopSigns');
% negativeImages = imageDatastore(negativeFolder);
% trainCascadeObjectDetector('stopSignDetector.xml',positiveInstances, ...
%     negativeFolder,'FalseAlarmRate',0.1,'NumCascadeStages',5);

%read in table of coordinates for positive car instances
filename = fullfile('C:','Users', 'Swathi', 'Desktop', 'sortedCarImages', 'resizedCoords2.xlsx');
resizedCoords1 = readtable(filename);
for c = 1:229
    resizedCoords1.coords{c} = str2num(resizedCoords1.coords{c});
end

positiveInstances = resizedCoords1(:,1:2);
imDir = fullfile(matlabroot,'toolbox','vision','visiondata','allResizedIm2');
addpath(imDir);
negativeFolder = fullfile(matlabroot,'toolbox','vision','visiondata','allNegativeResizedIm2');
negativeImages = imageDatastore(negativeFolder);
trainCascadeObjectDetector('avocado.xml',positiveInstances, negativeFolder, 'FalseAlarmRate',0.005,'NumCascadeStages',5, 'FeatureType', 'Haar');
%detector = vision.CascadeObjectDetector('stopSignDetector.xml');