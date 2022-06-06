%%%% This is the full model with no additional comments just so that is is
%%%% easier to look at
clear all
clc
global klokSeiz klokmax



plot_v=cell([1 30]);
plot_mhn=cell([1 30]);
plot_t=cell([1 30]);
plot_chv=cell([1 30]);
% plot_i=cell([1 30]);



ProbSeiz=randi([1,30],1,30); 

is=ones(1,30);
Seiz= ProbSeiz == is;
isSeiz=zeros(1,30);

for i=1:length(isSeiz)-1
    if Seiz(i)==1 && Seiz(i+1)== 1
        Seiz(i+1)=0;
        isSeiz(i)=Seiz(i);
    else
        isSeiz(i)=Seiz(i);
    end
end

if isempty(find(isSeiz, 1))
    disp("No Seizures this Month")
    return
end



% ProbSeiz2=randi([1,klokmax],1,klokmax); 
% is2=ones(1,klokmax);
% Seiz2= ProbSeiz2 == is2;
isSeiz2=zeros(1,klokmax);
Day=(1:1:30);

for j=1:length(isSeiz)
    if isSeiz(j)==1
        ProbSeiz2=randi([1,klokmax],1,klokmax); 
        is2= randi(klokmax,[1,klokmax]);
        Seiz2= ProbSeiz2 == is2;
        klokSeiz=find(Seiz2);
        if ~isempty(klokSeiz)
            Seizure_Happens
            
            plot_v(j)={v_plot};
            plot_mhn(j)={mhn_plot};
            plot_t(j)={t_plot};
            plot_chv(j)={chv_plot};
            disp(strcat("Seizure on day:", num2str(Day(j))))
            figure(j)
            plot(cell2mat(plot_t(j)),cell2mat(plot_v(j)))
            title(strcat('Neuron Voltage on Day:',num2str(Day(j))))
            xlabel('time (ms)')
            ylabel('voltage (mV)')
        else
            No_Seizure
            
            plot_v(j)={v_plot};
            plot_mhn(j)={mhn_plot};
            plot_t(j)={t_plot};
            plot_chv(j)={chv_plot};
            disp(strcat("No Seizure on day:", num2str(Day(j))))
        end
    else
        No_Seizure
        plot_v(j)={v_plot};
        plot_mhn(j)={mhn_plot};
        plot_t(j)={t_plot};
        plot_chv(j)={chv_plot};
        disp(strcat("No Seizure on day:", num2str(Day(j))))
    end
end



