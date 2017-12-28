%% Initiate variables needed for model and choose sampling time
close all, clc

Ts = 0.01;
load('workspace');
HP_engine = 10;
v_ini=20;
open('mc_model_v3_7');
%Initiation RPI LABHALL
%% ROS ination
rosshutdown
 setenv('ROS_MASTER_URI','http://192.168.10.1:11311')
 setenv('ROS_IP','192.168.10.10')
 

 
 %rosinit('http://192.168.1.217:11311')
 deviceRPI=rosdevice('192.168.10.1','mcsim','New4you')
 %
 rosinit(deviceRPI.DeviceAddress)
 %sub = rossubscriber('/unityx','beginner_tutorials/Float32_header')
 Header.Stamp = rostime('now','system');

 % GETFILE
%getFile(deviceRPI,'~/catkin_Simulink/src','C:\Users\ladmin\Documents\MATLAB\matlab_ros_custom_messages')
 
% ROS Generate Message
%rosgenmsg('C:\Users\ladmin\Documents\MATLAB\matlab_ros_custom_messages')
 
%Location of the javaclasspath.txt
%C:\Users\ladmin\AppData\Roaming\MathWorks\MATLAB\R2016b

%Remove path when rebuilding messages
%path //To see the saved paths
%rmpath('C:\Users\ladmin\Documents\MATLAB\matlab_ros_custom_messages\matlab_gen\msggen')
%% Information for washout and washout variables + TM easy
% Modeled after NASAs flight simnulator washout filter, a good strategy and
% explnation can be found in http://publications.lib.chalmers.se/records/fulltext/66675/local_66675.pdf
% (Vehicle Modelling and Washout Filter Tuning for the Chalmers Vehicle
% Simulator, Nikolce Murgovski)

% W11 Highpassfilter for high frequencies for rotational motions 
% W12 Lowpass filter for low frequency translational acceleration, tilt will use the
% filtered and scaled values to emulate these accelerations. (Can't be done wit this rig in another way)
% W21 The rotations effect on tranlational motion:opted to not be used as
% most SOTA washout-filters do not model for this as its effect is neglible
% W22 Highpass filter for translational motion combined with RTZ function

%The parameters need to be choosen for the optimazation of the lowpass
%filter. Note that the vestibicular system must be made ready for
%optimisation

% For tning the filter using Simulink - transfer function that are self build is a better option than using the current setup. The variables in
% the transfer function can be changed on the fly while changing variables with preset functions requires changes in the matlab script and -re
% launching

%Dimensions:
%surge (su) = x , sway (sw) = y,heave  (h) = z
%Roll (r) Rotation around x-axis , Pitch (p) Rotation around y-axis, Rotation around z-axis 

%% Constants
pi = 3.14159265359; %Matlab has it's own constant pi. Can be removed.
g = 9.82; % Gravity constant g
%% W11 - Simple HP filter s/(s+omega) for rotational motions (WRCp) , W11_i= s/(s+omega_i11)
%The minimal order is 1. To save time in tunning the order is kept to 1. Yaw was unused,Roll is bypassing the LP filter in the rotational channel
%Pitch
omega_p11 = 0.6;
W11_p =tf( [1 0],[1 omega_p11]);
%% W12 - Co-ordination channel channel, Low-pass filters (WCCx) and (WCCy)
omega_su12 = 20;
omega_sw12 = 10;
%zeta
zeta_su12 = 1; 
zeta_sw12 = 1;
% Low-pass x- accelerations
W12_su = tf(omega_su12^2,[1,2*zeta_su12*omega_su12,omega_su12^2]);
% Low- pass y- accelerations
W12_sw = tf(omega_sw12^2*10,[1,2*zeta_sw12*omega_sw12,omega_sw12^2*10]);
%% W22 - HP*RTZ highpass for jerks, (WHPTx, WHPy, WPTz)
%HP filter part
omega_su22 = 3*pi/15; 
omega_sw22 = 3*pi/350;
omega_h22 = 3*pi/10;
%zeta
zeta_su22 = 3; 
zeta_sw22 = 6;
zeta_h22 = 1.5;
%rtz poles
omega_rtz_su = 3*pi/2000;
omega_rtz_sw = 3*pi/200;
omega_rtz_h = 3*pi/4;
%s^2/(s^2+2*zeta*omega*s+omega^2)
W22_HPsu = tf([1 0 0],[1 2*zeta_su22*omega_su22 omega_su22^2]);
W22_HPsw = tf([1 0 0],[1 2*zeta_sw22*omega_sw22 omega_sw22^2]);
W22_HPh = tf([1 0 0],[1 2*zeta_h22*omega_h22 omega_h22^2]);
%RTZ
RTZsu = tf([1 0], [1 omega_rtz_su]);
RTZsw = tf([1 0], [1 omega_rtz_sw]);
RTZh = tf([1 0], [1 omega_rtz_h]);
W22_su = W22_HPsu*RTZsu;
W22_sw = W22_HPsw*RTZsw;
W22_h = W22_HPh*RTZh;
%% Boding plots
% Used for analysing frequency responses
% %Translational channel (W22)
figure(1)
hold on;
subplot(311);
bode(W22_su);
title('Bode of translational channel for x, W_{HPTx}')
subplot(312);
bode(W22_sw);
title('Bode of translational channel for y, W_{HPTy}')
hold on;
subplot(313);
bode(W22_h);
title('Bode of translational channel for z, W_{HPTz} ')
hold off;
% %Rotational channel (W11)
figure(2);
bode(W11_p);
title('Bode of rotational channel filter for pitch angle, W_{RCpitch}')
% LP to tilt coordination (W12)
figure(3)
bode(W12_su);
title('Bode of co-ordination channel filter for x_{acc}, W_{CCx}')
figure(4)
bode(W12_sw);
title('Bode of co-ordination channel filter for y_{acc}, W_{CCy}')
%% Scalers/gains/limits

%/GENERIC-02-23-0000-ICD-0001-R01-Interface, page 4 for accelerations
%Translational output limits POSISTION in m
surge_max = 0.181; surge_min = -0.142;
sway_max =0.146 ; sway_min = -0.146;
heave_max = 0.094; heave_min = -0.09;

%Translational output ACCELERATION in (m/s^2)
surge_acc_max = 6; surge_acc_min = -6; sway_acc_max = 6; sway_acc_min =-6;%GENERIC-02-23-0000-ICD-0001-R01-Interface, page 4 for accelerations
heave_acc_max =8; heave_acc_min =-8;

%% Simulink Limits and gains
%Translational channel 
scale_x_in = 6; %LIMITS, -6 m/s^2 to +6 m/s^2 for x accelerations
scale_y_in= 6; %LIMITS, -6 m/s^2 to +6 m/s^2 for y accelerations
scaled_z_in = 3; %LIMITS, -6 m/s^2 to +6 m/s^2 for z accelerations

gain_x_in =0.5; % Gain for x accelerations
gain_y_in =0.25; % Gain for y accelerations
gain_z_in =1; % Gain for z acceleration

% Co-ordination channel
scale_x_to_rot = 1;  %LIMITS, -6 m/s^2 to +6 m/s^2 for x accelerations to be transformed
scale_y_to_rot = 0.22;% LIMITS on y accelerations to be transformed

gain_scale_x_to_rot = 3; %Gain on x accelerations to be transformed
gain_scale_y_to_rot = 1.8;% Gain on y accelerations to be transformed

%% Rotational channel
%Maximum/minum accelerations from the motion platform: 200deg/s^2=2.23rad/s^2
roll_acc_max =2.23; roll_acc_min =-2.23 ; pitch_acc_max = 2.23; pitch_acc_min = -2.23; yaw_acc_max = 2.23; yaw_acc_min = 2.23 ;
%Maximum angle
roll_abs =17.3*pi/180;
pitch_abs =16.7*pi/180;
yaw_abs =27*pi/180;

%Limits
roll_abs =17.3*pi/180;
pitch_abs =16.7*pi/180;

%gains
gain_scale_pitch_in = 1;
gain_scale_roll_in = 1;


%% Vestibular system
%best model suited for simulation (architecture of driing simulations, chp2 [2.4 and 2.6])
%semi circular canals (x)
%x
Kscs = 5.73;
Ta = 80; T1 = 5.73;
%otolith (x)
Koto = 0.4;
TL=13.2;T1 =5.33; T2 = 0.66;%
% The vestibular system is modeled differently for every axis
%% Function to calculate engine torque curves:
xT=[3500, 4400, 5400, 6400, 7600, 8200, 8700, 9500, 9900, 10300, 11000, 11550];
yT=[18.02, 24.36, 29.69, 34.69, 43.5, 49.12, 52.1, 53.92, 53.01, 52.02, 47.83, 41.22];
nT=4;
[EnginePoly,S]=polyfit(xT,yT,nT);

xT1=[3500, 4400, 5400, 6400, 7600, 8200, 8700, 9500, 9900, 10300, 11000, 11550];
yT1=[54, 54, 54, 54, 54, 45, 35, 20, 10, 0, -10, -20];
nT1=5;
[EnginePolyGear1,S1]=polyfit(xT1,yT1,nT1);

v_ini=20;
%% TM
%Constants for tire model easy
%Uncomment this section for testing TM easy

 v_d = 1;   %m/s % Fictious speed
 dF0_x = 60*10^3;   % N
 dF0_y = 40*10^3;   % N
 
 sM_x = 0.11;       % 1
 sM_y = 0.2;          % 1
 
 FM_x = 1.1 *10^3;  % N
 FM_y = 1.4*10^3;   % N
 
 sS_x = 0.4;        % 1
 sS_y = 0.7;        % 1
 
 FS_x = 2*10^3;     % N
 FS_y = 2*10^3;     % N
 
 phi = 0; % Steer angle, TA bort denna MArcus & Karl

 slip_x= 1;
 slip_y=1;
 s_x_hat = sM_x /(sM_x+sM_y);
 s_y_hat = sM_y /(sM_x+sM_y);
 dF0 = sqrt((dF0_x * s_x_hat * cos(phi))^2 +(dF0_y * s_y_hat * sin(phi))^2);
 sM = sqrt(((sM_x / s_x_hat) * cos(phi))^2 +(sM_y / s_y_hat) * sin(phi))^2;
 FM = sqrt((FM_x * cos(phi))^2 + (FM_y*sin(phi))^2);
 sS = sqrt(((sS_x/s_x_hat)*cos(phi))^2 +( (sS_y/s_y_hat)*sin(phi))^2);
 FS = sqrt((FS_x *cos(phi))^2 + (FS_y * sin(phi))^2);
 s_star = sM + 0.2;
 a_transition = -(dF0/sM) * (FM/(dF0*sM))^2;
 b_transition = a_transition;