clear all;
close all;

nx = 100; 

params.xx = linspace(-1,1,100);
params.yy = params.xx; 

params.ang = pi/4;
params.amp = 1; 
params.center = 0;
params.width = 0.4; 

Filter = func_OrientedGauss(params);
Filter = fliplr(Filter); 

imagesc(Filter, [-1 1]);
colormap('gray');
axis equal
axis tight
set(gca,'XTick',[]); set(gca,'YTick',[]);
