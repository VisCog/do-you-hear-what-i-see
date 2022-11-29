% Simulate performance using 1D gauss (non-sep) and ST simple (sep) models 

clear all;
close all;

% load simulation results
load('SimSeparabilityResults.mat');

sepcenterLevels = 0.5; 
nsepmodels = length(sepcenterLevels);

nmodels = length(widthLevels) + nsepmodels;
modelLevels = 1:nmodels; 

figure(1); clf

% plot simulation results
subplot('Position', [ .1 .3 .5, .6]);
clist = repmat(linspace(0, 0.8, nmodels-nsepmodels)', 1, 3);
clist = [clist; 0 0.8 0.5; 0 0.8 0.3]; 
ph = semilogx(repmat(noiseLevels', 1, nmodels), mag2db(Threshold) - mag2db(0.5), '-'); 
set(gca, 'ColorOrder', clist)
xlabel('Noise Levels');
ylabel('Predicted Threshold');
xlim([0.05 10]); 

legendcell = cell(1,length(modelLevels));
for i = 1:length(modelLevels)
    legendcell{i} = ['model ' num2str(modelLevels(i))];
end
legend(legendcell, 'Location', 'NorthWest' );

% plot models
pos = [.75 0.9 .1 .1];
for model_id = 1:length(modelLevels)
    pos(2) = pos(2)-.11;
    s(model_id) = subplot('Position', pos);
    image(127+(saved_model(model_id).model*127)); colormap('gray'); drawnow
    axis off
end

