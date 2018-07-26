%% Initialize Workspace
clear; 
clf;

%% Load and Manipulate Data
MyDat = load('Autocorrelator_071818161047.dat');
Intensity = MyDat(:,2);
Location = MyDat(:,1);
Intensity = Intensity - min(Intensity);
Intensity = Intensity./max(Intensity);
Intensity = Intensity - 0.02;

%% Get Rid of Other Pulses
Intensity = Intensity(782:840);
Location = Location(782:840);

%% Plot Data
figure(1);
plot(Location, Intensity, 'b-')