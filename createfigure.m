function createfigure(X1, Y1)
%CREATEFIGURE(X1, Y1)
%  X1:  vector of x data
%  Y1:  vector of y data

%  Auto-generated by MATLAB on 27-Jan-2020 15:26:45

% Create figure
figure1 = figure;

% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

% Create plot
plot(X1,Y1,'Marker','*','LineStyle','none');

% Create ylabel
ylabel('periode (s)');

% Create xlabel
xlabel('tid (s)');

box(axes1,'on');
