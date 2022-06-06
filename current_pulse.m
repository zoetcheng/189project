% current pulses
% adds pulses of current to the 
% neuron model at the designated time

function i=current_pulse(t)
global ip;
    if((100<t)&&(t<110))
        i=ip;
    elseif((120<t)&&(t<130))
        i=ip;
    elseif((140<t)&&(t<150))
        i=ip;
    else
        i=0;
    end
end
