%% Initialize workspace
clear all;
clc;

%% Calculate principal planes of lens and filter
RefractiveIndex = 1.52;
ThicknessF = 6.35;
ThicknessL = 2.3;

dPrimeF = ThicknessF/RefractiveIndex;
dPrimeL = ThicknessL/RefractiveIndex;

%% Calculate power and principal plane of series
FocusL = 12.5;
FocusF = linspace(-1, -200, 5000);
ImageDistance = 30;

t = @(f) ((1/ImageDistance) - (1./FocusL) + (1./f)).*FocusL.*f;
dPrime = @(f,t) (ImageDistance/FocusL).*t;

%% Find filter focus with min distance between position at 2f and image at 30 mm from principal plane
for i = 1:length(FocusF)
    tS(i) = t(FocusF(i));
    dPrimeS(i) = dPrime(FocusF(i), tS(i));
    PositionDifference(i) = abs(ImageDistance./2 - 2.*FocusF(i) - dPrimeS(i));
end

MinLoc = find(min(PositionDifference) == PositionDifference);
OptimalFValue = FocusF(MinLoc)
LocF = OptimalFValue + dPrimeF;
LocL = LocF + tS(MinLoc);
