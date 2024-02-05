% ばねマスダンパ系にアクチュエータを加えたシミュレーション
clear;
clc;
close all;

% パラメータ設定
m = 1;      % 質点の質量 [kg]
k = 10;     % ばね定数 [N/m]
c = 1;    % ダンパ定数 [N/(m/s)]

%　制御ゲイン設定
Kp = 10;
Ki = 1;
Kd = 5;

% 初期条件
x0 = 1;     % 初期変位 [m]
v0 = 0;     % 初期速度 [m/s]

% シミュレーション時間
Tf = 15;
dt = 0.01;   % 0から5秒まで0.01秒刻みでシミュレーション

% シミュレーション条件
control_on = true;

% 運動方程式の数値解法
sim("PID_spring_mass_damper_system.slx");

%結果のプロット
figure(1);
plot(x_output.Time, x_output.Data, 'b-', 'LineWidth', 2);    % 変位のプロット
xlabel('Time [s]');
ylabel('Displacement [m]');
grid;
xlim([0 Tf]);
ax = gca;
ax.FontSize = 18;
legend({'{\slx}'},'Location','northeast','NumColumns',1)
ax.FontName = 'Times';
movegui('east');


figure(2);
plot(v_output.Time, v_output.Data, 'r-', 'LineWidth', 2);    % 速度のプロット
movegui('west');
xlabel('Time [s]');
ylabel('Velocity [m/s]');
grid;
xlim([0 Tf]);
ax = gca;
ax.FontSize = 18;
legend({'{\slv}'},'Location','northeast','NumColumns',1)
ax.FontName = 'Times';
movegui('west');

