% plot target and noise 

clear all;
close all;

Fs = 44100; 
dur = 0.8;
space = 30; 

nsamples = Fs*dur; 

dt = dur/nsamples;
ds = space/nsamples; 

M = eye(nsamples);

target_on_t = 0.15;
target_on_s = 15;

target_t_id = target_on_t/dt;
target_s_id = target_on_s/ds; 

M(1:target_t_id,1:target_s_id) = 0; 
M(end-target_t_id+1:end,end-target_s_id+1:end) = 0; 

nt = 10;
ns = 10;

figure(1);

% target space
target_xx = linspace(-15, 15, 100);
target_yy = linspace(0.2, 0.6, 100);
target_yy = fliplr(target_yy);
% black background
background = zeros(nt, ns);

ax1 = axes;
imagesc(ax1, background, [0 1]); colormap('gray'); axis square;
set(gca,'XTick',[]); set(gca,'YTick',[]);

ax2 = axes;
plot(ax2, target_xx, target_yy, 'w-', 'LineWidth', 10);

set(gca, 'color', 'none'); 
ylim([0 dur]); 
xlim([-space space]);
set(gca,'XTick',[]); set(gca,'YTick',[]);
set(gca,'YDir','reverse')
axis square;

figure(2);

designmat = randn(nt, ns); 
designmat = designmat./max(max(abs(designmat)));
designmat = (designmat + 1)./2;
imagesc(designmat); colormap('gray');
axis('square');
set(gca,'XTick',[]); set(gca,'YTick',[]);



