% current pulses
% adds pulses of current to the 
% neuron model at the designated time

function i=current_pulse(t)
global ip;
    if((50<t)&&(t<100))
        i=10;
    else
        i=0;
    end
end

