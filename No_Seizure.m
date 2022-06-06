global check;
global t1p t2p ip; %parameters for the function izero(t)
in_HH
in_mhnv

counter=0;
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
  
  v=(v+(dt/C)*(gE+izero(t)))/(1+(dt/C)*g);
  
  if(check)
    E=gE/g;
    chv=C*(v-v_old)/dt+g*(v-E)-izero(t);
  end
  
  
  
  %store results for future plotting:
  mhn_plot(:,klok)=[m h n]';
  v_plot(klok)=v;
  t_plot(klok)=t;
  chv_plot(klok)=round(chv);
  
  if chv_plot(klok)>0 || chv_plot(klok)<0
      if counter <60 % this is to simulate a system delay
          counter=counter+1;
      else % Apply voltage clamp
          v=0;
          v_plot(klok)=v;
      end
  else
      continue
  end
  
  
end

% 
% figure(1)
% plot(t_plot,chv_plot)
% title('Change in Voltage')
% xlabel('time (ms)')
% ylabel('Change in voltage (mV)')
% 
% 
% 
% figure(2)
% subplot(2,1,1),plot(t_plot,v_plot)
% title('Neuron Voltage')
% xlabel('time (ms)')
% ylabel('voltage (mV)')
% subplot(2,1,2),plot(t_plot,mhn_plot)
% legend('m','h','n')
% title('Gating Variables')
% xlabel('time (ms)')
% ylabel('proportion')