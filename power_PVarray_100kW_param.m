% System frequency (Hz):
Fnom=60;
% Time simulation
Simulation_Time = 0.4;
% Specialized Power Systems sample time (s):
Ts_Power=1/(33*Fnom)/100;
% Inverter Control system sample time (s):
Ts_Control=10*Ts_Power; 
% *****************************************************************
%                    CONTROL PARAMETERS
% *****************************************************************

% MPPT Control (Perturb & Observe Algorithm)

Dinit = 0.5;
Increment_MPPT= 0.01;     % Increment value used to increase/decrease Vdc_ref
Limits_MPPT= [ 1 0 ]; % Upper & Lower limit for D (V)


% *****************************************************************
%                         POWER PARAMETERS
% *****************************************************************
Pnom = 100e3;      % Inverter nominal 3-phase power (VA)
Vnom_prim = 25e3;  % Nominal inverter primary line-to-line voltage(Vrms)
Vnom_dc = 240;     % Nominal DC link voltage (Vrms)
