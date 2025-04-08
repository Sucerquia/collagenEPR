clear, clf, clc
data = readmatrix('../../experiments/field_intensity.dat');
field = data(:,1)
% ==== Experiment
Exp.mwFreq = 179.813;
Exp.Range = [min(field) max(field)];
Exp.nPoints = 501;
Exp.Harmonic = 0;

% ==== Theory
Sys = orca2easyspin('EPRII_i.out');
Sys.lwpp = 0.5

[ field, spec ] = pepper(Sys, Exp);
data = [field(:), spec(:) ];
writematrix(data, 'spectrum_hyFiCorr.dat', 'Delimiter', 'tab');
