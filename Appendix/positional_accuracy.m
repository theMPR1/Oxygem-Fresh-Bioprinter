%% Axis Positioning Error
clear; 
close all;

% ── Data ─────────────────────────────────────────────────────────────────
nom = [0,1,2,3,4,5,6,5,4,3,2,1,0];

X_cor  = [0,0,0,0,0,0,0,-5,-5,-5,-5,-5,-5];
X_unc  = [0,-60,-70,-90,-100,-100,-100,-80,-60,-40,-10,-20,0];

Y_cor  = [0,0,0,0,0,0,0,-10,-5,-10,-10,-5,-10];
Y_unc  = [0,-10,-35,-40,-50,-70,-80,-75,-65,-60,-45,-30,-10];

Z_cor  = [10,0,0,0,0,0,0,-5,0,0,-5,0,5];
Z_unc  = [0,-30,-40,-30,-30,-40,-50,-40,-30,-30,-40,-40,0];

data = {X_cor, X_unc, 'X-axis'; ...
        Y_cor, Y_unc, 'Y-axis'; ...
        Z_cor, Z_unc, 'Z-axis'};

% ── Style ────────────────────────────────────────────────────────────────
col_cor   = [0.106 0.420 0.749];   % blue  — corrected
col_unc   = [0.749 0.149 0.141];   % red   — uncorrected
col_shade = [0.188 0.533 0.800];   % light blue fill between curves
font_name = 'Helvetica Neue';

% ── Figure ───────────────────────────────────────────────────────────────
fig = figure('Units','centimeters', 'Position',[2 2 18 22], ...
             'Color','white', 'PaperPositionMode','auto');

for i = 1:3
    cor  = data{i,1};
    unc  = data{i,2};
    lbl  = data{i,3};

    ax = subplot(3,1,i);
    hold on;

    % Zero reference
    yline(0, 'Color',[0.55 0.55 0.55], 'LineWidth',0.75, ...
          'LineStyle',':', 'HandleVisibility','off');

    % Uncorrected — solid red
    plot(nom, unc, '-o', ...
         'Color',          col_unc, ...
         'LineWidth',       1.5,    ...
         'MarkerSize',      5,      ...
         'MarkerFaceColor', col_unc, ...
         'MarkerEdgeColor', col_unc, ...
         'DisplayName',    'Uncorrected');

    % Corrected — solid blue
    plot(nom, cor, '-o', ...
         'Color',          col_cor, ...
         'LineWidth',       1.8,    ...
         'MarkerSize',      5,      ...
         'MarkerFaceColor', col_cor, ...
         'MarkerEdgeColor', col_cor, ...
         'DisplayName',    'Corrected');

    % Axes
    xlim([0 6]);
    ylim([-110 30]);
    yticks(-100:25:25);
    xticks(0:1:6);
    grid on;

    ax.FontName        = font_name;
    ax.FontSize        = 9.5;
    ax.LineWidth       = 0.7;
    ax.Box             = 'on';
    ax.XColor          = [0.20 0.20 0.20];
    ax.YColor          = [0.20 0.20 0.20];
    ax.GridColor       = [0.75 0.75 0.75];
    ax.GridAlpha       = 0.6;
    ax.GridLineStyle   = ':';
    ax.TickDir         = 'out';
    ax.TickLength      = [0.012 0.025];
    ax.Layer           = 'top';

    % Y-label on every panel
    ylabel('Error (\mum)', ...
           'FontSize',10, 'FontName',font_name);

    % X-label only on bottom panel
    if i == 3
        xlabel('Nominal position (mm)', ...
               'FontSize',10, 'FontName',font_name);
    else
        ax.XTickLabel = {};
    end

    title(lbl, 'FontSize',11, 'FontName',font_name);

    % Legend — only on first panel to avoid repetition
    if i == 1
        leg = legend('Location','east', ...
                     'FontSize',9, 'FontName',font_name, ...
                     'Box','on', 'EdgeColor',[0.80 0.80 0.80]);
        leg.BoxFace.ColorType = 'truecoloralpha';
        leg.BoxFace.ColorData = uint8([255 255 255 220]');
    end
end

% ── Tighten subplot spacing ──────────────────────────────────────────────
set(gcf,'Units','normalized');
subplots = findall(fig,'Type','axes');
for k = 1:numel(subplots)
    pos = subplots(k).Position;
    subplots(k).Position = [pos(1)+0.04, pos(2), pos(3)-0.04, pos(4)];
end

% ── Export ───────────────────────────────────────────────────────────────
% exportgraphics(fig,'axis_errors.pdf','ContentType','vector','BackgroundColor','white');
% exportgraphics(fig,'axis_errors.png','Resolution',300,'BackgroundColor','white');