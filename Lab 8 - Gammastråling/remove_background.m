function [x, background, I_max] = remove_background(start, stop, I, E, plot_title)
slope = (E(stop) - E(start))/(stop - start);
x = linspace(0, stop-start, stop-start+1);
x = transpose(x);
background = E(start) + slope*x;

top = E(start:stop) - background;
% figure()
% hold on
% plot(top)
% title(plot_title)
% hold off

top_val = max(top);
idx_top = start + find(top == top_val);
I_max = I(idx_top);
end