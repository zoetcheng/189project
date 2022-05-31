% a constant amount of current goes into the neuron model in order to keep
% triggering action potentials

function i=izero(t)
%filename: izero.m
global ip;
i = ip;
end