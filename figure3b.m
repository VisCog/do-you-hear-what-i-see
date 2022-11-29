% plot group avg filters using the same methods as Neri (2014)

clear all;
close all;

% get z score

load('P_avg.mat')

P_EB_Z = (P_EB_avg - mean(P_EB_avg(:)))/std(P_EB_avg(:));
P_SC_Z = (P_SC_avg - mean(P_SC_avg(:)))/std(P_SC_avg(:));

zcutoff = 1;
lim = 2;

sigidx_EB = abs(P_EB_Z) > zcutoff; 
sigidx_SC = abs(P_SC_Z) > zcutoff; 

figure(1); % early blind

ax1 = axes; 
im1 = imagesc(P_EB_Z);
caxis([-lim lim]);
ax1.XTick = []; 
ax1.YTick = []; 
axis square;

ax2 = axes; 
im2 = imagesc(P_EB_Z);
im2.AlphaData = sigidx_EB;
caxis([-lim lim]);
axis square;

linkaxes([ax1,ax2]) 
ax2.Visible = 'off'; 
ax2.XTick = []; 
ax2.YTick = []; 
colormap(ax1,'gray') 
colormap(ax2,redblueNeri) 

cb1 = colorbar(ax1,'Position',[.05 .11 .0675 .815]); 
cb2 = colorbar(ax2,'Position',[.88 .11 .0675 .815]); 

xlabel('space');
ylabel('time');

figure(2); % sighted

ax3 = axes; 
im3 = imagesc(P_SC_Z);
caxis([-lim lim]);
ax3.XTick = []; 
ax3.YTick = []; 
axis square;

ax4 = axes; 
im4 = imagesc(P_SC_Z);
im4.AlphaData = sigidx_SC;
caxis([-lim lim]);
axis square;

linkaxes([ax3,ax4]) 
ax4.Visible = 'off'; 
ax4.XTick = []; 
ax4.YTick = []; 
colormap(ax3,'gray') 
colormap(ax4,redblueNeri) 

cb3 = colorbar(ax3,'Position',[.05 .11 .0675 .815]); 
cb4 = colorbar(ax4,'Position',[.88 .11 .0675 .815]); 

xlabel('space');
ylabel('time');









