figure(1);
plot(x1_output.Time, x1_output.Data, 'b-', 'LineWidth', 2);    % 変位のプロット
xlabel('Time [s]');
ylabel('Displacement [m]');
grid;
xlim([0 Tf]);
ax = gca;
ax.FontSize = 18;
legend({'{\slx}_1'},'Location','northeast','NumColumns',1)
ax.FontName = 'Times';
movegui('northwest');


figure(2);
plot(v1_output.Time, v1_output.Data, 'r-', 'LineWidth', 2);    % 速度のプロット
xlabel('Time [s]');
ylabel('Velocity [m/s]');
grid;
xlim([0 Tf]);
ax = gca;
ax.FontSize = 18;
legend({'{\slv}_1'},'Location','northeast','NumColumns',1)
ax.FontName = 'Times';
movegui('north');

figure(3);
plot(x2_output.Time, x2_output.Data, 'b-', 'LineWidth', 2);    % 変位のプロット
xlabel('Time [s]');
ylabel('Displacement [m]');
grid;
xlim([0 Tf]);
ax = gca;
ax.FontSize = 18;
legend({'{\slx}_2'},'Location','northeast','NumColumns',1)
ax.FontName = 'Times';
movegui('northeast');


figure(4);
plot(v2_output.Time, v2_output.Data, 'r-', 'LineWidth', 2);    % 速度のプロット
xlabel('Time [s]');
ylabel('Velocity [m/s]');
grid;
xlim([0 Tf]);
ax = gca;
ax.FontSize = 18;
legend({'{\slv}_2'},'Location','northeast','NumColumns',1)
ax.FontName = 'Times';
movegui('southwest');