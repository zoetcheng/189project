
clear all
clc
klokmax=2500;
y=zeros(2,klokmax);
x=1:2500;

           %%%%%%%%%%%%%%%%%% Warning %%%%%%%%%%%%%%%%%%%
%this takes a long time to run so I don't recommend it but this checks the
%difference between the two methods it has to do over 12 million
% iterations and I believe that it runs at O(n^2) time since we have nested
% for loops. 

for j=1:klokmax % added this to see if the two methods are essentially equivalent

    % randi method
for i=1:klokmax
ProbSeiz2=randi([1,klokmax],1,klokmax); 
is2= randi([1,klokmax],1,klokmax);
% is2= ones(1,klokmax);
Seiz2= ProbSeiz2 == is2;
klokSeiz=numel(find(Seiz2));
if isempty(klokSeiz)
    y(1,i)=0;
else
    y(1,i)=klokSeiz;
end
end

% ones method
for i=1:klokmax
ProbSeiz2=randi([1,klokmax],1,klokmax); 
% is2= randi([1,klokmax],1,klokmax);
is2= ones(1,klokmax);
Seiz2= ProbSeiz2 == is2;
klokSeiz=numel(find(Seiz2));
if isempty(klokSeiz)
    y(2,i)=0;
else
    y(2,i)=klokSeiz;
end
end



my1(j)=mean(y(1,:));
my2(j)=mean(y(2,:));

end


disp(strcat("Average randi method:", num2str(mean(my1))))
disp(strcat("Average ones method:", num2str(mean(my2))))

% Given output after one test is that Randi method is 0.99988 and ones
% method output is 0.99975 will likely be the same output if ran again. 

% this means that they both have about the same odds and are essentially
% equivalent. 
