clear all;
close all;

nx = 100; 

params.x = linspace(-1, 1, nx);
params.center = 0.5;
params.width = 0.6;
params.a = 1; 

Filter = func_STfilter2_simple(params);
Filter = fliplr(Filter);

imagesc(Filter, [-1 1]); 
axis square; 
colormap gray;
set(gca,'XTick',[]); set(gca,'YTick',[]);