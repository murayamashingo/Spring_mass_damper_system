fig1 = figure(1);
plot(x1_output.Time, x1_output.Data, 'b-', 'LineWidth', 2);    % 変位のプロット
xlabel('Time [s]');
ylabel('Position [m]');
grid;
xlim([0 Tf]);
ax = gca;
ax.FontSize = 18;
legend('$${x}_1$$','Interpreter','Latex','Location','northeast','NumColumns',1)
ax.FontName = 'Times';
movegui(fig1,'northwest');


fig2 = figure(2);
plot(v1_output.Time, v1_output.Data, 'r-', 'LineWidth', 2);    % 速度のプロット
xlabel('Time [s]');
ylabel('Velocity [m/s]');
grid;
xlim([0 Tf]);
ax = gca;
ax.FontSize = 18;
legend('$${v}_1$$','Interpreter','Latex','Location','northeast','NumColumns',1)
ax.FontName = 'Times';
movegui(fig2,'north');

fig3 = figure(3);
plot(x2_output.Time, x2_output.Data, 'b-', 'LineWidth', 2);    % 変位のプロット
xlabel('Time [s]');
ylabel('Position [m]');
grid;
xlim([0 Tf]);
ax = gca;
ax.FontSize = 18;
legend('$${x}_2$$','Interpreter','Latex','Location','northeast','NumColumns',1)
ax.FontName = 'Times';
movegui(fig3,'northeast');


fig4 = figure(4);
plot(v2_output.Time, v2_output.Data, 'r-', 'LineWidth', 2);    % 速度のプロット
xlabel('Time [s]');
ylabel('Velocity [m/s]');
grid;
xlim([0 Tf]);
ax = gca;
ax.FontSize = 18;
legend('$${v}_2$$','Interpreter','Latex','Location','northeast','NumColumns',1)
ax.FontName = 'Times';
movegui(fig4,'southwest');

fig5 = figure(5);
plot(F_output.Time,F_output.Data(:,1),'r', 'LineWidth', 2)
hold on
plot(F_output.Time,F_output.Data(:,2),'b', 'LineWidth', 2)
xlabel('Time [s]');
ylabel('Input [N]');
grid on;
xlim([0 Tf]);
ax = gca;
ax.FontSize = 18;
legend('$${u}_1$$','$${u}_2$$','Interpreter','Latex','Location','northeast','NumColumns',1)
ax.FontName = 'Times';
movegui(fig5,'south');