% ばねマスダンパ系にアクチュエータを加えたシミュレーション
clear;
clc;
close all;

% パラメータ設定
m1 = 1;      % 質点の質量 [kg]
k1 = 10;     % ばね定数 [N/m]
c1 = 1;    % ダンパ定数 [N/(m/s)]
m2 = 5;      % 質点の質量 [kg]
k2 = 20;     % ばね定数 [N/m]
c2 = 2;    % ダンパ定数 [N/(m/s)]

% 初期条件
x1 = 1;     % 初期変位 [m]
v1 = 0;     % 初期速度 [m/s]
x2 = 2;     % 初期変位 [m]
v2 = 0;     % 初期速度 [m/s]

% 目標行列
r = [0 0 0 0]';

% 状態空間表現
A = [0 1 0 0; -(k1+k2)/m1 -(c1+c2)/m1 k2/m1 c2/m1;0 0 0 1;k2/m2 c2/m2 -k2/m2 -c2/m2];
B = [0 0;1/m1 0;0 0;0 1/m2];
C = [1 0 0 0;0 0 1 0];
D = [0 0;0 0];
sys = ss(A,B,C,D);
sys


%% check if system is controllable / observable
%対角正準形
[csys,T] = canon(sys,'modal');
csys

%可制御性行列
Co = ctrb(A,B);
Unco = length(A)-rank(Co)%ここが0になったら可制御

%可観測性行列
Ob = obsv(A,C);
Unob = length(A)-rank(Ob)%ここが0になったら可観測

%LQRゲイン算出
Q = 30*diag([1 1 1 1]);
R = 1*diag([1 1]);
% K = lqr(A,B,Q,R);%状態フィードバックゲイン取得
P = care(A,B,Q,R);%リカッチ方程式を解くことで行列Ｐを導出
K = inv(R)*B'*P;%状態FBゲイン導出

%Kalman
Q_kal = 1e-2;
R_kal = 1e-2;
% Q_kal = 1e-2*diag([1 1 1 1]);
% R_kal = 1e-2*diag([1 1]);

%% シミュレーション
% シミュレーション時間
Tf = 30;
dt = 0.01;

% シミュレーション条件
control_on = true;
idealFB_on = false;
noise_on = false;
estimation_on = true;

% 周期
control_period = 0.01;
estimation_period = 0.01;

% 運動方程式の数値解法
sim("LQR_Kalman.slx");

%結果のプロット
if estimation_on
    run("est_plot.m")
else
    run("nonest_plot.m")
end

%% 周波数解析
w = [1e-2 1e2];
[z p k] = zpk(csys)