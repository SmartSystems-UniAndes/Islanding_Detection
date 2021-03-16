%% Create Structures
names = ["LN-fault"];% these are the scenarios we wish to simulate 
simulations = [100, 100, 100, 100 ]; % this are the number of simulations for each scenario
clear structures_array
for i = 1:length(names)
    structures_array(i) = struct('name', names(i), "iterations", simulations(i));
end
%% Collect data set
clc;
% First we need to load the dataset if we alreay have started one
curDir = pwd;
saveDir = "data";
dataset_name = 'dataset_IDM2.mat'; % name defined to the dataset
initial_sample = 10000; % the sample frequency is set to 2e-5s. So this sample is the second 0.2s
final_sample = 17500; % the sample frequency is set to 2e-5s. So this sample is the second 0.35s
cd(saveDir);
try
    load(dataset_name);
catch
    disp('no initial dataset found');
    disp(dataset_name + ' dataset will be created');
end
cd(curDir);


for i = structures_array
    activeP = 90e3; % This is the inital power of the load which will increment utnil 110e3
    d_activeP = (20e3/(i.iterations-1));
    clear data Loading T VPCC_normal label
    switch i.name %we select the current scenario depending on the name.
        % It is important to check which fault is selected in the simulink
        % file and if the circuit breaker of the capacitor is closed or
        % open. Every simulation is set to 0.4s
        case "normal_C_on"
            switching_C = 1;
            switching_PCC = 1;
            switching_fault = 1;
            label = 0;
        case "normal_C_off"
            switching_C = 1;
            switching_PCC = 1;
            switching_fault = 1;
            label = 1;
        case "turning_off_C_load"
            switching_C = 0.2;
            switching_PCC = 1;
            switching_fault = 1;
            label = 2;
        case "turning_on_C_load"
            switching_C = 0.2;
            switching_PCC = 1;
            switching_fault = 1;
            label = 3;
        case "islanding_on_C"
            switching_C = 1;
            switching_PCC = 0.2;
            switching_fault = 1;
            label = 4;
        case "islanding_off_C"
            switching_C = 1;
            switching_PCC = 0.2;
            switching_fault = 1;
            label = 5;
        case "LL-fault"
            switching_C = 1;
            switching_PCC = 1;
            switching_fault = 0.2;
            label = 6;
        case "LN-fault"
            switching_C = 1;
            switching_PCC = 1;
            switching_fault = 0.2;
            label = 7;
    end
    
    for j=1:i.iterations
        current_values = struct();
        sim('power_PVarray_islanding_detection.slx');
        Vabc_concatenated = vertcat(VPCC_normal.signals.values(initial_sample:final_sample, 1),VPCC_normal.signals.values(initial_sample:final_sample, 2),VPCC_normal.signals.values(initial_sample:final_sample, 3));
        transform = helperPlotScalogram(Vabc_concatenated,50000); % this transforms the data to an image
        current_values.load = activeP;
        current_values.data = transform;
        current_values.label = label;
        try
            dataset(end + 1) = current_values;
        catch
            dataset(1) = current_values;
        end
        activeP = activeP + d_activeP; %this changes the active power at the PCC
        fprintf('Current Scenario : %s \n ',i.name);
        fprintf('Iterarion Number : %d \n ',j);
    end
end
cd(saveDir)
save('dataset_IDM2','dataset', '-v7.3');
cd(curDir)

%% Wavelet transform example
%Vabc = vertcat(T{1,2}.signals.values(10000:17500, 1), T{1,2}.signals.values(10000:17500, 2), T{1,2}.signals.values(10000:17500, 3));
%a = abs(cwt(Vabc,50000))
%imagesc(a)
%image = helperPlotScalogram(Vabc,50000);
%image(image > 1) = 1;
%image(image < 0) = 0;
%imshow(image)
%size(transform)