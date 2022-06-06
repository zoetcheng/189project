%%%% Defining a methodology for Epilepsy Modeling

% Epilepsy and subsequently epileptic seizures can be generally thought of
% as a disturbed and disjointed Electrical field within a region of the
% brain. As such we want to essentially model this as some number of HH
% models where some of them get disturbed and some do not. 


% I think the easiest way to think about if someone might have an epileptic
% seizure on the scale of someone who has Refractory Epilepsy would be to
% say that that person might have a seizure somewhere on the order of once
% per month. I have no data to back it up but just what I will base the
% model around. 

%    However, in order to be classified as epilepsy the patient must have
%    at lest 2 seizures occur more than 24 Hrs appart so I will creat a
%    methodology for distinguising when our patient model has their
%    seizures. 

clear all
clc

global klokmax
in_HH
in_mhnv

ProbSeiz=randi([1,30],1,30); 
%we will say that if this is 1 there is a seizure that day but it can't
%happen on consecutive days

is=ones(1,30);
Seiz= ProbSeiz == is;
isSeiz=zeros(1,30);

for i=1:length(isSeiz)-1
    if Seiz(i)==1 && Seiz(i+1)== 1
        Seiz(i+1)=0;%this just ensures that there is no duplicate days.
        isSeiz(i)=Seiz(i);
    else
        isSeiz(i)=Seiz(i);
        %I'm not sure that this is really neccessary but it ensures that it
        %won't be buggy and I'm pretty sure this part of the function is
        %done in O(n) or linear time or maybe even O(1). 
    end
end
isSeiz;


% So now we have a way of telling the model to have a seizure that we could
% simulate over 30 days or longer hypothetically speaking. 


%%%%%%% Simulating a Seizure


% My idea with this from the research that I have done is that we want to
% simulate essentially just very crazy random and otherwise chaotic
% non-linear values. As far as I can tell we can just use the normal Rand
% function given that I believe it is actually adopted from the logitic map
% equation and other nonlinear mathematics/dynamics. So we will use this
% function in order to simulate the actual seizure. 




% So from our output  "change in voltage with epilepsy.Png" here we can see
% that we are getting pretty crazy random values and it does look
% relatively like a seizure which is great. What we need to do now is model
% this so that it can randomly occur over the time period and then we need
% to be able to detect that which we will do with our chv which is our
% change in voltage which should be ~0 under normal conditions. 

%randomly occuring over the time period:


% I think a simple easy solution to make this truly random would be to do
% something like this:

ProbSeiz2=randi([1,klokmax],1,klokmax); 
%we will say that if this is 1 there is a seizure that day but it can't
%happen on consecutive days

is2= randi(klokmax,[1,klokmax]);
Seiz2= ProbSeiz2 == is2;
isSeiz2=zeros(1,klokmax);

% since we are saying the seizure can't happen on consecutive days it also
% can't occure twice in the same day. So this needs to be altered. 

for i=1:length(isSeiz2)
    if Seiz2(i)==1 
        Seiz2(i+1:end)=0; %this should ensure that no matter what we only get 1 per day
        isSeiz2(i:end)=Seiz2(i:end);
        break
    else
        isSeiz2(i)=Seiz2(i);
    end
end
klokSeiz=find(isSeiz2);


% % We will use this to dictate if there is a seizure or not 
% 
% if ~isempty(klokSeiz)
%     Seizure_Happens
% else
%     HH
% end

% 
% ProbSeiz2=randi([1,klokmax],1,klokmax); 
% is2= randi(klokmax,[1,klokmax]);
% Seiz2= ProbSeiz2 == is2;

isSeiz2=zeros(1,klokmax);

for j=1:length(isSeiz)
    if isSeiz(j)==1
        ProbSeiz2=randi([1,klokmax],1,klokmax); 
        is2= randi(klokmax,[1,klokmax]);
        Seiz2= ProbSeiz2 == is2;
        for i=1:length(isSeiz2)
            if Seiz2(i)==1 
               Seiz2(i+1:end)=0; 
               isSeiz2(i:end)=Seiz2(i:end);
               break
            else
                isSeiz2(i)=Seiz2(i);
            end
        end
        klokSeiz=find(isSeiz2)
    end
end

