% ばねマスダンパ系にアクチュエータを加えたシミュレーション
clear;
clc;
close all;

% パラメータ設定
m = 1;      % 質点の質量 [kg]
k = 10;     % ばね定数 [N/m]
c = 1;    % ダンパ定数 [N/(m/s)]
u = @(t) 0*sin(t);  % アクチュエータの入力関数（例：sin関数）

% 初期条件
x0 = 1;     % 初期変位 [m]
v0 = 0;     % 初期速度 [m/s]

% シミュレーション時間
tspan = 0:0.01:15;   % 0から5秒まで0.01秒刻みでシミュレーション

% 質点の運動方程式
f = @(t, y) [y(2); (-k*y(1) - c*y(2) + u(t))/m];   % y(1)が変位, y(2)が速度

% 初期条件をベクトルにまとめる
y0 = [x0; v0];

% 運動方程式の数値解法
options = odeset('RelTol', 1e-6, 'AbsTol', 1e-6);   % 数値解法のオプション
[t, y] = ode45(f, tspan, y0, options);             % ode45関数による数値解法

% 結果のプロット
figure;
plot(t, y(:,1), 'b-', 'LineWidth', 2);    % 変位のプロット
xlabel('Time [s]');
ylabel('Displacement [m]');
title('Displacement vs Time');

figure;
plot(t, y(:,2), 'r-', 'LineWidth', 2);    % 速度のプロット
xlabel('Time [s]');
ylabel('Velocity [m/s]');
title('Velocity vs Time');
