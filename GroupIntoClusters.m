% Clustering MUPs
clear all 
clc
close all
load EMG_1
[clusters,fuzzy_membership,objective_fun] = fcm(MUPs,3);
% plotting clusters
figure
plot(clusters(1,:),'r')
hold on
plot(clusters(2,:),'k')
hold on
plot(clusters(3,:),'y')
title('cluster centers')
xlabel(' features ')
ylabel('Motor Unit Potential')
% Objective Function during Iterations
figure
plot(objective_fun)
title('Objective Function Values')
xlabel('Iteration Count')
ylabel('Objective Function Value')
% plotting fuzzy membership matrix 
figure
fuzzy_membership=fuzzy_membership';
plot(fuzzy_membership(:,1),'.r')
hold on
plot(fuzzy_membership(:,2),'.k')
hold on
plot(fuzzy_membership(:,3),'.y')
title('fuzzy membership Values')
xlabel(' samples ')
ylabel('Membership Value')
c1=[]; 
c2=[];
c3=[]; 
j=1;
for i=1:303 
    if fuzzy_membership(i,1) > fuzzy_membership(i,2) & fuzzy_membership(i,1) > fuzzy_membership(i,3)
        c1(i,:)=MUPs(i,:);
    else if fuzzy_membership(i,2) > fuzzy_membership(i,1) & fuzzy_membership(i,2) > fuzzy_membership(i,3)
        c2(i,:)=MUPs(i,:);
        else
            c3(i,:)=MUPs(i,:);
        end
    end
end
% plotting clustered MUPs
figure
c1=c1';
plot(c1)
title('MUPs related to Cluster 1')
xlabel(' features ')
ylabel('value')
figure
c2=c2';
plot(c2)
title('MUPs related to Cluster 2')
xlabel(' features ') 
ylabel('value')
figure
c3=c3';
plot(c3)
title('MUPs related to Cluster 3')
xlabel(' features ') 
ylabel('value')
% plotting MUPs together
figure
plot(c1)
hold on
plot(c2)
hold on
plot(c3)
title('MUPSs')
xlabel(' features ') 
ylabel('value')
