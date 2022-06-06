%filename HH.m
%numerical solution of the space-clamped Hodgkin-Huxley equations
% clear all
clc
clf
global check;
global t1p t2p ip; %parameters for the function izero(t)
in_HH
in_mhnv
for klok=1:klokmax
  t=klok*dt;                      %note time
  m=snew(m,alpham(v),betam(v),dt); %update m
  h=snew(h,alphah(v),betah(v),dt); %update h
  n=snew(n,alphan(v),betan(v),dt); %update n
  gNa=gNabar*(m^3)*h;    %sodium conductance
  gK =gKbar*(n^4);    %potassium conductance
  g=gNa+gK+gLbar;         %total conductance
  gE=gNa*ENa+gK*EK+gLbar*EL;         %gE=g*E
  %save old value of v for checking purposes:
  v_old=v;
  %update v:
  v=(v+(dt/C)*(gE+current_pulse(t)))/(1+(dt/C)*g); %izero(t) or current_pulse(t)
  if(check)
    E=gE/g;
    chv=C*(v-v_old)/dt+g*(v-E)-current_pulse(t); %izero(t) or current_pulse(t)
  end
  %store results for future plotting:
  mhn_plot(:,klok)=[m h n]';
  v_plot(klok)=v;
  t_plot(klok)=t;
  i_plot(klok)=current_pulse(t);
end


subplot(3,1,1),plot(t_plot,v_plot)
title('Neuron Voltage')
xlabel('time (ms)')
ylabel('voltage (mV)')
subplot(3,1,2),plot(t_plot,mhn_plot)
legend('m','h','n')
title('Gating Variables')
xlabel('time (ms)')
ylabel('proportion')
subplot(3,1,3),plot(t_plot,i_plot)
title('Applied Current')
xlabel('time (ms)')
ylabel('current (muA)')