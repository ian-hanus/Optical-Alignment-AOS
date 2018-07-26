%% Load Data
x = linspace(-3500,3500,10000);
y = 0.9284*exp(-((x+35.22)./599.6).^2);

%% Split Peak in Half
y1 = y(1:5000);
y2 = y(5001:end);

%% Find Half Max
MyVal1 = min(abs(y1-0.5));
MyVal2 = min(abs(y2-0.5));
MyNewV1 = 0.5 - MyVal1;
MyNewV2 = 0.5 - MyVal2;
Val1 = find(y == MyNewV1);
Val2 = find(y == MyNewV2);

%% Find Width at Half Max
XVal1 = x(Val1);
XVal2 = x(Val2);
FWHM = abs(XVal2 - XVal1)