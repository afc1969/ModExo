Colors = linspecer(6); 

%% VARIABLE EDITING
ms_to_s = 1/1000; % converts miliseconds to seconds
qc_to_rad = 2*pi/200000; % converts quadrature counts to radians
l = 0.105; % length of the torque arm in cm
g = 9.81; % gravity

m = zeros(length(Timems),1); % masses used in experiment 1
m_2 = zeros(length(Timems2),1); % masses used in experiment 2

m(1:308) = 5; % mass of 5kg
m(308:1126) = 0.5288; % mass of 0.5288kg
m(1126:length(Timems)) = 2*1.0687; % 2 masses of 1.0687kg

m_2(1:310) = 5; % mass of 5kg
m_2(310:1100) = 0.5288; % mass of 0.5288kg
m_2(1100:length(Timems2)) = 2*1.0687; % 2 masses of 1.0687kg

Torque = l*g*m*1000; % Torque given in mNm
Torque2 = l*g*m_2*1000; % Torque given in mNm

% use the code below delete lines not necessary
% initial=1;
% final=2000;
%
%  for i = 1:(final-initial+1)
%    Encoder(initial,:) = [];
%    EPOSCurrent(initial,:) = [];
%    EPOSPosition(initial,:) = [];
%    LoadCell(initial,:) = [];
%    SampleNumber10000samplespersecond(initial,:) = [];
%    Timems(initial,:) = [];
%    X1(initial,:) = [];
%    X2(initial,:) = [];
%    X3(initial,:) = [];
%  end

%% TRACKING PERFORMANCE PLOT FOR TEST 1
figure('Units', 'pixels', ...
    'Position', [100 100 600 300]);
grid on
hold on

% h1encoder = plot(Timems*ms_to_s, Encoder*qc_to_rad);
% h1eposposition = plot(Timems*ms_to_s, EPOSPosition*qc_to_rad);
h1loadcell = plot(Timems*ms_to_s, LoadCell);
h1torque = plot(Timems*ms_to_s, Torque);

set(h1loadcell                       , ...
  'LineWidth'       ,    2        , ...
  'LineStyle'       , '-'      , ...
  'color'          , Colors(2,:)     );

set(h1torque                       , ...
 'LineWidth'       ,    2        , ...
 'LineStyle'       , '-'        , ...
 'color'          , Colors(1,:)     );

h1Legend = legend( ...
  [h1loadcell, h1torque], ...
  'LoadCell Data', ...
  'Calculated Torque', ...
  'location', 'NorthEast' );

% TrackingTitle  = title ('My Publication-Quality Graphics');
h1YLabel = ylabel('Torque (mNm)');
h1XLabel = xlabel('time (s)');

set([h1Legend, gca]             , ...
    'FontSize'   , 13           );

set( gca                       , ...
    'FontSize',         15     , ...
    'FontName'   , 'Helvetica' );

set(gca, ...
  'XMinorTick'  , 'on'      , ...
  'YMinorTick'  , 'on'      , ...
  'YGrid'       , 'off'      , ...
  'LineWidth'   , 1         );

set([h1XLabel, h1YLabel], ...
    'FontName'   , 'AvantGarde');

% axis([57 59 0 2])

% saveas(gcf,'20170707-delay_test_1_response.png')
% savefig('03_sin_sin_response')

%% TRACKING PERFORMANCE PLOT FOR TEST 2
figure('Units', 'pixels', ...
    'Position', [100 100 600 300]);
grid on
hold on

% h2encoder = plot(Timems2*ms_to_s, Encoder2*qc_to_rad);
h2eposposition = plot(Timems2*ms_to_s, EPOSPosition2*qc_to_rad);
h2loadcell = plot(Timems2*ms_to_s, LoadCell2);
h2torque = plot(Timems2*ms_to_s, Torque2);

set(h2loadcell                       , ...
  'LineWidth'       ,    2        , ...
  'LineStyle'       , '-'      , ...
  'color'          , Colors(2,:)     );

set(h2torque                       , ...
 'LineWidth'       ,    2        , ...
 'LineStyle'       , '-'        , ...
 'color'          , Colors(1,:)     );

h2Legend = legend( ...
  [h2loadcell, h2torque], ...
  'LoadCell2 Data', ...
  'Calculated Torque', ...
  'location', 'NorthEast' );

% TrackingTitle  = title ('My Publication-Quality Graphics');
h2YLabel = ylabel('Torque (mNm)');
h2XLabel = xlabel('time (s)');

set([h2Legend, gca]             , ...
    'FontSize'   , 13           );

set( gca                       , ...
    'FontSize',         15     , ...
    'FontName'   , 'Helvetica' );

set(gca, ...
  'XMinorTick'  , 'on'      , ...
  'YMinorTick'  , 'on'      , ...
  'YGrid'       , 'off'      , ...
  'LineWidth'   , 1         );

set([h2XLabel, h2YLabel], ...
    'FontName'   , 'AvantGarde');

% axis([28 30 0 2])

% saveas(gcf,'20170707-delay_test_2_response.png')
% savefig('03_sin_sin_response')

%% TRACKING PERFORMANCE PLOT FOR TEST 3
% figure('Units', 'pixels', ...
%     'Position', [100 100 600 300]);
% figure;
% hold on;
% hold on
% grid on
% 
% hold on
% h3encoder = plot(Timems2*ms_to_s, Encoder2*qc_to_rad);
% h3eposposition = plot(Timems2*ms_to_s, EPOSPosition2*qc_to_rad);
% h1model = plot(t,x_m(1,:));
% 
% set(h3encoder                       , ...
%   'LineWidth'       ,    2        , ...
%   'LineStyle'       , '-'      , ...
%   'color'          , Colors(2,:)     );
% 
% set(h3eposposition                       , ...
%   'LineWidth'       ,    2        , ...
%   'LineStyle'       , '-'        , ...
%   'color'          , Colors(1,:)     );
% 
% h3Legend = legend( ...
%   [h3encoder, h3eposposition], ...
%   '\theta_{Reference}', ...
%   '\theta_{Tracking}'           , ...
%   'location', 'NorthEast' );
% 
% TrackingTitle  = title ('My Publication-Quality Graphics');
% h3YLabel = ylabel('\theta (rad)');
% h3XLabel = xlabel('time (s)');
% 
% 
% set([h3Legend, gca]             , ...
%     'FontSize'   , 13           );
% 
% set( gca                       , ...
%     'FontSize',         15     , ...
%     'FontName'   , 'Helvetica' );
% 
% set(gca, ...
%   'XMinorTick'  , 'on'      , ...
%   'YMinorTick'  , 'on'      , ...
%   'YGrid'       , 'off'      , ...
%   'LineWidth'   , 1         );
% 
% set([h3XLabel, h3YLabel], ...
%     'FontName'   , 'AvantGarde');
% 
% axis([43 45 0 2])
% 
% print -r3500 % set resolution
% saveas(gcf,'20170707-delay_test_3_response.png')
% savefig('03_sin_sin_response')