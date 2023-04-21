figure(1)
subplot(1,3,1)
histogram(reshape(err_MC(1,1,:),1,ntrials - failcnt), 'FaceColor', 'black');
hold on
plot(-3*err_std(1,1)*[1,1], ylim, ':', 'Color', rgb('LightCoral'), 'LineWidth', 1);
plot(3*err_std(1,1)*[1,1], ylim, ':', 'Color', rgb('LightCoral'), 'LineWidth', 1);
plot(err_mean(1,1)*[1,1], ylim,':', 'Color', rgb('Aquamarine'), 'LineWidth', 1);
set(gca, 'Color', rgb('Gainsboro'));
xlabel('X [km]');
ylabel('Trials [N = 1000]');
grid("on")

subplot(1,3,2)
histogram(reshape(err_MC(2,1,:),1,ntrials - failcnt), 'FaceColor', 'black');
hold on
plot(-3*err_std(2,1)*[1,1], ylim, ':', 'Color', rgb('LightCoral'), 'LineWidth', 1);
plot(3*err_std(2,1)*[1,1], ylim, ':', 'Color', rgb('LightCoral'), 'LineWidth', 1);
plot(err_mean(2,1)*[1,1], ylim,':', 'Color', rgb('Aquamarine'), 'LineWidth', 1);
set(gca, 'Color', rgb('Gainsboro'));
xlabel('Y [km]')
grid("on")

subplot(1,3,3)
histogram(reshape(err_MC(3,1,:),1,ntrials - failcnt), 'FaceColor', 'black');
hold on
plot(-3*err_std(3,1)*[1,1], ylim, ':', 'Color', rgb('LightCoral'), 'LineWidth', 1);
plot(3*err_std(3,1)*[1,1], ylim, ':', 'Color', rgb('LightCoral'), 'LineWidth', 1);
plot(err_mean(3,1)*[1,1], ylim,':', 'Color', rgb('Aquamarine'), 'LineWidth', 1);
set(gca, 'Color', rgb('Gainsboro'));
xlabel('Z [km]')
grid("on")

if save_plt
    matlab2tikz('IM1_err.tex','height','\figureheight','width','\figurewidth','parseStrings',false);
end

figure(2)
subplot(1,3,1)
histogram(reshape(err_MC(1,2,:),1,ntrials - failcnt), 'FaceColor', 'black');
hold on
plot(-3*err_std(1,2)*[1,1], ylim, ':', 'Color', rgb('LightCoral'), 'LineWidth', 1);
plot(3*err_std(1,2)*[1,1], ylim, ':', 'Color', rgb('LightCoral'), 'LineWidth', 1);
plot(err_mean(1,2)*[1,1], ylim,':', 'Color', rgb('Aquamarine'), 'LineWidth', 1);
set(gca, 'Color', rgb('Gainsboro'));
xlabel('X [km]');
ylabel('Trials [N = 1000]');
grid("on")

subplot(1,3,2)
histogram(reshape(err_MC(2,2,:),1,ntrials - failcnt), 'FaceColor', 'black');
hold on
plot(-3*err_std(2,2)*[1,1], ylim, ':', 'Color', rgb('LightCoral'), 'LineWidth', 1);
plot(3*err_std(2,2)*[1,1], ylim, ':', 'Color', rgb('LightCoral'), 'LineWidth', 1);
plot(err_mean(2,2)*[1,1], ylim,':', 'Color', rgb('Aquamarine'), 'LineWidth', 1);
set(gca, 'Color', rgb('Gainsboro'));
xlabel('Y [km]')
grid("on")

subplot(1,3,3)
histogram(reshape(err_MC(3,2,:),1,ntrials - failcnt), 'FaceColor', 'black');
hold on
plot(-3*err_std(3,2)*[1,1], ylim, ':', 'Color', rgb('LightCoral'), 'LineWidth', 1);
plot(3*err_std(3,2)*[1,1], ylim, ':', 'Color', rgb('LightCoral'), 'LineWidth', 1);
plot(err_mean(3,2)*[1,1], ylim,':', 'Color', rgb('Aquamarine'), 'LineWidth', 1);
set(gca, 'Color', rgb('Gainsboro'));
xlabel('Z [km]')
grid("on")

if save_plt
    matlab2tikz('IM2_err.tex','height','\figureheight','width','\figurewidth','parseStrings',false);
end

figure(3)
subplot(1,3,1)
histogram(reshape(err_MC(1,3,:),1,ntrials - failcnt), 'FaceColor', 'black');
hold on
plot(-3*err_std(1,3)*[1,1], ylim, ':', 'Color', rgb('LightCoral'), 'LineWidth', 1);
plot(3*err_std(1,3)*[1,1], ylim, ':', 'Color', rgb('LightCoral'), 'LineWidth', 1);
plot(err_mean(1,3)*[1,1], ylim,':', 'Color', rgb('Aquamarine'), 'LineWidth', 1);
set(gca, 'Color', rgb('Gainsboro'));
xlabel('X [km]');
ylabel('Trials [N = 1000]');
grid("on")

subplot(1,3,2)
histogram(reshape(err_MC(2,3,:),1,ntrials - failcnt), 'FaceColor', 'black');
hold on
plot(-3*err_std(2,3)*[1,1], ylim, ':', 'Color', rgb('LightCoral'), 'LineWidth', 1);
plot(3*err_std(2,3)*[1,1], ylim, ':', 'Color', rgb('LightCoral'), 'LineWidth', 1);
plot(err_mean(2,3)*[1,1], ylim,':', 'Color', rgb('Aquamarine'), 'LineWidth', 1);
set(gca, 'Color', rgb('Gainsboro'));
xlabel('Y [km]')
grid("on")

subplot(1,3,3)
histogram(reshape(err_MC(3,3,:),1,ntrials - failcnt), 'FaceColor', 'black');
hold on
plot(-3*err_std(3,3)*[1,1], ylim, ':', 'Color', rgb('LightCoral'), 'LineWidth', 1);
plot(3*err_std(3,3)*[1,1], ylim, ':', 'Color', rgb('LightCoral'), 'LineWidth', 1);
plot(err_mean(3,3)*[1,1], ylim,':', 'Color', rgb('Aquamarine'), 'LineWidth', 1);
set(gca, 'Color', rgb('Gainsboro'));
xlabel('Z [km]')
grid("on")

if save_plt
    matlab2tikz('IM3_err.tex','height','\figureheight','width','\figurewidth','parseStrings',false);
end

figure(4)
subplot(1,3,1)
histogram(err_vel(1,:), 'FaceColor', 'black');
hold on
plot(-3*vel_std(1)*[1,1], ylim, ':', 'Color', rgb('LightCoral'), 'LineWidth', 1);
plot(3*vel_std(1)*[1,1], ylim, ':', 'Color', rgb('LightCoral'), 'LineWidth', 1);
plot(vel_mean(1)*[1,1], ylim,':', 'Color', rgb('Aquamarine'), 'LineWidth', 1);
set(gca, 'Color', rgb('Gainsboro'));
xlabel('Vx [m/s]');
ylabel('Trials [N = 1000]');
grid("on")

subplot(1,3,2)
histogram(err_vel(2,:), 'FaceColor', 'black');
hold on
plot(-3*vel_std(2)*[1,1], ylim, ':', 'Color', rgb('LightCoral'), 'LineWidth', 1);
plot(3*vel_std(2)*[1,1], ylim, ':', 'Color', rgb('LightCoral'), 'LineWidth', 1);
plot(vel_mean(2)*[1,1], ylim,':', 'Color', rgb('Aquamarine'), 'LineWidth', 1);
set(gca, 'Color', rgb('Gainsboro'));
xlabel('Vy [m/s]');
grid("on")

subplot(1,3,3)
histogram(err_vel(3,:), 'FaceColor', 'black');
hold on
plot(-3*vel_std(3)*[1,1], ylim, ':', 'Color', rgb('LightCoral'), 'LineWidth', 1);
plot(3*vel_std(3)*[1,1], ylim, ':', 'Color', rgb('LightCoral'), 'LineWidth', 1);
plot(vel_mean(3)*[1,1], ylim,':', 'Color', rgb('Aquamarine'), 'LineWidth', 1);
set(gca, 'Color', rgb('Gainsboro'));
xlabel('Vz [m/s]');
grid("on")

if save_plt
    matlab2tikz('V2_err.tex','height','\figureheight','width','\figurewidth','parseStrings',false);
end